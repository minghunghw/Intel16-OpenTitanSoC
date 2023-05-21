export DESIGN_NAME 		= chip_earlgrey
export PLATFORM    		= intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

# export IO_CONSTRAINTS 	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_placement.tcl

export MEMORY_DIR 		= ../ip/memory

export ADDITIONAL_LEFS 	= $(wildcard $(MEMORY_DIR)/*_be/lef/*.lef)
export ADDITIONAL_OAS  	= $(wildcard $(MEMORY_DIR)/*_be/oas/*.oas)
export ADDITIONAL_CDL 	= $(wildcard $(MEMORY_DIR)/*_be/cdl/*.cdl)

export CORE_UTILIZATION    = 20
export CORE_ASPECT_RATIO   = 1
export CORE_MARGIN         = 1

export MACRO_PLACE_CHANNEL = 40 40 
export MACRO_PLACE_HALO    = 20 20

export PLACE_DENSITY = uniform