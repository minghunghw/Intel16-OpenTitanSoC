export DESIGN_NAME 		= chip_earlgrey
export PLATFORM    		= intel16

export CHIP_DIR 		= ./designs/$(PLATFORM)/$(DESIGN_NAME)
export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= $(CHIP_DIR)/constraint.sdc

export PDN_TCL 			= $(CHIP_DIR)/pdn.tcl
export IO_CONSTRAINTS 	= $(CHIP_DIR)/io_placement.tcl

export MEMORY_DIR 		= ../ip/memory

export ADDITIONAL_LEFS 	= $(wildcard $(MEMORY_DIR)/*_be/lef/*.lef)
export ADDITIONAL_OAS  	= $(wildcard $(MEMORY_DIR)/*_be/oasis/*.oas)
export ADDITIONAL_CDL 	= $(wildcard $(MEMORY_DIR)/*_be/spice/*.sp)

# export DIE_AREA    = 0 0 1400 1250
# export CORE_AREA   = 2 2 1398 1248

export CORE_UTILIZATION    = 10
export CORE_ASPECT_RATIO   = 1
export CORE_MARGIN         = 1

export MACRO_PLACE_CHANNEL = 40 40 
export MACRO_PLACE_HALO    = 20 20

export PLACE_DENSITY = uniform
export REPAIR_PDN_VIA_LAYER = v1

export ABC_CLOCK_PERIOD_IN_PS = 20000