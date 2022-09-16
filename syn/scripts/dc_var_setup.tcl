## @file
###################################################################
# *NAME* : dc_var_setup.tcl
#
# *DESCRIPTION* : Sets up DC specific default variables used in the flow
###################################################################

##############################################################################

set start_time [clock seconds]
#puts "==>SOURCING: [info script] START TIME: [date]"

################################################################################
# Description: This file sets up DC specific default variables used in the flow.
################################################################################

####################
# General Settings
####################
set_app_var sh_continue_on_error false
set_app_var enable_page_mode false

########################
## UPF Specific settings
########################
if {($synopsys_program_name == "dc_shell") && [info exists INTEL_UPF] && $INTEL_UPF } {
  if { [info exists INTEL_UPF_VERSION] && $INTEL_UPF_VERSION >= 2.0 } {
    set_app_var upf_create_implicit_supply_sets true
  } else {
    set_app_var upf_create_implicit_supply_sets false
  }
  set_app_var enable_ao_synthesis true
  set_app_var mv_insert_level_shifters_on_ideal_nets all
  set_app_var auto_insert_level_shifters_on_clocks all
  #set_app_var mv_no_main_power_violations false
}

##########################################
# LIMIT WARNINGS and INFORMATION Messages
########################################
# Warning: Design rule attributes from the driving cell will be set on the port. (UID-401)
set_message_info -id UID-401 -limit 5

# Limit the message showing info about defining new variable
# Information: Defining new variable 'INTEL_INSERT_SCAN'. (CMD-041)
set_message_info -id CMD-041 -limit 5

##################################
# DC Explorer Variable
###############################
if {[shell_is_in_exploration_mode]} {
  set enable_presynthesis_floorplanning true
}

######################################
# Final output/verilog output settings
########################################
set_app_var report_default_significant_digits 3

#set_app_var high_fanout_net_threshold 25
#set_app_var high_fanout_net_pin_capacitance 4

set_app_var write_name_nets_same_as_ports true

set_app_var uniquify_naming_style %s_%d
# Following variables are needed for correct verilog out
set_app_var verilogout_no_tri true
set_app_var verilogout_single_bit false
set_app_var verilogout_show_unconnected_pins true
set_app_var verilogout_higher_designs_first false
set_app_var timing_library_max_cap_from_lookup_table true

######################################
#Variable for Timing
#####################################
# Reset needs to be fixed for timing
set_app_var enable_recovery_removal_arcs true
set_app_var timing_enable_multiple_clocks_per_reg true
# Enable dynamic max_cap tables based upon pin frequency
# set_app_var compile_enable_dyn_max_cap true

######################################
# read/write cache from local run dir
#####################################
if {![file exists ./synopsys_cache]} {file mkdir ./synopsys_cache}
set_app_var cache_write ./synopsys_cache
set_app_var cache_read ./synopsys_cache
set_app_var cache_file_chmod_octal 777
set_app_var cache_dir_chmod_octal 777

########################################
# Settings for compile
#######################################
# Setting variable to show following info during compile
if {![shell_is_in_exploration_mode]} {
  set_app_var compile_log_format "  %elap_time %trials %area %wns %tns %drc %group_path %endpoint"
  # Below app option is obsolete from S-2021 versions
  #set_app_var power_preserve_rtl_hier_names true
}
set compile_timing_high_effort true

#set_app_var power_preserve_rtl_hier_names true

####################################
# Read design RTL settings
###################################
define_design_lib WORK -path ./WORK

set_app_var hdlin_preserve_sequential all
set_app_var link_force_case case_insensitive
set_app_var uniquify_keep_original_design true
set_app_var allow_newer_db_files true
set_app_var change_names_dont_change_bus_members false
set_app_var vhdlout_single_bit VECTOR
set_app_var vhdlout_follow_vector_direction TRUE
set_app_var vhdlout_dont_write_types true
set_app_var vhdlout_package_naming_style CONV_PACK


set_app_var mw_logic1_net $INTEL_POWER_NET
set_app_var mw_logic0_net $INTEL_GROUND_NET

## Disable command and argument abbreviation.
#set_app_var sh_command_abbrev_mode none
#set_app_var sh_command_abbrev_options false

set_host_options -max_cores $INTEL_NUM_CPUS
#puts "==>ENDING: [info script] END TIME: [date] RUNTIME in (hh:mm:ss): [clock format [expr [clock seconds] - $start_time] -format %T -gmt 1] MEMORY: [mem]KB"
