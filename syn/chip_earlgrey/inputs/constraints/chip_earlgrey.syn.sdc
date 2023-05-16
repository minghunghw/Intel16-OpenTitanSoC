set SETUP_CLOCK_UNCERTAINTY 500

#####################
# main clk          #
#####################

set MAIN_CLK_PIN u_chip_earlgrey_asic/u_ast/clk_src_sys_o
set MAIN_TCK_PERIOD 20000

create_clock -name MAIN_CLK -period ${MAIN_TCK_PERIOD} [get_pins ${MAIN_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks MAIN_CLK]

#####################
# USB clock         #
#####################
set USB_CLK_PIN u_chip_earlgrey_asic/u_ast/clk_src_usb_o
set USB_TCK_PERIOD 40000

create_clock -name USB_CLK -period ${USB_TCK_PERIOD} [get_pins ${USB_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks USB_CLK]

#####################
# IO clk            #
#####################

set IO_CLK_PIN u_chip_earlgrey_asic/u_ast/clk_src_io_o
set IO_TCK_PERIOD 20000

create_clock -name IO_CLK -period ${IO_TCK_PERIOD} [get_pins ${IO_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks IO_CLK]

#####################
# AON clk           #
#####################
set AON_CLK_PIN u_chip_earlgrey_asic/u_ast/clk_src_aon_o
set AON_TCK_PERIOD 5000000

create_clock -name AON_CLK -period ${AON_TCK_PERIOD} [get_pins ${AON_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks AON_CLK]

#####################
# JTAG clock        #
#####################
set JTAG_CLK_PIN u_chip_earlgrey_asic/chip_io[62]
set JTAG_TCK_PERIOD 50000

create_clock -name JTAG_TCK -period $JTAG_TCK_PERIOD [get_pins ${JTAG_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks JTAG_TCK]

#####################
# AST clock        #
#####################

set AST_EXT_CLK_PIN u_chip_earlgrey_asic/chip_io[52]
set AST_EXT_TCK_PERIOD 40000

create_clock -name AST_EXT_CLK -period ${AST_EXT_TCK_PERIOD} [get_pins ${AST_EXT_CLK_PIN}]
set_clock_uncertainty -setup  ${SETUP_CLOCK_UNCERTAINTY} [get_clocks AST_EXT_CLK]

#################
# SPI DEV clock #
#################
set SPI_DEV_CLK_PIN u_chip_earlgrey_asic/chip_io[19]
set SPI_DEV_TCK 32000

create_clock -name SPI_DEV_CLK  -period ${SPI_DEV_TCK} [get_pins ${SPI_DEV_CLK_PIN}]
set_clock_uncertainty ${SETUP_CLOCK_UNCERTAINTY} [get_clocks SPI_DEV_CLK]