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
    fv_flow => ordered_hash(
        OPT_SPEC   => {
            # default value will be set in <dut>.cfg
            'testname' => { TYPE => 'string', DEFAULT => '',
                            HELP => "Ace test to run for selected compiler"},
        },

        jg_compile  => {
            stage             => 'ace_command',
            deps              => [qw()],
            opts => {
                command       => "ace -ccjg -ignore_filtered_deplib_error -use_fv_compile_opts -use_fv_mcrd",
            },
            setup             => \&jg_setup,
        },
        jg_test  => {
            stage             => 'ace_command',
            deps              => [qw(jg_compile)],
            opts => {
                command       => "ace -sc -use_fv_mcrd -t %testname%",
            },
            setup             => \&jg_setup,
        },
     )
);

sub jg_setup
{
   $ENV{JG_SETUP} = 1;
   return 0;
}


