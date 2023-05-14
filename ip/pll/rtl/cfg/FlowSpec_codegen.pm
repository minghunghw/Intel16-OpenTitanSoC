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
    codegen_flow => ordered_hash(
        creg => {
            stage             => 'creg',
            default_active    => "off",
            deps              => [qw()], 
            setup             => [\&creg::creg_stage_setup],
            post_run          => [\&creg::creg_post_run],
            use_flow_digest   => ToolConfig::ToolConfig_get_tool_var('stage_creg','enable_stage_digest'),
            flow_digest_rules => ['ignore_toolcfg_calls', 
                                  'cache_stage',
                                  'creg_rules'],
         },
         fuse => {
            stage             => 'fuse',
            default_active    => "off", ## off by default since it requires a specific fusegen version not available in all baselines (socfusegen d16ww52.5 or later works, but 2.30.1 and 2.34 do not)
            deps              => [qw(creg)],
            setup             => [\&fuse::fuse_stage_setup], 
            tools_for_setup   => ['fuse'],
            use_flow_digest   => ToolConfig::ToolConfig_get_tool_var('stage_fuse','enable_stage_digest'),
            flow_digest_rules => ['ignore_toolcfg_calls', 
                                  'cache_stage',
                                  'creg_rules'],
          },

          #Collage place holder for now. Need the PDS approved collage flow specification here
          #collage => {
          #    subflow           => 'collage_flow',
          #    deps              => [qw(creg fuse)], 
          #},


          jemsw  => {
             stage             => 'ace_command',
             default_active    => "off", 
             deps              => [qw(creg fuse)],
             opts => {
                command       => "ace -ccojsw",
             },
          },
     ),
);
