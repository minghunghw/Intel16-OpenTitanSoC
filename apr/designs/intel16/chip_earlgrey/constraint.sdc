create_clock [get_pins -of_objects [get_nets u_chip_earlgrey_asic/ast_base_clks_clk_sys_] -filter direction==output]  -name MAIN_CLK  -period 20000  -waveform {0 10000}
set_clock_uncertainty 500  [get_clocks MAIN_CLK]
create_clock [get_pins -of_objects [get_nets u_chip_earlgrey_asic/ast_base_clks_clk_usb_] -filter direction==output]  -name USB_CLK  -period 40000  -waveform {0 20000}
set_clock_uncertainty 500  [get_clocks USB_CLK]
create_clock [get_pins -of_objects [get_nets u_chip_earlgrey_asic/ast_base_clks_clk_io_] -filter direction==output]  -name IO_CLK  -period 20000  -waveform {0 10000}
set_clock_uncertainty 500  [get_clocks IO_CLK]
create_clock [get_pins -of_objects [get_nets u_chip_earlgrey_asic/ast_base_clks_clk_aon_] -filter direction==output]  -name AON_CLK  -period 5.0e+06  -waveform {0 2.5e+06}
set_clock_uncertainty 500  [get_clocks AON_CLK]
create_clock [get_pins -of_objects [get_nets chip_io[62]] -filter direction==output]  -name JTAG_TCK  -period 50000  -waveform {0 25000}
set_clock_uncertainty 500  [get_clocks JTAG_TCK]
create_clock [get_pins -of_objects [get_nets chip_io[52]] -filter direction==output]  -name AST_EXT_CLK  -period 40000  -waveform {0 20000}
set_clock_uncertainty -setup 500  [get_clocks AST_EXT_CLK]
create_clock [get_pins -of_objects [get_nets chip_io[19]] -filter direction==output]  -name SPI_DEV_CLK  -period 32000  -waveform {0 16000}
set_clock_uncertainty 500  [get_clocks SPI_DEV_CLK]