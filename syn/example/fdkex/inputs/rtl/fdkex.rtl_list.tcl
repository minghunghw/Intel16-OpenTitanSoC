## Analyze verilog and SV files first


set rtl_path ./inputs/rtl
set rtl_list { alu_core.vs check_ecc_alu.vs check_ecc_in.vs fdkex.vs fifo.vs gen_ecc_alu.vs gen_ecc_in.vs init_mask_alu.vs init_mask_in.vs secded_alu.vs secded_in.vs }
if {[info exists synopsys_program_name]} {
  set rtl_read_command analyze
  set rtl_read_args "-format"
  set rtl_read_format sverilog
} else {
  set rtl_read_command read_hdl
  set rtl_read_args "-sv"
  set rtl_read_format ""
}
foreach file $rtl_list {$rtl_read_command $rtl_read_args $rtl_read_format $rtl_path/$file}
