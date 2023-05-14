
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
    dvt_flow => ordered_hash(
        dvt_compile   => {
            stage             => 'ace_command',
            deps              => [qw()],
            opts => {
                command       => "ace -dvt -use_sim_compile_opts",
            },
            default_active    => "on", 
            setup             => \&dvt_setup,
        },

        dvt_run  => {
            stage             => 'ace_command',
            deps              => [qw(dvt_compile)],
            opts => {
                command       => "ace -run_dvt",
            },
            default_active    => "off", 
            setup             => \&dvt_setup,
        },
     )
);
sub dvt_setup
{
   $ENV{DVT_SETUP} = 1;
   return 0;
}



