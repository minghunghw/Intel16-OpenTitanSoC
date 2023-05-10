source ../rtl_targets.tcl

analyze -f sverilog -define SYN $rtl_packages
analyze -f sverilog -define SYN $rtl_toy_design