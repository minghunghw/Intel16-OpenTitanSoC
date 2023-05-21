create_clock [get_pins {u_chip_earlgrey_asic_u_ast/U4052/out0}] -name MAIN_CLK  -period 20000  -waveform {0 10000}
set_clock_uncertainty 500  [get_clocks MAIN_CLK]