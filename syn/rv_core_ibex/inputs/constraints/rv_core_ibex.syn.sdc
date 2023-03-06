set sdc_version 2.0
set clock_name clk_i
set clock_period 100000
set clock_edn clk_edn_i
set edn_period 100000
set clock_esc clk_esc_i
set esc_period 100000
set clock_otp clk_otp_i
set otp_period 100000

set input_clock_delay [expr $clock_period * 0.2]
set output_clock_delay [expr $clock_period * 0.2]
set input_edn_delay [expr $edn_period * 0.2]
set output_edn_delay [expr $edn_period * 0.2]
set input_esc_delay [expr $esc_period * 0.2]
set output_esc_delay [expr $esc_period * 0.2]
set input_otp_delay [expr $otp_period * 0.2]
set output_otp_delay [expr $otp_period * 0.2]

set clock_uncertainty 150
set clock_latency 500
set clock_transition 200

set half_clock_period [expr $clock_period / 2.0]
set half_edn_period [expr $edn_period / 2.0]
set half_esc_period [expr $esc_period / 2.0]
set half_otp_period [expr $otp_period / 2.0]

set_units -time ps -capacitance fF

create_clock [get_ports $clock_name] -name $clock_name -period $clock_period -waveform "0 $half_clock_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_name]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_name]

set_input_delay -clock $clock_name -min $input_clock_delay [get_ports {rst_ni nmi_wdog_i lc_cpu_en_i pwrmgr_cpu_en_i irq_timer_i icache_otp_key_i scanmode_i corei_tl_h_i hart_id_i cfg_tl_d_i alert_rx_i edn_i}]
set_input_delay -clock $clock_name -max $input_clock_delay [get_ports {rst_ni nmi_wdog_i lc_cpu_en_i pwrmgr_cpu_en_i irq_timer_i icache_otp_key_i scanmode_i corei_tl_h_i hart_id_i cfg_tl_d_i alert_rx_i edn_i}]
set_output_delay -clock $clock_name -min $output_clock_delay [get_ports {icache_otp_key_o corei_tl_h_o cfg_tl_d_o alert_tx_o edn_o}]
set_output_delay -clock $clock_name -max $output_clock_delay [get_ports {icache_otp_key_o corei_tl_h_o cfg_tl_d_o alert_tx_o edn_o}]

set_clock_latency $clock_latency [get_clocks $clock_name]
set_clock_transition $clock_transition [get_clocks $clock_name]


create_clock [get_ports $clock_edn] -name $clock_edn -period $edn_period -waveform "0 $half_edn_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_edn]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_edn]

set_input_delay -clock $clock_edn -min $input_edn_delay [get_ports {rst_edn_ni edn_i}]
set_input_delay -clock $clock_edn -max $input_edn_delay [get_ports {rst_edn_ni edn_i}]
set_output_delay -clock $clock_edn -min $output_edn_delay [get_ports {edn_o}]
set_output_delay -clock $clock_edn -max $output_edn_delay [get_ports {edn_o}]

set_clock_latency $clock_latency [get_clocks $clock_edn]
set_clock_transition $clock_transition [get_clocks $clock_edn]


create_clock [get_ports $clock_esc] -name $clock_esc -period $esc_period -waveform "0 $half_esc_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_esc]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_esc]

set_input_delay -clock $clock_esc -min $input_esc_delay [get_ports {rst_esc_ni esc_tx_i}]
set_input_delay -clock $clock_esc -max $input_esc_delay [get_ports {rst_esc_ni esc_tx_i}]
set_output_delay -clock $clock_esc -min $output_esc_delay [get_ports {esc_rx_o}]
set_output_delay -clock $clock_esc -max $output_esc_delay [get_ports {esc_rx_o}]

set_clock_latency $clock_latency [get_clocks $clock_esc]
set_clock_transition $clock_transition [get_clocks $clock_esc]



create_clock [get_ports $clock_otp] -name $clock_otp -period $otp_period -waveform "0 $half_otp_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_otp]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_otp]

set_input_delay -clock $clock_otp -min $input_otp_delay [get_ports {rst_otp_ni icache_otp_key_i}]
set_input_delay -clock $clock_otp -max $input_otp_delay [get_ports {rst_otp_ni icache_otp_key_i}]
set_output_delay -clock $clock_otp -min $output_otp_delay [get_ports {icache_otp_key_o}]
set_output_delay -clock $clock_otp -max $output_otp_delay [get_ports {icache_otp_key_o}]

set_clock_latency $clock_latency [get_clocks $clock_otp]
set_clock_transition $clock_transition [get_clocks $clock_otp]