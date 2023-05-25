set INTEL_DESIGN_NAME fdkex
set INTEL_INPUT_SCANDEF "[list ./inputs/scandef/fdkex.syn.scandef]"
set INTEL_INPUT_NETLIST "[list ./inputs/netlist/fdkex.vg]"


dict set INTEL_SCENARIOS FUNC_WORST apr_constraints "[list ./inputs/constraints/fdkex.sdc]"
dict set INTEL_SCENARIOS FUNC_BEST apr_constraints "[list ./inputs/constraints/fdkex.sdc]"
dict set INTEL_SCENARIOS FUNC_POWER apr_constraints "[list ./inputs/constraints/fdkex.sdc]"
set INTEL_INSERT_SCAN "1"
set INTEL_FP_BOUNDARY "[list [list 0 0] [list [expr $INTEL_MD_GRID_X * 2163] [expr $INTEL_MD_GRID_Y * 371]]]"




