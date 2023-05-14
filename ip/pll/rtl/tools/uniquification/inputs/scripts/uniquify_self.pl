#!/usr/intel/pkgs/perl/5.14.1/bin/perl
##########################################################################################
## uniquify_self.pl
##
##    Description: 
##    Code for applying uniquification to your own IP collateral, ignoring subIP content.
##    If subIP content must be uniquified but the subIP did not provide their own uniquifyme
##    script, then in your IP you may add a uniquification script on behalf of that IP
##    in your own tools/uniquification/inputs/scripts/uniquify_<subip>.pl
##    NOTE: When present, subIP/<subip>/tools/uniquification/uniquifyme should always 
##    have priority over any parent IP owned uniquify_<subip>.pl 
##
##########################################################################################

use strict;
use warnings;
use Cwd;
use lib "$ENV{RTL_PROJ_BIN}/perllib";
use ToolConfig;
use File::Basename;
use Getopt::Long();
use vars qw($rtltools_flows $puni_version $help $debug $auto_search $ip_root $only_run $prefix $checker_mode $waiver_file $report_file $input_dir $output_dir);

my ($program, $prog_dir);

# need to put these basic subroutines before the BEGIN
# block because the are used inside of it.
sub info {
    my ($message) = @_;
   
    print ("-I- $program - $message\n");
}

sub warning {
    my ($message) = @_;
   
    print ("-W- $program - $message\n");
}

sub error {
    my ($message) = @_;
   
    print ("-E- $program - $message\n");
    exit(1);
}

BEGIN { 
    ($program, $prog_dir) = &fileparse($0);
    if(defined($ENV{PUNI_HOME}) && defined($ENV{RTLTOOLS_FLOWS})) {
        $puni_version = $ENV{PUNI_HOME};
        $rtltools_flows = $ENV{RTLTOOLS_FLOWS};
    } elsif(defined($ENV{RTL_PROJ_BIN})) {        
        if(ToolConfig::ToolConfig_tool_exists('rtltools_flows')) {
            $rtltools_flows = ToolConfig::ToolConfig_get_tool_path('rtltools_flows');
        } elsif(defined($ENV{RTLTOOLS_FLOWS})) {
            $rtltools_flows = $ENV{RTLTOOLS_FLOWS};
        } else {
            $rtltools_flows = "$ENV{RTL_PROJ_TOOLS}/rtltools_flows/xhdk74/latest";
            warning("Unable to find ToolConfig entry for rtltools_flows; defaulting to latest");
        }
        if(ToolConfig::ToolConfig_tool_exists('puni')) {
            $puni_version = ToolConfig::ToolConfig_get_tool_path('puni');
        } elsif(defined($ENV{PUNI_HOME})) {
            $puni_version = $ENV{PUNI_HOME};
        } else {
            error("Unable to find path to puni using ToolConfig or \$ENV{PUNI_HOME}");
        }
    } else {
        if(defined($ENV{PUNI_HOME})) {
            $puni_version = $ENV{PUNI_HOME};
        } else {
            my $sysname = `sysname -afs`;
            chomp $sysname;
            $sysname = "x86-64_linux30" if(!-e "/p/hdk/rtl/cad/$sysname");
            $puni_version = "/p/hdk/rtl/cad/$sysname/intel/puni/16.06.0" ;
            warning("Unable to find path to puni using ToolConfig or \$ENV{PUNI_HOME}; assuming $puni_version");
        }
        if(defined($ENV{RTLTOOLS_FLOWS})) {
            $rtltools_flows = $ENV{RTLTOOLS_FLOWS};
        } else {
            $rtltools_flows = "/p/hdk/rtl/proj_tools/rtltools_flows/xhdk74/latest";
            warning("Unable to find path to rtltools_flows using ToolConfig or \$ENV{RTLTOOLS_FLOWS}; assuming $rtltools_flows");
        }
    }
}

exit main();

sub main {
    parseArgs();
    my $status = 0;
    ## add code or function calls here for applying uniquification to your own IP collateral
    ## -uniquify <list of build components> List of build components include rtl, collage, ace, febe, lintra, visa. This switch substitutes the individual switches to enable different functionality in PUNI
    my @ace_options = (
       "-uniquify_ace_config", #enables udf/hdl file modification
       #"-ace_file_list $ip_root/tools/uniquification/inputs/IP.ace.filelist.txt",  ## without the filelist puni uses -model_root to find the udf and hdl files
       #"-ignore_ace_libs", #Only file references are modified, not library names
        "-rtl_libs $input_dir/IP.ace.library_names.txt", ## list of rtl library names that need to be uniquified (default: look for acedump.filelist.pl)
        "-rtl_scope $input_dir/subIP.ace.scope_names.txt", ## list of sub-IP scope names that needs to be uniquified
       "-scope_uniquify_ip_only", ## Must be used with -rtl_scope, use this option to uniquify scope only for the particular IP level.
    );
    my @chef_options = (
        "-uniquify_chef",
    );
    my @collage_options = (
        "-uniquify_collage",
        "-collage_file_list  $input_dir/IP.collage.filelist.txt", 
    );
    my @fe2be_options = (
        "-uniquify_febe",
    );
    my @lintra_options = (
        "-uniquify_lintra_waivers",
        "-lintra_waivers_filelist $input_dir/IP.lintra.filelist.txt",
    );
    my @rtl_options = (
        "-assumed_defined $input_dir/subIP.top_modules.txt",# already uniquified sub-IP module names
       #"-ignore_include",  ## not usually a safe argument
       #"-id_nonuniquified", ## slows down puni
       "-ignore_non_existent_includes", ## usually for generated file `includes that have not been created
       "-delete_orig_file", #Delete original files after running uniquification. Uniquified files will be preserved.
    );
    my @search_replace_options = (
        ## this option disables the uniquification capability and will focus on searching for
        ## a specific uniquification prefix and replacing that with an alternative prefix
        ## provided by the user in the filelist.
        "-search_replace",
    );
    my @visa_options = (
        #"-uniquify_visa_config ",
    );
    if($only_run eq 'ace') {
        $status |= run_puni("puni.ace.log", 
                            @ace_options,
                           );
    } elsif($only_run eq 'chef') {
        $status |= run_puni("puni.chef.log", 
                            @chef_options,
                           );
    } elsif($only_run eq 'collage') {
        $status |= run_puni("puni.collage.log", 
                            @collage_options,
                           );
    } elsif($only_run eq 'rtl') {
        $status |= run_puni("puni.rtl.log", 
                            @rtl_options,
                           );
    } elsif($only_run eq 'search_replace') {
        $status |= run_puni("puni.search_replace.log", 
                            @search_replace_options,
                           );
    } else {
        $status |= run_puni("puni.full.log", 
                            @ace_options,
                            @chef_options,
                            @collage_options,
                            @fe2be_options,
                            @lintra_options,
                            @rtl_options,
                            @visa_options,
                           );
    }
    if($checker_mode) {
        $status |= check_puni($waiver_file, $report_file);
    }
    return $status;
}

sub parse_puni_report {
    my ($report_file, $violations) = @_;
    my $status = 0;
    # parse report file
    if(!-e $report_file) {
        error("PUNI produced report file $report_file doesn't exist\n");
    }
    open(RF, "$report_file") or error("Couldn't open report file $report_file for reading\n");
    while(<RF>) {
        my $line = $_;
        next if($line =~ 
                /^(\s+|MODEL_ROOT\s*\:|Prefix\s*\:|SUMMARY\s*\:|\#|MODULES\:|MACROS\:|Files\:|PACKAGES\:|COMPILER DIRECTIVES\:|SCOPE\:)/);
        chomp($line);
        push @{$violations}, $line;
    }
    close(RF);
}

sub convert_violations_to_lintra_xml {
    my ($violations, $lintra_mode_violations) = @_;
    my $header =<<HEADER;
<?xml version="1.0" encoding="UTF-8"?>
<LINTRA_VIOLATIONS>
 <run_info top="puni"/>
HEADER

    my $footer =<<FOOTER;
</LINTRA_VIOLATIONS>
FOOTER

    push @{$lintra_mode_violations}, $header;

    my $id = 0;
    foreach my $violation (@{$violations}) {
        push @{$lintra_mode_violations}, "<violation id=\"puni\" file=\"na\" line=\"0\" message=\"$violation\" key=\"$violation\" severity=\"Error\" group=\"PuniRules\" design_id=\"$prefix\" waiver=\"\" />\n";
        $id++;
    }
    push @{$lintra_mode_violations}, $footer;
}

sub write_lintra_violations_xml {
    my ($violations_file, $lintra_mode_violations) = @_;
    open(FILE, ">$violations_file") or error("Couldn't open file $violations_file for writing");
    foreach my $violation (@{$lintra_mode_violations}) {
        print FILE "$violation";
    }
    close(FILE);
}

sub run_lintra {
    my ($lintra_mode_violations) = @_;
    my $violations_file = "$output_dir/${prefix}_puni_lintra_all_violations.xml";
    my $waiver_path = "$input_dir/puni_lintra";
    my $cfg_file = "$input_dir/puni_lintra/LintraPuniConfig.xml";
    my $waiver_file = "puni_lintra_waiver_w.xml";
    my $unwaived_violations = "puni_lintra_unwaived_violations.xml";
    write_lintra_violations_xml($violations_file, $lintra_mode_violations);

    # set up lintra env vars
    ToolConfig::ToolConfig_setup_tools("puni/lintra", 1, undef);

    # lintra batch mode run applies waivers
    # -lr = load violations report
    # -wf = waiver file regex or waiver file (use your waiver file here)
    # -wd = waiver file dir
    # -xrn = new violations report (use one from QC entry)
    my $cmd = &ToolConfig::ToolConfig_get_tool_exec('puni/lintra') . " -top puni -lr $violations_file -wf $waiver_file -wd $waiver_path -od $output_dir -xrn $unwaived_violations -pfn -cfg $cfg_file";
    info("Running command: $cmd\n");
    my $status = system($cmd);
    $status=$status >> 8;
    return $status;
}

sub check_puni {
    my ($waiver_file, $report_file) = @_;
    my $status = 0;

    my @violations;
    my @lintra_mode_violations;
    my @waivers;
    my @unwaived_violations;
    
    # parse report file
    parse_puni_report($report_file, \@violations);
    convert_violations_to_lintra_xml(\@violations, \@lintra_mode_violations);
    $status = run_lintra(\@lintra_mode_violations);
    return $status;
}

sub run_puni {
    my ($logname, @args_for_puni) = @_;
    system("/bin/mkdir -p $output_dir") if(!-d $output_dir);
    my $logfile = "$output_dir/$logname";
    my @autosearch_options = (
        ## -autosearch info: Instead of explicitly specifying the files to parse/uniquify, 
        ## the script can exhaustively search all files in the specified search path, 
        ## including any files referenced as `include within a module.
        ## This option should be used with caution as the script will attempt to
        ## recursively parse ALL files in the directory. Therefore, the specified
        ## directory hierarchy should only contain RTL files to avoid modifying other
        ## non-RTL files such as scripts, logfiles, and other design data.
        "-autosearch $ip_root/src",

        ##-newoutputdir may be used with the –autosearch option to redirect the 
        ## modified/uniquified RTL to a separate directory from the original source
        ## directory while leaving the original directory and its contents intact.
        ## The highest-level directory specified with the –autosearch option 
        ## will be cloned with the _unique suffix. All subdirectory names within the 
        ## original directory will be copied within the newly created _unique directory.
        "-newoutputdir", 
    );
    if($auto_search) {
        push @args_for_puni, @autosearch_options;
    }
    if($checker_mode) {
        push @args_for_puni, "-checker_mode";
    }

    my $cmd = "$puni_version/PUNI.pl ".
        " -prefix $prefix ".
        ## required: -filelist <name of the file that contains a header and a list of all files in your design and library>
        "-filelist $input_dir/IP.filelist.txt ".
        "-model_root $ip_root ".
        join(" ",@args_for_puni);
    $cmd = "cd $output_dir ; $cmd >& $logfile";
    info("Running: $cmd");
    error("The following command failed: $cmd") if(system($cmd));
}

sub parseArgs {
    $auto_search = 0;
    $checker_mode = 0;
    $debug = 0;
    $help = 0;
    $only_run = "";
    my $tmp_puni_path;
    &Getopt::Long::config("pass_through", "getopt_compat");
    &Getopt::Long::GetOptions(
         "autosearch"   => \$auto_search,
         "checker_mode" => \$checker_mode,
         "waiver_file=s"=> \$waiver_file,
         "report_file=s"=> \$report_file,
         "d|debug"      => \$debug,
         "h|help"       => \$help,
         "ip_root=s"    => \$ip_root,
         "only_run=s"   => \$only_run,
         "prefix=s"     => \$prefix,
         "use_puni_ver=s" => \$tmp_puni_path,
    );
    if(!defined($prefix) || !defined($ip_root)) {
        helpInfo();
        exit(1);
    }
    $input_dir = "$ip_root/tools/uniquification/inputs";
    $output_dir = "$ip_root/tools/uniquification/outputs";
    if(defined($tmp_puni_path) && $tmp_puni_path ne '') {
        if(-e "$tmp_puni_path") {
            $puni_version = $tmp_puni_path;
        } else {
            error("'-use_puni_ver $tmp_puni_path' should be a full path to the puni version\n");
        }
    }
    if($waiver_file) {
        if($waiver_file !~ /^\//) {
            $waiver_file = "$ip_root/$waiver_file";
        }        
        if(!-e $waiver_file) {
            error("Waiver file $waiver_file doesn't exist\n");
        }
    }
    else {
        $waiver_file = "$input_dir/uniquification_waiver_regexp";
    }

    if($report_file) {
        if($report_file !~ /^\//) {
            $report_file = "$ip_root/$report_file";
        }        
        if(!-e $report_file) {
            error("PUNI report file $report_file doesn't exist");
        }
    }
    else {
        $report_file = "$output_dir/${prefix}_notuniq.txt";
    }


    if($help) {
        helpInfo();
        exit(0);
    }

}

sub helpInfo {
    print <<END_OF_HELP;
uniquify_self.pl -prefix <prefix>
Options:
   -ip_root             : (required) Sets the root of the ip model
   -prefix              : (required) Sets the prefix (including any underscores) that should be used by uniquification steps
   -h, -help            : (optional) Display this help screen
   -d, -debug           : (optional) Enable debug messages
   -autosearch          : (optional) Turn on puni autosearch capability using $ip_root/src
   -checker_mode        : (optional) Run PUNI in checker mode

END_OF_HELP

}


exit 0;
