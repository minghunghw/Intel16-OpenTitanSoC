set PRIM        "../../hw/sv/prim"
set IP          "../../ip"
set OPENTITAN   "../../ip/opentitan/hw/ip"
set DV          "../../ip/opentitan/hw/dv"
set EARLGREY    "../../ip/opentitan/hw/top_earlgrey"
set IBEX 	   	"../../ip/opentitan/hw/vendor/lowrisc_ibex"
set PULP        "../../ip/opentitan/hw/vendor/pulp_riscv_dbg"

source ../earlgrey_rtl_targets.tcl

analyze -f sverilog $rtl_packages
analyze -f sverilog $rtl_adc_ctrl
analyze -f sverilog $rtl_aes
analyze -f sverilog $rtl_alert_handler
analyze -f sverilog $rtl_aon_timer
analyze -f sverilog $rtl_ast
analyze -f sverilog $rtl_clkmgr
analyze -f sverilog $rtl_csrng
analyze -f sverilog $rtl_dm
analyze -f sverilog $rtl_edn
analyze -f sverilog $rtl_entropy_src
analyze -f sverilog $rtl_flash_ctrl
analyze -f sverilog $rtl_gpio
analyze -f sverilog $rtl_hmac
analyze -f sverilog $rtl_i2c
analyze -f sverilog $rtl_ibex
analyze -f sverilog $rtl_keymgr
analyze -f sverilog $rtl_kmac
analyze -f sverilog $rtl_lc_ctrl
analyze -f sverilog $rtl_otbn
analyze -f sverilog $rtl_otp_ctrl
analyze -f sverilog $rtl_pattgen
analyze -f sverilog $rtl_pinmux
analyze -f sverilog $rtl_prim
analyze -f sverilog $rtl_prim_generic
analyze -f sverilog $rtl_pwm
analyze -f sverilog $rtl_pwrmgr
analyze -f sverilog $rtl_rom_ctrl
analyze -f sverilog $rtl_rstmgr
analyze -f sverilog $rtl_rv_core_ibex
analyze -f sverilog $rtl_rv_dm
analyze -f sverilog $rtl_rv_plic
analyze -f sverilog $rtl_rv_timer
analyze -f sverilog $rtl_sensor_ctrl
analyze -f sverilog $rtl_spi_device
analyze -f sverilog $rtl_spi_host
analyze -f sverilog $rtl_sram_ctrl
analyze -f sverilog $rtl_sysrst_ctrl
analyze -f sverilog $rtl_tlul
analyze -f sverilog $rtl_uart
analyze -f sverilog $rtl_usbdev
analyze -f sverilog $rtl_xbar
analyze -f sverilog $rtl_top_earlgrey
analyze -f sverilog $rtl_chip_earlgrey