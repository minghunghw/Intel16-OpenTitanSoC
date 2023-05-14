#======================#
# START OF CATCH BLOCK #
#======================#
if { [catch {
#======================#

if {![info exists env(DUT)] } {
    set env(DUT) default
}
if {![info exists env(REPO_ROOT)] } {
    set env(REPO_ROOT) $env(MODEL_ROOT)/target/$env(DUT)
}

###########################################################################
# IP info settings
###########################################################################

set ::collage_ip_info::ip_name            "mss_top_top"
set ::collage_ip_info::ip_top_module_name "mss_top_top"
set ::collage_ip_info::ip_version         "1.0"
set ::collage_ip_info::ip_intent_sp       "$::env(MODEL_ROOT)/tools/collage/inputs/build/intent"

set ::collage_ip_info::ip_input_language  "SystemVerilog"
if { [file exists $::env(REPO_ROOT)/src/rtl/mss_top/mss_top_top.sv] } { 
   set ::collage_ip_info::ip_input_files "$::env(REPO_ROOT)/src/rtl/mss_top/mss_top_top.sv"
} else {
   set ::collage_ip_info::ip_input_files     "$::env(MODEL_ROOT)/src/rtl/mss_top/mss_top_top.sv"
}
set ::collage_ip_info::ip_rtl_inc_dirs    "$::env(MODEL_ROOT)/src/rtl/mss_top $::env(MODEL_ROOT)/src/rtl/common"

set ::collage_ip_info::ip_plugin_dir      "" ; # Directories - space separated list - with tcl plugin files
set ::collage_ip_info::ip_ifc_def_hook "mss_top_top_create_ifc_instances" ; # Set this to procedure to add IP interfaces - defined below
set ::collage_ip_info::ip_plugin_dirs "" 

######################################################################
# Procedure to create IP interfaces
######################################################################
proc mss_top_top_create_ifc_instances {} {
  if { ! [file exists $::env(REPO_ROOT)/src/rtl/mss_top/mss_top_top.sv] } { 
    # -------------
    # Define the IP clocks
    # -------------
    set_port_attribute {clk}  ClockName clk   
    set_clock_attribute {clk} CycleTime 20ps
    collage_create_ip_clock -port "clk" -clk_type FUNC_CLK -clk_min_freq 40 -clk_max_freq 40

    # -------------
    # <interface instance>
    # -------------


    

    ## create default tieoffs
    mss_top_top_create_adhoc_default_tieoffs
  }
}

######################################################################
# Procedure to create tieoffs for IP adhoc signals
######################################################################
proc mss_top_top_create_adhoc_default_tieoffs {} {
    ## create default tieoffs (to zero, one or open) for all adhoc ports

    set_port_attribute powergood_rst_b            IfUnconnected one
    set_port_attribute reset_b                    IfUnconnected one
    set_port_attribute data_i                     IfUnconnected zero
    set_port_attribute data_o                     IfUnconnected open

    ## automatically tie off power to 1 and ground to 0 (if left unconnected)
    set_port_attribute vdd*                       IfUnconnected one
    set_port_attribute vss*                       IfUnconnected zero


}

proc add_generic_interface {{ifc_defn_name ""} {ifc_defn_version ""} {ifc_inst_name ""} {ifc_inst_type "consumer"} {ifc_inst_format "*_%s"} {open_params {}} {open_ports {}} {port_map {}}} {

    create_interface_instance $ifc_inst_name -type $ifc_inst_type \
        -interface $ifc_defn_name -version $ifc_defn_version \
        -associationformat $ifc_inst_format
 
    #set_interface_parameter_attribute -instance $ifc_inst_name  <name of param> Value <value of param>
    
    collage_set_open_interface -ifc_inst_name $ifc_inst_name -parameters $open_params -ports $open_ports
    
    #set port_map {
    #    architecture_port     rtl_port
    #}
    collage_set_interface_link -ifc_inst_name $ifc_inst_name -ports $port_map
}

#######################################################################################
# mss_top_top_create_visa_ifc_instances and mss_top_top_create_visa_ifc_instance
#######################################################################################
proc mss_top_top_create_visa_ifc_instances {{Max_Visa_Lanes 0} {Visa_Lane_Width 8} {version "1.0"} {associationformat "*%s*"}} {
    set ifc_inst_name mss_top_top_visa_cfg_ulm${Visa_Lane_Width}b
    create_interface_instance $ifc_inst_name \
            -type consumer \
            -interface "IOSF::DFX::VISA_CFG" \
            -version $version \
            -associationformat "$associationformat"
    set_interface_port_attribute -instance $ifc_inst_name VISA_SERSTB     InterfaceLink "visa_serial_cfg_in[0]"
    set_interface_port_attribute -instance $ifc_inst_name VISA_FRAME      InterfaceLink "visa_serial_cfg_in[1]"
    set_interface_port_attribute -instance $ifc_inst_name VISA_SERDATA    InterfaceLink "visa_serial_cfg_in[2]"

    set ifc_inst_name mss_top_top_visa_sec_ulm${Visa_Lane_Width}b
    create_interface_instance $ifc_inst_name \
            -type consumer \
            -interface "IOSF::DFX::VISA_SEC" \
            -version $version \
            -associationformat "$associationformat"

    for {set i 0} {$i <= $Max_Visa_Lanes} {incr i} {
        mss_top_top_create_visa_ifc_instance "mss_top_top_visa_ulm${Visa_Lane_Width}b_${i}" "[$i]" ${Visa_Lane_Width} $version $associationformat
    }
    ## these visa ports are not part of an interface
    set_port_attribute visa_reg_start_index IfUnconnected zero
    set_port_attribute visa_resetb          IfUnconnected zero
    set_port_attribute visa_unit_id         IfUnconnected zero
}

proc mss_top_top_create_visa_ifc_instance {ifc_inst_name {current_lane ""} {Visa_Lane_Width 8} {version "1.0"} {associationformat "*%s*"} {port_map { }} {open_params { }} {open_ports { }} } {
    create_interface_instance $ifc_inst_name \
            -type consumer \
            -interface "IOSF::DFX::VISA" \
            -version $version \
            -associationformat "$associationformat"
    set_interface_port_attribute -instance $ifc_inst_name VISA_CLK      InterfaceLink "visa_clk$current_lane"
    set_interface_port_attribute -instance $ifc_inst_name VISA_DBG_LANE InterfaceLink "visa_dbg_lane$current_lane"

    set_interface_parameter_attribute -instance $ifc_inst_name VISA_LANE_WIDTH InterfaceLink "VISA_LANE_WIDTH"
    #set_interface_parameter_attribute -instance $ifc_inst_name VISA_LANE_WIDTH InterfaceLink "<open>"
    #set_interface_parameter_attribute -instance $ifc_inst_name VISA_LANE_WIDTH Value ${Visa_Lane_Width}
        
    collage_set_open_interface -ifc_inst_name $ifc_inst_name -parameters $open_params -ports $open_ports
        
    collage_set_interface_link -ifc_inst_name $ifc_inst_name -ports $port_map
    
    return
}

#######################################################################################
# set_param_local
#######################################################################################
proc set_param_local {} {
    ## add any parameters that you want to be customer configurable
    if {$::env(SIP_VARIATION) == "common"} {
        set configurable_params(DATA_SIZE) 1
    }

    foreach_in_collection p [find_item -quiet -type param -filter {DesignParameter == 1}] {
        if {[info exists configurable_params($p)]} { continue }
        set_parameter_attribute $p Visible 0
        set_parameter_attribute $p FromArchitecture 1
    }
}

print_info "Start building $::collage_ip_info::ip_top_module_name\n"

#uncomment this hook if you want protect (some) parameters in your corekit 
# so that they are not available for customer modification (aka lock parameters)
#add_activity_hook -before DesignConfigurationIntent set_param_local

######################################################################
# Add interface definition files
######################################################################
# example: collage_add_ifc_def_files -files "<official_file_name>"
collage_add_ifc_def_files -files "iosf_primary_interface.1.2.tcl"
collage_add_ifc_def_files -files "iosf_sb_interface.1.2.tcl"

######################################################################
# Create workspace (see help for options)
######################################################################
collage_create_workspace

######################################################################
# Run the build flow (see help for options)
######################################################################
collage_simple_build_flow -exit -copy_corekit -dont_create_ws -gen_ipxact_xml

#====================#
# END OF CATCH BLOCK #
#====================#
} msg ] } {
    echo "ERROR mss_top_top builder failed with: $msg"
    puts stderr "\n\nERROR (Code = ${::errorCode}):\n${::errorInfo}\n"
    exit 1
}
#====================#
