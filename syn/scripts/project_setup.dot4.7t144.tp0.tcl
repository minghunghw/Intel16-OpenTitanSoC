## @file
###################################################################
# *NAME* : project_setup.dot2.8m_144.tp0.tcl
#
# *DESCRIPTION* : Assigns variables for default project configuration
###################################################################

############################################################################

####################################
#Tool Environment Variables
####################################

# Include the names of all memories, io's etc to be used in the block. An example is given below
# set INTEL_HARD_MACRO_NAME         [list macro1 macro2]

set INTEL_MACRO_X_SPACING 1.864
set INTEL_MACRO_Y_SPACING 2.260

########################################
#Design Variables:
########################################

############SYN, APR and PV#############
########################################

# Top level block name for Physical Design
set INTEL_DESIGN_NAME   ""

# Max and min routing layers. These variables are used by set_ignored_layers icc command and various other tcl scripts.
set INTEL_MAX_ROUTING_LAYER                  "m8"
set INTEL_MIN_ROUTING_LAYER                  "m2"
set INTEL_RC_IGNORE_LAYERS                   "m1"

# Override the min routing layer contraint during placement only. Used in tool_constraints.tcl.
# This has proven to improve post route QOR by reducing RC in placement.
set INTEL_MIN_ROUTING_LAYER_OVERRIDE(place)           "m2"
set INTEL_MIN_ROUTING_LAYER_OVERRIDE(post_place)      "m2"
# Specify all VT & LS_VT types available for use in library
set INTEL_ALL_VT_TYPES    {base_ell base_elllvt lvl_ell lvl_elllvt pwm_ell pwm_elllvt seq_ell seq_elllvt spcl_ell spcl_elllvt}
set INTEL_ALL_LS_TYPES    {lvl_ell lvl_elllvt}
# Select specific VT & LS_VT types to use in flow
#set INTEL_ENABLE_VT_TYPES {ln nn mn hn qn rn sn}
#set INTEL_ENABLE_LS_TYPES {ls_hn ls_nn ls_mn ls_ln ls_qn ls_rn ls_sn}
set INTEL_ENABLE_VT_TYPES    {base_ell base_elllvt pwm_ell pwm_elllvt seq_ell seq_elllvt spcl_ell spcl_elllvt}
set INTEL_ENABLE_LS_TYPES    {lvl_ell lvl_elllvt}
# Set Synthesis scenarios to run. Need atleast one scenario defined and set to default and 
# must be from list of valid scenarios defined in INTEL_SCENARIOS variable
set INTEL_SYN_SCENARIOS {FUNC_WORST}
set INTEL_SYN_DEFAULT_SCENARIO {FUNC_WORST}

# Set APR scenarios to set and run
set INTEL_APR_SCENARIOS {FUNC_WORST FUNC_BEST}

# Variable for merging oasis
set INTEL_MERGE_FILES ""
foreach vt [lsort -unique $INTEL_ALL_VT_TYPES] {
  lappend INTEL_MERGE_FILES $env(INTEL_STDCELLS)/$vt/oasis/lib224_b15_7t_144pp_$vt.oas
}

lappend INTEL_MERGE_FILES $env(INTEL_TIC)/libraries/tic/oasis/${LAYERSTACK}/intel22tic.oas

# MW Power net Name
set INTEL_POWER_NET    vcc
set INTEL_GROUND_NET   vss

# Variable to enable the usage of SDC file. If set to 1, read ./inputs/constraints/${INTEL_DESIGN_NAME}.syn.sdc. If set to 0, read ./inputs/constraints/clocks.tcl and ./inputs/constraints/constraints.tcl
set INTEL_SDC_FILE      0

# Variable to insert timing aware multibit flipflops in synthesis, if set to 1, DC will insert multibit and write out all the details of insertion in a hidden file called ./.create_register_bank.tcl in the run area
set INTEL_INSERT_MBFF 1

# Set it to 1 for frequency based max capacitance enablement
set INTEL_CMAX 0

# Variable to set the banking threshold for MBFFs, if the register has slack less than the value set for this variable (currently set to 0) the tool will not map it to a multibit flop
set INTEL_TIMING_AWARE_BANKING_THRESHOLD 0

# Variable to use scan flops or not (if 1, compile -scan otherwise -scan is not used). If var set to 1 then, Synthesis will run compile -scan and compiled netlist will have scan flops.
set INTEL_SCAN_REPLACE_FLOPS 1

#Variable to insert scan chain, if set to 1, DC will insert scan chain and  write out ./outputs/${INTEL_DESIGN_NAME}.scandef. APR will read in ./inputs/scandef/${INTEL_DESIGN_NAME}.scandef and run place_opt -optimize_dft
set INTEL_INSERT_SCAN   0

# If set to 1, enables UPF flow for synthesis and APR.
set INTEL_UPF     0

# Set RTL & post-synthesis UPF version, either 1.0 or 2.0.
set INTEL_UPF_VERSION   1.0

# Set the list of nets incase of UPF design
set INTEL_UPF_POWER_NETS {vss vcc}

# If set to 1, synthesis and APR flow will read ./inputs/constraints/${INTEL_DESIGN_NAME}.saif and optimizes dynamic power.
set INTEL_SAIF      0

# Variable used to define the hierarchical instance (top/instA) for which switching activity is annotated. If not defined then top level design name will be assumed
set INTEL_SAIF_INSTANCE   ""

# The maximum number of cores to be used.
set INTEL_NUM_CPUS                  4

# Macro NDM reference libs to be added in block_setup.tcl per design.
# E.g.
#set INTEL_MACRO_NDM_REF_LIBS {
#  $macro1_dir/$macro1.ndm
#  $macro2_dir/$macro2.ndm
#  $macro3_dir/$macro3.ndm
#}
set INTEL_MACRO_NDM_REF_LIBS {}

############SYN Specific################
########################################

# If set to 1 then DC will read the .def file for floorplan from ./inputs/floorplan/${INTEL_DESIGN_NAME}.def
set INTEL_TOPO_DEF      0

# Variable to set insert_clock_gating (if 1 then insert_clock_gating and compile_ultra -clock_gate is used)
set INTEL_INSERT_CLOCKGATES         1

# Set to 1, to invoke synopsys physical guidance to generate ddc/mwdb for seed placement to APR. DEF file must be provided and INTEL_TOPO_DEF set to 1.
set INTEL_SPG                       0



# If set to 1 then ICC will read .ddc file from ./inputs/${INTEL_DESIGN_NAME}.syn.ddc
set INTEL_DDC                       0

###########APR Specific #################
#####################################################################

#Input file name variables - Provide full paths to file names. Examples provided below.
#Note - if variable not set, default path and filename (as shown in example below) will be assumed.

# set INTEL_INPUT_NETLIST ./inputs/netlist/<INTEL_DESIGN_NAME>.vg
# set INTEL_INPUT_SCANDEF ./inputs/scandef/<INTEL_DESIGN_NAME>.syn.scandef
# set INTEL_INPUT_DEF ./inputs/floorplan/<INTEL_DESIGN_NAME>.floorplan.def
# set INTEL_INPUT_UPF ./inputs/upf/<INTEL_DESIGN_NAME>.syn.upf
# set INTEL_INPUT_SDC ./inputs/constraints/<INTEL_DESIGN_NAME>.syn.sdc
dict set INTEL_SCENARIOS FUNC_WORST syn_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.syn.sdc]
dict set INTEL_SCENARIOS FUNC_BEST  syn_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.syn.sdc]
dict set INTEL_SCENARIOS FUNC_WORST apr_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc]
dict set INTEL_SCENARIOS FUNC_BEST  apr_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc]
dict set INTEL_SCENARIOS FUNC_POWER  apr_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc]
dict set INTEL_SCENARIOS FUNC_WORST sta_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc.gz]
dict set INTEL_SCENARIOS FUNC_BEST sta_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc.gz]
dict set INTEL_SCENARIOS FUNC_POWER sta_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc.gz]
dict set INTEL_SCENARIOS FUNC_NOISE sta_constraints [list ./inputs/constraints/\${INTEL_DESIGN_NAME}.sdc.gz]
dict set INTEL_SCENARIOS FUNC_WORST upf_set_voltage ./inputs/upf/\${INTEL_DESIGN_NAME}.set_voltage.tcl

set INTEL_ENABLE_TIMING_DERATES 0

########## Main Command Variables ###################################
# The following variables set the options to main APR commands like place_opt, psynopt, etc

# place_opt.tcl may append additional switches "-power", "-layer_optimization", "-optimize_dft" or "-spg" conditionally based on other INTEL_* conrol vars.
set INTEL_PLACE_CMD "place_opt"

# used in psynopt.tcl
set INTEL_POST_PLACE_CMD "refine_opt"

# used in cts.tcl
set INTEL_CLK_OPT_CMD "clock_opt -from build_clock -to final_opto"
set INTEL_POST_CTS_OPT_CMD "refine_opt -from inc_opto"

# route_trackassign.tcl may append "-power" switch conditionally based on other INTEL_* conrol vars.
set INTEL_ROUTE_TRACK_ASSIGN_CMD "route_auto -stop_after_track_assignment true"

# used in initial_detailroute.tcl
set INTEL_INITIAL_DETAIL_ROUTE_CMD "route_auto"

# used in incr_route_opt.tcl
set INTEL_INCR_ROUTE_OPT_CMD "route_opt"

# used in incr_eco_detail_route.tcl
set INTEL_INCR_ECO_DETAIL_ROUTE_CMD "route_detail -incremental true"

# used in incr_detailroute.tcl
set INTEL_INCR_DETAIL_ROUTE_OPT_CMD "route_detail -incremental true"

set INTEL_PROCESS_NAME p1222
set INTEL_STDCELL_TILE_HEIGHT 0.63
set INTEL_FLIP_FIRST_ROW 0

# The following variables are also used, but defined in other parts of project_setup.tcl, by the runset based pg hookup.
# INTEL_UPF, INTEL_MW_POWER_NET, INTEL_MW_GROUND_NET, INTEL_STDCELL_TILE, INTEL_DFM_RELEASE_DIR


#############Floorplan##################

#set INTEL_FP_INPUT                 "BOUNDARY" ; # DEF(import fp def)|FP_TCL(import fp tcl)|""

# Example
# set INTEL_FP_BOUNDARY             "{0 0} {[expr $INTEL_MD_GRID_X * 400] [expr $INTEL_MD_GRID_Y * 400]}";

set INTEL_METAL_LAYERS {m2 m3 m4 m5 m6 m7 m8}
set INTEL_HORIZONTAL_LAYERS {m2 m4 m6 m8 gm0 c4}
set INTEL_VERTICAL_LAYERS {m1 m3 m5 m7 gmz gmb}
set INTEL_MAX_PG_LAYER "m8"
set INTEL_MIN_PG_LAYER "m1"

# Sets the terminal length for each metal layer for use in P_create_pg_terminals procedure during FRAM generation.
set INTEL_TERM_LENGTH "m1 0.120 m2 0.160 m3 0.160 m4 0.160 m5 0.160 m6 0.160 m7 0.160 m8 0.5"

#### PG pullback values ####
# Set pullback values for primary power nets at voltage area boundary. If no pullback is specified (or) if they are always-on nets, they run till voltage area boundary.
set pg_pullback(va) {"m1 0.040" "m2 0.040" "m3 0.040" "m4 0.040" "m5 0.040" "m6 0.040" "m7 0.27" "m8 0.27"}

# Set pullback values for macros
set pg_pullback(macro) {"m1 0.160" "m2 0.160" "m3 0.160" "m4 0.160" "m5 0.160" "m6 0.160" "m7 0.27" "m8 0.27"}

# Define layers for ports
set INTEL_PORT_LAYERS "m7 m8"

# Define macro offgrid layers for offgrid track creation
#set INTEL_OFFGRID_LAYERS "m2 m3 m4 m5 m6"

#The example below shows how to override default RG values for macro reference (iromu1r0w6144d16w1spu0p) for layers m4 and m5.
#set INTEL_MACRO_RG_LIST(iromu1r0w6144d16w1spu0p) "m4 0.10 -0.10 m5 -0.210 -0.210"

#The example below shows how to completely exclude some macro references.
#set INTEL_MACRO_EXCLUSION_LIST [list iromu1r0w6144d16w1spu0p iromu1r0w6144d16w1spu1p]

#Update the list of ports where you don't need diode insertion
set INTEL_NO_INPUT_DIODE_PORTS ""

########################################
# UPF Floorplan vars

# UPF always-on supply nets as defined in UPF loaded to design.
# 1 must be ground net.  The other 1 is power net for single always-on supply voltage, or the other 2 are power nets for dual always-on supply voltage.
# Order of always-on power nets in INTEL_UPF_POWER_NETS determines mapping to aon,1 & aon,2 in INTEL_PG_GRID_CONFIG for dual always-on supply UPF.
set INTEL_UPF_POWER_NETS {vss vcc}

# UPF power plan to implement P/G grids.
# Supported values are mesh_upf_1aosv (single always-on supply voltage) & mesh_upf_2aosv (dual always-on supply voltages).
set INTEL_POWER_PLAN mesh_upf_1aosv

# core PS variable
# Define power switch array style (checker_board/column)
# Horizontal pitch between power switch cells of adjacent staggered columns in staggered array.  Must be multiple of $INTEL_MD_GRID_X.
# Vertical pitch between power switch cells of adjacent staggered rows in staggered array.  Must be multiple of $INTEL_MD_GRID_Y.
# NOTE: If there are more than 1 offsets for P/G template, use the 1st offset.
# Lib cell of power switch cells to be inserted in staggered array configuration in shutdown voltage areas.
# Supports both single control & dual control power switch lib cell, but must match control of UPF power switch strategy.
# Define different power switch lib cells for specifc power domains if necessary.  To be added in block_setup.tcl per design.
# Connection mode among power switch cells supported by -mode option of connect_power_switch command, i.e. hfn, daisy or fishbone.
# Start corner/point of power switch cell for daisy or fishbone mode as supported by -start_point option of connect_power_switch command, i.e. lower_left, upper_left, lower_right or upper_right.
#Define ladders to use for power switch connections
# E.g.
# E.g.
#dict lappend INTEL_PS_CORE($power_domain) lib_cell <cell_name>
set INTEL_PS_CORE [dict create {*}{
  default {
    style "column"
    x_pitch 34.56
    y_pitch 10.08
    lib_cell b15psbf20bw1qfkx5
    connect_config daisy
    connect_corner lower_left
  }
}]

# A pair of adjacent metal layers with always-on P/G grid templates in INTEL_PG_GRID_CONFIG to align power switch cells.
set INTEL_PS_ALIGN_PG_GRID [dict create {*}{
   mesh_upf_1aosv {{m6 power_va_aon} {m7 power_all_aon}}
   mesh_upf_2aosv {{m6 power_va_aon,1 power_va_aon,2} {m7 power_all_aon,1 power_all_aon,2}}
}]

set INTEL_PS_SEC_PG [dict create {*}{
  default  VL2644_1
}]
set INTEL_PS_SEC_PG_ALIGN [dict create {*}{
  default 1
}]

# ring based PS variable 
# (single/double/none)
set INTEL_PS_RING [dict create {*}{
  ring_number 0
  x_pitch 3.132
  y_pitch 2.52
  lib_cell b15psbf20bw1qfkx5
}]

# Macro channel base PS variable
set INTEL_PS_MIP [ dict create {*}{
  x_pitch 34.56
  y_pitch 10.08
  horizontal_threshold 10
  vertical_threshold 10
  x_offset 1
  lib_cell b15psbf20bw1qfkx5
}]

#Define ladders to use for aon connections
set INTEL_SEC_PG "VL2413 VL2412 VL2421 VL2422"

# Movebounds along voltage area boundaries for level-shifter & isolation cells, as well as to extend always-on P/G grids across voltage areas.
#
# INTEL_LS_BOUND($voltage_area,outer) = List of margins of outer movebound from sides of single-shape voltage area starting from lower left-most edge in clockwise order.
# INTEL_LS_BOUND_CELLS($voltage_area,outer) = List of cell patterns of level-shifter & isolation cells with parent location in UPF for outer movebound of single-shape voltage area.
#
# INTEL_LS_BOUND($voltage_area,$voltage_area_shape,outer) = List of margins of outer movebound from sides of 1 of the multiple disjoint shapes of voltage area starting from lower left-most edge in clockwise order.
# INTEL_LS_BOUND_CELLS($voltage_area,$voltage_area_shape,outer) = List of cell patterns of level-shifter & isolation cells with parent location in UPF for outer movebound of 1 of the multiple disjoint shapes of voltage area.
#
# INTEL_LS_BOUND($voltage_area,inner) = List of margins of inner movebound from sides of single-shape voltage area starting from lower left-most edge in clockwise order.
# INTEL_LS_BOUND_CELLS($voltage_area,inner) = List of cell patterns of level-shifter & isolation cells with self location in UPF for inner movebound of single-shape voltage area.
#
# INTEL_LS_BOUND($voltage_area,$voltage_area_shape,inner) = List of margins of inner movebound from sides of 1 of the multiple disjoint shapes of voltage area starting from lower left-most edge in clockwise order.
# INTEL_LS_BOUND_CELLS($voltage_area,$voltage_area_shape,inner) = List of cell patterns of level-shifter & isolation cells with self location in UPF for inner movebound of 1 of the multiple disjoint shapes of voltage area.
#
# NOTE:
#   Movebound margins & cells for single-shape voltage area can also be specified using the format with explicit voltage area shape, but not vice-versa.
#   Number of margins for a voltage area shape must be either match the number of sides or empty.
#   Margins must be either positive number or 0 for no movebound at the given side.
#   Margins of vertical edges must be multiple of placement site width and >= width of vertical halo cell + widest level-shifter/isolation cell.
#   Margins of horizontal edges must be multiple of row height and >= 2 rows (level-shifter cells are double-height).
#


#############Placement##################

set INTEL_CRITICAL_RANGE           "2000";
set INTEL_AREA_CRITICAL_RANGE      "not_set";
set INTEL_POWER_CRITICAL_RANGE     "not_set";

## Set to 1 to enable Layer Promotion
set INTEL_LAYER_PROMOTION           0

# Set to "magnet" for magnet placement, "port" for placing cells close to ports and "" to let place_opt place the iso cells.
set INTEL_ISOCELL_PLACER            ""

################CTS#####################

set INTEL_CTS_NETS                          ""
set INTEL_CTS_MAX_ROUTING_LAYER(DEFAULT)    "m8"
set INTEL_CTS_MIN_ROUTING_LAYER(DEFAULT)    "m3"
set INTEL_CTS_LEAF_MIN_LAYER                "m3"
set INTEL_CTS_LEAF_MAX_LAYER                "m8"
set INTEL_ENABLE_CLOCK_SPACING              "1" ; #Enables/disables clock cell spacing for IR/EM
set INTEL_CTS_MAX_FANOUT                    "24"
set INTEL_CTS_ADVANCED_DRC_FIXING           "true"
set INTEL_ENABLE_CLOCK_SHIELD 0
######################################
# CTS NDR SETUP
######################################
set INTEL_ENABLE_CLOCK_NDR "0"
set INTEL_CTS_NDR_RULE(clk) ""
set INTEL_CTS_NDR_RULE(SHIELD) ""

########################################################################
# NDR definitions for each clock in the design
#   Note - If INTEL_ENABLE_CLOCK_NDR is set to '0', then default routing
#          rules are used for clocks
########################################################################
#set INTEL_CTS_NDR_RULE(clk) "ndr_defaultW_3T_Sh"
#set INTEL_CTS_MAX_ROUTING_LAYER(clk) "m6"
#set INTEL_CTS_MIN_ROUTING_LAYER(clk) "m5"

##############Routing###################
set INTEL_ZROUTE_VIA_DBL           "0"     ;# Redundant via insertion

##############Fill######################

############# MCMM Flow Specific Variables ################
# Comments on MCMM Flow:
# The prerequisite for running the MCMM flow is:
#   1) The library.tcl is updated to include PVTs referenced here by set_operating_conditions. Macros PVT must match the PVT of the stdcell libraries for the tools to link to them correctly.
#   2) The variable below be set for each scenario created.
#
# All MCMM related setup is now done through create_scenarios.tcl. If something custom is required, please copy the file over locally an modify as needed.

# When using MCMM (set INTEL_MCMM 1), it is set to 0 by default
# Also need to set all the MCMM variables below (example provided below)
set INTEL_MCMM 0

############Power variables#############

# Variable is used to enable VCD/SAIF file read for PTPX Power Calculation ./inputs/constraints/${INTEL_DESIGN_NAME}.vcd/.fsdb/.saif. Specify the full path of the activity file name.
set INTEL_ACTIVITY_FILE    ""

# Specifies a path prefix that is to be stripped from all the object names read from the VCD file. This option is applied to strip the testbench/instance path from the VCD file.
set INTEL_STRIP_PATH         ""

# Variables used to specify the map file while using VCD from RTL. Give full path of the file. Map file will make sure that RTL names in the VCD match with those in the gate-level netlist.
set INTEL_RTL_VCD_MAP_FILE     ""

# Variable used to set average or peak power_analysis type. Valid values are avg, peak.
set INTEL_POWER_ANALYSIS     "avg"
#################################################################################
##                PV/STA variables
#################################################################################

set INTEL_VG_FILES "./inputs/netlist/\${INTEL_DESIGN_NAME}.vg.gz"


# Optional: Specify input SPEF files in this format
#dict set INTEL_SCENARIOS FUNC_WORST spef inputs/spef/\$vars(INTEL_DESIGN_NAME).pcss_125c.spef.gz
#dict set INTEL_SCENARIOS FUNC_BEST  spef inputs/spef/\$vars(INTEL_DESIGN_NAME).pcff_125c.spef.gz
#dict set INTEL_SCENARIOS FUNC_NOISE spef inputs/spef/\$vars(INTEL_DESIGN_NAME).pcss_125c.spef.gz
#dict set INTEL_SCENARIOS FUNC_POWER  spef inputs/spef/\$vars(INTEL_DESIGN_NAME).pcss_125c.spef.gz

# Required : Define list of lists SDC in the format {{inst1 sdc1} {inst2 sdc2}..}
# If undefined, will look for SDC file in inputs directory
set INTEL_SDC ""

# Specify list of valid run types for STA
set INTEL_VALID_STA_RUN_TYPES {min max noise power}

# INTEL_STA_RUN_TYPE is a mandatory variable can be  {max,min,noise,power}
set INTEL_STA_RUN_TYPE ""

# Specify STA run types with scenarios to check
set INTEL_STA_TYPE(max)    {FUNC_WORST}
set INTEL_STA_TYPE(min)    {FUNC_BEST}
set INTEL_STA_TYPE(power)  {FUNC_POWER}
set INTEL_STA_TYPE(noise)  {FUNC_NOISE}

# Set number of cores to be use for STA run
set INTEL_STA_NUM_CORES   ""
set INTEL_PT_ERC_CHECK_ENABLE 0
set INTEL_POCVM_ENABLE 1
set INTEL_AOCVM_ENABLE 0



#####for ICV Runset FILL####
set INTEL_FILL_LAYERS {IMPLANT M1 M2 M3 M4 M5 M6 M7 M8}
set INTEL_RUNSET_FILL_PATH $env(INTEL_PDK)/fill/synopsys/runsets/

#########for VHDL support#####

#set_app_var hdlin_vhdl_std 2008

#################



##SMARTFILL
set INTEL_SMART_FILL_DIR $env(INTEL_PDK)/fill/siemens/runsets/
set INTEL_CALIBRE_SMART_FILL_ENV $env(INTEL_PDK)/runsets/calibre/svrf/
set INTEL_SMART_FILL_LAYERS_LIST "UV M1 M2 M3 M4 M5 M6 M7 M8"
set INTEL_ENABLE_SMARTFILL "0"
#####



####user needs to define max paths for STA reporting ###
set INTEL_STA_REPORT_MAX_PATH "100"

##for better timing qor recommended to use pba_mode as exhaustive  , default is 1 
set INTEL_PBA_ANALYSIS "1"
