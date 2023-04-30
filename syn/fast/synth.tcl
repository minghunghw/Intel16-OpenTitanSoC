# Configurations
## Set top design
set top         chip_earlgrey_asic

## Set main clock and reset for the top design
set clk_name    u_ast/clk_src_sys_o
set rst_name    u_ast/scan_reset_no

## Set clock period
set clk_period  100

# Set maximal threads
set_host_options -max_cores 16

# Set output file names
set synth_dir    "../"
set netlist_dir  "$synth_dir/netlist"
set ddc_dir      "$synth_dir/ddc"
set rpt_dir      "$synth_dir/rpt"
set sdf_dir      "$synth_dir/sdf"
set netlist_file "$netlist_dir/$top.vg"
set svsim_file   "$netlist_dir/$top\_svsim.sv"
set ddc_file     "$ddc_dir/$top.ddc"
set chk_file     "$rpt_dir/$top.chk"
set sdf_file     "$sdf_dir/$top.sdf"
set sdc_file     "$netlist_dir/$top.syn.sdc"

# Set rtl path
set PRIM        "../../../hw/sv/prim"
set IP          "../../../ip"
set OPENTITAN   "../../../ip/opentitan/hw/ip"
set DV          "../../../ip/opentitan/hw/dv"
set EARLGREY    "../../../ip/opentitan/hw/top_earlgrey"
set IBEX 	   	"../../../ip/opentitan/hw/vendor/lowrisc_ibex"
set PULP        "../../../ip/opentitan/hw/vendor/pulp_riscv_dbg"

# Source file list configurations
source $synth_dir/../earlgrey_rtl_targets.tcl

# Set libraries
set include_dirs " \
    $OPENTITAN/prim/rtl \
    $IP/opentitan/hw/dv/sv/dv_utils \
"

# Set libraries
set eecs598_dir         "/afs/umich.edu/class/eecs598a/f21"
set search_path_598     "$eecs598_dir/SAED32_EDK/lib/stdcell_rvt/db_ccs"
set search_path_dw      "/usr/caen/synopsys-synth-2018.06/libraries/syn"
set target_library      "saed32rvt_tt0p85v25c.db"
set synthetic_library   "dw_foundation.sldb"
set memory_library [ concat \
  ../../../ip/memory/db/rf_1024x36_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/rf_512x32_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_1024x22_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_1024x39_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_4096x76_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_512x28_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_512x78_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_512x80_be_tttt_0.85v_25c.db \
  ../../../ip/memory/db/sram_8192x39_be_tttt_0.85v_25c.db \
]

set_app_var search_path       "$include_dirs $search_path_598 $search_path_dw"
set_app_var target_library    $target_library
set_app_var synthetic_library $synthetic_library
set_app_var link_library      "* $target_library $memory_library $synthetic_library"

# Work with designs in memory
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

elaborate $top
current_design $top
uniquify
link

# Define design environments
set op_cond                  "tt0p85v25c"
set rst_drive                0
set driving_cell             "DFFARX1_RVT"
set avg_load                 0.1
set avg_fo_load              10
set auto_wire_load_selection "true"

set_operating_conditions $op_cond
set_drive $rst_drive $rst_name
set_driving_cell -lib_cell $driving_cell [all_inputs]
remove_driving_cell [find port $clk_name]
set_load $avg_load [all_outputs]
set_fanout_load $avg_fo_load [all_outputs]
set_resistance 0 $rst_name


# Define design constraints
set crit_range [expr $clk_period * 0.1]
set clk_latency 0.1
set clk_uncertainty 0.1
set clk_transition 0.1
set input_delay 0.1
set output_delay 0.1

create_clock -period $clk_period -name $clk_name [find port $clk_name]
set_critical_range $crit_range [current_design]
set_clock_latency $clk_latency [get_clocks $clk_name]
set_clock_uncertainty $clk_uncertainty [get_clocks $clk_name]
set_clock_transition $clk_transition [get_clocks $clk_name]
set_input_delay $input_delay -clock $clk_name [all_inputs]
remove_input_delay -clock $clk_name [find port $clk_name]
set_output_delay $output_delay -clock $clk_name [all_outputs]
set_max_delay $clk_period [all_outputs]
group_path -from [all_inputs] -name input_grp
group_path -to [all_outputs] -name output_grp
set_fix_multiple_port_nets -outputs -buffer_constants
set_fix_hold $clk_name


# Optimize the design
set_dont_touch $rst_name


# Compile the design
set map_effort "medium"
uniquify
# ungroup -all -flatten
compile -map_effort $map_effort


# Analyze the design
set report_level "low"
set max_paths 8
exec mkdir -p $rpt_dir

check_design > $chk_file
report_area -hier > "$rpt_dir/$top\_area.rpt"
report_timing -max_paths $max_paths -input_pins -nets \
    -transition_time \
    > "$rpt_dir/$top\_timing.rpt"

if { $report_level == "high" } {
    report_design > "$rpt_dir/$top\_design.rpt"
    report_cell > "$rpt_dir/$top\_cell.rpt"
    report_reference > "$rpt_dir/$top\_ref.rpt"
    report_port > "$rpt_dir/$top\_port.rpt"
    report_net > "$rpt_dir/$top\_net.rpt"
    report_compile_options > "$rpt_dir/$top\_comp.rpt"
    report_constraint -max_delay -verbose \
        > "$rpt_dir/$top\_constr.rpt"
    report_hierarchy > "$rpt_dir/$top\_hier.rpt"
    report_resources > "$rpt_dir/$top\_res.rpt"
}


# Save the design database
exec mkdir -p $netlist_dir
exec mkdir -p $ddc_dir
exec mkdir -p $sdf_dir
write -hier -format verilog -output $netlist_file $top
write -format svsim -output $svsim_file $top
write -hier -format ddc -output $ddc_file $top
write_sdf $sdf_file


# Quit
quit

