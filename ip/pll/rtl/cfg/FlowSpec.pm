package FlowSpec;

use strict;
use warnings;

use Exporter;
use vars qw(@ISA @EXPORT);
@ISA    = qw(Exporter);
@EXPORT = qw(%FlowSpec);
use lib "$ENV{RTL_PROJ_BIN}/perllib";
use ToolConfig;

use vars qw($rtltools_path $flowbee_path);
BEGIN {
    $rtltools_path = ToolConfig::ToolConfig_get_tool_path('rtltools');
    $flowbee_path = ToolConfig::ToolConfig_get_tool_path('rtltools/flowbee');
}

use FindBin;
use lib "$FindBin::Bin";
use File::Basename;
use Cwd qw (abs_path);

use lib "$rtltools_path";
use lib "$flowbee_path";
use RTLUtils;
use Utils;
use File::Temp qw/ tempfile tempdir /;
use File::Path qw(make_path);
#use strict;
no strict "subs";
no warnings 'redefine';
use vars qw(%FlowSpec);

############################################################
# FlowSpec Hash
# Contains the flow specifications for all currently
# supported flows
############################################################
$ENV{FLOW_DIGEST_VERBOSE} = 1;
$ENV{CTECH_ROOT} = '/p/hdk/cad/stdcells/b15/20ww20.5_b15_4.0_mtl/ctech/'; 
#$ENV{CTECH_ROOT} = '/p/hdk/cad/ctech/c4v19ww34f_hdk161_p1222_18ww47.5_b15_3.4_soc/'; 
%FlowSpec = (

     ################################
    # simbuild flow
    ###############################

    simbuild => ordered_hash(
        OPT_SPEC => {
            "dut" => {
                TYPE    => "string",
                DEFAULT => undef,
                HELP    => "design under test",
            },
        },
        SETUP    => \&simbuild_setup,

        ##################################################
        # Ace cfg file generation based on templates
        # this is usually automatically done in
        # simbuild_setup
        # This stage will explicitly re-run it.
        # Turned off by default. Only used when enabling
        # new DUTs to look at the generated Ace collateral
        # and copy and modify it, if required
        # See README in repo                     
        ###################################################
        gen_ace_files =>  {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
               command       => "echo Done generating Ace config files based on templates. Generated files located in \$ACE_UTILS_ROOT",
            },
        },

        ###################################################
        # codegen flow : Described in FlowSpec_codegen.pm
        ###################################################
        codegen => ordered_hash(
            subflow           => 'codegen_flow',
            deps              => [qw()], 
        ),

        ##################################################
        # compile flow : Described in FlowSpec_compile.pm
        ##################################################

        compile => ordered_hash(
            subflow           => 'compile_flow',
            deps              => [qw(codegen)], 
        ),

        #############################################################
        # static checks flow : Described in FlowSpec_static_checks.pm
        #############################################################

        static_checks => ordered_hash(
           subflow           => 'static_checks_flow',
           deps              => [qw(codegen)], 
        ),

        #############################################################
        # formal verification flow: Described in FlowSpec_fv.pm
        #############################################################

        fv => ordered_hash(
           subflow           => 'fv_flow',
           deps              => [qw(codegen)], 
           default_active    => "off", 
        ),

        #############################################################
        # DVT Eclipse flow: Described in FlowSpec_dvt.pm
        #############################################################

        dvt => ordered_hash(
           subflow           => 'dvt_flow',
           deps              => [qw(codegen)], 
           default_active    => "off", 
        ),

        ##################################################
        # audit flow : To Be Described in FlowSpec_audit.pm
        ##################################################
        # zircon/build_audit/acelint ?
        #audit => ordered_hash(
        #    subflow           => 'audit_flow',
        #    deps              => [qw(codegen compile cdc)], 
        #),
                             
    ) # end simbuild

);

# import FlowSpec entries for all the subflows
foreach my $subflow ('codegen', 'compile', 'static_checks', 'fv','dvt') {
    my $subflow_flowspec = "$ENV{MODEL_ROOT}/cfg/FlowSpec_$subflow.pm";
    require $subflow_flowspec || die("cannot required $subflow_flowspec");
}

##########################################################
# Sub     : simbuild_setup
# Caller  : build_flow (Flow.pm)
# Desc    : This is called when the simbuild flow is being
#         : constructed (prior to stage run) and does some
#         : basic variable, etc setup that is required
#         : by the flow and its stages
# Inputs  : $flowptr : Pointer to flow
#         : %opts : Flow manager opts hash
# Output  : No output
#         : the success of the setup function can be
#         : checked using $flowptr->{setup_ok}
#         : The setup function must set this to true
#         : on succesful completion
##########################################################
sub simbuild_setup
{
    my $flowptr = shift;
    my $opts    = $flowptr->{scoped_vars}->{opts};

    $flowptr->add_scoped_vars(
        qw($dut $DutConfig $aceroot
          $rtlTarget
          $default_config
          $ace_env_ptr
          )
    );

    my $scoped_vars = $flowptr->{scoped_vars};

    # DUT is a required argument for simbuild
    print_fatal("Dut is a required option for simbuild!")
        if ($flowptr->get_opt("dut") eq "");
    $scoped_vars->{dut} = $flowptr->get_opt("dut");

    # move the config and log files to dut specific file names - update the prefix
    # the move occurs once the flow is built and prior to any stages being run
    my $prefix = $scoped_vars->{logPrefix};
    $scoped_vars->{logPrefix} = $prefix . "$scoped_vars->{dut}.";

    $scoped_vars->{default_config} =
      $flowptr->get_opt("default_config") ||
      $flowptr->get_opt("dc");



    ####################
    # DutConfig Check
    ####################

    # Check if the dut.cfg exist in MODEL_ROOT/cfg/ directory
    if (&ToolConfig_get_tool_var('rtltools', 'enableDutCheck') &&
        !($flowptr->{scoped_vars}{default_config})) {
        if (RTL_dutCheck($scoped_vars->{dut})) {
            print <<DC_ERROR;

-E- Unsupported DUT.  Config file $scoped_vars->{dut}.cfg was not found at $ENV{MODEL_ROOT}/cfg/
To build $scoped_vars->{dut} using default.cfg, add  "-dc " to the command line

DC_ERROR
            exit 1;
        } ## end if (RTL_dutCheck($scoped_vars...
    } ## end if (&ToolConfig_get_tool_var...

    # Set up the DUT config
    # This reads/updates the DutConfig and also sets rtlTarget
    my %DutConfig = %{ &FlowSpec::simbuild_setup_dut($flowptr) };
    $scoped_vars->{DutConfig} = \%DutConfig;

    $scoped_vars->{dut_resources} = $scoped_vars->{DutConfig}->{resources};

    $scoped_vars->{aceroot} = $scoped_vars->{targetRoot} . "/" . $scoped_vars->{rtlTarget} . "/aceroot";

    $scoped_vars->{stageLogDir} =
      $scoped_vars->{targetRoot} . "/" . $scoped_vars->{rtlTarget} .
      "/log";
    $scoped_vars->{stageLogPrefix} =
      $scoped_vars->{stageLogPrefix} . "$scoped_vars->{rtlTarget}.";

    ## Add simbuildargs from dut config
    my $simbuildArgs = $scoped_vars->{DutConfig}->{simBuildArgs};
    my $instOptsRef  = $flowptr->{scoped_vars}->{instOptsRef};
    my $simcmd       = $instOptsRef->{ $flowptr->{'flow_path'} };
    unshift(@{$simcmd}, split(/ /, $simbuildArgs)) if ($simbuildArgs);

    Flow::get_flow_opts($flowptr);

    $scoped_vars->{ARCHNAME} = ToolConfig_get_general_var("ARCHNAME");

    my $date = `date "+%m_%d-%T"`;
    $date = main::mychomp($date);
    my $cloneName = &basename($ENV{MODEL_ROOT});
    my $buildName = "build_";
    $buildName .=
      $scoped_vars->{opt_logPrefix} ?
      "$scoped_vars->{opt_logPrefix}" :
      "${cloneName}_" . $scoped_vars->{dut};
    my $pid       = "_$$";
    my $pidlength = length($pid);

    if (length($buildName) + $pidlength > 100) {
        my $oldbuildName = $buildName;
        $buildName = $buildName . substr(0, 99 - $pidlength) . $pid;
        print_warning(
            "The buildName $oldbuildName$pid is too long. Will shorten it to 55 chars : $buildName"
        );
    } else {
        $buildName .= $pid;
    }
    $scoped_vars->{scheduler}->set_top_task_name($buildName);


    # HK Turning this off to enable each stage to source the ace env independently
    # this enables different stages to have slightly diff env setup, for e.g. 
    # spyglass_cdc vs spyglass_lint can have diff tool versions of spyglass setup
    # read ace env and set %ace_env scoped var
    # my %ace_env = source_ace_env($scoped_vars);
    # $scoped_vars->{ace_env_ptr} = \%ace_env;
    $flowptr->{setup_ok} = 1;
} ## end sub simbuild_setup



#######################################################
# Sub     : simbuild_setup_dut
# Caller  : simbuild_setup
# Desc    : Reads the DutConfig file, updates
#         : %DutConfig based on simbuild scope variables
#         : and returns %DutConfig
# Inputs  : %opts : Flow manager opts hash
#         : $flowVars : Simbuild scope variables
# Outputs : \%DutConfig
########################################################
sub simbuild_setup_dut
{

    # flow pointer
    my $flowptr = shift;

    # flow variables
    my $scopedVars = $flowptr->{scoped_vars};

    #####################
    # Setup DutConfig
    ####################

    print_fatal(
               "Please specify the Device Under Test with '-dut'\n\n")
      if (!defined $scopedVars->{dut});

  # Check if configuration file exists, if not, skip CTE stage and use
  # basic RTLBuild switches
    my $rtlTarget;
    my @cfgDirs = @{ $scopedVars->{cfgDirs} };
    my $dut = $scopedVars->{dut};
    use vars '%DutConfig';

    if (defined &RTL_find("$dut.cfg", @cfgDirs, 'one', 'one') or
        defined &RTL_find("default.cfg", @cfgDirs, 'one', 'one')) {

        my $found_opt_dut_cfg =
          &RTL_find("$dut.cfg", @cfgDirs, 'one', 'one');
        if (defined $found_opt_dut_cfg) {
            (my $useCfg = $found_opt_dut_cfg) =~ s/$dut\.cfg\s*$//;

            require "$useCfg/$dut.cfg";
            DutConfig->import();
            
        } else {
            my $found_default_cfg =
              &RTL_find("default.cfg", @cfgDirs, 'one', 'one');
            (my $useCfg = $found_default_cfg) =~ s/default.cfg\s*$//;
            require "$useCfg/default.cfg";
            DutConfig->import();
            $DutConfig{topFub} = $scopedVars->{dut};
        } ## end else [ if (defined $found_opt_dut_cfg)

        $rtlTarget =
          defined $DutConfig{target} ? $DutConfig{target} :
                                       $DutConfig{topFub};
    } else {
        print_info("No " . $scopedVars->{dut} .
            " configuration found -- running without configuration settings"
        );
        $DutConfig{topFub} = $scopedVars->{dut};
        $rtlTarget = $scopedVars->{dut};
    } ## end else [ if (defined &RTL_find(...
    

    $scopedVars->{rtlTarget}  = $rtlTarget;

    return \%DutConfig;

} ## end sub simbuild_setup_dut



# Uses ACE Utils to dump the ace environment and populate a hash for stages that need to be in the ACE env
sub source_ace_env {
    my ($scoped_vars) = @_;

    my %ace_env = ();

    my $targetRoot = $scoped_vars->{targetRoot};
    my $dut           = $scoped_vars->{dut}; 

    &RTL_mkDir(["$targetRoot/$dut/log"]);
#    my $ace = ACE_UTILS->new(ace_root_dir => "$targetRoot/$dut/aceroot", dut => $dut, ace_log_file => "$targetRoot/$dut/log/$dut.ace_env.log");
	my $ace_env_log = "$scoped_vars->{dut}.ace_env.log";
#	if (ToolConfig::get_general_var("logPrefix")){
	        $ace_env_log = "$scoped_vars->{stageLogPrefix}ace_env.log";
#    }
    my $ace = ACE_UTILS->new(ace_root_dir => "$targetRoot/$dut/aceroot", dut => $dut, ace_log_file => "$targetRoot/$dut/log/$ace_env_log");
    $ace->setup();

    my ($env_file_handle,$env_dump) = tempfile();
    my $command = "/usr/bin/printenv > $env_dump";
    my $status = $ace->execute_cmd($command);

    if($status != 0) {
        die "Could not dump environment to $env_dump!\n";
    }

    open my $fh, "$env_dump" or die "Cannot read env dump file $env_dump -- $!\n";
    while(my $line = <$fh>) {
        chomp($line);

        my ($env_var, $value) = split(/=/, $line, 2);
        
        $ace_env{$env_var} = $value;
    }
    close $fh;

    # clean up
    unlink($env_dump);

    return %ace_env;
} ## end of sub source_ace_env

1;
