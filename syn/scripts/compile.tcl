## @file
###################################################################
# *NAME* : compile.tcl
#
# *DESCRIPTION* : Runs initial compile and flattens clock gate hierarchies
###################################################################

####################################
# List of procs used by this script
# None
####################################

#########
#Compile
#########

set_app_var compile_high_pin_density_cell_spreading true

if {[shell_is_in_exploration_mode] } {
  set cmd "compile_exploration"
} else {
  set cmd "compile_ultra  -timing_high_effort_script"
}
if  { [info exists INTEL_INSERT_CLOCKGATES] && $INTEL_INSERT_CLOCKGATES ==1} {
  set cmd "$cmd -gate_clock"
}

if { [info exists INTEL_SCAN_REPLACE_FLOPS] && $INTEL_SCAN_REPLACE_FLOPS==1} {
  set cmd "$cmd -scan"
}

if {[shell_is_in_topographical_mode]} {
  if { ![shell_is_in_exploration_mode]} {
    
    if {[info exists INTEL_SPG] && $INTEL_SPG ==1} {
      if {[info exists INTEL_TOPO_DEF] && $INTEL_TOPO_DEF ==1} {
        set cmd "$cmd -spg"
      } else {
        puts "==>WARNING: DEF input has not been provided. Hence Compile Ultra will not run with SPG"
      }
    }
  }
  # Using the "-check_only" option of "compile_ultra" to verify that the libraries and design are complete
  # and optimization will not fail in topographical mode

  set check_only  "$cmd -check_only"
  eval $check_only
}

puts "==>INFORMATION: Performing initial compile using\n '$cmd'"
eval $cmd


#################################
#Flatten clock gate hierarchies
#################################
set_app_var power_cg_flatten true

set icg_coll [get_cells * -hierarchical -filter "@ref_name =~ *SNPS_CLOCK_GATE*"]
if { [sizeof_collection $icg_coll] > 0 } {
  ungroup -flatten $icg_coll
}
remove_attribute [filter_collection [get_cells -hierarchical *] "@is_hierarchical==true"] dont_touch

