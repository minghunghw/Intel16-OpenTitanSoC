
set rtl_path ./inputs/rtl
set rtl_list { dhm.v convert_64_8.v convert_8_64.v convert_8_8.v des_decrypt_mixed.v des_encrypt_mixed.v dhm_bypass.v dhm_core.v dhm_lut.v dhm_sleep_logic.v dhm_unit.v }
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

