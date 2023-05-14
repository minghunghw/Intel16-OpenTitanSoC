#!/usr/intel/bin/perl -w

#####################################################################
# ToolData.pm
#
# This Perl module stores configuration information for RTL models
# The data is accessed through the ToolConfig module.
# This file should not be included by any file other than ToolConfig.pm!
#
#
######################################################################
# Use %general_vars to store general model information,
# Use %ToolConfig_int to store ucode tool data,
# Use %ToolConfig_tools to store tool data, using its special syntax.
#
# ToolConfig_tools syntax:
#
# $ToolConfig_tools{mytool} = {
# 		VERSION => <version>,
# 		PATH     => <root path>,
# 		ENV       => {
# 			# environment variables needed for the tool
# 			# these variables will be setenv`ed
# 			# by the setup_tools() function
# 			ENV_VAR1 => <value>,
# 			ENV_VAR2 => <value>,
# 			#using back referenced values by embedding access functions.
# 			# These will later be evaluated by the set_* functions.
# 			ENV_VAR3 => '&get_tool_env{ENV_VAR1)'.'/bin' ,
# 		},
# 		ENV_COND	=> {
# 			# variables here work similarly to variables under ENV,
# 			# except that setup_tools() doesn't define them if they
#			# already exist in %ENV.
# 			COND_ENV1 => <value>,
# 		},
# 		ENV_APPEND	=> {
# 			# variables here work similarly to variables under ENV,
# 			# except that setup_tools() appends their value to existing
# 			# environment variables with the same name, if they exist
# 			APND_ENV1 => <value>,
# 		OTHER       => {
#			# Those are accesible via ToolConfig_get_tool_var
#	 		_SCALAR_VAR1 = <value>,
#	 		_ARRAY_VAR1  = [ <value1>,<value2>,...],
#	 	},
#	 	# sub tools ( duplicates the main tool structure.
#	 	# Allows specifying an individual sub tool version for this tool
#	 	# (for example TCL used in this tool may be different than the one used by other tools,
#	 	# or the default one.)
# 		SUB_TOOLS => {
# 			tool1 => {
# 				Version,path,env,license fields...
# 			},
# 	    	tool2 => {
# 				Version,path,env,license fields...
# 			},
# 			# a tool can simply be a reference to another tool.
# 			tool3 => '&get_tool(\'vcs\')'
# 		},
# };
#
# *** Attention: all tool and subtool names must be lowercase. A tool with a name which
#     includes an uppercase character will not be accesible for external code. This is
#     done to allow external code to refer to tool names as case-insensitive.
#
# *** Attention: all embedded functions must be used with both & at the beginning and ()
#     at the end.
#
# The embedded functions available for back-reference are all the functions that appear
# in ToolConfig.pm, and return a string:
#
#			for current tool				for current or another tool
# 	o 	&get_tool_path()				&get_tool_path(tool)
# 	o 	&get_tool_version()				&get_tool_version(tool)
# 	o	&get_tool_env_var(undef,var)	&get_tool_env_var(tool,var)
# 	o	&get_tool_var(undef,var)		&get_tool_var(tool,var)
#
# 			others
# 	o	&get_general_var(var)
# 	o	&get_ucode_var(var)
#
#####################################################################

# DO NOT REMOVE!!!  Learn to code warning-free perl instead.
#
use warnings FATAL => 'all';

package ToolData;

use File::Basename;

use Exporter ();
@ISA    = qw(Exporter);
@EXPORT = qw(
  %ToolConfig_int
  %general_vars
  %ToolConfig_tools
  %onecfg
);

#This function require other files that were split from ToolData.pm such as RTLData.pm
#&ToolConfig::ToolConfig_locate_ToolData();

# Check if we are in 64bit setup:
my $setup64 = 0;
if (defined $ENV{SETUP_ON_64BITS} and $ENV{SETUP_ON_64BITS}) {
    $setup64 = 1;
}

######################################################################
#
# general_vars hash stores general tool data which doesn't belong to
# any specific tool. These variables are used internally in the
# flow and are not set in the Unix environment.
#
# Hash entries that are arrays need to be declared as:
#   $general_vars{<entry>} = [ <item1>,<item2> ];
#
######################################################################
our %general_vars = ();

# Define some global variables
# Tools need to look at 2 variables to determine architecture they are running on:
#
# 1. Real architecture (SYSNAME)         -> is derived from `sysname -afs`
# 2. Effective arch or 'mode' (ARCHNAME) -> defines the mode (32bit or 64bit[em64t])
#    On Suse32 machines ARCHNAME = SYSNAME
#    On Suse64 machines ARCHNAME identifies 64bit mode or 32bit-compatibility mode
#      (currently only compatibilty mode is supported on Suse64)
#

######### REFERENCE TABLE FOR OS/PLATFORM. (DO NOT DELETE - hmangat)########
#
# PLATFORM  OS-type  Sysname(-afs)   Sysname(-ct)
# --------  -------  -------------   ------------
# 64-bit    SLES10   x86-64_linux26  em64t_SLES10
# 64-bit    SLES9    x86-64_linux26  em64t_linux26
# 32-bit    SLES10   i386_linux26    i686_SLES10
# 32-bit    SLES9    i386_linux26    i686_linux26
#
##################################################################

###### Define which ToolData.pm files to read

@{$general_vars{tooldatas}} = qw(ToolData.pm);

###### Define default values for various ARCHNAMEs based upon OS-type ######
## other archetectures are configured in baseline, adding sles11 only
if ($ENV{USE_OLD_ARCHNAME}) {
    $general_vars{ARCHNAME_SLES11} = $general_vars{ARCHNAME};
} else {
    $general_vars{ARCHNAME_SLES11} = '&get_archname(SLES11)';
}

################################################################

# Set default values for paths
#
our $PROJ_ROOT    = exists $ENV{PROJ_ROOT} ? $ENV{PROJ_ROOT} : "/p/$PROJECT";
our $CFG_PROJECT  = exists $ENV{CFG_PROJECT} ? $ENV{CFG_PROJECT} : 'whdk';
$ENV{LM_PROJECT} = 'PDS'; ## Ensure that this is set correctly for your IP

######################################################################
# General /usr/intel/pkgs tools (overriding or adding to those in baseline
######################################################################

######################################################################
#
# ToolConfig_tools hash stores data about tools need by the RTL
# simulation environment.
#
# If a tool version changes, please change the corresponding entry in
# this file.
#
#    **** All tool and subtool names must be lowercase. ****
#
######################################################################
our %ToolConfig_tools = ();
our %ToolConfig_int   = ();

my $argv_str = join(" ", @ARGV);
if(!defined($ENV{ONECFG_CUST})) {
   if($argv_str =~ /\-1c.*\-CUST\s+(\S+).*\-1c\-/) {
        $ENV{ONECFG_CUST} = $1;
   }
}
if(!defined($ENV{ONECFG_dut})) {
   if($argv_str =~ /\s*\-dut\s+(\S+)/) {
        $ENV{ONECFG_dut} = $1;
   }
}
######################################################################
#
# Baseline Tools
# GeneralVars contains common variable settings and general_vars setup
# BaselineToolData contains common tool settings
#
######################################################################
my $baseline_tools_ver = '1.6.4';

my $baseline_tools_path = "$RTL_PROJ_TOOLS/baseline_tools/master/$baseline_tools_ver";
$ToolConfig_tools{baseline_tools} = {
    VERSION => $baseline_tools_ver,
    PATH => "$RTL_PROJ_TOOLS/baseline_tools/master/&get_tool_version()",
};

######################################################################
#
# Project Baseline Tools
# This is where project specific baseline overrides are residing
#
######################################################################
$ToolConfig_tools{project_baseline_tools} = {
    VERSION => '17.01.08',
    PATH => "$RTL_PROJ_TOOLS/baseline_tools/$ENV{CFG_PROJECT}/&get_tool_version()",
};

######################################################################
# Other stuff...
######################################################################
#------------------------------------------------------
# EFFM code snippet to added to cfg/ToolData.pm
#------------------------------------------------------
$ToolConfig_tools{effm} = {
   VERSION => '2019.30',
   PATH => "$RTL_CAD_ROOT/intel/effm/&get_tool_version()",
};
########################################################################


$ToolConfig_tools{onecfg} = {
    VERSION => '1.02.07',
    PATH    => "$RTL_PROJ_TOOLS/onecfg/master/&get_tool_version()",
    ENV => {
        ONECFG_PATH => '&get_tool_path()',
        __ACE_USE_OBCM__ => 1,
        __ACE_PRELOAD_LEGACY_MODULES__ => '&get_tool_env_var(,ONECFG_PATH)/udf/obcm_preload.yaml',
        ONECFG_IGNORE_UNKNOWN_ATTR_ERROR => 2,
    },
    ENV_PREPEND => {
        PERL5LIB => '&get_tool_env_var(,ONECFG_PATH)/lib/Legacy',
    },
    OTHER   => {
        strict_facet => 1,
        IMPORTS => [ "${baseline_tools_path}/GeneralVars.pm",
                     "${baseline_tools_path}/Baseline_ToolData.pm",
                     "&get_tool_path(project_baseline_tools)/projectToolData.pm",
                     # HK - do we still use this or is this only for questa CDC?
                     "&get_tool_path(cdc_utils)/cfg/CDCToolData.pm",
                     "$ENV{MODEL_ROOT}/cfg/IPToolData.pm",
                     "$ENV{MODEL_ROOT}/cfg/LocalToolData.pm",
            ],
        TSETUP_TOOLNAME    => 'onecfg',
        TSETUP_VENDOR      => 'intel',
        TSETUP_IP_VERSIONS => {
            '1.01.05' => "$RTL_PROJ_TOOLS/onecfg/master/1.01.05",
        },    
    },
};

# declare the facets available for variations
# the duts are determined specially, by
# looking for cfg/<dut>.cfg
#
#
$onecfg{Facet} = {
    values => {
        ### SR specific changes 
        ##stepping   => [qw(mtl-a0)], ## must match .git/config
        stepping   => [qw(appg-a0)], ## must match .git/config
        ##cluster    => [qw(ringpll)], ## must match .git/config
        cluster    => [qw(ringpll)], ## must match .git/config
        ##project    => [qw(ips_mtl)], ## must match .git/config
        project    => [qw(p1222),qw(appg)], ## must match .git/config
        ##domain     => [qw(xhdk74)], ## must match .git/config
        domain     => [qw(xhdk74)], ## must match .git/config

        CUST       => [qw(any)], ## if you must have customer specific settings
        dut        => [qw(ringpll default)],
        arch       => [qw(i386_linux26
                          i686_SLES10
                          x86-64_linux26
                          em64t_SLES10
                          em64t_SLES11)],
        bits       => [qw(32 64)],
        platform   => [qw(Linux SuSE)],
        derivative => [qw(common)],
        milestone  => [qw(0.0 0.3 0.5 0.8 1.0 POLO PROD)],
        # Is scope ever going to be different from a dut ?       
        #scope      => [qw(ip2211ringpll pmm)],
        be_milestone => [qw(hdk73_1273_hdk124)], ## needs to be a valid BE milestone (used for febe)
        be_process => [qw(1273)], #[qw(1222 1269 1271 1273 1274 1275)],
        be_project => [qw(hdk73)], #[qw(siphdk hdk73 chdk74)],
        process    => [qw(p1222 p1269 p1271 p1273 p1274 p1275)],
    },
    contours => {
        ## used for Facet values that are supersets of other factets 
        ## providing specific combinations of facet values
        ## example: CAP means dut=C and derivative=A and project=P
        #p1222 => { be_process => '1222', be_project => 'siphdk', process => 'p1222', be_milestone => 'hdk73_1273_hdk124' },
        #p1269 => { be_process => '1269', be_project => 'siphdk', process => 'p1269', be_milestone => 'hdk73_1273_hdk124' },
        #p1271 => { be_process => '1271', be_project => 'siphdk', process => 'p1271', be_milestone => 'hdk73_1273_hdk124' },
        #p1273 => { be_process => '1273', be_project => 'hdk73',  process => 'p1273', be_milestone => 'hdk73_1273_hdk124' },
        #p1274 => { be_process => '1274', be_project => 'chdk74', process => 'p1274', be_milestone => 'hdk73_1273_hdk124' },
        #p1275 => { be_process => '1275', be_project => 'siphdk', process => 'p1275', be_milestone => 'hdk73_1273_hdk124' },
    },
    implications => {
        ## used to set one or more facet values based on known facet values
        ## example: dut=A implies derivative=B and scope=C
        ##          'dut=A' => { derivative => 'B', scope => 'C' },
        'dut=default' => { derivative => 'common',},
        'dut=*'        => { derivative => 'common',},

        ## set up process-related facets according to selected backend process
        'be_process=*' => { process    => 'p&get_facet(be_process)', },

        ## set up customer-related facets according to selected CUST process
        #'CUST=*'       => { },
    },
    defaults => {
        ## used to set default values, which are NOT overriden by implications
        ### SR specific changes 
        ##stepping   => 'mtl=a0', ## taken from .git/config
        stepping   => 'appg-a0', ## taken from .git/config
        cluster    => 'ringpll',  ## taken from .git/config
        ###project    => 'ips_mtl',  ## taken from .git/config
        project    => 'p1222',  ## taken from .git/config
        domain     => 'xhdk74',   ## taken from .git/config
        #derivative => 'common', ## taken from implications
        #scope      => 'ip2211ringpll',      ## taken from implications
        #process    => 'p1273',     ## taken from implications
        CUST       => 'any',
        arch       => 'em64t_SLES11',
        bits       => '64',
        platform   => 'SuSE',
        be_process => '1273',
        be_project => 'hdk73',
        be_milestone => 'hdk73_1273_hdk124', ## NOTE: needs to be a valid BE milestone (used for febe)
        dut        => 'ringpll',
        milestone  => 'PROD',
        spyglass_mode => 'lint', # this baseline ver needs this facet to have a default value to setup Spyglass correctly
                 
    },
};

$ToolConfig::MyVersion = 1;


1;

### EOF ###
