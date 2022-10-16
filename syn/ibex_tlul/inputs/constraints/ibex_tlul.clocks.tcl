
create_clock -period 10000 [get_ports clk_i]
set_clock_uncertainty -setup 2500 [get_clocks clk_i]
set_clock_uncertainty -hold 1500 [get_clocks clk_i]
set_clock_latency 5000 [get_clocks clk_i]
set_clock_transition 2000 [get_clocks clk_i]

create_clock -name virtual_clk -period 10000
set_clock_uncertainty -setup 2500.0 [get_clocks virtual_clk]
set_clock_uncertainty -hold 1500 [get_clocks virtual_clk]
set_clock_latency 5000 [get_clocks virtual_clk]

## --------------------------------------------------------------------------
## End of file
## --------------------------------------------------------------------------
