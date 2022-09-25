source ../rtl_targets.tcl

analyze -f sverilog -define SYN -vcs +incdir+$rtl_includes $rtl_packages
analyze -f sverilog -define SYN -vcs +incdir+$rtl_includes $rtl_prim
analyze -f sverilog -define SYN -vcs +incdir+$rtl_includes $rtl_tlul
analyze -f sverilog -define SYN -vcs +incdir+$rtl_includes $rtl_mem