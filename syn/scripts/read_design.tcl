## @file
###################################################################
# *NAME* : read_design.tcl
#
# *DESCRIPTION* : Reads design input (RTL and optionally DEF, SAIF, UPF, etc).
###################################################################

##############################################################################

####################################################
# List of procs used by this script
# 1. P_msg_info
# 2. P_msg_fatal
#######################################################

######################################
#INPUT SETUP CHECKS
######################################

puts "==>INFORMATION: Executing input file setup checks...."

#Checking for UPF files
if { $synopsys_program_name == "dc_shell"} {
  if {[info exists INTEL_UPF] && $INTEL_UPF} {
    P_msg_info "Checking for UPF files..."
    if {![file readable ./inputs/upf/${INTEL_DESIGN_NAME}.upf]} {
      P_msg_fatal "INTEL_UPF is set to $INTEL_UPF. Expecting ${INTEL_DESIGN_NAME}.upf file in ./inputs/upf/. Exiting..."
    } else {
      P_msg_info "UPF file existence: ${INTEL_DESIGN_NAME}.upf file exists"
    }
  }
}

if {[shell_is_in_topographical_mode]} {
  if {[info exists INTEL_TOPO_DEF ] && $INTEL_TOPO_DEF == 1} {
    puts "==>INFORMATION: Checking for DEF file..."
    if {![file exists ./inputs/floorplan/${INTEL_DESIGN_NAME}.def]} {
      puts "==>FATAL: INTEL_TOPO_DEF has been set to 1. Expecting ${INTEL_DESIGN_NAME}.def in ./inputs/floorplan/. Exiting..."
      return 0
    } else {
      puts "==>INFORMATION: DEF file existence: ${INTEL_DESIGN_NAME}.def exists. Will use this file."
    }
  }
} else {
  puts "==>INFORMATION: DEF file not provided. Default floorplan will be assumed"
}


# Checking for scan input files
puts "==>INFORMATION: Checking for scan input file...."
if { $synopsys_program_name == "dc_shell" } {
  if {[info exists INTEL_INSERT_SCAN] && $INTEL_INSERT_SCAN ==1} {
    if {![file exists ./scripts/scan_stitch_template.tcl]} {
      puts "==>FATAL: INTEL_INSERT_SCAN set to 1. Expecting scan_stitch_template.tcl in ./scripts/. Exiting..."
      return 0
    } else {
      puts "==>INFORMATION: Scan input existence: Scan stitch template exists"
    }
  } else {
    puts "==>INFORMATION: Scan input existence: Scan not enabled. Hence scan_stitch_template.tcl not necessary."
  }
}

####################
#SAIF file setup
####################
if {[info exists INTEL_SAIF] && $INTEL_SAIF==1} {
  if {![file exists ./inputs/constraints/${INTEL_DESIGN_NAME}.saif]} {
    puts "==>FATAL: INTEL_SAIF var is set to 1. Expecting ${INTEL_DESIGN_NAME}.saif file in ./inputs/constraints/... Exiting..."
    return 0
  }
}

if {$synopsys_program_name == "dc_shell"} {
  saif_map -start
  set_vsdc ./outputs/${INTEL_DESIGN_NAME}.syn.vsdc
}

#####################
#Creating MW library
#####################

if { [shell_is_in_topographical_mode] } {
  file delete -force -- ./mwdb/${INTEL_DESIGN_NAME}_syn_LIB
  set_app_var mw_design_library ./mwdb/${INTEL_DESIGN_NAME}_syn_LIB
  if {[info exists INTEL_EXTEND_MW_LAYERS] && $INTEL_EXTEND_MW_LAYERS=="1"} {
    P_msg_info "Enabling extended milkway layers"
    extend_mw_layers
  }
  create_mw_lib -technology $INTEL_TECH_FILE_SYN -mw_reference_library $mw_reference_library $mw_design_library
  open_mw_lib $mw_design_library
}


############################
#Read RTL, Elaborate & Link
############################

if {[file exists ./inputs/rtl/${INTEL_DESIGN_NAME}.rtl_list.tcl]} {
  source ./inputs/rtl/${INTEL_DESIGN_NAME}.rtl_list.tcl
} else {
  puts "==>FATAL: ${INTEL_DESIGN_NAME}.rtl_list.tcl file does not exist in ./inputs/rtl area... Exiting..."
  return 0
}

elaborate ${INTEL_DESIGN_NAME}
current_design ${INTEL_DESIGN_NAME}


if {![eval {link}]} {
  puts "==>FATAL: Design Link Failed... Exiting..."
  return 0
} else {
  link > ./reports/${INTEL_DESIGN_NAME}.syn.link.rpt
}


##############################
#Read UPF
##############################
if { $synopsys_program_name == "dc_shell"} {
  if {[info exists INTEL_UPF] && $INTEL_UPF} {
    load_upf ./inputs/upf/${INTEL_DESIGN_NAME}.upf
    propagate_constraints -power_supply_data

    save_upf ./outputs/${INTEL_DESIGN_NAME}.syn.premapped.upf
    redirect ./reports/${INTEL_DESIGN_NAME}.syn.premapped.report_power_domain.rpt {eval report_power_domain [get_power_domains -quiet -hierarchical *]}
  }
}
