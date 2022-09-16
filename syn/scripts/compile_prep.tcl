## @file
###################################################################
# *NAME* : compile_prep.tcl
#
# *DESCRIPTION* : Applies settings and performs operations in preparation for compile
###################################################################


############################################
## List of procs used by this script
## 1. P_msg_warn
#############################################


#####################
#Insert Clock Gating
#####################

if {[info exists INTEL_INSERT_CLOCKGATES] && $INTEL_INSERT_CLOCKGATES==1} {
  set_clock_gating_style  -positive_edge_logic integrated \
    -max_fanout 16 \
    -minimum_bitwidth 8 \
    -control_point before \
    -no_sharing \
    -control_signal test_mode

  set_app_var compile_clock_gating_through_hierarchy true

  #Exclude negative edge FF
  #------------------------
  set neg_edge_ff [ get_cells -hierarchical -filter  "@ff_edge_sense==0" * ]
  if { [sizeof_collection $neg_edge_ff ] > 0} {
    set_clock_gating_objects -exclude $neg_edge_ff
  }
  #insert_clock_gating
}

#--------------------
#Set Routing layers
#--------------------
if {[shell_is_in_topographical_mode]} {

# Suppress the following message:
# Information: No preferred routing direction is found for design layer metal1. Automatically deriving direction V. (DCT-035)
# This message is issued in Design Compiler versions 2009 and beyond, when the automatically derived DC preferred routing directions are overriden in the flow. This is for informational purposes only and can be suppressed.

  suppress_message DCT-035
  
  set_preferred_routing_direction -layers $INTEL_HORIZONTAL_LAYERS -direction horizontal
  set_preferred_routing_direction -layers $INTEL_VERTICAL_LAYERS -direction vertical
  set_ignored_layers -min_routing_layer $INTEL_MIN_ROUTING_LAYER -max_routing_layer $INTEL_MAX_ROUTING_LAYER
}


#--------------------------------------------
#Uniquify the design to make it APR friendly
#--------------------------------------------
uniquify

#------------------------
# set compile variables.
#------------------------
if {[shell_is_in_topographical_mode]} {
  set_app_var placer_max_cell_density_threshold 0.7
}

set_max_time_borrow 0 [all_registers]
set_register_merging $INTEL_DESIGN_NAME false
set_critical_range 2000 [get_designs]
set_app_var timing_enable_multiple_clocks_per_reg true
# Dont Allow synopsys to invert registers
set_app_var compile_seqmap_enable_output_inversion false
# Disable register merging during compile. This causes FV issues
set_app_var compile_enable_register_merging false
# Disable identification of shift registers. This will allow compile to swap all flops to scan flops
set_app_var compile_seqmap_identify_shift_registers false
set_app_var compile_seqmap_propagate_constants true
set_app_var compile_delete_unloaded_sequential_cells false
set_app_var compile_preserve_subdesign_interfaces true

if {$synopsys_program_name == "dc_shell"} {
  set_app_var compile_seqmap_propagate_high_effort false

  #Setting for AHFS synthesis in TOPO
  #-------------------------------------
  if {[shell_is_in_topographical_mode]} {
    set_fix_multiple_port_nets -all -buffer_constants
    set_ahfs_options -default
  }
}


