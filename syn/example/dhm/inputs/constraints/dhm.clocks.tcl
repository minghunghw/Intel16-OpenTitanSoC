
create_clock -period 1000.0 [get_ports clk]
set_clock_uncertainty -setup 250.0 [get_clocks clk]
set_clock_uncertainty -hold 150.0 [get_clocks clk]
set_clock_latency 500.0 [get_clocks clk]
set_clock_transition 200.0 [get_clocks clk]

create_clock -name virtual_clk -period 1000.0
set_clock_uncertainty -setup 250.00 [get_clocks virtual_clk]
set_clock_uncertainty -hold 150.0 [get_clocks virtual_clk]
set_clock_latency 500.0 [get_clocks virtual_clk]

create_clock -period 1000.0 [get_ports clk_lut]
set_clock_uncertainty -setup 250.0 [get_clocks clk_lut]
set_clock_uncertainty -hold 150.0 [get_clocks clk_lut]
set_clock_latency 500.0 [get_clocks clk_lut]
set_clock_transition 200.0 [get_clocks clk_lut]

create_clock -name virtual_clk_lut -period 1000
set_clock_uncertainty -setup 250.0 [get_clocks virtual_clk_lut]
set_clock_uncertainty -hold 150.0 [get_clocks virtual_clk_lut]
set_clock_latency 500.0 [get_clocks virtual_clk_lut]

## --------------------------------------------------------------------------
## End of file
## --------------------------------------------------------------------------
