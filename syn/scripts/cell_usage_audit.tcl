## @file
###################################################################
# *NAME* : cell_usage_audit.tcl
#
# *DESCRIPTION* : This script reports any invalid cell being introduced during optimization
###################################################################

##############################################################################
#Script: cell_usage_audit.tcl
# List of procs used by this tcl
# 1. P_msg_error
########################################

set output_file "./reports/$INTEL_DESIGN_NAME.$INTEL_STEP_CURR.Illegal_cells.rpt"
set f [open $output_file "w"]

foreach vt_type $INTEL_ENABLE_VT_TYPES {
  regexp _(.*) $vt_type letter_vt_type letter
  if {$letter == "hp"} {
    set vt_exp($vt_type) "^.{10}q.*"
  } elseif {$letter == "lp"} {
    set vt_exp($vt_type) "^.{10}l.*"
  } elseif {$letter == "lplvt"} {
    set vt_exp($vt_type) "^.{10}m.*"
  } elseif {$letter == "lvt"} {
    set vt_exp($vt_type) "^.{10}h.*"
  } elseif {$letter == "nom"} {
    set vt_exp($vt_type) "^.{10}n.*"
  } elseif {$letter == "ulp"} {
    set vt_exp($vt_type) "^.{10}r.*"
  } elseif {$letter == "ulvt"} {
    set vt_exp($vt_type) "^.{10}s.*"
  } elseif {$letter == "ell"} {
    set vt_exp($vt_type) "^.{10}w.*"
  } elseif {$letter == "elllvt"} {
    set vt_exp($vt_type) "^.{10}y.*"
  }
}

foreach_in_collection cell [get_lib_cells -of_objects [get_cells -hierarchical]] {
  set lib_cell_name [get_attribute $cell name]
  if {[regexp $INTEL_FDK_LIB $lib_cell_name] == 1} {
    set error_flag 0
    foreach vt_type $INTEL_ENABLE_VT_TYPES {
      if {[regexp $vt_exp($vt_type) $lib_cell_name] == 1} {
        set error_flag 1
      }
    }
    if { $error_flag == 0 } {
      P_msg_error "Non FDK recommended vt_type cell detected: $lib_cell_name"
      puts $f "Non FDK recommended vt_type cell detected: $lib_cell_name"  
    }
  }
}

close $f
