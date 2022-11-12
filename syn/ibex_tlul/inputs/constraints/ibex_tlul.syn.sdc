set sdc_version 2.0
set clock_name clk_i
set clock_period 4000
set input_clock_delay [expr $clock_period * 0.2]
set output_clock_delay [expr $clock_period * 0.2]
set clock_uncertainty 150
set clock_latency 500
set clock_transition 200
set half_clock_period [expr $clock_period / 2.0]

set_units -time ps -capacitance fF

create_clock [get_ports $clock_name] -name $clock_name -period $clock_period -waveform "0 $half_clock_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_name]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_name]

set_input_delay -clock $clock_name $input_clock_delay [all_inputs]
set_output_delay -clock $clock_name $output_clock_delay [all_outputs]

set_clock_latency $clock_latency [get_clocks $clock_name]
set_clock_transition $clock_transition [get_clocks $clock_name]