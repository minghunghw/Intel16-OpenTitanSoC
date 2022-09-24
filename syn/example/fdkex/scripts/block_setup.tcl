set INTEL_DESIGN_NAME fdkex
set INTEL_INSERT_SCAN "1"
dict set INTEL_SCENARIOS FUNC_WORST syn_constraints "[list ./inputs/constraints/fdkex.syn.sdc]"
dict set INTEL_SCENARIOS FUNC_BEST syn_constraints "[list ./inputs/constraints/fdkex.syn.sdc]"
dict set INTEL_SCENARIOS FUNC_POWER syn_constraints "[list ./inputs/constraints/fdkex.syn.sdc]"
