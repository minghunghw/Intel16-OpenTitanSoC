## @file
###################################################################
# *NAME* : inc_compile.tcl
#
# *DESCRIPTION* : Runs incremental compile
###################################################################
##############################################################################

####################################
# List of procs used by this script
# None
####################################


#################
#Incremental Compile
#####################

set_app_var compile_high_pin_density_cell_spreading true

if {![shell_is_in_exploration_mode]} {
  set cmd "compile_ultra -incremental"

  if  { [info exists INTEL_INSERT_CLOCKGATES] && $INTEL_INSERT_CLOCKGATES ==1} {
    set cmd "$cmd -gate_clock"
  }

  if { [info exists INTEL_SCAN_REPLACE_FLOPS] && $INTEL_SCAN_REPLACE_FLOPS==1} {
    set cmd "$cmd -scan"
  }


  if {[shell_is_in_topographical_mode]} {

    
    if {[info exists INTEL_SPG] && $INTEL_SPG ==1 && [info exists INTEL_TOPO_DEF] && $INTEL_TOPO_DEF ==1 } {
      set cmd "$cmd -spg"
    }
  }


  puts "==>INFORMATION: Performing incremental compile using\n '$cmd'"
  eval $cmd



  #Doing this again following a bug in DC where hier reappear for clock_gate
  #if only -gate_clock is used but not using it with -scan option
  #################################
  #Flatten clock gate hierarchies
  #################################
  set_app_var power_cg_flatten true

  set icg_coll [get_cells * -hierarchical -filter "@ref_name =~ *SNPS_CLOCK_GATE*"]
  if { [sizeof_collection $icg_coll] > 0 } {
    ungroup -flatten $icg_coll
  }
}
