
create_clock -period 40000 [get_ports clk_i]
set_clock_uncertainty -setup 250 [get_clocks clk_i]
set_clock_uncertainty -hold 150 [get_clocks clk_i]
set_clock_latency 500 [get_clocks clk_i]
set_clock_transition 200 [get_clocks clk_i]

create_clock -name virtual_clk -period 40000
set_clock_uncertainty -setup 250 [get_clocks virtual_clk]
set_clock_uncertainty -hold 150 [get_clocks virtual_clk]
set_clock_latency 500 [get_clocks virtual_clk]

create_clock -period 100000 [get_ports spi_sclk]
set_clock_uncertainty -setup 250 [get_clocks spi_sclk]
set_clock_uncertainty -hold 150 [get_clocks spi_sclk]
set_clock_latency 500 [get_clocks spi_sclk]
set_clock_transition 200 [get_clocks spi_sclk]

create_clock -name virtual_clk -period 100000
set_clock_uncertainty -setup 250 [get_clocks virtual_clk_spi]
set_clock_uncertainty -hold 150 [get_clocks virtual_clk_spi]
set_clock_latency 500 [get_clocks virtual_clk_spi]

## --------------------------------------------------------------------------
## End of file
## --------------------------------------------------------------------------
