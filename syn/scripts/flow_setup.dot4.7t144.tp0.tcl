## @file
###################################################################
# *NAME* : flow_setup.tcl
#
# *DESCRIPTION* : Default flow step/substep execution
###################################################################

############################################################################

####################################
# Flow Vars
####################################

# Synthesis flow vars
# To add an extra step to the flow update the *_STEPS var to add the new step
# Also define *_SUBSTEPS(<new step>) to include the tcl files that need to be sourced during that step

set INTEL_SYN_STEPS {read_design \
  read_constraints \
  compile \
  insert_mbff \
  insert_dft \
  inc_compile\
  optimize_netlist}

set INTEL_SYN_SUBSTEPS(read_design) { \
  read_design \
  }
set INTEL_SYN_SUBSTEPS(read_constraints) { \
  read_constraints \
  read_phys_constraints \
  create_scenarios \
  }
set INTEL_SYN_SUBSTEPS(compile) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  compile_prep \
  create_path_group \
  compile \
  cell_usage_audit
  }
set INTEL_SYN_SUBSTEPS(insert_mbff) { \
  insert_mbff \
  cell_usage_audit
  }
set INTEL_SYN_SUBSTEPS(insert_dft) { \
  insert_dft \
  cell_usage_audit
  }
set INTEL_SYN_SUBSTEPS(inc_compile) { \
  inc_compile_prep \
  inc_compile \
  change_names \
  cell_usage_audit
  }
set INTEL_SYN_SUBSTEPS(optimize_netlist) { \
  optimize_netlist \
  change_names \
  cell_usage_audit
  }





# APR Flow vars
set INTEL_APR_STEPS {import_design \
  floorplan \
  place \
  post_place \
  cts \
  post_cts \
  route \
  post_route \
  fill }

set INTEL_APR_SUBSTEPS(import_design) { \
  import_design \
  lib_cell_usage_setup \
  lib_cell_usage \
  create_scenarios \
  read_constraints \
  create_path_group \
  set_isolate_ports \
  connect_pg_net \
  change_names \
  cell_usage_audit
  }

# If floorplan information is provided in form of DEF then remove unnecessary substeps from floorplan stage.
# Example, if all macro placement information is available in DEF then remove macro_placement substep.
set INTEL_APR_SUBSTEPS(floorplan) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  init_floorplan \
  create_row \
  set_wiretracks \
  macro_placement \
  create_macro_ws \
  create_rectilinear_routing_blockage \
  connect_pg_net \
  set_pg_grid_config \
  create_pg_grid \
  io_placement \
  create_boundary_ws \
  create_boundary_si_blockage \
  add_tap_cells \
  pre_place_fiducial \
  pre_place_bonus_fib \
  insert_antenna_diodes_on_input \
  create_top_pg_pin \
  create_check_grid \
  connect_pg_net \
  check_floorplan \
  cell_usage_audit
  }

set INTEL_APR_SUBSTEPS(place) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  set_ideal_clock_network \
  place_opt \
  connect_pg_net \
  change_names \
  cell_usage_audit
  }

#set INTEL_APR_SUBSTEPS(post_place)         { lib_cell_usage_setup lib_cell_usage tool_constraints extraction_settings_prefill refine_opt connect_pg_net change_names}
set INTEL_APR_SUBSTEPS(post_place) {}

set INTEL_APR_SUBSTEPS(cts) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  cts_ndr_rules \
  cts_options \
  remove_ideal_clock_network \
  route_options_drc \
  cts \
  create_clock_shield \
  freeze_clock_nets \
  update_clocks \
  connect_pg_net \
  change_names \
  cell_usage_audit
  }
set INTEL_APR_SUBSTEPS(post_cts) {}

set INTEL_APR_SUBSTEPS(route) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  route_options \
  route_options_drc \
  antenna_rules \
  report_pre_route \
  initial_detailroute \
  incr_create_clock_shield \
  check_routes \
  connect_pg_net \
  change_names \
  cell_usage_audit
  }

set INTEL_APR_SUBSTEPS(post_route) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  route_options \
  route_options_drc \
  antenna_rules \
  incr_route_opt \
  incr_eco_detail_route \
  incr_create_clock_shield \
  incr_detailroute \
  add_filler_cells \
  check_routes \
  connect_pg_net \
  change_names \
  cell_usage_audit
  }


set INTEL_APR_SUBSTEPS(fill) { \
  remove_boundary_blockage \
  metal_fill \
  extraction_settings_postfill \
  }
  

if {[string first 144 $INTEL_LIB_TYPE] > 0} {
set INTEL_APR_SUBSTEPS(post_route) "$INTEL_APR_SUBSTEPS(post_route) extend_tgoxid remove_m1"
} 

# UPF flow steps.
#set INTEL_APR_STEPS { upf_import_design upf_floorplan upf_place post_place cts post_cts route upf_post_route fill}

set INTEL_APR_SUBSTEPS(upf_import_design) $INTEL_APR_SUBSTEPS(import_design)

set INTEL_APR_SUBSTEPS(upf_floorplan) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  init_floorplan \
  create_row \
  set_wiretracks \
  macro_placement \
  create_macro_ws \
  create_rectilinear_routing_blockage \
  add_va_iso_cell \
  connect_pg_net \
  set_pg_grid_config \
  create_power_switch_ring_design_boundary \
  create_power_switch \
  create_ls_bounds \
  create_pg_grid \
  create_power_switch_at_narrow_channel \
  connect_power_switch \
  connect_pg_net \
  connect_sec_pg_power_switch \
  io_placement \
  create_boundary_ws \
  create_boundary_si_blockage \
  add_tap_cells \
  pre_place_fiducial \
  pre_place_bonus_fib \
  insert_antenna_diodes_on_input \
  create_top_pg_pin \
  create_check_grid \
  connect_pg_net \
  check_floorplan \
  cell_usage_audit
  }

set INTEL_APR_SUBSTEPS(upf_place) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  route_options_drc \
  set_ideal_clock_network \
  connect_pg_net \
  place_opt \
  connect_pg_net \
  route_always_on_power \
  change_names \
  cell_usage_audit
  }

#set INTEL_APR_SUBSTEPS(upf_post_place) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  route_options_drc \
  refine_opt \
  connect_pg_net \
  route_always_on_power \
  change_names \
  }

set INTEL_APR_SUBSTEPS(upf_post_route) { \
  lib_cell_usage_setup \
  lib_cell_usage \
  tool_constraints \
  max_tran_constraints \
  extraction_settings_prefill \
  route_options \
  route_options_drc \
  antenna_rules \
  incr_route_opt \
  incr_eco_detail_route \
  incr_create_clock_shield \
  connect_pg_net \
  route_always_on_power \
  incr_detailroute \
  add_filler_cells \
  check_routes \
  connect_pg_net \
  change_names \
  cell_usage_audit
  }

if {[string first 144 $INTEL_LIB_TYPE] > 0} {
set INTEL_APR_SUBSTEPS(upf_post_route) "$INTEL_APR_SUBSTEPS(upf_post_route) extend_tgoxid remove_m1"
} 
########################################
#Outputs and Reports Variables
########################################

#############Synthesis##################
########################################

# Setting the reports var. All the reports listed are in common/scripts/procs_reference.tcl
set INTEL_REPORTS(insert_mbff)     "clock_gating"
set INTEL_REPORTS(inc_compile) "qor area clock clock_gating max_delay max_cap \
  max_tran all_violators saif power check_timing \
  check_design high_fanout timing_setup timing_setup_groups \
  timing_loops congestion dft_drc dft_signal scanpath vars check_mv_design"
set INTEL_REPORTS(optimize_netlist) "qor area clock clock_gating max_delay max_cap \
  max_tran all_violators power check_timing \
  check_design high_fanout timing_setup timing_setup_groups \
  timing_loops dft_signal scanpath vars check_mv_design threshold_voltage_group"
  # Variable used to control report_timing parameters
foreach step $INTEL_SYN_STEPS {
  set INTEL_MAX_PATHS($step)   1000
  set INTEL_SLACK_LIMIT($step) 9999
  set INTEL_NWORST($step)      1
}

set INTEL_OUTPUTS(compile)     "verilog upf"
set INTEL_OUTPUTS(insert_dft)  "verilog upf"
set INTEL_OUTPUTS(inc_compile) "verilog upf sdc saif spef scandef def"
set INTEL_OUTPUTS(optimize_netlist) $INTEL_OUTPUTS(inc_compile)

################ APR ################################################
#####################################################################

# Available report types:
# NOTE: check_mv_design & upf will only be reported if $INTEL_UPF == 1.
# Design checks:   check_mv_design check_timing check_legality check_zrt_routability
# Design reports:  area threshold_voltage_group high_fanout physical
# UPF reports:     upf
# Timing reports:  qor all_violators timing_setup timing_hold timing_setup_zeroRC timing_setup_groups timing_loops
# Clock reports:   clock_tree clock_gating
# Power reports:   saif power
# Route reports:   check_routes lvs
# Other reports:   logic_levels vars

set INTEL_REPORTS(import_design)    "flow_vars"
set INTEL_REPORTS(upf_import_design) "$INTEL_REPORTS(import_design) check_mv_design upf"
set INTEL_REPORTS(floorplan)      "lib_files vars flow_vars check_placement_constraints"
set INTEL_REPORTS(upf_floorplan)    "$INTEL_REPORTS(floorplan) check_mv_design upf"

set INTEL_REPORTS(place)           "lib_files vars flow_vars lib_cell_purpose qor utilization high_fanout check_legality physical"
set INTEL_REPORTS(upf_place)      "$INTEL_REPORTS(place) check_mv_design upf"
#set INTEL_REPORTS(post_place)     "$INTEL_REPORTS(place) check_routability"
set INTEL_REPORTS(post_place)     ""
set INTEL_REPORTS(upf_post_place) "$INTEL_REPORTS(post_place) check_mv_design upf"

set INTEL_REPORTS(cts)            "lib_files vars flow_vars lib_cell_purpose qor utilization clocks \
                                   check_legality check_routability physical timing_setup timing_hold utilization "
set INTEL_REPORTS(post_cts)       "" 
set INTEL_REPORTS(route)          "lib_files vars flow_vars lib_cell_purpose qor utilization \
                                   lvs physical timing_setup timing_hold utilization"
set INTEL_REPORTS(post_route)     "$INTEL_REPORTS(route) check_legality all_violators timing_setup timing_hold power threshold_voltage_groups utilization"
set INTEL_REPORTS(fill)     "$INTEL_REPORTS(route) check_legality all_violators timing_setup timing_hold power threshold_voltage_groups"
set INTEL_REPORTS(upf_post_route) "$INTEL_REPORTS(post_route) check_mv_design upf"

foreach step $INTEL_APR_STEPS {
  set INTEL_MAX_PATHS($step)   1000
  set INTEL_SLACK_LIMIT($step) 9999
  set INTEL_NWORST($step)      1
}

# Available output types: verilog verilog_pg spef def fp sdc oas gds
# NOTE: check_mv_design & upf will only be reported if $INTEL_UPF == 1.

set INTEL_OUTPUTS(import_design)   ""
set  INTEL_OUTPUTS(upf_import_design)  $INTEL_OUTPUTS(import_design)
set INTEL_OUTPUTS(floorplan)       "def"
set INTEL_OUTPUTS(upf_floorplan)   $INTEL_OUTPUTS(floorplan)
set INTEL_OUTPUTS(place)           ""
set INTEL_OUTPUTS(upf_place)       $INTEL_OUTPUTS(place)
set INTEL_OUTPUTS(post_place)      ""
set INTEL_OUTPUTS(upf_post_place)  $INTEL_OUTPUTS(post_place)
set INTEL_OUTPUTS(cts)             ""
set INTEL_OUTPUTS(post_cts)        ""
set INTEL_OUTPUTS(route)           "verilog"
set INTEL_OUTPUTS(post_route)      "$INTEL_OUTPUTS(route) spef sdc def gds oas" 
set INTEL_OUTPUTS(upf_post_route)  $INTEL_OUTPUTS(post_route)
set INTEL_OUTPUTS(fill)            "$INTEL_OUTPUTS(route) verilog_pg spef sdc def gds oas lteloc abstract fram techlef"

################PV######################
set INTEL_STA_RUN_TYPE "timing"
# Variable used to set generate reports for different runs

set INTEL_REPORTS(max)             [list timing_setup all_violators clock check_timing timing_setup_groups pin_margin net_attribute pin_attribute parasitic_not_annotated_check vars max_cap max_tran max_delay error_info aocvm qor min_pulse_width]
set INTEL_REPORTS(min)             [list timing_hold  all_violators clock check_timing timing_hold_groups  pin_margin net_attribute pin_attribute parasitic_not_annotated_check vars error_info aocvm qor min_pulse_width]
set INTEL_REPORTS(noise)           [list noise_all_vio noise_below noise_above check_noise parasitic_not_annotated_check max_analysis_coverage vars error_info qor]
set INTEL_REPORTS(power)           [list power switching_activity missing_power_tables parasitic_not_annotated_check vars error_info qor]

# Variable used to control report_timing parameters
set INTEL_MAX_PATHS(max)            1000
set INTEL_SLACK_LIMIT(max)          9999
set INTEL_NWORST(max)               1

set INTEL_MAX_PATHS(min)            1000
set INTEL_SLACK_LIMIT(min)          9999
set INTEL_NWORST(min)               1

set INTEL_MAX_PATHS(power)            1000
set INTEL_SLACK_LIMIT(power)          9999
set INTEL_NWORST(power)               1

set INTEL_MAX_PATHS(noise)            1000
set INTEL_SLACK_LIMIT(noise)          9999
set INTEL_NWORST(noise)               1

# ERC checks variables and reporting
# Variable to enable ERC checks
set INTEL_PT_ERC_CHECK_ENABLE 0




################PV-DMSA (Variables not yet in use!!)######################

set INTEL_REPORTS(dmsa)              [list timing_setup timing_hold all_violators vars max_cap max_tran max_delay max_analysis_coverage clock_summary]
set INTEL_MAX_PATHS(dmsa)            1000
set INTEL_SLACK_LIMIT(dmsa)          9999
set INTEL_NWORST(dmsa)               1
