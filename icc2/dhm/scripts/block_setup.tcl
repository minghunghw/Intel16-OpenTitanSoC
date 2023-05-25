set INTEL_DESIGN_NAME dhm

set INTEL_FP_BOUNDARY {}; foreach coord {{0 10} {0 90} {14 90} {14 120} {80 120} {80 84} {94 84} {94 21} {80 21} {80 0} {10 0} {10 10}} {
  lappend INTEL_FP_BOUNDARY "[expr [lindex $coord 0] * $INTEL_MD_GRID_X * 3*5] [expr [lindex $coord 1] * $INTEL_MD_GRID_Y * 3]"
}


#set INTEL_TECH_FILE ./p1222_icc2.tf

set INTEL_UPF 1

#P_source_if_exists dhm.upf_pp_setup.tcl

set INTEL_INPUT_NETLIST "./inputs/netlist/${INTEL_DESIGN_NAME}_syn.vg"

set INTEL_INPUT_UPF ./inputs/upf/${INTEL_DESIGN_NAME}.upf



set INTEL_APR_STEPS { upf_import_design upf_floorplan upf_place cts route upf_post_route fill }

dict set INTEL_SCENARIOS FUNC_WORST upf_supply_net "[list ./inputs/upf/$INTEL_DESIGN_NAME.upf]"
#set INTEL_ENABLE_LS_TYPES { ls_nn ls_hn ls_mn ls_ln}

### Adding to include second corner for synthesis
#set INTEL_UPF_VERSION "1.0"
set INTEL_UPF_POWER_NETS {vss vccL vcc}
set INTEL_POWER_PLAN mesh_upf_2aosv
set INTEL_PORT_LAYERS {m6 m7 m8}
