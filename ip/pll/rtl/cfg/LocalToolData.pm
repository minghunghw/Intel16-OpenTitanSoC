######################################################################
# This file is intended to store local overrides of tool versions 
# and configurations.  The defaults come from baseline tool collections
# contoured in ToolData.pm 
######################################################################
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

######################################################################
## general vars
######################################################################
## netbatch settings
$general_vars{NBPOOL}  = "$ENV{SITE}_dts";
$general_vars{NBQSLOT}  = '/cds/cds';

if(ToolConfig::get_facet('arch') eq 'em64t_SLES11') {
    $general_vars{NBCLASS} = '8G&&SLES11';
    $general_vars{NBCLASS_LARGE} = 'SLES11&&32G';
} else {
    $general_vars{NBCLASS} = '8G';
    $general_vars{NBCLASS_LARGE} = '32G';
}

## aceroot_dpath is used by fe2be to determine the path 
## where generated contents are placed
$general_vars{aceroot_dpath} = "$ENV{MODEL_ROOT}/target/" . &ToolConfig::get_facet('dut') ;
## this stagelogdir general_var is also used by febe to
## determine where to place stage log files.
## Needed to add this explicitly cause aceroot_dpath dir is not
## parallel to the stage log dir as assumed by febe
$general_vars{stageLogDir} = "$ENV{MODEL_ROOT}/target/" . &ToolConfig::get_facet('dut') . "/log" ;

# Ace env file generation based on templates
# Main ace env file 
$ToolConfig_tools{ace}{OTHER}{ace_main_env_file_contents} = <<ACEENV;
source ace/common.env
ACEENV

# Ace common env file - shared across duts/scopes
$ToolConfig_tools{ace}{OTHER}{ace_env_templates}{"ace/common.env"} =
  $ENV{MODEL_ROOT}."/cfg/templates/common.env.template";
  
#####################################################################
######################################################################
# gatekeeper_utils
# ####################################################################
$ToolConfig_tools{gatekeeper_utils} = {
      VERSION => '1.01.80',
      PATH => "$RTL_PROJ_TOOLS/gatekeeper_utils/&get_tool_version()",
      #EXEC => "&get_tool_path()/gk-utils.pl",
};
$ToolConfig_tools{gkutils} = $ToolConfig_tools{gatekeeper_utils};

# Simbuild related

# Override incorrect setting in baseline_tooldata.pm
$ToolConfig_tools{rtltools}{OTHER}{filter_rules_module} = "&get_tool_path(rtltools/flowbee)/filters.pm";
$ToolConfig_tools{rtltools}{SUB_TOOLS}{flowbee}{OTHER}{filter_rules_module} = "&get_tool_path(rtltools/flowbee)/filters.pm";


# push fuse into the default list of stage modules loaded by simbuild
push(@{$ToolConfig_tools{rtltools}{SUB_TOOLS}{flowbee}{OTHER}{modules}}, "&get_tool_path(stage_fuse)", "&get_tool_path(stage_ace_command)");

$ToolConfig_tools{stage_fuse}{PATH} = "&get_tool_path('rtltools')/stages/fuse.pm";

$ToolConfig_tools{ace_utils}{VERSION} = "1.01.03";
#$ToolConfig_tools{ace_utils}{OTHER}{cleanenvrc} = 1;
$ToolConfig_tools{ace_utils}{OTHER}{printcmd} = 1;

# Runtools related
$ToolConfig_tools{runtools}{ENV}{'TREX_PACKAGES'} .= ":$ENV{MODEL_ROOT}/cfg/trex/ace_aliases_TREX.pm";
$ToolConfig_tools{runtools}{OTHER}{system_fails_filenames} .= '%MODEL%/cfg/trex/system_fails';
$ToolConfig_tools{runtools}{OTHER}{repo_trex_output} = 'regression/%DUT%/trex';
# based on inputs from yaelz
$ToolConfig_tools{runtools}{OTHER}{USE_ACE_CUSTOM_TEST_RESULT_DIR} = 1;
$ToolConfig_tools{runtools}{OTHER}{CHILD_TIMEOUT} = 0;
$ToolConfig_tools{runtools}{OTHER}{use_ifeed_subdir} = 1; 


#Some basic CTECH config
$ToolConfig_tools{ctech}{VERSION} = "20ww20.5_b15_4.0_mtl/ctech/";
$ToolConfig_tools{ctech}{PATH} = "/p/hdk/cad/stdcells/b15/&get_tool_version()";
$ToolConfig_tools{ctech}{ENV}{CTECH_LIB_NAME} = "CTECH_v_rtl_lib";

#EFFM config
#$ToolConfig_tools{effm}{ENV}{EMUL_TOOLS_DIR} = "&get_tool_path()/effm_tools";
#$ToolConfig_tools{effm}{ENV_PREPEND}{PATH} = "&get_tool_path()/effm_tools";
#$ToolConfig_tools{effm}{ENV}{EMUL_CFG_DIR} = "$ENV{MODEL_ROOT}/tools/effm_flows/inputs";

$ToolConfig_tools{effm} = {
VERSION =>'2019.30.p02',
PATH =>"$RTL_CAD_ROOT/intel/effm/&get_tool_version()",
};
$ToolConfig_tools{effm}{ENV}{EMUL_TOOLS_DIR} ="&get_tool_path()/effm_tools";
$ToolConfig_tools{effm}{ENV_PREPEND}{PATH} = "&get_tool_path()/effm_tools";
$ToolConfig_tools{effm}{ENV}{EMUL_CFG_DIR} = "$ENV{MODEL_ROOT}/tools/effm_flows/inputs";

#JasperGold config
delete $ToolConfig_tools{intel_jasper_library}{ENV_PREPEND}{IJL_ROOT};
$ToolConfig_tools{intel_jasper_library}{ENV}{IJL_ROOT} = "&get_tool_path(intel_jasper_library)/src";
$ToolConfig_tools{jaspergold}{VERSION} = "2017.12";
$ToolConfig_tools{intel_jasper_library}{VERSION} = "3.5";
#####################################################################
$ToolConfig_tools{febe3}{VERSION}='20.02.02';

# SpyglassCDC config

$ToolConfig_tools{spyglass_cdc}{VERSION} = "3.00.02.p1";
$ToolConfig_tools{spyglass_cdc}{SUB_TOOLS}{spyglass}{VERSION} = "P-2019.06-SP2-5";
$ToolConfig_tools{spyglass_cdc}{SUB_TOOLS}{cdclint}{VERSION} = "2.00.04";

1;

# Overriding the spyglass_lint versions for SGOL enablement
$ToolConfig_tools{spyglass_lint}{VERSION} = "3.02.02.20ww35";
$ToolConfig_tools{spyglass_lint}{SUB_TOOLS}{spyglass}{VERSION} = "P-2019.06-SP2-7";
$ToolConfig_tools{spyglass_cdc}{SUB_TOOLS}{cdclint}{VERSION} = "2.00.04";

############## Zircon config #############################
$ToolConfig_tools{zirconqa}{VERSION}='2.10.09';
$ToolConfig_tools{zirconqarules}{VERSION}='2.10.09';

