#-- Synopsys, Inc.
#-- Version J-2014.09-T0909

#implementation: "rev_1"
impl -add rev_1 -type fpga

#implementation attributes
set_option -vlog_std sysv
set_option -project_relative_includes 1

##device options
set_option -technology Virtex7
set_option -part XC7VX485T
set_option -package FFG1157
set_option -speed_grade -1
set_option -part_companion ""

#compilation/mapping options
set_option -use_fsm_explorer 0
set_option -resolve_multiple_driver 1

# mapper_options
set_option -frequency auto
set_option -write_verilog 1
set_option -write_vhdl 0
set_option -srs_instrumentation 1

# xilinx_options
set_option -RWCheckOnRam 1

# Xilinx Virtex2
set_option -run_prop_extract 1
set_option -maxfan 10000
set_option -disable_io_insertion 0
set_option -pipe 1
set_option -update_models_cp 0
set_option -retiming 0
set_option -no_sequential_opt 0
set_option -fix_gated_and_generated_clocks 1

# Xilinx Virtex7
set_option -enable_prepacking 1
set_option -use_vivado 1

# sequential_optimization_options
set_option -symbolic_fsm_compiler 1

# Compiler Options
set_option -compiler_compatible 0
set_option -resource_sharing 1
set_option -multi_file_compilation_unit 1
set_option -dc_root /nfs/site/eda/tools/synopsys/designcompiler/F-2011.09/common/
set_option -dw_foundation 1

# Compiler Options
set_option -auto_infer_blackbox 1
set_option -continue_on_error 1

#automatic place and route (vendor) options
set_option -write_apr_constraint 1
