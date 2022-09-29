# Technology: Intel intel 16-nn 
$(info [INFO-FLOW] Intel 16NN)

FOUNDRY_DIR := $(realpath $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

export FOUNDRY_VERSION 		= P1222.29 BOM 6T
export FOUNDRY_STD_VERSION 	= stdcell_1222.BOM_dot29
export FOUNDRY_LIB_VERSION 	= lib2229 bom 6t 108pp
export FOUNDRY_PDK_VERSION 	= pdk050_rovopo_efv

export FOUNDRY_DIR FOUNDRY_VERSION FOUNDRY_PDK_VERSION

export PLATFORM = intel16
export PROCESS 	= 16

export OPENROAD_PATCHES +=

export TECH_LEF 		= $(FOUNDRY DIR)/lef/p1222.lef
export SC_LEF 			= $(FOUNDRY DIR)/lef/lib224_bom_6t_108pp_base_nom.lef
export ADDITIONAL_LEFS += $(FOUNDRY_DIR)/lef/lib224_bom_6t_108pp_spcl_nom.lef \
                          $(FOUNDRY_DIR)/lef/lib224_bom_6t_108pp_seq_nom.lef

export GDS_FILES  = $(FOUNDRY DIR)/gds/lib224 bom 6t_108pp_base_nom.gds \
                    $(FOUNDRY_DIR)/gds/lib224_bom_6t_108pp_spcl_nom.gds \
                    $(FOUNDRY_DIR)/gds/lib224_bom_6t_108pp_seq_nom.gds \
                    $(ADDITIONAL_GDS)

export GDS_MAP_FILE = $(FOUNDRY_DIR)/gds/p1222.cdns_gds.map
export POWER_NET 	= VDD
export GROUND_NET 	= VSS

# KLayout technology file 
export KLAYOUT_TECH_FILE = $(FOUNDRY_DIR)/KLayout/intel16.lyt

# Placement site for core cells
# This can be found in the technology lef 
export PLACE_SITE = core_6T_108pp

export PLACE_DENSITY ?= 0.40

# Standard cells: intel 
export DONT_USE_CELLS = *01x5 *x7 *x3

# the following dont_use cells are temporary pending feature SYMMETRY support in placer export DONT USE CELLS += *b0mfpn* *b0mfqn* *b0mcdi* *b0mfpy* *b0mfqy* *b0mfdw* *b0mfhw* *hn1n*

export FILL_CELLS 		= b0mzdnd00an1n01x5 b0mzdnd00an1n02x5
export FILL_CELLS 		+= b0mzdnd11an1n04x5 b0mzdnd11an1n08x5 b0mzdnd11an1n16x5 b0mzdnd11an1n32x5 b0mzdnd11an1n64x5

# export FILL_CELLS 		+= b0mzdnd33an1n04x5 b0mzdnd33an1n08x5 b0mzdnd33an1n16x5 b0mzdnd33an1n32x5 b0mzdnd33an1n64x5
# export FILL_CELLS 		+= b0mzdnd44an1n04x5 b0mzdnd44an1n08x5 b0mzdnd44an1n16x5 b0mzdnd44an1n32x5 b0mzdnd44an1n64x5

export DFF_LIB_FILE 	= $(FOUNDRY_DIR)/lib/dff.lib.fixed

export BC_LIB_FILES 	= $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_base_nom_psss_0p585v_m40c_tttt_ctyp_nldm.lib.gz \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_spcl_nom_psss_0p585v_m40c_tttt_ctyp_nldm.lib.gz \ 
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_seq_nom_psss_0p585v_m40c_tttt_ctyp_nldm.lib.gz

export BC_DB_FILES 		= $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_base_nom_pfff_1p050v_125c_tttt_ctyp_nldm.ldb \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_seq_nom_psss_0p585v_m40c_tttt_ctyp_nldm.ldb \ 
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_spcl_nom_psss_0p585v_m40c_tttt_ctyp_nldm.ldb

export BC_TEMPERATURE	= -40C

export WC_LIB_FILES 	= $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_base_nom_pfff_1p050v_125c_tttt_ctyp_nldm.lib.gz \ 
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_spcl_nom_pfff_1p050v_125c_tttt_typ_nldm.lib.gz \ 
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_seq_nom_pfff_1p050v_125c_tttt_ctyp_nldm.lib.gz

export WC_DB_FILES 		= $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_base_nom_pfff_1p050v_125c_tttt_ctyp_nldm.ldb \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_spcl_nom_pfff_1p050v_125c_tttt_ctyp_nldm.ldb \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_seq_nom_pfff_1p050v_125c_tttt_ctyp_nldm.ldb

export WC_TEMPERATURE 	= 125

export TC_LIB_FILES 	= $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_base_nom_tttt_0p850v_25c_tttt_ctyp_nldm.lib.gz \
                          $(FOUNDRY DIR)/lib/lib224_b0m_6t_108pp_spcl_nom tttt_0p850v_25c_tttt_ctyp_nldm.lib.gz \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_seq_nom tttt_0p850v_25c_tttt_ctyp_nldm.lib.gz 

export TC_DB_FILES		= $(FOUNDRY DIR)/lib/lib224_b0m_6t_108pp_base nom_tttt_0p850v_25c_tttt_ctyp_nldm.ldb \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_spcl_nom_tttt_0p850v_25c_tttt_ctyp_nldm.ldb \
                          $(FOUNDRY_DIR)/lib/lib224_b0m_6t_108pp_seq_nom_tttt_0p850v_25c_tttt_ctyp_nldm.ldb

export TC_TEMPERATURE 	= 25

export CORNER 			?= BC

export LIB_FILES 		+= $($(CORNER)_LIB_FILES) 
export LIB_DIRS 		+= $($(CORNER)_LIB_DIRS) 
export DB_FILES 		+= $($(CORNER)_DB_FILES)
export DB_DIRS 			+= $($(CORNER)_DB_DIRS)
export WRAP_LIBS 		+= $(WRAP_$(CORNER)_LIBS)
export WRAP_LEFS 		+= $(WRAP_$(CORNER)_LEFS)
export TEMPERATURE 		 = $($(CORNER)_TEMPERATURE)

# Power grid configuration
export PDN_TCL 			?= $(FOUNDRY_DIR)/openRoad/pdn/grid_strategy-M1-M7.tcl

# Information used in YOSYS Synthesis
# Set yosys-abc clock period to first "clk_period" value or "-period" value found in sdc file 
export ABC_CLOCK_PERIOD_IN_PS 	?= $(shell sed -nr "s/^set\s+clk_period\s+(\S+).*|.*-period\s+(\S+).*/\1\2/p" $(SDC_FILE) | head -1 | awk '{print $$1}')
export ABC_DRIVER_CELL 			= b0mbfn000an1n04x5 
export ABC_LOAD_IN_FF 			= 1.805064006547858
export MIN_BUF_CELL_AND_PORTS 	= b0mbfm201an1n04x5 a o 
export TIEHI_CELL_AND_PORT 		= b0mtihi00an1n03x5 o 
export TIELO_CELL_AND_PORT 		= b0mtilo00an1n03x5 o

# IO placer 
export IO_PLACER_H ?= m4 
export IO_PLACER_V ?= m3

# Information for placement
export CELL_PAD_IN_SITES_DETAIL_PLACEMENT ?= 2 
export CELL_PAD_IN_SITES_GLOBAL_PLACEMENT ?= 2

# Information for TritonCTS 
export CTS_BUF_CELL 				= b0mcbf000an1n16x5 b0mcbf000an1n08x5 b0mcbf000an1n04x5 b0mcbf000an1n02x5

# Information for FastRoute
export FASTROUTE_TCL 				?= $(FOUNDRY_DIR)/fastroute.tcl 
export MAX_ROUTING_LAYER 			?= m7 
export MIN_ROUTING_LAYER 			?= m2

# to drop via in standard cell pin geometry 
export VIA_IN_PIN_MIN_LAYER 		?= m1

# Information for TritonMacroPlace 
export MACRO_PLACE_CHANNEL 			?= 10 10 
export MACRO_PLACE_HALO 			?= 5 5

# Information to build Tap Cells 
export TAPCELL_TCL 					= $(FOUNDRY_DIR)/openRoad/tapCell.tcl 
export MAKE_TRACKS 					= $(FOUNDRY_DIR)/openRoad/make_tracks.tcl

# Innovus Settings 
export INNOVUS_VERSION 				?= INNOVUS211

export CALIBRE_VERSION 				?= 2022.2_24.16

# Calibre Settings 
export CALIBRE_DRC_DECK 			= $(FOUNDRY_DIR)/calibre/svrf/p1222_drcc.svrf

export LAYOUT_PATH  				?= $(FINAL_GDS)
export DR_INPUT_FILE 				?= $(FINAL_GDS)

export LAYOUT_PRIMARY 				?= $(DESIGN_NAME)
export DR_INPUT_CELL 				?= $(DESIGN_NAME)

export DRC_RESULTS_DATABASE 		?= $(DESIGN NAME)
export DR_RVE_FILE 					?= drc.results

# default Intel setting
export Calibre_RUNSET 				= $(abspath $(FOUNDRY_DIR)/calibre/svrf)

export INTEL_CALIBRE_ENV 			= 1

# export DR_PROCESS					= dotTwo
export DR_PROCESS 					= dot Four
# export DR_PROCESS					= dotTwentyNine
# export DR_Enable_NVM				= YES
export LAYERSTACK					= m11_1x_3xa_1xb_1xc_2yb_2ga_mim2_1gb_bumpp
export DR_GATE_DIRECTION 			= VERTICAL
export DR_DIC_EXISTENCE_CHECK		= NO
export DR_FULL_DIE 					= NO 
export DR_LIB_NOFILTER 				= NO
export DR_DONTCMPGNACS 				= YES
export DR_LIB_NOFILTER 				= NO
export DR_DONTCMPGNACS 				= YES
# if (! $?DR_IGNORE_NV_PV) unexport DR_IGNORE_NV_PV 
export DR_MERGEOPEN 				= NO 
export DR_GLOBAL_COLON 				= YES 
export DR_WELL_TEXT 				= NO 
export DR_NWELLTAP 					= YES 
export DR_SUBTAP 					= YES 
export DR_SECTION_LEVEL 			= NO 
export DR_COMBINE_DEN_WINDOWS 		= YES
export DR_TemplateValidate 			= NO 
export DR_DIC_EXISTANCE_CHECK 		= NO 
export DR_GEN_DEN_RING 				= YES 
export DR_VIRPKGROUTE 				= NO 
export DR_DISPLAY_MASK 				= NO 
export DR_DEBUG 					= NO
export DR_DISPLAY_PCT_LOOP 			= NO
export DR_enableXHP 				= NO
export DR_BOT_Bump 					= NO 
export DR_FILTER_DNW_DIODE 			= YES 
export DR_REDUCE_TFR_2020 			= YES

export DR_RDB_PATH					= ./
export DR_RDB_FILE 					= $(DR_RDB_PATH)/out.rdb

export DR_REPORT_FILE 				= drc.sum 
export DR_ERC_REPORT 				= erc.sum
export DR_ERC_RESULT 				= erc.rdb

export DR_userOverrides 			= $(Calibre_RUNSET)/includes/useroverrides/useroverrides.svrf 
export DR_userOverrides_reuse 		= $(Calibre_RUNSET)/includes/useroverrides/useroverrides_reuse.svrf
export select_check_file 			= $(Calibre_RUNSET)/includes/select_check_file

export CALIBRE_ENABLE_CONNECT_FLEX 	= YES
# —-----------------------------------------------------
# Calibre Fill
#---------------------------------------------------------
export CALIBRE_FILL_DECK 			= $(FOUNDRY_DIR)/calibre/surf/p1222_fill.svrf

export Fill_RUNSET 					= $(CALIBRE_FILL_DECK)
export FILL_RDB_PATH 				= $(DR_RDB_PATH)/fill
export FILL_RDB_FILE 				= $(FILL_RDB_PATH) /out.rdb
export FILL_RVE_FILE 				= out.rve
export FILL_REPORT_FILE 			= drc.sum
export FILL_ERC_FILE 				= erc.sum
export FILL_ERC_RESULT 				= erc.rdb 
export FILL_INPUT_CELL 				= $(DESIGN_NAME)
export FILL_INPUT_FILE 				= $(FINAL_GDS)

#------------------------------------------------------------------
# StarRC settings
#------------------------------------------------------------------
export STARRC_LEF_FILES 			= $(abspath $(TECH_LEF) $(SC_LEF) $(ADDITIONAL_LEFS))

export STARRC_BC_NXTGRD_FILE 		= $(FOUNDRY_DIR)/starrc/techfiles/svrf/pcss.nxtgrd
export STARRC_WC_NXTGRD_FILE 		= $(FOUNDRY_DIR)/starrc/techfiles/surf/pcff.nxtgrd
export STARRC_TC_NXTGRD_FILE 		= $(FOUNDRY_DIR)/starrc/techfiles/svrf/tttt.nxtgrd
  
export STARRC_MAPPING_FILE          = $(FOUNDRY_DIR)/starrc/asic/svrf/asic.starrc.map
export STARRC_GDS_LAYER_MAP_FILE 	= $(FOUNDRY_DIR)/starrc/asic/svrf/gds.fill.starrc.map
