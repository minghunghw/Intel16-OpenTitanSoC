package FlowSpec;

#use strict;
no strict "subs";
use warnings;
no warnings 'redefine';

use RTLUtils;
use Utils;

use vars qw(%FlowSpec);

use lib "$ENV{RTL_PROJ_BIN}/perllib";
use ToolConfig;

%FlowSpec = (
    %FlowSpec,
    static_checks_flow => ordered_hash(
        OPT_SPEC   => {
            # default value will be set in <dut>.cfg
            'testname' => { TYPE => 'string', DEFAULT => '',
                            HELP => "Ace test to run for selected compiler"},
        },

        lintra_compile  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccolt -use_lint_mcrd ",
            },
        },
        lintra_test  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -sc -use_lint_mcrd -t %testname%",
            },
        },
        sg_lint_compile  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccsg -use_sg_lint_mcrd -ASSIGN -static_check_cfg_file=\$SPYGLASS_METHODOLOGY_RTL_LINT/ace_static_check.cfg",
            },
            setup             => \&sg_lint_setup,
        },
        sg_lint_test  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw(sg_lint_compile)],
            opts => {
                command       => "ace -use_sg_lint_mcrd -sc -t static_checks/spyglass_lint/%testname% -static_check_cfg_file=\$SPYGLASS_METHODOLOGY_RTL_LINT/ace_static_check.cfg",
            },
            setup             => \&sg_lint_setup,
        },
################################## SGOL Setup ########################

        sg_ol_test  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw(sg_lint_compile)],
            opts => {
                command       => "ace -use_sg_lint_mcrd -sc -t static_checks/spyglass_ol/%testname% -static_check_cfg_file=\$SPYGLASS_METHODOLOGY_RTL_LINT/ace_static_check.cfg",
            },
            setup             => \&sg_lint_setup,
        },

######################################################################


        sg_cdc_compile  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccsg -use_sg_cdc_mcrd -ASSIGN -static_check_cfg_file=\$SPYGLASS_METHODOLOGY_CDC/ace_static_check.cfg",
               set_facets => ['spyglass_mode=cdc',],
               osetup_tools => ['spyglass_cdc'],
            },
            setup             => \&sg_cdc_setup,
        },

        sg_cdc_test  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw(sg_cdc_compile)],
            opts => {
                command       => "ace -sc -use_sg_cdc_mcrd  -ASSIGN -static_check_cfg_file=\$SPYGLASS_METHODOLOGY_CDC/ace_static_check.cfg",
               set_facets => ['spyglass_mode=cdc'],
               osetup_tools => ['spyglass_cdc'],
            },
            setup             => \&sg_cdc_setup,
        },
       
        sg_cdc_gui => {
            stage 	      => ace_command,
            default_active    => "off",
            deps 	      => [qw(sg_cdc_compile)],
            opts  => {
                command       => "spyglass -project ",
               set_facets => ['spyglass_mode=cdc'],
               osetup_tools => ['spyglass_cdc'],
            },
            setup             => \&sg_cdc_setup,
        },

        vclp_compile  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccvclp -use_vclp_mcrd",
            },
        },
        vclp_test  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw(vclp_compile)],
            opts => {
                command       => "ace -sc -use_vclp_mcrd -t static_checks/vclp/%testname%",
            },
        },

        # EFFM Checks
        effm_veloce  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                     command       => "ace -effm -effm_run_flow CHECK_VELOCE -use_check_veloce_rd",
            },
        },

        effm_fpga  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                command       => "ace -effm -effm_run_flow CHECK_FPGA -use_check_fpga_rd",
            },
        },
        effm => {
            stage => ace_command,
            default_active => "off",
            opts => {
                command => 'setenv EMULATION 1 && ace -emul -ASSIGN -hdl_compiler=emul -results results/emu -mcrd \\<-results\\> '.ToolConfig::get_tool_var('my_simbuild_config','effm_args'),
                results => 'results/emu',
                #tool => 'effm',
                osetup_tools => ['effm','emubuild'],
            },
            deps => [qw()],
        },
     
     )
);

sub sg_cdc_setup 
{
   my %args = @_;
   my $scopedVars = $args{scopedVars};
   $scopedVars->{ace_env_ptr} = undef;
   print_info("-I-: Clearing the ace env ptr. This will force the stage to re-source the ace env\n");
   print "-I-: SGCDC stage env setup\n";
   $ENV{"SPYGLASS_CDC"} = 1;
   return 0;
}
sub sg_lint_setup
{
   $ENV{SPYGLASS_LINT} = 1;
   return 0;
}
