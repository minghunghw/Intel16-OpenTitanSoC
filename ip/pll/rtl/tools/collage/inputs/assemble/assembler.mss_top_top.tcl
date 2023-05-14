if { [ catch {
#======================#

if {![info exists env(DUT)] } {
    set env(DUT) default
}
if {![info exists env(REPO_ROOT)] } {
    set env(REPO_ROOT) $env(MODEL_ROOT)/target/$env(DUT)
}

# subIP corekit to wrap was not found in metadata
set ip_name         ""
set ip_kit_src_dir  "$env(MODEL_ROOT)/tools/collage/inputs/$env(DUT)/$ip_name/coreKits"


set top_wrap_name                 mss_top_top
set subsys_dir                    $env(MODEL_ROOT)/tools/collage/inputs/integ/mss_top_top

set ip_wrap_kit_src_dir           $env(MODEL_ROOT)/tools/collage/outputs/$env(DUT)/mss_top_top/coreKits
set ip_wrap_reports_dir           $env(MODEL_ROOT)/tools/collage/outputs/$env(DUT)/mss_top_top/reports
set ip_wrap_rtl_dir               $env(REPO_ROOT)/src/rtl/mss_top
set env(COLLAGE_IP_KITS)          $ip_wrap_kit_src_dir

file mkdir $ip_wrap_kit_src_dir
file mkdir $ip_wrap_reports_dir
file mkdir $ip_wrap_rtl_dir

source $env(RTLTOOLS_FLOWS)/tools/collage/inputs/packages/export_utils.tcl

proc soc_generate_wrapper_rtl_hook {} {
    global ip_wrap_rtl_dir
    global top_wrap_name
    global ip_name
    print_info "soc_generate_wrapper_rtl_hook  Adding hooks for '$ip_name'"
   #add_activity_hook -before SpecifySubsystem         ""
   #add_activity_hook -before CompleteConnections      ""
   #add_activity_hook -before GenerateSubsystemRTL     ""
   #add_activity_hook -before CreateTestbenchWorkspace ""
   #add_activity_hook -before BuildSubsystemCorekit    ""
   #add_activity_hook -before CreateSubsystemTemplate  ""

    add_activity_hook -before CompleteConnections  "export_utils::export_unconnected_adhoc_pins $ip_name"
    add_activity_hook -before GenerateSubsystemRTL "collage_generate_rtl -set_options_only -language SystemVerilog -dont_use_type_override_input_pins"
   #add_activity_hook -after  GenerateSubsystemRTL "export_utils::post_generate_subsystem_rtl $top_wrap_name $ip_wrap_rtl_dir"
    add_activity_hook -after  GenerateSubsystemRTL "export_utils::create_define_file $top_wrap_name $ip_wrap_rtl_dir"
    add_activity_hook -after  GenerateSubsystemRTL "export_utils::mark_interfaces_as_not_visible $ip_name"
    #add_activity_hook -after  GenerateSubsystemRTL "collage_add_ifdef_supply_ground -folder_path $ip_wrap_kit_src_dir -supply_pin_include [list vdd vss]"
    # stub creation provided by collage does not work for all modules
    # in particular there seems to be a problem handling parameterized modules
    #add_activity_hook -after  GenerateSubsystemRTL "collage_gen_ip_stub $ip_name _empty sv $ip_wrap_rtl_dir 0 1"
}
#collage_continue_on_error_adhoc_connect_stage()
#collage_generate_wrapper_corekit_rtl -top_wrap_name $top_wrap_name \
#         -ip_wrap_kit_src_dir $ip_wrap_kit_src_dir -subsys_dir $subsys_dir 
#file rename -force -- $ip_wrap_kit_src_dir/$top_wrap_name.build.summary $ip_wrap_reports_dir/ 
#file rename -force -- $ip_wrap_kit_src_dir/$top_wrap_name.build.warning $ip_wrap_reports_dir/ 
#file rename -force -- $ip_wrap_kit_src_dir/$top_wrap_name.sv $ip_wrap_rtl_dir/ 
puts "-W- No subIP corekit configured, so cannot create a wrapper"


exit 0

} msg] } {
   echo "### FAILED"
   echo $msg
   puts stderr "\n\nERROR (Code = ${::errorCode}):\n${::errorInfo}\n$msg"
   exit 1
}

