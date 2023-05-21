export DESIGN_NAME = sandbox
export PLATFORM    = intel16

export SANDBOX_DIR 		= ./designs/$(PLATFORM)/$(DESIGN_NAME)
export CACHED_NETLIST 	= $(SANDBOX_DIR)/$(DESIGN_NAME).sv
export SDC_FILE      	= $(SANDBOX_DIR)/constraint.sdc

export PDN_TCL 			= $(SANDBOX_DIR)/pdn.tcl
export IO_CONSTRAINTS 	= $(SANDBOX_DIR)/io_placement.tcl

export ADDITIONAL_LEFS 	= $(wildcard $(SANDBOX_DIR)/lef/*.lef)
export ADDITIONAL_OAS  	= $(wildcard $(SANDBOX_DIR)/oas/*.oas)
export ADDITIONAL_CDL 	= $(wildcard $(SANDBOX_DIR)/cdl/*.cdl)

export DIE_AREA    = 0 0 300 1250
export CORE_AREA   = 2 2 298 1248

export MACRO_PLACE_CHANNEL = 40 40
export MACRO_PLACE_HALO    = 20 20

export PLACE_DENSITY = uniform