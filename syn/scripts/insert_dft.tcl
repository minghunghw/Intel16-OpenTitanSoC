## @file
###################################################################
# *NAME* : insert_dft.tcl
#
# *DESCRIPTION* : Inserts DFT elements into netlist.  Requires scan_stitch_template.tcl for design specific setup
###################################################################

##############################################################################

######################################
# List of procs used by this script
# None
#
######################################
##############################################################################
# DFT Insertion
#
# Copy scan_stitch_template file from $env(INTEL_ASIC)/kit/asicflow/synopsys/syn/scripts into
# local ./scripts directory and modify as needed
##############################################################################

if {[shell_is_in_exploration_mode]} {
  echo "INFO: DFT not supported in exploration mode"
} else {
  if {[info exists INTEL_INSERT_SCAN] && $INTEL_INSERT_SCAN==1} {
    set_scan_state test_ready

    if {![file readable ./scripts/scan_stitch_template.tcl]} {
      P_msg_fatal "==>FATAL: Can't read ./scripts/scan_stitch_template.tcl file. Exiting..."
    } else {
      puts "==>INFORMATION: Found ./scripts/scan_stitch_template.tcl file"
      source ./scripts/scan_stitch_template.tcl
    }

    #Test Clocks
    if {$INTEL_SCAN_CLOCKS == "" || $INTEL_SCAN_CLOCKS == "none"} {
      P_msg_fatal "==>FATAL: Atleast one test clock must be defined for DFT insertion. Exiting..."
    } else {
      foreach clk_fields $INTEL_SCAN_CLOCKS {
        foreach clock_element $clk_fields {
          set split_clock_name [split $clock_element "/"]
          set_dft_signal -view existing_dft -type ScanClock -timing [list 45 55] -port [lindex $split_clock_name 0]
          puts "==>INFORMATION: Defining test clock(s):  set_dft_signal -view existing_dft -type ScanClock -timing [list 45 55] -port [lindex $split_clock_name 0]"
        }
      }
    }
    set first_testclk [lindex $INTEL_SCAN_CLOCKS 0]
    set split_first_testclk [split $first_testclk "/"]
    set first_testclk_name [lindex $split_first_testclk 0]
    #set testclk_period to 100ns default; using ps to match with library units
    set testclk_period 100000

    puts "==>INFORMATION: first_testclk_name: $first_testclk_name"
    puts "==>INFORMATION: testclk_period: $testclk_period"

    #Test Resets
    if {$INTEL_SCAN_RESETS == "" || $INTEL_SCAN_RESETS == "none"} {
      puts "==>WARNING: Test reset(s) NOT defined or set to 'none'; Proceeding without test resets"
    } else {
      set split_resets [split $INTEL_SCAN_RESETS ","]
      foreach reset_fields $split_resets {
        foreach reset_element $reset_fields {
          set split_reset_active_value [split $reset_element "/"]
          if {[lindex $split_reset_active_value 1] == "high" } {
            set active_reset_value "0"
          } else {
            set active_reset_value "1"
          }
          puts "==>INFORMATION: Defining test reset(s): set_dft_signal -view existing_dft -port [lindex $split_reset_active_value 0] -type Reset -active_state $active_reset_value"
          set_dft_signal -view existing_dft -port [lindex $split_reset_active_value 0] -type Reset -active_state $active_reset_value
        }
      }
    }

    #Test Constraints
    if {$INTEL_SCAN_CONSTRAINTS == "" || $INTEL_SCAN_CONSTRAINTS == "none"} {
      puts "==>INFORMATION: Test constraints NOT defined or set to 'none'; Proceeding without test mode constraints"
    } else {
      foreach constraint_fields $INTEL_SCAN_CONSTRAINTS {
        foreach constraint_element $constraint_fields {
          set split_test_constraint_value [split $constraint_element "/"]
          set_dft_signal -view existing_dft -type Constant -active_state [lindex $split_test_constraint_value 1] -port [lindex $split_test_constraint_value 0]
          puts "==>INFORMATION: Defining test constraints:  set_dft_signal -view existing_dft -type Constant -active_state [lindex $split_test_constraint_value 1] -port [lindex $split_test_constraint_value 0]"
        }
      }
    }

    #Scan_enable
    if {$INTEL_SCAN_ENABLE == "" || $INTEL_SCAN_ENABLE == "default"} {
      puts "==>INFORMATION: Scan_enable port NOT defined or set to 'default'; Creating default scan_enable (test_se, active_high)"
      create_port -direction in test_se
      set_switching_activity -toggle_rate 0 test_se
      set scanen_port test_se
    } else {
      set split_scanen_field [split $INTEL_SCAN_ENABLE "/"]
      if {[lindex $split_scanen_field 1] == "high" } {
        set scanen_active_value "1"
      } else {
        set scanen_active_value "0"
      }
      redirect -var scan_en_port {get_ports [lindex $split_scanen_field 0]}
      if {[lindex $scan_en_port 0] == "Warning:"} {
        puts "==>INFORMATION: Port [lindex $split_scanen_field 0] doesn't exist"
        puts "==>INFORMATION: Creating new port [lindex $split_scanen_field 0] for scan_enable"
        create_port -direction in [lindex $split_scanen_field 0]
        set_dft_signal -view spec -port [lindex $split_scanen_field 0] -type ScanEnable -active_state $scanen_active_value
      } else {
        redirect -var scan_en_port_direction_out {get_ports [lindex $split_scanen_field 0] -filter {@port_direction == out}}
        if {[lindex $scan_en_port_direction_out 0] == "[lindex $split_scanen_field 0]"} {
          P_msg_fatal "==>FATAL: Output port [lindex $scan_en_port_direction_out 0] already exists. Cannot create input port with the same name. Exiting..."
        } else {
          redirect -var scan_en_port_direction_in {get_ports [lindex $split_scanen_field 0] -filter {@port_direction == in}}
          if {[lindex $scan_en_port_direction_in 0] == "[lindex $split_scanen_field 0]"} {
            puts "==>INFORMATION: Input port [lindex $scan_en_port_direction_in 0] already exists"
            puts "==>INFORMATION: Defining existing port [lindex $split_scanen_field 0] as scan_enable"
            set_dft_signal -view existing -port [lindex $split_scanen_field 0] -type ScanEnable -active_state $scanen_active_value
          }
        }
      }
      set_switching_activity -toggle_rate 0 [lindex $split_scanen_field 0]
      set scanen_port [lindex $split_scanen_field 0]
    }
    puts "==>INFORMATION: Scan_enable port is $scanen_port"

    #Clock_gating enable
    if {$INTEL_SCAN_CLOCK_UNGATE == "" || $INTEL_SCAN_CLOCK_UNGATE == "default"} {
      puts "==>INFORMATION: Clock_gating_enable NOT defined or set to 'default'; Creating a default port test_tm to control clock_gating in scan mode"
      create_port -direction in test_tm
      set_dft_signal -port test_tm -view spec -type TestMode -usage clock_gating
      set_switching_activity -toggle_rate 0 test_tm
      set_case_analysis 1 test_tm
      set clock_gating_en_port test_tm
    } else {
      set split_clock_ungate_field [split $INTEL_SCAN_CLOCK_UNGATE "/"]
      redirect -var clkgating_en_port {get_ports [lindex $split_clock_ungate_field 0]}
      if {[lindex $clkgating_en_port 0] == "Warning:"} {
        puts "==>INFORMATION: Port [lindex $split_clock_ungate_field 0] doesn't exist"
        puts "==>INFORMATION: Defining new port {[lindex $split_clock_ungate_field 0]} as clock_gating_enable"
        create_port -direction in [lindex $split_clock_ungate_field 0]
        set_dft_signal -port [lindex $split_clock_ungate_field 0] -view spec -type TestMode -usage clock_gating
      } else {
        redirect -var clkgating_en_port_direction_out {get_ports [lindex $split_clock_ungate_field 0] -filter {@port_direction == out}}
        if {[lindex $clkgating_en_port_direction_out 0] == "[lindex $split_clock_ungate_field 0]"} {
          P_msg_fatal "==>FATAL: Output port [lindex $clkgating_en_port_direction_out 0] already exists. Cannot create input port with the same name. Exiting..."
        } else {
          redirect -var clkgating_en_port_direction_in {get_ports [lindex $split_clock_ungate_field 0] -filter {@port_direction == in}}
          if {[lindex $clkgating_en_port_direction_in 0] == "[lindex $split_clock_ungate_field 0]"} {
            puts "==>INFORMATION: Port [lindex $clkgating_en_port_direction_in 0] already exists"
            puts "==>INFORMATION: Defining existing port {[lindex $split_clock_ungate_field 0]} as clock_gating_enable"
            set_dft_signal -port $INTEL_SCAN_CLOCK_UNGATE -view existing -type TestMode
          }
        }
      }
      set_switching_activity -toggle_rate 0 [lindex $split_clock_ungate_field 0]
      set_case_analysis 1 [lindex $split_clock_ungate_field 0]
      set clock_gating_en_port [lindex $split_clock_ungate_field 0]
    }
    puts "==>INFORMATION: Clock_gating_en port is $clock_gating_en_port"

    #Scan_chain_length check
    if {$INTEL_SCAN_COMPRESSION == "enable" || $INTEL_SCAN_COMPRESSION == "yes"} {
      #scan_chain length in compression_mode
      if {$INTEL_SCAN_CHAIN_LENGTH == "" || $INTEL_SCAN_COMPRESSED_CHAIN_LENGTH == ""} {
        P_msg_fatal "==>FATAL: INTEL_SCAN_CHAIN_LENGTH and INTEL_SCAN_COMPRESSED_CHAIN_LENGTH must be specified for scan_compression. Exiting..."
      }
    } else {
      #scan_chain length in simple scan mode
      if {$INTEL_SCAN_CHAIN_LENGTH == ""} {
        P_msg_fatal "==>FATAL: INTEL_SCAN_CHAIN_LENGTH must be specified for simple scan mode. Exiting..."
      }
    }

    #Chain_length setup
    if {$INTEL_SCAN_COMPRESSION == "enable" || $INTEL_SCAN_COMPRESSION == "yes"} {
      puts "==>INFORMATION: INTEL_SCAN_COMPRESSION enabled"
      set_dft_configuration -scan_compression enable
      #scan_chain length in compression_mode
      if {$INTEL_SCAN_CHAIN_LENGTH == "default"} {
        puts "==>WARNING: INTEL_SCAN_CHAIN_LENGTH set to default. Chain_length for external chains will be set to 750"
        puts "==>INFORMATION: Using scan_chain_length of $INTEL_SCAN_COMPRESSED_CHAIN_LENGTH for internal chains in compression_mode"
        set_scan_configuration -exact_length 750
        set_scan_compression_configuration -xtolerance high -max_length $INTEL_SCAN_COMPRESSED_CHAIN_LENGTH -min_power true
      } else {
        puts "==>INFORMATION: Using scan_chain_length of $INTEL_SCAN_CHAIN_LENGTH for external chains in compression_mode"
        puts "==>INFORMATION: and using $INTEL_SCAN_COMPRESSED_CHAIN_LENGTH for internal chains in compression_mode"
        set_scan_configuration -exact_length $INTEL_SCAN_CHAIN_LENGTH
        set_scan_compression_configuration -xtolerance high -max_length $INTEL_SCAN_COMPRESSED_CHAIN_LENGTH -min_power true
      }
    } else {
      puts "==>INFORMATION: Scan_compression NOT enabled. Proceeding with simple scan configuration."
      #scan_chain length in NON_compression_mode

      #Scan_ins, scan_outs
      if {$INTEL_SCAN_IN_SCAN_OUT == "" || $INTEL_SCAN_IN_SCAN_OUT == "none" || $INTEL_SCAN_IN_SCAN_OUT == "default"} {
        puts "==>INFORMATION: Scan_in/scan_out NOT defined or set to 'none' or 'default'; Creating scan chain(s) with default test_si*/test_so* port name(s)"
        if {$INTEL_SCAN_CHAIN_LENGTH == "" || $INTEL_SCAN_CHAIN_LENGTH == "default"} {
          puts "==>INFORMATION: INTEL_SCAN_CHAIN_LENGTH not specified or set to 'default'; Max_chain_length will be set to 750"
          set_scan_configuration -exact_length 750
        } else {
          puts "==>INFORMATION: Using scan_chain_length of $INTEL_SCAN_CHAIN_LENGTH"
          set_scan_configuration -exact_length $INTEL_SCAN_CHAIN_LENGTH
        }
      } else {
        puts "Creating [llength $INTEL_SCAN_IN_SCAN_OUT] scan chains based on INTEL_SCAN_IN_SCAN_OUT settings"                        
        set_scan_configuration -chain_count [llength $INTEL_SCAN_IN_SCAN_OUT]
        set count 1
        foreach chain $INTEL_SCAN_IN_SCAN_OUT {
          set split_chains_in_out [split $chain "/"]
          puts "==>INFORMATION: Creating new port {[lindex $split_chains_in_out 0]} as scan_in"
          create_port -direction in [lindex $split_chains_in_out 0]
          set_dft_signal -view spec -type ScanDataIn   -port *[lindex $split_chains_in_out 0]

          puts "==>INFORMATION: Creating new port {[lindex $split_chains_in_out 1]} as scan_out"
          create_port -direction out [lindex $split_chains_in_out 1]
          set_dft_signal -view spec -type ScanDataOut  -port *[lindex $split_chains_in_out 1]
          incr count
        }
      }
    }

    #OCC
    if [info exists INTEL_SCAN_ATSPEED_CLK_CTRL] {
      if {$INTEL_SCAN_ATSPEED_CLK_CTRL == "" || $INTEL_SCAN_ATSPEED_CLK_CTRL == "none"} {
        puts "==>INFORMATION: At_speed clock_controller variable INTEL_SCAN_ATSPEED_CLK_CTRL set to 'none'; Proceeding without at_speed clock controller"
        } else {
          set atspeed_clk_ctrl_fields [split $INTEL_SCAN_ATSPEED_CLK_CTRL ","]
          puts "==>INFORMATION: Defining OCC with [lindex $atspeed_clk_ctrl_fields 0] as pll clock, [lindex $atspeed_clk_ctrl_fields 1] as ref_clk and [lindex $atspeed_clk_ctrl_fields 2] as ATEclk"

          #Enable OCC insertion
          set_dft_configuration -clock_controller enable
          set_dft_signal -view existing_dft -type refclock -port [lindex $atspeed_clk_ctrl_fields 1] -period 10 -timing [list 3 8]

          #Define shift clock coming from ATE
          set_dft_signal -type ScanClock -view existing_dft -port [lindex $atspeed_clk_ctrl_fields 2] -timing [list 45 55]
          set_dft_signal -type Oscillator -view existing_dft -port [lindex $atspeed_clk_ctrl_fields 2]

          #Define PLL output pin, this is where we insert OCC
          set_dft_signal -type Oscillator -view existing_dft -hookup_pin  [get_pins [lindex $atspeed_clk_ctrl_fields 0]]

          #Define global signals needed for OCC: pll_reset, occ_testmode, pll_bypass
          set_dft_signal -type pll_reset  -port pll_reset -view spec
          set_dft_signal -type TestMode   -port occ_testmode -view spec
          set_dft_signal -type pll_bypass -port pll_bypass -view spec

          #Define OCC clock controller
          set_dft_clock_controller \
              -cell_name OCC1 \
              -test_mode_port occ_testmode \
              -design_name snps_clk_mux \
              -pllclocks [lindex $atspeed_clk_ctrl_fields 0] \
              -ateclocks  [lindex $atspeed_clk_ctrl_fields 2] \
              -cycles_per_clock 4 -chain_count 1

          #Use integrated clock_gating cells for gating, instead of AND/OR based clock selection
          set_app_var test_occ_insert_clock_gating_cells true

          #Use a dedicated OCC clock_chain clock connection 
          set_app_var test_dedicated_clock_chain_clock true
        }
    } else {
      puts "INTEL_SCAN_ATSPEED_CLK_CTRL variable not defined in ./scripts/scan_stitch_template.tcl; Proceeding without OCC"
    }

    #DFT Configuration
    puts "==>INFORMATION: Setting up DFT configuration"
    set_dft_insertion_configuration -preserve_design_name true
    set_dft_insertion_configuration -synthesis_optimization none

    set_scan_configuration -clock_mixing mix_clocks
    set_scan_configuration -insert_terminal_lockup true -add_lockup true
    set_scan_configuration -create_dedicated_scan_out_ports true

    #Non_scan designs
    if {[file exists ./scripts/list_of_non_scan_designs] } {
      set file [open "./scripts/list_of_non_scan_designs" r]
      set non_scan_design [read $file]
      foreach nonscan_element $non_scan_design {
        puts "==>INFORMATION: set_scan_element false [get_attribute [get_designs -quiet $nonscan_element] name]"
        set_scan_element false [get_designs -quiet $nonscan_element]
      }
    }

    puts "==>INFORMATION: Creating test protocol"
    redirect ./reports/${INTEL_DESIGN_NAME}.create_test_protocol.rpt { create_test_protocol }

    #Pre_DFT reports
    redirect ./reports/${INTEL_DESIGN_NAME}.syn.pre_dft_drc.rpt { dft_drc }
    redirect ./reports/${INTEL_DESIGN_NAME}.syn.pre_dft_drc_verbose.rpt { dft_drc -verbose }
    redirect ./reports/${INTEL_DESIGN_NAME}.syn.scan_config.rpt { report_scan_configuration }

    if [info exists INTEL_SCAN_ATSPEED_CLK_CTRL] {
      if {$INTEL_SCAN_ATSPEED_CLK_CTRL == "" || $INTEL_SCAN_ATSPEED_CLK_CTRL == "none"} {
      } else {
        redirect ./reports/${INTEL_DESIGN_NAME}.syn.clock_controller.rpt { report_dft_clock_controller -view spec }
      }
    } else {
    }

    redirect ./reports/${INTEL_DESIGN_NAME}.syn.preview_dft.rpt { preview_dft -show all}

    #List of pre_scan pins
    set input_ports_pre_scan [get_ports [all_inputs]]
    set output_ports_pre_scan [get_ports [all_outputs]]

    puts "==>INFORMATION: Performing DFT insertion"
    redirect ./reports/${INTEL_DESIGN_NAME}.insert_dft.rpt { insert_dft }

    #post_DFT reports
    if [info exists INTEL_SCAN_ATSPEED_CLK_CTRL] {
      if {$INTEL_SCAN_ATSPEED_CLK_CTRL == "" || $INTEL_SCAN_ATSPEED_CLK_CTRL == "none"} {
        redirect ./reports/${INTEL_DESIGN_NAME}.syn.post_dft_drc.rpt { dft_drc }
      } else {
        set_dft_drc_configuration -pll_bypass enable
        redirect ./reports/${INTEL_DESIGN_NAME}.syn.post_dft_drc_pll_bypass.rpt { dft_drc }
      }
    } else {
    } 
      redirect ./reports/${INTEL_DESIGN_NAME}.syn.scan_path.rpt { report_scan_path -test_mode all }

    #Test protocol files
    if {$INTEL_SCAN_COMPRESSION == "enable" || $INTEL_SCAN_COMPRESSION == "yes"} {
      puts "==>INFORMATION: Saving test protocol in compression_mode"
      write_test_protocol -out ./outputs/${INTEL_DESIGN_NAME}.syn.scan_internal.spf -test_mode Internal_scan
      write_test_protocol -out ./outputs/${INTEL_DESIGN_NAME}.syn.scan_compress.spf -test_mode ScanCompression_mode
    } else {
      puts "==>INFORMATION: Saving simple scan test protocol"
      write_test_protocol -output ./outputs/${INTEL_DESIGN_NAME}.syn.spf
    }

    #False_path to new scan control signals
    puts "==>INFORMATION: set_false_path -through $scanen_port"
    set_false_path -through $scanen_port

    puts "==>INFORMATION: set_false_path -through $clock_gating_en_port"
    set_false_path -through $clock_gating_en_port

    if {$INTEL_SCAN_COMPRESSION == "enable" || $INTEL_SCAN_COMPRESSION == "yes"} {
      puts "==>INFORMATION: set_false_path -through test_mode"
      set_false_path -through test_mode
    }

    if [info exists INTEL_SCAN_ATSPEED_CLK_CTRL] {
      if {$INTEL_SCAN_ATSPEED_CLK_CTRL == "" || $INTEL_SCAN_ATSPEED_CLK_CTRL == "none"} {
      } else {
        puts "==>INFORMATION: set_false_path -through ooc related signals: occ_testmode and pll_bypass"
        set_false_path -through occ_testmode
        set_false_path -through pll_bypass
      }
    } else {
    }

    #Setting 100ps nominal input_delay on scan inputs
    set input_ports_post_scan [get_ports [all_inputs]]
    set new_input_ports_post_scan [remove_from_collection $input_ports_post_scan $input_ports_pre_scan]

    foreach_in_collection inputs_post_scan $new_input_ports_post_scan {
      echo "==>INFORMATION: set_input_delay -clock $first_testclk_name 100 [get_object_name $inputs_post_scan]"
      set_input_delay -clock $first_testclk_name 100 [get_object_name $inputs_post_scan]
    }

    #Setting 100ps nominal output_delay on scan outputs
    set output_ports_post_scan [get_ports [all_outputs]]
    set new_output_ports_post_scan [remove_from_collection $output_ports_post_scan $output_ports_pre_scan]

    foreach_in_collection outputs_post_scan $new_output_ports_post_scan {
      echo "==>INFORMATION: set_output_delay -clock $first_testclk_name 100 [get_object_name $outputs_post_scan]"
      set_output_delay -clock $first_testclk_name 100 [get_object_name $outputs_post_scan]
    }
  } else {
    puts "==>WARNING: INTEL_INSERT_SCAN not defined or set to 0. DFT will not be inserted"
  }
}

