set PRIM        "../../hw/sv/prim"
set IP          "../../ip"
set OPENTITAN   "../../ip/opentitan/hw/ip"
set DV          "../../ip/opentitan/hw/dv"
set EARLGREY    "../../ip/opentitan/hw/top_earlgrey"
set IBEX 	   	"../../ip/opentitan/hw/vendor/lowrisc_ibex"
set PULP        "../../ip/opentitan/hw/vendor/pulp_riscv_dbg"

source ../earlgrey_rtl_targets.tcl

analyze -f sverilog -define SYNTHESIS $rtl_packages
analyze -f sverilog -define SYNTHESIS $rtl_adc_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_aes
analyze -f sverilog -define SYNTHESIS $rtl_alert_handler
analyze -f sverilog -define SYNTHESIS $rtl_aon_timer
analyze -f sverilog -define SYNTHESIS $rtl_ast
analyze -f sverilog -define SYNTHESIS $rtl_clkmgr
analyze -f sverilog -define SYNTHESIS $rtl_csrng
analyze -f sverilog -define SYNTHESIS $rtl_dm
analyze -f sverilog -define SYNTHESIS $rtl_edn
analyze -f sverilog -define SYNTHESIS $rtl_entropy_src
analyze -f sverilog -define SYNTHESIS $rtl_flash_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_gpio
analyze -f sverilog -define SYNTHESIS $rtl_hmac
analyze -f sverilog -define SYNTHESIS $rtl_i2c
analyze -f sverilog -define SYNTHESIS $rtl_ibex
analyze -f sverilog -define SYNTHESIS $rtl_keymgr
analyze -f sverilog -define SYNTHESIS $rtl_kmac
analyze -f sverilog -define SYNTHESIS $rtl_lc_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_otbn
analyze -f sverilog -define SYNTHESIS $rtl_otp_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_pattgen
analyze -f sverilog -define SYNTHESIS $rtl_pinmux
analyze -f sverilog -define SYNTHESIS $rtl_prim
analyze -f sverilog -define SYNTHESIS $rtl_prim_generic
analyze -f sverilog -define SYNTHESIS $rtl_pwm
analyze -f sverilog -define SYNTHESIS $rtl_pwrmgr
analyze -f sverilog -define SYNTHESIS $rtl_rom_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_rstmgr
analyze -f sverilog -define SYNTHESIS $rtl_rv_core_ibex
analyze -f sverilog -define SYNTHESIS $rtl_rv_dm
analyze -f sverilog -define SYNTHESIS $rtl_rv_plic
analyze -f sverilog -define SYNTHESIS $rtl_rv_timer
analyze -f sverilog -define SYNTHESIS $rtl_sensor_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_spi_device
analyze -f sverilog -define SYNTHESIS $rtl_spi_host
analyze -f sverilog -define SYNTHESIS $rtl_sram_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_sysrst_ctrl
analyze -f sverilog -define SYNTHESIS $rtl_tlul
analyze -f sverilog -define SYNTHESIS $rtl_uart
analyze -f sverilog -define SYNTHESIS $rtl_usbdev
analyze -f sverilog -define SYNTHESIS $rtl_xbar
analyze -f sverilog -define SYNTHESIS $rtl_top_earlgrey
analyze -f sverilog -define SYNTHESIS $rtl_chip_earlgrey_asic