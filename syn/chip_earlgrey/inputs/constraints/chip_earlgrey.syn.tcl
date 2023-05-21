set MAIN_CLK_PIN u_chip_earlgrey_asic/u_ast/clk_src_sys_o

set MAIN_TCK_PERIOD 20000
set SETUP_CLOCK_UNCERTAINTY 500

create_clock -name MAIN_CLK -period ${MAIN_TCK_PERIOD} [get_pins ${MAIN_CLK_PIN}]

set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks MAIN_CLK]