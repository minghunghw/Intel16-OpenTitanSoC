set INTEL_DESIGN_NAME   "ibex_tlul"
set INTEL_NUM_CPUS      16

dict set INTEL_SCENARIOS FUNC_WORST syn_constraints [list ./inputs/constraints/\$INTEL_DESIGN_NAME.syn.sdc]
dict set INTEL_SCENARIOS FUNC_BEST syn_constraints [list ./inputs/constraints/\$INTEL_DESIGN_NAME.syn.sdc]
dict set INTEL_SCENARIOS FUNC_POWER syn_constraints [list ./inputs/constraints/\$INTEL_DESIGN_NAME.syn.sdc]