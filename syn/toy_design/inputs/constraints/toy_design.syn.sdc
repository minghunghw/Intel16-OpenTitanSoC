set sdc_version 2.0
set clock_name clk_i_PAD
set clock_period 2500
set clock_uncertainty 150
set clock_latency 500
set clock_transition 200
set half_clock_period [expr $clock_period / 2.0]

set_units -time ps -capacitance fF

create_clock [get_pins u_west/outi[3]] -name $clock_name -period $clock_period -waveform "0 $half_clock_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_name]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_name]

set_clock_latency $clock_latency [get_clocks $clock_name]
set_clock_transition $clock_transition [get_clocks $clock_name]