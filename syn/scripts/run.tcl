##############################################################################

#######################################################################
# SUMMARY: run.tcl to drive netlist2gds flow in ICC
######################################################################
set echo_include_commands false
set echo_include_commands FALSE


set timestamp [sh date '+%m_%d_%H_%M']

puts "\n######## Synopsys Build Information ########"
puts "Product Version:  $::sh_product_version"
puts "Build Date:       $::product_build_date"
puts "############################################\n"

#########################################
# General/Project SPECIFIC CONFIGURATION
#########################################

if { ![info exists env(INTEL_ASIC)] } {
  error "Required environment variable 'INTEL_ASIC' not set."
} else {
  set INTEL_ASIC $env(INTEL_ASIC)
  puts "-I- Setting FDK DIR to $INTEL_ASIC"
}

#setup all local paths
set INTEL_LOG_PATH     ./logs
set INTEL_SCRIPTS_PATH ./scripts
set INTEL_INPUTS_PATH  ./inputs
set INTEL_MW_LIB       ./ddc
set INTEL_REPORTS_PATH ./reports
set INTEL_OUTPUTS_PATH ./outputs

if { ![file isdirectory $INTEL_MW_LIB] } { file mkdir $INTEL_MW_LIB }
if { ![file isdirectory $INTEL_LOG_PATH] } { file mkdir $INTEL_LOG_PATH }
if { ![file isdirectory $INTEL_OUTPUTS_PATH] } { file mkdir $INTEL_OUTPUTS_PATH }
if { ![file isdirectory $INTEL_REPORTS_PATH] } { file mkdir $INTEL_REPORTS_PATH }

set_app_var sh_command_log_file ./logs/cmd.log
set_app_var sh_output_log_file  ./logs/dc.log

### INTEL_SCRIPTS_SEARCH_PATH order as: highest to lowest
set INTEL_SCRIPTS_SEARCH_PATH $INTEL_SCRIPTS_PATH
set INTEL_SCRIPTS_SEARCH_PATH "$INTEL_SCRIPTS_SEARCH_PATH \
                             $env(INTEL_ASIC)/asicflows/synopsys/syn  \
                             $env(INTEL_ASIC)/asicflows/synopsys/tech.${INTEL_DOTP}.${INTEL_LIB_TYPE}${INTEL_LIB_VENDOR}.${INTEL_TRACKPATTERN}"

set COMMON_SCRIPTS $env(INTEL_ASIC)/asicflows/synopsys/common
set SYN_SCRIPTS $env(INTEL_ASIC)/asicflows/synopsys/syn

puts "-I- scripts search path variable INTEL_SCRIPTS_SEARCH_PATH is set to: $INTEL_SCRIPTS_SEARCH_PATH"
set search_path [concat $INTEL_SCRIPTS_SEARCH_PATH $search_path]


source $env(INTEL_ASIC)/asicflows/synopsys/tech.${INTEL_DOTP}.${INTEL_LIB_TYPE}${INTEL_LIB_VENDOR}.${INTEL_TRACKPATTERN}/procs.tcl

P_source_if_exists tooltype.tcl
P_source_if_exists procs_common.tcl
P_source_if_exists aliases.tcl
P_source_if_exists run_proc.tcl

### Flow steps
P_source_if_exists flow_setup.${INTEL_DOTP}.${INTEL_LIB_TYPE}${INTEL_LIB_VENDOR}.${INTEL_TRACKPATTERN}.tcl -require

### project specific setting
P_source_if_exists project_setup.${INTEL_DOTP}.${INTEL_LIB_TYPE}${INTEL_LIB_VENDOR}.${INTEL_TRACKPATTERN}.tcl -require

### Scenario setup
P_source_if_exists scenario_vars.tcl

### design specific setting
P_source_if_exists block_setup.tcl -require

### Build scenario template
P_source_if_exist scenario_template.tcl

### Pre Scenario check
P_source_if_exists scenario_vars_checks.tcl

P_source_if_exists library.tcl
P_source_if_exists dc_var_setup.tcl


### Check Disk Space
P_run_CheckDiskSpace

