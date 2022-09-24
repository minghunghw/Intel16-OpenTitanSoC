set sdc_version 2.0
set cycle_percentage_delta_from_orginal 1
#set org_period 2500
set org_period 833
set period [expr $org_period * $cycle_percentage_delta_from_orginal]
set set_clock_uncertainty [expr round($period * .14)]
set set_input_delay [expr round($period * .14)]
set set_output_delay [expr round($period * .14)]
set half_period [expr $period / 2]
set_units -time ps -capacitance fF
create_clock [get_ports clk] -name clk -period $period -waveform "0 $half_period"
set_clock_uncertainty -setup $set_clock_uncertainty [get_clocks clk]
set_input_delay -clock clk $set_output_delay [all_inputs]
set_output_delay -clock clk $set_output_delay [all_outputs]
