## @file
###################################################################
# *NAME* : read_phys_constraints.tcl
#
# *DESCRIPTION* : Reads physical data from DEF and UPF if provided and enabled
###################################################################

##############################################################################

################################
# List of procs used by this script
# None
#################################

############################
#Physical Constraints/def file
##############################
if {[info exists INTEL_TOPO_DEF] && $INTEL_TOPO_DEF==1} {
  if {[shell_is_in_topographical_mode] && [file exists ./inputs/floorplan/${INTEL_DESIGN_NAME}.def]} {
    puts "==>INFORMATION: Sourcing the DEF file for Physical Constraints"
    set find_ignore_case true
    set_preferred_routing_direction -layers $INTEL_HORIZONTAL_LAYERS -direction horizontal
    set_preferred_routing_direction -layers $INTEL_VERTICAL_LAYERS -direction vertical
    set_ignored_layers -min_routing_layer $INTEL_MIN_ROUTING_LAYER -max_routing_layer $INTEL_MAX_ROUTING_LAYER
    extract_physical_constraints ./inputs/floorplan/${INTEL_DESIGN_NAME}.def -allow_physical_cells
    set find_ignore_case false
    if {[info exists INTEL_UPF] && $INTEL_UPF == 1 } {
      if {[file exists ./scripts/${INTEL_DESIGN_NAME}.voltage_area.tcl]} {
        puts "==>INFORMATION : sourcing ${INTEL_DESIGN_NAME}.voltage_area.tcl to create voltage area"
        source ./scripts/${INTEL_DESIGN_NAME}.voltage_area.tcl
      } else {
        puts "==>INFORMATION : ${INTEL_DESIGN_NAME}.voltage_area.tcl does not exist to create the voltage area."
      }
    }

  } else {
    puts "==>FATAL: Cant read DEF file, either file not found in ./inputs/constraints/ or shell is not in TOPO mode... Exiting..."
    return 0
  }
} elseif {[info exists INTEL_DESIGN_HEIGHT] && $INTEL_DESIGN_HEIGHT > 0 && [info exists INTEL_DESIGN_WIDTH] && $INTEL_DESIGN_WIDTH > 0} {
  ## check lego
  set INTEL_DESIGN_WIDTH [expr ceil($INTEL_DESIGN_WIDTH / $INTEL_MD_GRID_X ) * $INTEL_MD_GRID_X]
  set INTEL_DESIGN_HEIGHT [expr ceil($INTEL_DESIGN_HEIGHT / $INTEL_MD_GRID_Y ) * $INTEL_MD_GRID_Y]
  puts "==>INFORMATION: Floorplan area set to \"$INTEL_DESIGN_WIDTH x $INTEL_DESIGN_HEIGHT\""
  set_placement_area -fixed -coordinate "0 0 $INTEL_DESIGN_WIDTH $INTEL_DESIGN_HEIGHT"
}