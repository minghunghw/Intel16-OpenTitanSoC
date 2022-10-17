source ../rtl_targets.tcl

analyze -f sverilog -define SYN -vcs $rtl_packages
analyze -f sverilog -define SYN -vcs $rtl_prim
analyze -f sverilog -define SYN -vcs $rtl_prim_generic
analyze -f sverilog -define SYN -vcs $rtl_tlul
analyze -f sverilog -define SYN -vcs $rtl_gpio