## @file
###################################################################
# *NAME* : library.tcl
#
# *DESCRIPTION* : Sets up libraries for use in synthesis.
###################################################################
##############################################################################
# abort run if general checks fail
set abort 0

if {![info exists INTEL_ENABLE_VT_TYPES]} {
  P_msg_error "INTEL_ENABLE_VT_TYPES variable not defined. Require this to setup libraries for syntheisis run. Please check!"
  set abort 1
}

# Check if INTEL_SYN_DEFAULT_SCENARIO is defined.
if {![info exists INTEL_SYN_DEFAULT_SCENARIO] || $INTEL_SYN_DEFAULT_SCENARIO == ""} {
  P_msg_error "INTEL_SYN_DEFAULT_SCENARIO either not defined or empty. Require this information to proceed!"
  set abort 1
}

if {![info exists INTEL_SYN_SCENARIOS] || $INTEL_SYN_SCENARIOS == ""} {
  P_msg_error "INTEL_SYN_SCENARIOS not defined (or) empty. Require this information to proceed!"
  set abort 1
}

# Check if pvt specified in each scenario exists in INTEL_PVTS. Also make sure that 
# target/mw_ref/search_path for appropriate VTs in each pvt of INTEL_PVTS exist
foreach scenario $INTEL_SYN_SCENARIOS {
  if {![dict exists $INTEL_PVTS [set pvt [dict get $INTEL_SCENARIOS $scenario pvt]]]} {
    P_msg_warn "Scenario $scenario PVT $pvt not found in INTEL_PVTS. Please check!"
    set abort 1
  } elseif {![dict exists $INTEL_PVTS $pvt stdcells]} {
    P_msg_error "PVT $pvt does not have 'stdcells' sub key. Need this to proceed further!"
    set abort 1
  } else {
    set subkeys [dict keys [dict get $INTEL_PVTS $pvt stdcells]]
    foreach required_subkey {target_ldb search_path mw_ref} {
      if {[lsearch $subkeys $required_subkey] < 0} {
        P_msg_error "Required subkey $required_subkey is not defined for Key 'stdcells' of PVT $pvt! Cannot proceed!!"
        set abort 1
      } else {
        foreach vt [list {*}$INTEL_ENABLE_VT_TYPES {*}$INTEL_ENABLE_LS_TYPES] {
          if {![dict exists [dict get $INTEL_PVTS $pvt stdcells $required_subkey] $vt]} {
            P_msg_warn "Vt type $vt subkey not found under INTEL_PVTS->${pvt}->stdcells->$required_subkey key! Check if this threshold variant exists in the library specfied and edit your INTEL_ENABLE_VT_TYPES/INTEL_ENABLE_LS_TYPES variable to remove this entry to proceed..."
            #set abort 1
          }
        }
      }
    }
  }
}

# Return if any of the above checks failed
if {$abort} {
  P_msg_error "Please check & address above warnings/errors before running synthesis"
  return
}

unset -nocomplain pvt vt subkeys required_subkey scenario

##########################################
# Variables for CCST Timing Model
##########################################

## NOTE: Set the variables to basic for NLDM Timing Model if required.

P_msg_info "Setting variables to support CCS Timing Models"
set_app_var rc_driver_model_mode advanced
set_app_var rc_receiver_model_mode advanced


###########################################################################
# Description: This file sets up libraries for the entire design
###########################################################################
set tmp_macro_link_ldb {}

foreach scenario $INTEL_SYN_SCENARIOS {
  P_msg_info "Setting search_paths and target libraries for $scenario"
  set pvt [dict get $INTEL_SCENARIOS $scenario pvt]
  foreach vt [set vt_list [list {*}$INTEL_ENABLE_VT_TYPES {*}$INTEL_ENABLE_LS_TYPES]] {
    if {[lsearch [dict keys [dict get $INTEL_PVTS $pvt stdcells search_path]] $vt] < 0} {
    P_msg_warn "No separate search_path found for $vt stdcells"
    } else {
    lappend tmp_search_paths     [dict get $INTEL_PVTS $pvt stdcells search_path $vt]
    }
    if {[lsearch [dict keys [dict get $INTEL_PVTS $pvt stdcells target_ldb]] $vt] < 0} {
    P_msg_warn "No separate target_ldb found for $vt stdcells"
    } else {
    lappend tmp_target_libraries {*}[dict get $INTEL_PVTS $pvt stdcells target_ldb $vt ]
    }
    if {[lsearch [dict keys [dict get $INTEL_PVTS $pvt stdcells mw_ref]] $vt] < 0} {
    P_msg_warn "No separate mw_ref found for $vt stdcells"
    } else {
    lappend tmp_mw_ref_libraries {*}[dict get $INTEL_PVTS $pvt stdcells mw_ref $vt]
    }
  }
  #foreach vt [set vt_list [list {*}$INTEL_ENABLE_LS_TYPES]] {
  #  lappend tmp_target_libraries {*}[dict get $INTEL_PVTS $pvt stdcells target_ldb $vt ]
  #}  
  P_msg_info "Enabling libraries for following VT types: $vt_list"
 if {[dict exists $INTEL_PVTS $pvt macros]} {
     if {[dict exists $INTEL_PVTS $pvt macros mw_ref]} {
    lappend tmp_mw_ref_libraries {*}[dict get $INTEL_PVTS $pvt macros mw_ref]
    }
    # If lib pointers are specified as full paths, then search_paths may not be needed
    if {[dict exists $INTEL_PVTS $pvt macros search_path]} {
      lappend tmp_search_paths     {*}[dict get $INTEL_PVTS $pvt macros search_path]
    } else {
      lappend tmp_search_paths {*}{}
    }
    if {[dict exists $INTEL_PVTS $pvt macros target_ldb]} {
    append tmp_macro_link_ldb   {*}[dict get $INTEL_PVTS $pvt macros target_ldb]
  }
  }
}
# Set search paths
set_app_var search_path [concat $search_path [lsort -unique $tmp_search_paths]]
P_msg_info "search_path is set to $search_path"

# Set target libraries
set_app_var target_library $tmp_target_libraries
P_msg_info "target_library is set to $target_library"

# Set link libraries
set_app_var link_library [list *]
set_app_var link_library [concat $link_library $target_library $tmp_macro_link_ldb]
set_app_var link_library [concat $link_library dw_foundation.sldb]
#set_app_var link_library [lsort -unique [concat $link_library dw_foundation.sldb]]

P_msg_info "link_library is set to $link_library"

# Set MW reference library
set mw_reference_library [lsort -unique [join $tmp_mw_ref_libraries]]
P_msg_info "mw_reference_library is set to $mw_reference_library"

unset -nocomplain tmp_*
