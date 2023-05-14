# DO NOT REMOVE!!!  Learn to code warning-free perl instead.
#
use warnings FATAL => 'all';

package ToolData;

########################################################
## Example ToolConfig.pl commands
##    ToolConfig.pl get_tools               -- list all configured tools (and subtools)
##    ToolConfig.pl get_tool_version <tool> -- tells the configured version of the tool
##    ToolConfig.pl get_tool_path    <tool> -- returns the configured path of the tool
##    ToolConfig.pl show_tool_info   <tool> -- shows all configured settings for the tool
## NOTE: if a tool has entries under SUB_TOOLS, these subtools may be accessed
##       as above, but using <tool>/<subtool> instead of <tool>
## EXAMPLE: ToolConfig.pl get_tool_version ovm
########################################################

## to clear any default ip configurations given in the baseline
undef %ToolData::ToolConfig_ips;

delete $ToolData::ToolConfig_tools{ipconfig} if(defined($ToolData::ToolConfig_tools{ipconfig}));
$ToolConfig_tools{ipconfig}{SUB_TOOLS} = {};

######################################################################
# Current IP : template
######################################################################
$ToolConfig_tools{ipconfig}{SUB_TOOLS}{template} = {
    VERSION => 'local',
    PATH    => "$ENV{MODEL_ROOT}",
    OTHER   => { SUB_SCOPES => [qw(CTECH )]},
};

########################################################
## Configure and Load project VIP baseline file
## (example, vip_baseline needs to be created for every project)
########################################################
$ToolConfig_tools{ipconfig}{SUB_TOOLS}{vip_baseline} = {
    VERSION => '1.0',
    PATH    => "$ENV{IP_RELEASES}/vip/vip_base/&get_tool_version()",
    OTHER   => { IMPORT => ["$ENV{IP_RELEASES}/vip/vip_base/1.0/cfg/VIP_BASE_IPToolData.pm"] },
};

if(-e $ToolConfig_tools{ipconfig}{SUB_TOOLS}{vip_baseline}{PATH}) {
    ToolConfig::import_files('ipconfig/vip_baseline',\%ToolConfig_tools);
}

######################################################################
# Example of an integrated subIP for local-use only: <unique_ip_name>
#   Common subIPs include IPs needed only for TestBench, not TestIsland 
######################################################################
#$ToolConfig_tools{ipconfig}{SUB_TOOLS}{<unique_ip_name>} = {
#    VERSION => '<ip_version>',
#    PATH    => '<full_path_to_ip_area>/&get_tool_version()',
#    OTHER   => { IMPORT => ['&get_tool_path()/cfg/<ip_scope>_IPToolData.pm'] },
#};

$ToolConfig_tools{ipconfig}{SUB_TOOLS}{CTECH} = {
    VERSION => "&get_tool_version(ctech)",
    PATH => "&get_tool_path(ctech)",
    ENV => "&get_tool_env_var(ctech)",
};


1;

