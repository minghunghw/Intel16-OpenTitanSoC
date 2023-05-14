#Placeholder for ANY additional source files e.g:
# Design constraints
# Configuration files
# Netlist files (EDIF or NGC)
#Examples:
# To add a design constraint file, do:
# add_file -[analysis_constraint |
#			  compiler_constraint |
#             edif |
#             fpga_constraint |
#             xilinx
#             nrf |
#             xflow |
#             physical_constraint |
#             partition |
#             constraint |
#             verilog
#             tcl |
#             include |
 #            clearbox_verilog] filenanme
# To add a configuration file config_name.v, do:
# add_file -verilog -vlog_std sysv "/path/to/the/configuration/direcotory/cofig_name.v"
# To add a Xilinx proprietary netlist file (e.g. from Coregen), do:
# add_file -xilinx "path/to/netlist/directory/netlist_name.ngc"

