##########################################################
# *NAME*: lib_cell_usage.tcl
#
# *SUMMARY* :     Set dont_use/lib_cell_usage for Syntheis/APR/PV runs
#
# *REQUIRED* :    yes
#
# *USAGE* :
#
# *ARGUMENTS* :   None
#
# *VARIABLES* :   None
#
# *DESCRIPTION* : This script is used to set dont_use/lib_cell_usage for Syntheis/APR/PV runs
#
# *EXAMPLES* :
#
###############################################################################

proc set_lib_cell_usage {data program_name} {
    switch -glob -- $program_name {
        dc*      { set_lib_cell_usage_dc      $data }
        icc2*    { set_lib_cell_usage_icc2    $data }
    }
}

proc set_lib_cell_usage_dc {data} {
    if {[dict get $data flow] eq "all" || [dict get $data flow] eq "syn"} {

        # dont_use true
        if {[dict exists $data exclude] && [dict get $data exclude] eq "all"} {
            foreach cells [dict get $data cells] {
                if {[sizeof_collection [get_lib_cells -quiet $cells]] > 0} {
                    puts "INFO: Setting dont_use to true on $cells [dict get $data comments]"
                    set_attribute [get_lib_cells -quiet $cells] dont_use true
                    foreach_in_collection lib_pin [get_lib_pins -of_objects [get_lib_cells -quiet $cells]] {
                        if {[get_attribute -quiet $lib_pin clock_gate_out_pin] == "true"} {
                            set_dont_use [get_lib_cells -quiet -of $lib_pin] -power
                        }
                    }
                }
            }
                
        # dont_use false
        } elseif {[dict exists $data include] && [dict get $data include] eq "all"} {
            foreach cells [dict get $data cells] {
                if {[sizeof_collection [get_lib_cells -quiet $cells]] > 0} {
                    puts "INFO: Setting dont_use to false on $cells [dict get $data comments]"
                    set_attribute [get_lib_cells -quiet [dict get $data cells]] dont_use false
                    foreach_in_collection lib_pin [get_lib_pins -of_objects [get_lib_cells -quiet [dict get $data cells]]] {
                        if {[get_attribute -quiet $lib_pin clock_gate_out_pin] == "true"} {
                            set_attribute [get_lib_cells -quiet -of $lib_pin] pwr_cg_dont_use false
                        }
                    }
                }
            }
                
        # dont_use true and pwr_cg_dont_use false for ICG
        } elseif {[dict exists $data include] && [dict get $data include] eq "cts"} {
            foreach cells [dict get $data cells] {
                if {[sizeof_collection [get_lib_cells -quiet $cells]] > 0} {
                    puts "INFO: Setting dont_use to true and pwr_cg_dont_use to false on $cells [dict get $data comments]"
                    set_attribute [get_lib_cells -quiet [dict get $data cells]] dont_use true
                    foreach_in_collection lib_pin [get_lib_pins -of_objects [get_lib_cells -quiet [dict get $data cells]]] {
                        if {[get_attribute -quiet $lib_pin clock_gate_out_pin] == "true"} {
                            set_attribute [get_lib_cells -quiet -of $lib_pin] pwr_cg_dont_use false
                        }
                    }
                }
            }
            
        } 
    }
}

proc set_lib_cell_usage_icc2 {data} {
    if {[dict get $data flow] eq "all" || [dict get $data flow] eq "apr"} {
        
        # exclude
        if {[dict exists $data exclude]} {
            foreach cells [dict get $data cells] {
                if {[sizeof_collection [get_lib_cells -quiet $cells]] > 0} {
                    puts "INFO: Setting lib_cell_purpose to exclude [dict get $data exclude] on $cells [dict get $data comments]"
                    set_lib_cell_purpose -exclude [dict get $data exclude] [get_lib_cells -quiet $cells]
                } 
            }
                
        # include
        } elseif {[dict exists $data include]} {
            foreach cells [dict get $data cells] {
                if {[sizeof_collection [get_lib_cells -quiet $cells]] > 0} {
                    puts "INFO: Setting lib_cell_purpose to include [dict get $data include] on $cells [dict get $data comments]"
echo set_lib_cell_purpose -include [dict get $data include] [get_lib_cells -quiet $cells]
                    set_lib_cell_purpose -include [dict get $data include] [get_lib_cells -quiet $cells]
                } 
            }        
        }
    }
}


# Find program name
if {[info exists synopsys_program_name]} {
    set program_name $synopsys_program_name
} else {
    set program_name [lindex [split [info nameofexecutable] /] end]
}

# Apply use/dont_use on cells in each category
dict for {category data} $lib_cell_usage {
    set_lib_cell_usage $data $program_name
}
