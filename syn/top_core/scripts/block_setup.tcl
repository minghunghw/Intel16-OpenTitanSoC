set INTEL_DESIGN_NAME   "top_core"
set INTEL_NUM_CPUS      16

dict set INTEL_SCENARIOS FUNC_WORST syn_constraints [list ./inputs/constraints/\$INTEL_DESIGN_NAME.clocks.tcl ./inputs/constraints/\$INTEL_DESIGN_NAME.constraints.tcl]
