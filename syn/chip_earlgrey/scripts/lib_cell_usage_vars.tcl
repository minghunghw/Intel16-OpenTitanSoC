##########################################################
# *NAME*: lib_cell_usage_vars.tcl
#
# *SUMMARY* :     Defines dont_use/lib_cell_usage variable
#
# *REQUIRED* :    yes
#
# *USAGE* :
#
# *ARGUMENTS* :   None
#
# *VARIABLES* :   None
#
# *DESCRIPTION* : This script is used to define dont_use/lib_cell_usage variable
#
# *EXAMPLES* :
#
###############################################################################

################################################################################
# set <dictionary> {
#     <category> {
#         flow {<flow>}
#         exclude {<lib_cell_purpose>}
#         include {<lib_cell_purpose>}
#         property {<ccopt_property>}
#         cells {<cell_name>}
#         comments {"comments"}    
#     }
# }
# <category>
#     Can be any name.  
#     Must include hold, cts, eco, tie, synch, special
# <flow>
#     all, syn, apr, or sta
# <lib_cell_purpose>: Used in ICC2 set_lib_cell_purpose command
#     exclude: hold|cts|optimization|power|all
#     include: hold|cts|optimization|power
# <ccopt_property>: Used in Innovus set_ccopt_property and setOptMode -holdFixingCells commands
#     hold, buffer_cells|inverter_cells|clock_gating_cells|delay_cells|logic_cells
################################################################################
# To contain only exclude-all cells
set lib_cell_usage_dont_use {
    openroad_dont_use {
        flow {all}
        exclude {all}
        cells {
            */????????????d*
            */???fdw003a*1n24x5
        }
        comments {"Dont use cells"}
    }
    hold_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???bfm*
        }
        comments {"Delay cells"}
    }
    cts_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???cbf*
            */???cil*
            */???cinv*
            */???cdiyr*
            */???clb*
            */???cmbn* 
        }
        comments {"Exclude all clock cells for APR. Include as required during CTS"}
    }
    eco_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???qgbbf*
            */???qgbao*
            */???qgbbd*
            */???qgbbf*
            */???qgbff*
            */???qgbin*
            */???qgblf*
            */???qgbmx*
            */???qgbna*
            */???qgbno*
            */???qgboa*
            */???qgbxo*
            */???qgbdc*
            */???qgbdp*
            */???qgbth*
            */???qgbtl*
        }
        comments {"ECO cells, including Functional Bonus Cells"}
    }
    tie_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???ti*
        }
        comments {"Tie cells"}
    }
    synch_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???fmm20*
            */???fmm30*
        }
        comments {"Synchronizers"}
    }
   special_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???rev*
        }
        comments {"Special cells"}
    }
    drc_dont_use {
        flow {all}
        exclude {all}
        cells {
            */???aoi022a*n02x5 
        }
        comments {"HPC Cells"}
            
    }
    hold_exclude {
        flow {apr}
        exclude {hold}
        cells {
            */*
        }
        comments {"Exclude all cells for hold fix"}
    }
    cts_exclude {
        flow {apr}
        exclude {cts}
        cells {*/*}
        comments {"Exclude all cells for CTS"}
    }
}

set lib_cell_usage_use {
    cts_buffer_include {
        flow {apr}
        include {cts}
        property {buffer_cells}
        cells {
            */???cbf000?h???4x5
            */???cbf000?h???6x5
            */???cbf000?h???8x5
            */???cbf000?h??12x5
            */???cbf000?h??16x5
            */???cbf000?h??24x5
            */???cbf000?h??32x5
            */???cbf000?h??48x5
            */???cbf000?h??64x5


        }
        comments {"Use high perf buffer Vt cells for clock tree."}
    }
    cts_inverter_include {
        flow {apr}
        include {cts}
        property {inverter_cells}
        cells {
            */???cinv00?h???4x5
            */???cinv00?h???6x5
            */???cinv00?h???8x5
            */???cinv00?h??12x5
            */???cinv00?h??16x5
            */???cinv00?h??24x5
            */???cinv00?h??32x5
            */???cinv00?h??48x5
            */???cinv00?h??64x5

        }
        comments {"Use high perf inverter Vt cells for clock tree."}
    }
    cts_clock_gating_include {
        flow {apr}
        include {cts}
        property {clock_gating_cells}
        cells {
            */???cil???h*
        }
        comments {"Use high perf ICG Vt cells for clock tree."}
    }
    cts_logic_include {
        flow {apr}
        include {cts}
        property {logic_cells}
        cells {
            */???clb????h*
            */???cmbn???h*
        }
        comments {"Use high perf clock logic Vt cells for clock tree."}
    }
    icg_include {
        flow {syn}
        include {cts}
        cells {
            */???cil????h*
        }
        comments {"Use ICG cells of high performance Vt type"}
    }
    optimization_include {
        flow {apr}
        include {optimization}
        cells {
            */???tihi???n*
            */???tilo???n*
        }
        comments {"Tie-high/low cells"}
    }
    hold_include {
        flow {apr}
        include {hold}
        property {hold}
        cells {
            */???bfm????l* 
        }
        comments {"Include LP buffer cells for hold fix."}
    }
}

