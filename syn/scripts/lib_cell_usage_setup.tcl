## @file
############################################################
# *NAME* : lib_cell_usage_setup.tcl
#
# *SUMMARY* :       Applies dont_use and cell usage attribute to cells specified in lib_cell_usage_vars file 
#
# *REQUIRED* :      yes
#
# *USAGE* :         P_source_if_exists lib_cell_usage_setup.tcl
#
# *ARGUMENTS* :     None
#
# *VARIABLES* :    None 
#
# *DESCRIPTION* : Applies dont_use and cell usage attribute to cells specified in lib_cell_usage_vars file 
#
# *EXAMPLES* :
#
#############################################################

P_source_if_exists lib_cell_usage_vars.tcl
if { [info exists INTEL_LIB_CELL_USAGE_VARS_OPT] && [file exists INTEL_LIB_CELL_USAGE_VARS_OPT] } {
  P_source_if_exists $INTEL_LIB_CELL_USAGE_VARS_OPT
} else {
  P_msg_info "Using default dont_use settings for the tool.  To customize use the INTEL_LIB_CELL_USAGE_VARS_OPT variable to pass customized dont use dictionary."
}

# Set lib_cell_usage dictionary to be used in dont_use.tcl
if { ![info exists lib_cell_usage] } {
  set lib_cell_usage $lib_cell_usage_dont_use;
  foreach category [dict keys $lib_cell_usage_use] {
    dict append lib_cell_usage $category \
    [dict get $lib_cell_usage_use $category]
  }
}

