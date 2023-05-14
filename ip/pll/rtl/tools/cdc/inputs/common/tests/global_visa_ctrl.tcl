##################################################
#Start of Section A: Basic Configuration
##################################################
# Black-box the ULMs and PLM to avoid tons of false violations:
netlist blackbox visa_unit_mux_s 
netlist blackbox visa_partition_mux_ng_s 
netlist blackbox visa_partition_mux_ng_xcro_s
netlist blackbox visa_iomapper_mux_cro_s
netlist blackbox visa_repeater_master*

##################################################
# End of Section A: Basic Configuration
##################################################

##################################################
# Section B: Clocks
#  Basic Format: netlist clock <clk_name> -group <clkGroup>
##################################################
netlist clock ss_clk_out -group VISA_SSCLK_GROUP -module visa_unit_mux_s
netlist clock {serial_cfg_out[0]} -group VISACFGCLK_GROUP -module visa_unit_mux_s
netlist clock {serial_cfg_in[0]}  -group VISACFGCLK_GROUP -module visa_unit_mux_s
netlist clock ss_clk_out -group VISA_SSCLK_GROUP -module visa_partition_mux_ng_s
netlist clock ss_clk_out -group VISA_SSCLK_GROUP -module visa_partition_mux_ng_xcro_s
netlist clock ss_clk_out -group VISA_SSCLK_GROUP -module visa_iomapper_mux_cro_s

netlist clock {serial_cfg_out[0]} -group VISACFGCLK_GROUP -module visa_partition_mux_ng_s
netlist clock {serial_cfg_out[0]} -group VISACFGCLK_GROUP -module visa_partition_mux_ng_xcro_s
netlist clock {serial_cfg_out[0]} -group VISACFGCLK_GROUP -module visa_iomapper_mux_cro_s
netlist clock src_clk            -group VISA_SSCLK_GROUP -module visa_repeater_master*
netlist clock ss_clk_out         -group VISA_SSCLK_GROUP -module visa_repeater_master*

##################################################
# End of Section B: Clocks
##################################################

##################################################
# Section C: Resets
#  Basic Format: netlist reset <name> [-remove] [-async] [-negedge] -module <module>
##################################################

##################################################
# End of Section C: Resets
##################################################

##################################################
# Section D: Static and Stable signals
#  Basic Format: cdc signal <name> -stable -module <module>
#                netlist constant <name> 1'b[10] -module <module>
##################################################
netlist constant *visa_all_disable 1'b0
netlist constant *visa_customer_disable 1'b0 
cdc signal bypass_cr_out -stable -module visa_partition_mux_ng_xcro_s
cdc signal extra_cr      -stable -module visa_partition_mux_ng_xcro_s
cdc signal bypass_cr_out -stable -module visa_unit_mux_s



##################################################
# End of Section D: Static and Stable signals
##################################################

##################################################
# Section E: Waivers
#  Basic Format: cdc report crossing -scheme <scheme> [-from <name>] [-through <name>] [-to <name>] \
#    -module <module> -severity waived -rx_clock <GROUP> -comment "<why waiver is ok, with approver name>"
##################################################
cdc report crossing -scheme no_sync -to lane_in* -module visa_unit_mux_s -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Inputs to the VISA network lane_in are not real clock crossings.  Globally waived by jranders"

cdc report crossing -scheme no_sync -to lane_in* -module visa_repeater_master*  -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Inputs to the VISA network lane_in are not real clock crossings.  Globally waived by jranders"

cdc report crossing -scheme no_sync -to data_path_reset -module visa_repeater_master*  -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Visa VT says that visa reset does not need to be synchronous to any clock because it should be connected to earliest unit reset.  Globally waived by jranders"

#cdc report crossing -scheme no_sync -to bypass   -module visa_repeater_master*  -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Inputs to the VISA network lane_in are not real clock crossings.  Globally waived by jranders"

cdc report crossing -scheme multi_bits -to lane_in* -module visa_unit_mux_s -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Inputs to the VISA network lane_in are not real clock crossings.  Globally waived by jranders"

cdc report crossing -scheme multi_bits -to lane_in* -module visa_repeater_master*  -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Inputs to the VISA network lane_in are not real clock crossings.  Globally waived by jranders"

cdc report crossing -scheme no_sync -to visa_resetb -module visa_unit_mux_s -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Visa VT says that visa reset does not need to be synchronous to any clock because it should be connected to earliest unit reset.  Globally waived by jranders"

cdc report crossing -scheme no_sync -to visa_resetb -module visa_partition_mux_ng_s -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Visa VT says that visa reset does not need to be synchronous to any clock because it should be connected to earliest unit reset.  Globally waived by jranders"

cdc report crossing -scheme no_sync -to visa_resetb -module visa_partition_mux_ng_xcro_s -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Visa VT says that visa reset does not need to be synchronous to any clock because it should be connected to earliest unit reset.  Globally waived by jranders"

cdc report crossing -scheme no_sync -to visa_resetb -module visa_iomapper_mux_cro_s -severity waived -rx_clock VISA_SSCLK_GROUP -comment "Visa VT says that visa reset does not need to be synchronous to any clock because it should be connected to earliest unit reset.  Globally waived by jranders"

##################################################
# End of Section E: Waivers
##################################################

##################################################
# Global Directives
##################################################
netlist port domain customer_disable -module visa_unit_mux_s      -clock VISA_SSCLK_GROUP 
netlist port domain all_disable      -module visa_unit_mux_s      -clock VISA_SSCLK_GROUP 
netlist port domain customer_disable -module visa_partition_mux_s -clock VISA_SSCLK_GROUP
netlist port domain all_disable      -module visa_partition_mux_s -clock VISA_SSCLK_GROUP

netlist port domain data_path_reset   -module visa_iomapper_mux_cro_s -clock VISA_SSCLK_GROUP
netlist port domain bypass_cr_out     -module visa_iomapper_mux_cro_s -clock VISA_SSCLK_GROUP
netlist port domain global_bypass_out -module visa_iomapper_mux_cro_s -clock VISA_SSCLK_GROUP
netlist port domain clk_sel_out       -module visa_iomapper_mux_cro_s -clock VISA_SSCLK_GROUP

foreach module [list "visa_unit_mux_s" "visa_partition_mux_ng_s" \
                "visa_partition_mux_ng_xcro_s" "visa_iomapper_mux_cro_s" ] {
  netlist port domain src_clk          -module $module -clock VISA_SSCLK_GROUP
  netlist port domain visa_resetb      -module $module -clock VISA_SSCLK_GROUP 
  netlist port domain visa_unit_id     -module $module -clock VISA_SSCLK_GROUP 
  netlist port domain reg_start_index  -module $module -clock VISA_SSCLK_GROUP 
  netlist port domain fscan_mode       -module $module -clock VISA_SSCLK_GROUP 
  netlist port domain xbar_ss_clk_out  -module $module -clock VISA_SSCLK_GROUP 
  netlist port domain xbar_out         -module $module -clock VISA_SSCLK_GROUP 
  netlist port domain lane_in          -module $module -clock VISA_SSCLK_GROUP
  netlist port domain lane_out         -module $module -clock VISA_SSCLK_GROUP
  netlist port domain {serial_cfg_in[2:1]}  -module $module -clock VISACFGCLK_GROUP
  netlist port domain {serial_cfg_out[2:1]} -module $module -clock VISACFGCLK_GROUP
}

netlist port domain lane_in           -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain bypass            -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain lane_out          -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain centering_en      -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain data_path_reset   -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain bypass_out        -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain global_bypass     -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain ss_npk_pti_rdclk  -clock VISA_SSCLK_GROUP -module visa_repeater_master*
netlist port domain npk_pti_valid_sel -clock VISA_SSCLK_GROUP -module visa_repeater_master*

netlist port domain visa_enabled -clock VISACFGCLK_GROUP -module visa_unit_mux_s

