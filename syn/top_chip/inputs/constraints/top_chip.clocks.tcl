
create_clock -period 10000 [get_ports clk_i_PAD]
set_clock_uncertainty -setup 250 [get_clocks clk_i_PAD]
set_clock_uncertainty -hold 150 [get_clocks clk_i_PAD]
set_clock_latency 500 [get_clocks clk_i_PAD]
set_clock_transition 200 [get_clocks clk_i_PAD]

create_clock -name virtual_clk -period 10000
set_clock_uncertainty -setup 250 [get_clocks virtual_clk]
set_clock_uncertainty -hold 150 [get_clocks virtual_clk]
set_clock_latency 500 [get_clocks virtual_clk]

create_clock -period 40000 [get_ports spi_sclk_PAD]
set_clock_uncertainty -setup 250 [get_clocks spi_sclk_PAD]
set_clock_uncertainty -hold 150 [get_clocks spi_sclk_PAD]
set_clock_latency 500 [get_clocks spi_sclk_PAD]
set_clock_transition 200 [get_clocks spi_sclk_PAD]

create_clock -name virtual_clk -period 40000
set_clock_uncertainty -setup 250 [get_clocks virtual_clk_spi]
set_clock_uncertainty -hold 150 [get_clocks virtual_clk_spi]
set_clock_latency 500 [get_clocks virtual_clk_spi]

## --------------------------------------------------------------------------
## End of file
## --------------------------------------------------------------------------
