set sdc_version 2.0
set clock_name clk_i
set spi_name spi_sclk
set clock_period 2500
set spi_period 5000
set input_clock_delay [expr $clock_period * 0.6]
set output_clock_delay [expr $clock_period * 0.6]
set input_spi_delay [expr $spi_period * 0.6]
set output_spi_delay [expr $spi_period * 0.6]
set clock_uncertainty 150
set clock_latency 500
set clock_transition 200
set half_clock_period [expr $clock_period / 2.0]
set half_spi_period [expr $spi_period / 2.0]

set_units -time ps -capacitance fF

create_clock [get_ports $clock_name] -name $clock_name -period $clock_period -waveform "0 $half_clock_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $clock_name]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $clock_name]

set_input_delay -clock $clock_name $input_clock_delay [remove_from_collection [all_inputs] [get_ports spi*]]
set_output_delay -clock $clock_name $output_clock_delay [remove_from_collection [all_outputs] [get_ports spi*]]

set_clock_latency $clock_latency [get_clocks $clock_name]
set_clock_transition $clock_transition [get_clocks $clock_name]

create_clock [get_ports $spi_name] -name $spi_name -period $spi_period -waveform "0 $half_spi_period"

set_clock_uncertainty -setup $clock_uncertainty [get_clocks $spi_name]
set_clock_uncertainty -hold $clock_uncertainty [get_clocks $spi_name]

set_input_delay -clock $spi_name $input_spi_delay [get_ports {spi_cs spi_sdi*}]
set_output_delay -clock $spi_name $output_spi_delay [get_ports {spi_mode spi_sdo*}]

set_clock_latency $clock_latency [get_clocks $spi_name]
set_clock_transition $clock_transition [get_clocks $spi_name]