###################################################################

# Created by write_sdc for scenario [FUNC_WORST] on Wed Apr 26 17:49:59 2023

###################################################################
set sdc_version 2.1

set_units -time ps -resistance kOhm -capacitance fF -voltage V -current mA
#set_operating_conditions -analysis_type on_chip_variation typical_1.00 -library lib224_b0m_6t_108pp_base_hp_psss_0p765v_125c_tttt_ctyp_ccslnt
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_22__u_counter_dout_reg_23_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_20__u_counter_dout_reg_21_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_18__u_counter_dout_reg_19_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_16__u_counter_dout_reg_17_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_14__u_counter_dout_reg_15_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_12__u_counter_dout_reg_13_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_10__u_counter_dout_reg_11_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_8__u_counter_dout_reg_9_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_6__u_counter_dout_reg_7_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_4__u_counter_dout_reg_5_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_2__u_counter_dout_reg_3_]
#set_max_time_borrow 0 [get_cells u_counter_dout_reg_0__u_counter_dout_reg_1_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_22__u_counter_count_reg_23_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_20__u_counter_count_reg_21_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_18__u_counter_count_reg_19_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_16__u_counter_count_reg_17_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_14__u_counter_count_reg_15_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_12__u_counter_count_reg_13_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_10__u_counter_count_reg_11_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_8__u_counter_count_reg_9_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_6__u_counter_count_reg_7_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_4__u_counter_count_reg_5_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_2__u_counter_count_reg_3_]
#set_max_time_borrow 0 [get_cells u_counter_count_reg_0__u_counter_count_reg_1_]
create_clock [get_ports clk]  -period 10000  -waveform {0 5000}
set_clock_latency 500  [get_clocks clk]
set_clock_uncertainty 150  [get_clocks clk]
set_clock_transition -max -rise 200 [get_clocks clk]
set_clock_transition -max -fall 200 [get_clocks clk]
set_clock_transition -min -rise 200 [get_clocks clk]
set_clock_transition -min -fall 200 [get_clocks clk]
group_path -weight 5  -name REG2REG  -from [list [get_cells u_counter_dout_reg_0__u_counter_dout_reg_1_] [get_cells u_counter_dout_reg_2__u_counter_dout_reg_3_] [get_cells u_counter_dout_reg_4__u_counter_dout_reg_5_] [get_cells u_counter_dout_reg_6__u_counter_dout_reg_7_] [get_cells u_counter_dout_reg_8__u_counter_dout_reg_9_] [get_cells u_counter_dout_reg_10__u_counter_dout_reg_11_] [get_cells u_counter_dout_reg_12__u_counter_dout_reg_13_] [get_cells u_counter_dout_reg_14__u_counter_dout_reg_15_] [get_cells u_counter_dout_reg_16__u_counter_dout_reg_17_] [get_cells u_counter_dout_reg_18__u_counter_dout_reg_19_] [get_cells u_counter_dout_reg_20__u_counter_dout_reg_21_] [get_cells u_counter_dout_reg_22__u_counter_dout_reg_23_] [get_cells u_counter_count_reg_0__u_counter_count_reg_1_] [get_cells u_counter_count_reg_2__u_counter_count_reg_3_] [get_cells u_counter_count_reg_4__u_counter_count_reg_5_] [get_cells u_counter_count_reg_6__u_counter_count_reg_7_] [get_cells u_counter_count_reg_8__u_counter_count_reg_9_] [get_cells u_counter_count_reg_10__u_counter_count_reg_11_] [get_cells u_counter_count_reg_12__u_counter_count_reg_13_] [get_cells u_counter_count_reg_14__u_counter_count_reg_15_] [get_cells u_counter_count_reg_16__u_counter_count_reg_17_] [get_cells u_counter_count_reg_18__u_counter_count_reg_19_] [get_cells u_counter_count_reg_20__u_counter_count_reg_21_] [get_cells u_counter_count_reg_22__u_counter_count_reg_23_]]  -to [list [get_cells u_counter_dout_reg_0__u_counter_dout_reg_1_] [get_cells u_counter_dout_reg_2__u_counter_dout_reg_3_] [get_cells u_counter_dout_reg_4__u_counter_dout_reg_5_] [get_cells u_counter_dout_reg_6__u_counter_dout_reg_7_] [get_cells u_counter_dout_reg_8__u_counter_dout_reg_9_] [get_cells u_counter_dout_reg_10__u_counter_dout_reg_11_] [get_cells u_counter_dout_reg_12__u_counter_dout_reg_13_] [get_cells u_counter_dout_reg_14__u_counter_dout_reg_15_] [get_cells u_counter_dout_reg_16__u_counter_dout_reg_17_] [get_cells u_counter_dout_reg_18__u_counter_dout_reg_19_] [get_cells u_counter_dout_reg_20__u_counter_dout_reg_21_] [get_cells u_counter_dout_reg_22__u_counter_dout_reg_23_] [get_cells u_counter_count_reg_0__u_counter_count_reg_1_] [get_cells u_counter_count_reg_2__u_counter_count_reg_3_] [get_cells u_counter_count_reg_4__u_counter_count_reg_5_] [get_cells u_counter_count_reg_6__u_counter_count_reg_7_] [get_cells u_counter_count_reg_8__u_counter_count_reg_9_] [get_cells u_counter_count_reg_10__u_counter_count_reg_11_] [get_cells u_counter_count_reg_12__u_counter_count_reg_13_] [get_cells u_counter_count_reg_14__u_counter_count_reg_15_] [get_cells u_counter_count_reg_16__u_counter_count_reg_17_] [get_cells u_counter_count_reg_18__u_counter_count_reg_19_] [get_cells u_counter_count_reg_20__u_counter_count_reg_21_] [get_cells u_counter_count_reg_22__u_counter_count_reg_23_]]
group_path -name COMB  -from [list [get_ports clk] [get_ports {sel[95]}] [get_ports {sel[94]}] [get_ports {sel[93]}] [get_ports {sel[92]}] [get_ports {sel[91]}] [get_ports {sel[90]}] [get_ports {sel[89]}] [get_ports {sel[88]}] [get_ports {sel[87]}] [get_ports {sel[86]}] [get_ports {sel[85]}] [get_ports {sel[84]}] [get_ports {sel[83]}] [get_ports {sel[82]}] [get_ports {sel[81]}] [get_ports {sel[80]}] [get_ports {sel[79]}] [get_ports {sel[78]}] [get_ports {sel[77]}] [get_ports {sel[76]}] [get_ports {sel[75]}] [get_ports {sel[74]}] [get_ports {sel[73]}] [get_ports {sel[72]}] [get_ports {sel[71]}] [get_ports {sel[70]}] [get_ports {sel[69]}] [get_ports {sel[68]}] [get_ports {sel[67]}] [get_ports {sel[66]}] [get_ports {sel[65]}] [get_ports {sel[64]}] [get_ports {sel[63]}] [get_ports {sel[62]}] [get_ports {sel[61]}] [get_ports {sel[60]}] [get_ports {sel[59]}] [get_ports {sel[58]}] [get_ports {sel[57]}] [get_ports {sel[56]}] [get_ports {sel[55]}] [get_ports {sel[54]}] [get_ports {sel[53]}] [get_ports {sel[52]}] [get_ports {sel[51]}] [get_ports {sel[50]}] [get_ports {sel[49]}] [get_ports {sel[48]}] [get_ports {sel[47]}] [get_ports {sel[46]}] [get_ports {sel[45]}] [get_ports {sel[44]}] [get_ports {sel[43]}] [get_ports {sel[42]}] [get_ports {sel[41]}] [get_ports {sel[40]}] [get_ports {sel[39]}] [get_ports {sel[38]}] [get_ports {sel[37]}] [get_ports {sel[36]}] [get_ports {sel[35]}] [get_ports {sel[34]}] [get_ports {sel[33]}] [get_ports {sel[32]}] [get_ports {sel[31]}] [get_ports {sel[30]}] [get_ports {sel[29]}] [get_ports {sel[28]}] [get_ports {sel[27]}] [get_ports {sel[26]}] [get_ports {sel[25]}] [get_ports {sel[24]}] [get_ports {sel[23]}] [get_ports {sel[22]}] [get_ports {sel[21]}] [get_ports {sel[20]}] [get_ports {sel[19]}] [get_ports {sel[18]}] [get_ports {sel[17]}] [get_ports {sel[16]}] [get_ports {sel[15]}] [get_ports {sel[14]}] [get_ports {sel[13]}] [get_ports {sel[12]}] [get_ports {sel[11]}] [get_ports {sel[10]}] [get_ports {sel[9]}] [get_ports {sel[8]}] [get_ports {sel[7]}] [get_ports {sel[6]}] [get_ports {sel[5]}] [get_ports {sel[4]}] [get_ports {sel[3]}] [get_ports {sel[2]}] [get_ports {sel[1]}] [get_ports {sel[0]}]]  -to [list [get_ports {dout[23]}] [get_ports {dout[22]}] [get_ports {dout[21]}] [get_ports {dout[20]}] [get_ports {dout[19]}] [get_ports {dout[18]}] [get_ports {dout[17]}] [get_ports {dout[16]}] [get_ports {dout[15]}] [get_ports {dout[14]}] [get_ports {dout[13]}] [get_ports {dout[12]}] [get_ports {dout[11]}] [get_ports {dout[10]}] [get_ports {dout[9]}] [get_ports {dout[8]}] [get_ports {dout[7]}] [get_ports {dout[6]}] [get_ports {dout[5]}] [get_ports {dout[4]}] [get_ports {dout[3]}] [get_ports {dout[2]}] [get_ports {dout[1]}] [get_ports {dout[0]}]]
group_path -name INPUTS  -from [list [get_ports {sel[95]}] [get_ports {sel[94]}] [get_ports {sel[93]}] [get_ports {sel[92]}] [get_ports {sel[91]}] [get_ports {sel[90]}] [get_ports {sel[89]}] [get_ports {sel[88]}] [get_ports {sel[87]}] [get_ports {sel[86]}] [get_ports {sel[85]}] [get_ports {sel[84]}] [get_ports {sel[83]}] [get_ports {sel[82]}] [get_ports {sel[81]}] [get_ports {sel[80]}] [get_ports {sel[79]}] [get_ports {sel[78]}] [get_ports {sel[77]}] [get_ports {sel[76]}] [get_ports {sel[75]}] [get_ports {sel[74]}] [get_ports {sel[73]}] [get_ports {sel[72]}] [get_ports {sel[71]}] [get_ports {sel[70]}] [get_ports {sel[69]}] [get_ports {sel[68]}] [get_ports {sel[67]}] [get_ports {sel[66]}] [get_ports {sel[65]}] [get_ports {sel[64]}] [get_ports {sel[63]}] [get_ports {sel[62]}] [get_ports {sel[61]}] [get_ports {sel[60]}] [get_ports {sel[59]}] [get_ports {sel[58]}] [get_ports {sel[57]}] [get_ports {sel[56]}] [get_ports {sel[55]}] [get_ports {sel[54]}] [get_ports {sel[53]}] [get_ports {sel[52]}] [get_ports {sel[51]}] [get_ports {sel[50]}] [get_ports {sel[49]}] [get_ports {sel[48]}] [get_ports {sel[47]}] [get_ports {sel[46]}] [get_ports {sel[45]}] [get_ports {sel[44]}] [get_ports {sel[43]}] [get_ports {sel[42]}] [get_ports {sel[41]}] [get_ports {sel[40]}] [get_ports {sel[39]}] [get_ports {sel[38]}] [get_ports {sel[37]}] [get_ports {sel[36]}] [get_ports {sel[35]}] [get_ports {sel[34]}] [get_ports {sel[33]}] [get_ports {sel[32]}] [get_ports {sel[31]}] [get_ports {sel[30]}] [get_ports {sel[29]}] [get_ports {sel[28]}] [get_ports {sel[27]}] [get_ports {sel[26]}] [get_ports {sel[25]}] [get_ports {sel[24]}] [get_ports {sel[23]}] [get_ports {sel[22]}] [get_ports {sel[21]}] [get_ports {sel[20]}] [get_ports {sel[19]}] [get_ports {sel[18]}] [get_ports {sel[17]}] [get_ports {sel[16]}] [get_ports {sel[15]}] [get_ports {sel[14]}] [get_ports {sel[13]}] [get_ports {sel[12]}] [get_ports {sel[11]}] [get_ports {sel[10]}] [get_ports {sel[9]}] [get_ports {sel[8]}] [get_ports {sel[7]}] [get_ports {sel[6]}] [get_ports {sel[5]}] [get_ports {sel[4]}] [get_ports {sel[3]}] [get_ports {sel[2]}] [get_ports {sel[1]}] [get_ports {sel[0]}]]
group_path -name OUTPUTS  -to [list [get_ports {dout[23]}] [get_ports {dout[22]}] [get_ports {dout[21]}] [get_ports {dout[20]}] [get_ports {dout[19]}] [get_ports {dout[18]}] [get_ports {dout[17]}] [get_ports {dout[16]}] [get_ports {dout[15]}] [get_ports {dout[14]}] [get_ports {dout[13]}] [get_ports {dout[12]}] [get_ports {dout[11]}] [get_ports {dout[10]}] [get_ports {dout[9]}] [get_ports {dout[8]}] [get_ports {dout[7]}] [get_ports {dout[6]}] [get_ports {dout[5]}] [get_ports {dout[4]}] [get_ports {dout[3]}] [get_ports {dout[2]}] [get_ports {dout[1]}] [get_ports {dout[0]}]]
set_input_delay -clock clk  2000  [get_ports clk]
set_input_delay -clock clk  2000  [get_ports {sel[95]}]
set_input_delay -clock clk  2000  [get_ports {sel[94]}]
set_input_delay -clock clk  2000  [get_ports {sel[93]}]
set_input_delay -clock clk  2000  [get_ports {sel[92]}]
set_input_delay -clock clk  2000  [get_ports {sel[91]}]
set_input_delay -clock clk  2000  [get_ports {sel[90]}]
set_input_delay -clock clk  2000  [get_ports {sel[89]}]
set_input_delay -clock clk  2000  [get_ports {sel[88]}]
set_input_delay -clock clk  2000  [get_ports {sel[87]}]
set_input_delay -clock clk  2000  [get_ports {sel[86]}]
set_input_delay -clock clk  2000  [get_ports {sel[85]}]
set_input_delay -clock clk  2000  [get_ports {sel[84]}]
set_input_delay -clock clk  2000  [get_ports {sel[83]}]
set_input_delay -clock clk  2000  [get_ports {sel[82]}]
set_input_delay -clock clk  2000  [get_ports {sel[81]}]
set_input_delay -clock clk  2000  [get_ports {sel[80]}]
set_input_delay -clock clk  2000  [get_ports {sel[79]}]
set_input_delay -clock clk  2000  [get_ports {sel[78]}]
set_input_delay -clock clk  2000  [get_ports {sel[77]}]
set_input_delay -clock clk  2000  [get_ports {sel[76]}]
set_input_delay -clock clk  2000  [get_ports {sel[75]}]
set_input_delay -clock clk  2000  [get_ports {sel[74]}]
set_input_delay -clock clk  2000  [get_ports {sel[73]}]
set_input_delay -clock clk  2000  [get_ports {sel[72]}]
set_input_delay -clock clk  2000  [get_ports {sel[71]}]
set_input_delay -clock clk  2000  [get_ports {sel[70]}]
set_input_delay -clock clk  2000  [get_ports {sel[69]}]
set_input_delay -clock clk  2000  [get_ports {sel[68]}]
set_input_delay -clock clk  2000  [get_ports {sel[67]}]
set_input_delay -clock clk  2000  [get_ports {sel[66]}]
set_input_delay -clock clk  2000  [get_ports {sel[65]}]
set_input_delay -clock clk  2000  [get_ports {sel[64]}]
set_input_delay -clock clk  2000  [get_ports {sel[63]}]
set_input_delay -clock clk  2000  [get_ports {sel[62]}]
set_input_delay -clock clk  2000  [get_ports {sel[61]}]
set_input_delay -clock clk  2000  [get_ports {sel[60]}]
set_input_delay -clock clk  2000  [get_ports {sel[59]}]
set_input_delay -clock clk  2000  [get_ports {sel[58]}]
set_input_delay -clock clk  2000  [get_ports {sel[57]}]
set_input_delay -clock clk  2000  [get_ports {sel[56]}]
set_input_delay -clock clk  2000  [get_ports {sel[55]}]
set_input_delay -clock clk  2000  [get_ports {sel[54]}]
set_input_delay -clock clk  2000  [get_ports {sel[53]}]
set_input_delay -clock clk  2000  [get_ports {sel[52]}]
set_input_delay -clock clk  2000  [get_ports {sel[51]}]
set_input_delay -clock clk  2000  [get_ports {sel[50]}]
set_input_delay -clock clk  2000  [get_ports {sel[49]}]
set_input_delay -clock clk  2000  [get_ports {sel[48]}]
set_input_delay -clock clk  2000  [get_ports {sel[47]}]
set_input_delay -clock clk  2000  [get_ports {sel[46]}]
set_input_delay -clock clk  2000  [get_ports {sel[45]}]
set_input_delay -clock clk  2000  [get_ports {sel[44]}]
set_input_delay -clock clk  2000  [get_ports {sel[43]}]
set_input_delay -clock clk  2000  [get_ports {sel[42]}]
set_input_delay -clock clk  2000  [get_ports {sel[41]}]
set_input_delay -clock clk  2000  [get_ports {sel[40]}]
set_input_delay -clock clk  2000  [get_ports {sel[39]}]
set_input_delay -clock clk  2000  [get_ports {sel[38]}]
set_input_delay -clock clk  2000  [get_ports {sel[37]}]
set_input_delay -clock clk  2000  [get_ports {sel[36]}]
set_input_delay -clock clk  2000  [get_ports {sel[35]}]
set_input_delay -clock clk  2000  [get_ports {sel[34]}]
set_input_delay -clock clk  2000  [get_ports {sel[33]}]
set_input_delay -clock clk  2000  [get_ports {sel[32]}]
set_input_delay -clock clk  2000  [get_ports {sel[31]}]
set_input_delay -clock clk  2000  [get_ports {sel[30]}]
set_input_delay -clock clk  2000  [get_ports {sel[29]}]
set_input_delay -clock clk  2000  [get_ports {sel[28]}]
set_input_delay -clock clk  2000  [get_ports {sel[27]}]
set_input_delay -clock clk  2000  [get_ports {sel[26]}]
set_input_delay -clock clk  2000  [get_ports {sel[25]}]
set_input_delay -clock clk  2000  [get_ports {sel[24]}]
set_input_delay -clock clk  2000  [get_ports {sel[23]}]
set_input_delay -clock clk  2000  [get_ports {sel[22]}]
set_input_delay -clock clk  2000  [get_ports {sel[21]}]
set_input_delay -clock clk  2000  [get_ports {sel[20]}]
set_input_delay -clock clk  2000  [get_ports {sel[19]}]
set_input_delay -clock clk  2000  [get_ports {sel[18]}]
set_input_delay -clock clk  2000  [get_ports {sel[17]}]
set_input_delay -clock clk  2000  [get_ports {sel[16]}]
set_input_delay -clock clk  2000  [get_ports {sel[15]}]
set_input_delay -clock clk  2000  [get_ports {sel[14]}]
set_input_delay -clock clk  2000  [get_ports {sel[13]}]
set_input_delay -clock clk  2000  [get_ports {sel[12]}]
set_input_delay -clock clk  2000  [get_ports {sel[11]}]
set_input_delay -clock clk  2000  [get_ports {sel[10]}]
set_input_delay -clock clk  2000  [get_ports {sel[9]}]
set_input_delay -clock clk  2000  [get_ports {sel[8]}]
set_input_delay -clock clk  2000  [get_ports {sel[7]}]
set_input_delay -clock clk  2000  [get_ports {sel[6]}]
set_input_delay -clock clk  2000  [get_ports {sel[5]}]
set_input_delay -clock clk  2000  [get_ports {sel[4]}]
set_input_delay -clock clk  2000  [get_ports {sel[3]}]
set_input_delay -clock clk  2000  [get_ports {sel[2]}]
set_input_delay -clock clk  2000  [get_ports {sel[1]}]
set_input_delay -clock clk  2000  [get_ports {sel[0]}]
set_output_delay -clock clk  2000  [get_ports {dout[23]}]
set_output_delay -clock clk  2000  [get_ports {dout[22]}]
set_output_delay -clock clk  2000  [get_ports {dout[21]}]
set_output_delay -clock clk  2000  [get_ports {dout[20]}]
set_output_delay -clock clk  2000  [get_ports {dout[19]}]
set_output_delay -clock clk  2000  [get_ports {dout[18]}]
set_output_delay -clock clk  2000  [get_ports {dout[17]}]
set_output_delay -clock clk  2000  [get_ports {dout[16]}]
set_output_delay -clock clk  2000  [get_ports {dout[15]}]
set_output_delay -clock clk  2000  [get_ports {dout[14]}]
set_output_delay -clock clk  2000  [get_ports {dout[13]}]
set_output_delay -clock clk  2000  [get_ports {dout[12]}]
set_output_delay -clock clk  2000  [get_ports {dout[11]}]
set_output_delay -clock clk  2000  [get_ports {dout[10]}]
set_output_delay -clock clk  2000  [get_ports {dout[9]}]
set_output_delay -clock clk  2000  [get_ports {dout[8]}]
set_output_delay -clock clk  2000  [get_ports {dout[7]}]
set_output_delay -clock clk  2000  [get_ports {dout[6]}]
set_output_delay -clock clk  2000  [get_ports {dout[5]}]
set_output_delay -clock clk  2000  [get_ports {dout[4]}]
set_output_delay -clock clk  2000  [get_ports {dout[3]}]
set_output_delay -clock clk  2000  [get_ports {dout[2]}]
set_output_delay -clock clk  2000  [get_ports {dout[1]}]
set_output_delay -clock clk  2000  [get_ports {dout[0]}]
#set_load 0.199788  [get_nets {dout[23]}]
#set_resistance 0.0285285  [get_nets {dout[23]}]
#set_load 1.52597  [get_nets {dout[22]}]
#set_resistance 0.221961  [get_nets {dout[22]}]
#set_load 0.122474  [get_nets {dout[21]}]
#set_resistance 0.0175876  [get_nets {dout[21]}]
#set_load 1.01316  [get_nets {dout[20]}]
#set_resistance 0.148507  [get_nets {dout[20]}]
#set_load 0.153993  [get_nets {dout[19]}]
#set_resistance 0.0218128  [get_nets {dout[19]}]
#set_load 0.308504  [get_nets {dout[18]}]
#set_resistance 0.044373  [get_nets {dout[18]}]
#set_load 0.281523  [get_nets {dout[17]}]
#set_resistance 0.0412266  [get_nets {dout[17]}]
#set_load 0.281756  [get_nets {dout[16]}]
#set_resistance 0.039281  [get_nets {dout[16]}]
#set_load 0.0386931  [get_nets {dout[15]}]
#set_resistance 0.00573983  [get_nets {dout[15]}]
#set_load 0.211705  [get_nets {dout[14]}]
#set_resistance 0.0316677  [get_nets {dout[14]}]
#set_load 0.114073  [get_nets {dout[13]}]
#set_resistance 0.0161109  [get_nets {dout[13]}]
#set_load 0.480947  [get_nets {dout[12]}]
#set_resistance 0.0711782  [get_nets {dout[12]}]
#set_load 0.189903  [get_nets {dout[11]}]
#set_resistance 0.0282139  [get_nets {dout[11]}]
#set_load 0.53096  [get_nets {dout[10]}]
#set_resistance 0.0743542  [get_nets {dout[10]}]
#set_load 0.310055  [get_nets {dout[9]}]
#set_resistance 0.0438855  [get_nets {dout[9]}]
#set_load 0.303093  [get_nets {dout[8]}]
#set_resistance 0.042996  [get_nets {dout[8]}]
#set_load 0.338847  [get_nets {dout[7]}]
#set_resistance 0.0478779  [get_nets {dout[7]}]
#set_load 0.317224  [get_nets {dout[6]}]
#set_resistance 0.0447941  [get_nets {dout[6]}]
#set_load 0.23995  [get_nets {dout[5]}]
#set_resistance 0.0355807  [get_nets {dout[5]}]
#set_load 0.865409  [get_nets {dout[4]}]
#set_resistance 0.128675  [get_nets {dout[4]}]
#set_load 0.128019  [get_nets {dout[3]}]
#set_resistance 0.0191415  [get_nets {dout[3]}]
#set_load 0.890054  [get_nets {dout[2]}]
#set_resistance 0.128059  [get_nets {dout[2]}]
#set_load 0.00992263  [get_nets {dout[1]}]
#set_resistance 0.00146451  [get_nets {dout[1]}]
#set_load 0.781728  [get_nets {dout[0]}]
#set_resistance 0.111505  [get_nets {dout[0]}]
#set_load 0.24357  [get_nets u_counter_N24]
#set_resistance 0.0345263  [get_nets u_counter_N24]
#set_load 0.527239  [get_nets u_counter_N23]
#set_resistance 0.076206  [get_nets u_counter_N23]
#set_load 0.258806  [get_nets u_counter_N22]
#set_resistance 0.0359736  [get_nets u_counter_N22]
#set_load 0.938297  [get_nets u_counter_N21]
#set_resistance 0.138884  [get_nets u_counter_N21]
#set_load 0.373612  [get_nets u_counter_N20]
#set_resistance 0.0525623  [get_nets u_counter_N20]
#set_load 0.112091  [get_nets u_counter_N19]
#set_resistance 0.0161408  [get_nets u_counter_N19]
#set_load 0.272879  [get_nets u_counter_N18]
#set_resistance 0.0380655  [get_nets u_counter_N18]
#set_load 0.271351  [get_nets u_counter_N17]
#set_resistance 0.0394989  [get_nets u_counter_N17]
#set_load 0.247975  [get_nets u_counter_N16]
#set_resistance 0.0344938  [get_nets u_counter_N16]
#set_load 0.543747  [get_nets u_counter_N15]
#set_resistance 0.0803737  [get_nets u_counter_N15]
#set_load 0.303608  [get_nets u_counter_N14]
#set_resistance 0.0430185  [get_nets u_counter_N14]
#set_load 0.178711  [get_nets u_counter_N13]
#set_resistance 0.0257789  [get_nets u_counter_N13]
#set_load 0.300039  [get_nets u_counter_N12]
#set_resistance 0.0418763  [get_nets u_counter_N12]
#set_load 0.400148  [get_nets u_counter_N11]
#set_resistance 0.0581277  [get_nets u_counter_N11]
#set_load 0.294213  [get_nets u_counter_N10]
#set_resistance 0.041418  [get_nets u_counter_N10]
#set_load 0.406732  [get_nets u_counter_N9]
#set_resistance 0.0588149  [get_nets u_counter_N9]
#set_load 0.275051  [get_nets u_counter_N8]
#set_resistance 0.0387228  [get_nets u_counter_N8]
#set_load 0.331093  [get_nets u_counter_N7]
#set_resistance 0.0486675  [get_nets u_counter_N7]
#set_load 0.253642  [get_nets u_counter_N6]
#set_resistance 0.0352619  [get_nets u_counter_N6]
#set_load 0.381164  [get_nets u_counter_N5]
#set_resistance 0.0563404  [get_nets u_counter_N5]
#set_load 0.322552  [get_nets u_counter_N4]
#set_resistance 0.0452641  [get_nets u_counter_N4]
#set_load 0.407606  [get_nets u_counter_N3]
#set_resistance 0.0569045  [get_nets u_counter_N3]
#set_load 0.332825  [get_nets u_counter_N2]
#set_resistance 0.0475421  [get_nets u_counter_N2]
#set_load 0.367132  [get_nets u_counter_N1]
#set_resistance 0.0487182  [get_nets u_counter_N1]
#set_load 1.06663  [get_nets {u_counter_count[0]}]
#set_resistance 0.138593  [get_nets {u_counter_count[0]}]
#set_load 0.705332  [get_nets {u_counter_count[1]}]
#set_resistance 0.0986147  [get_nets {u_counter_count[1]}]
#set_load 0.632762  [get_nets {u_counter_count[2]}]
#set_resistance 0.0816831  [get_nets {u_counter_count[2]}]
#set_load 0.265846  [get_nets {u_counter_count[3]}]
#set_resistance 0.0347282  [get_nets {u_counter_count[3]}]
#set_load 0.502746  [get_nets {u_counter_count[4]}]
#set_resistance 0.0742016  [get_nets {u_counter_count[4]}]
#set_load 0.46954  [get_nets {u_counter_count[5]}]
#set_resistance 0.0608902  [get_nets {u_counter_count[5]}]
#set_load 0.470557  [get_nets {u_counter_count[6]}]
#set_resistance 0.0678004  [get_nets {u_counter_count[6]}]
#set_load 0.349151  [get_nets {u_counter_count[7]}]
#set_resistance 0.0453593  [get_nets {u_counter_count[7]}]
#set_load 0.703492  [get_nets {u_counter_count[8]}]
#set_resistance 0.100475  [get_nets {u_counter_count[8]}]
#set_load 0.319518  [get_nets {u_counter_count[9]}]
#set_resistance 0.0415632  [get_nets {u_counter_count[9]}]
#set_load 0.362091  [get_nets {u_counter_count[10]}]
#set_resistance 0.0515735  [get_nets {u_counter_count[10]}]
#set_load 0.295212  [get_nets {u_counter_count[11]}]
#set_resistance 0.0386971  [get_nets {u_counter_count[11]}]
#set_load 0.458793  [get_nets {u_counter_count[12]}]
#set_resistance 0.0655575  [get_nets {u_counter_count[12]}]
#set_load 0.308773  [get_nets {u_counter_count[13]}]
#set_resistance 0.0403762  [get_nets {u_counter_count[13]}]
#set_load 0.772429  [get_nets {u_counter_count[14]}]
#set_resistance 0.112256  [get_nets {u_counter_count[14]}]
#set_load 0.29567  [get_nets {u_counter_count[15]}]
#set_resistance 0.0386337  [get_nets {u_counter_count[15]}]
#set_load 0.372526  [get_nets {u_counter_count[16]}]
#set_resistance 0.0527603  [get_nets {u_counter_count[16]}]
#set_load 0.347529  [get_nets {u_counter_count[17]}]
#set_resistance 0.0457737  [get_nets {u_counter_count[17]}]
#set_load 0.418906  [get_nets {u_counter_count[18]}]
#set_resistance 0.0588933  [get_nets {u_counter_count[18]}]
#set_load 0.27376  [get_nets {u_counter_count[19]}]
#set_resistance 0.0356949  [get_nets {u_counter_count[19]}]
#set_load 1.08258  [get_nets {u_counter_count[20]}]
#set_resistance 0.158781  [get_nets {u_counter_count[20]}]
#set_load 0.256692  [get_nets {u_counter_count[21]}]
#set_resistance 0.0334152  [get_nets {u_counter_count[21]}]
#set_load 0.781841  [get_nets {u_counter_count[22]}]
#set_resistance 0.112299  [get_nets {u_counter_count[22]}]
#set_load 0.321871  [get_nets {u_counter_count[23]}]
#set_resistance 0.0459873  [get_nets {u_counter_count[23]}]
#set_load 2.47208  [get_nets n95]
#set_resistance 0.226321  [get_nets n95]
#set_load 0.326856  [get_nets n98]
#set_resistance 0.0436115  [get_nets n98]
#set_load 0.199516  [get_nets n99]
#set_resistance 0.028854  [get_nets n99]
#set_load 1.05377  [get_nets n100]
#set_resistance 0.136072  [get_nets n100]
#set_load 0.556675  [get_nets n101]
#set_resistance 0.0747357  [get_nets n101]
#set_load 0.123107  [get_nets n102]
#set_resistance 0.0178774  [get_nets n102]
#set_load 0.47366  [get_nets n103]
#set_resistance 0.0629409  [get_nets n103]
#set_load 0.510505  [get_nets n104]
#set_resistance 0.0681328  [get_nets n104]
#set_load 0.245426  [get_nets n105]
#set_resistance 0.0343874  [get_nets n105]
#set_load 0.312659  [get_nets n106]
#set_resistance 0.0407371  [get_nets n106]
#set_load 0.386439  [get_nets n107]
#set_resistance 0.0515239  [get_nets n107]
#set_load 0.156453  [get_nets n108]
#set_resistance 0.0229715  [get_nets n108]
#set_load 0.671223  [get_nets n109]
#set_resistance 0.0902489  [get_nets n109]
#set_load 0.27122  [get_nets n110]
#set_resistance 0.0371819  [get_nets n110]
#set_load 0.0966085  [get_nets n111]
#set_resistance 0.0141019  [get_nets n111]
#set_load 0.451266  [get_nets n112]
#set_resistance 0.0612885  [get_nets n112]
#set_load 0.412552  [get_nets n113]
#set_resistance 0.0545549  [get_nets n113]
#set_load 0.239817  [get_nets n114]
#set_resistance 0.0339597  [get_nets n114]
#set_load 0.209623  [get_nets n115]
#set_resistance 0.0278511  [get_nets n115]
#set_load 0.624185  [get_nets n116]
#set_resistance 0.0856252  [get_nets n116]
#set_load 0.273981  [get_nets n117]
#set_resistance 0.0395382  [get_nets n117]
#set_load 0.817178  [get_nets n118]
#set_resistance 0.109847  [get_nets n118]
#set_load 0.197441  [get_nets n119]
#set_resistance 0.0268312  [get_nets n119]
#set_load 0.393126  [get_nets n121]
#set_resistance 0.0548083  [get_nets n121]
#set_load 0.914564  [get_nets n122]
#set_resistance 0.124326  [get_nets n122]
#set_load 0.307875  [get_nets n123]
#set_resistance 0.0397614  [get_nets n123]
#set_load 0.0781812  [get_nets n124]
#set_resistance 0.0109558  [get_nets n124]
#set_load 0.451117  [get_nets n125]
#set_resistance 0.0592088  [get_nets n125]
#set_load 0.87882  [get_nets n126]
#set_resistance 0.121115  [get_nets n126]
#set_load 0.176041  [get_nets n127]
#set_resistance 0.0255071  [get_nets n127]
#set_load 0.475337  [get_nets n128]
#set_resistance 0.0647978  [get_nets n128]
#set_load 0.542194  [get_nets n129]
#set_resistance 0.0776107  [get_nets n129]
#set_load 0.644975  [get_nets n130]
#set_resistance 0.0832357  [get_nets n130]
#set_load 0.0631806  [get_nets n131]
#set_resistance 0.00896733  [get_nets n131]
