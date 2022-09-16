## @file
###################################################################
# *NAME* : create_scenarios.tcl
#
# *DESCRIPTION* : Creates scenarios based on INTEL_MCMM_* variable definitions
###################################################################

##############################################################################

#Requirements:
# 1: Update library.tcl to include libraries needed for each scenario.
# 2: Update project_setup.tcl/block_setup.tcl $INTEL_MCMM_* to create and setup scenarios.

unset -nocomplain abort scenario scenario_list

# Check if INTEL_SYN_SCENARIOS variable is set
if {![info exists INTEL_SYN_SCENARIOS]} {
  P_msg_error "INTEL_SYN_SCENARIOS not defined. This is a list of valid scenarios defined in INTEL_SCENARIOS variable and is required to run synthesis"
  set abort 1
}

# Check if each scenario defined in INTEL_SYN_SCENARIOS is exists in INTEL_SCENARIOS
foreach scenario $INTEL_SYN_SCENARIOS {
  if {[lsearch -all -inline [dict keys $INTEL_SCENARIOS] $scenario] < 0} {
    P_msg_error "$scenario defined in INTEL_SYN_SCENARIOS not found in INTEL_SCENARIOS. Please check!"
    set abort 1
  } else {
    # Initialize scenario_list local variable to contain list of scenarios to create
    lappend scenario_list $scenario
  }
}

# Check if INTEL_SYN_DEFAULT_SCENARIO variable is set
if {![info exists INTEL_SYN_DEFAULT_SCENARIO]} {
  P_msg_error "INTEL_SYN_DEFAULT_SCENARIO not defined. This is required to run Synthesis and should be one of the scenarios defined in INTEL_SYN_SCENARIOS list!"
  set abort 1
}

# Check if exceptions occured, if so issue error and return
if {[info exists abort] && $abort} {
  P_msg_error "Please fix above errors before proceeding"
  return
}

# Reset variables 
unset -nocomplain scenario abort

# Uniquify scenario_list
lset scenario_list [lsort -unique $scenario_list]

# Remove all scenarios first
remove_scenario -all

foreach scenario $scenario_list {
  dict with INTEL_SCENARIOS $scenario {
    # Create Scenario
    P_msg_info "Creating Scenario : $scenario"
    create_scenario $scenario

    # Set Scenario_options. Need check if analyis type is one of valid options 
    # for synthesis - setup, hold, leakage_power, dynamic_power
    set scenario_options ""
    foreach option $analysis_type { 
      if {[lsearch {setup hold leakage_power dynamic_power} $option] > -1} {
        lappend scenario_options {*}"-${option} true"
      } else {
        P_msg_info "Option $option is not valid for set_scenario_options. Skipping it..."
      }
    }
    P_msg_info "Setting following scenario options for $scenario - '$scenario_options'"
    eval "set_scenario_options -scenario $scenario $scenario_options"

    # Report scenario options
    P_msg_info "Scenario $scenario is created with following options"
    report_scenario_options
    
    # Setting TLU+
    P_msg_info "Setting tlu+ model for scenario ${scenario}..."
    set tlup_cmd "set_tlu_plus_files \
        -tech2itf_map [dict get $INTEL_INTERCONNECTS $rc_interconnect map_file tlup] \
        -max_tluplus  [dict get $INTEL_INTERCONNECTS $rc_interconnect techfile tlup] \
        -min_tluplus  [dict get $INTEL_INTERCONNECTS $rc_interconnect techfile tlup]"
                 
    if {[dict exists $INTEL_INTERCONNECTS $rc_interconnect techfile tlup_emul] && \
        [dict    get $INTEL_INTERCONNECTS $rc_interconnect techfile tlup_emul] != ""} {
      lappend tlup_cmd {*}" \
        -max_emulation_tluplus [dict get $INTEL_INTERCONNECTS $rc_interconnect techfile tlup_emul] \
        -min_emulation_tluplus [dict get $INTEL_INTERCONNECTS $rc_interconnect techfile tlup_emul]"
    }
    eval $tlup_cmd 
    check_tlu_plus_files

    set vt [lindex $INTEL_ENABLE_VT_TYPES 0]
    # Setting Operating Conditions
    set_operating_conditions -analysis_type on_chip_variation \
      -max      [dict get $INTEL_PVTS $pvt opcon] \
      -library  [file rootname [lindex [dict get $INTEL_PVTS $pvt stdcells target_ldb $vt] 0]]

    if {[info exists INTEL_UPF] && $INTEL_UPF} {
      if {![dict exists $INTEL_SCENARIOS $scenario upf_set_voltage]} {
        P_msg_error "INTEL_UPF set but upf_set_voltage subkey not found in INTEL_SCENARIOS. Please check!"
      } elseif {![file exists [set voltage_file [subst [dict get $INTEL_SCENARIOS $scenario upf_set_voltage]]]]} {
        P_msg_error "$voltage_file set in upf_set_voltage not found! Please check!"
      } else {
        source -e -v $voltage_file
      }
    }


    # Read in mode constraints file
    if {[dict exists $INTEL_MODES $mode syn_constraints]} {
      # Read in TCL constraint files
      foreach tcl_file [subst [lsearch -all -inline [dict get $INTEL_MODES $mode syn_constraints] {*\.tcl}]] {
        if {[file exists $tcl_file]} {
          P_msg_info "Reading in $mode Mode specific tcl constraint file: $tcl_file"
          source -e -v $tcl_file
        } else {
          P_msg_warn "Mode specific tcl constraint file $tcl_file for $mode in INTEL_MODES(syn_constraints) does not exist. Please check!"
          incr tcl_const_err
        }
      }
      # Read in SDC constraint files
      foreach sdc_file [subst [lsearch -all -inline [dict get $INTEL_MODES $mode syn_constraints] {*\.sdc}]] {
        if {[file exists $sdc_file]} {
          P_msg_info "Reading in $mode Mode specific sdc constraint file: $sdc_file"
          read_sdc $sdc_file
        } else {
          P_msg_warn "Mode specific sdc constraint file $sdc_file for $mode in INTEL_MODES(syn_constraints) does not exist. Please check!"
          incr sdc_const_err
        }
      }
    }

    # Read-in Scenario constraints file
    if {[dict exists $INTEL_SCENARIOS $scenario syn_constraints] && \
       ([llength [dict get $INTEL_SCENARIOS $scenario syn_constraints]] > 0)} {
      foreach tcl_file [subst [lsearch -all -inline [dict get $INTEL_SCENARIOS $scenario syn_constraints] {*\.tcl}]] {
        if {[file exists $tcl_file]} {
          P_msg_info "Reading in scenario specific tcl constraints file $tcl_file for $scenario scenario in INTEL_SCENARIOS(syn_constraints)"
          source $tcl_file
        } else {
          P_msg_warn "Scenario specific tcl constraints file $tcl_file for $scenario in INTEL_SCENARIOS(syn_constraints) does not exist. Please check!"
          incr tcl_const_err
        }
      }
      foreach sdc_file [subst [lsearch -all -inline [dict get $INTEL_SCENARIOS $scenario syn_constraints] {*\.sdc}]] {
        if {[file exists $sdc_file]} {
          P_msg_info "Reading in scenario specific sdc constraint file $sdc_file for $scenario scenario"
          read_sdc $sdc_file
        } else {
          P_msg_warn "Scenario specific sdc constraints file $sdc_file for $scenario in INTEL_SCENARIOS(syn_constraints) does not exist. Please check!"
          incr sdc_const_err
        }
      }
    } else {
      P_msg_info "No constraints files specified/found for $scenario in INTEL_SCENARIOS(syn_constraints)"
    }

    
    # Check if errors were encountered when processing sdc/tcl files above
    if {[info exists tcl_const_err] && $tcl_const_err > 0} {
      P_msg_error "Error (count: $tcl_const_err) found when processing tcl constraint files. Please review warnings/errors generated above before proceeding further!"
    } 
    if {[info exists sdc_const_err] && $sdc_const_err >0 } {
      P_msg_error "Error (count: $sdc_const_err) found when processing sdc constraint files. Please review warnings/errors generated above before proceeding further!"
    }

    unset -nocomplain voltage_file tlup_cmd vt scenario_options *_file *_file_exists *_const_err
  }
}

# Enable default scenario
current_scenario $INTEL_SYN_DEFAULT_SCENARIO

# Flow assumes that all created scenarios are active.
set_active_scenarios [all_scenarios]
report_scenarios
