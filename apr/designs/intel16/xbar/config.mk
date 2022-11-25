export DESIGN_NAME = xbar
export PLATFORM    = intel16

export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NAME)/$(DESIGN_NAME).sv))
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

export PDN_TCL          = ./designs/$(PLATFORM)/$(DESIGN_NAME)/pdn.tcl
export IO_PLACEMENT_TCL = ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_placement.tcl
export TAPCELL_TCL 	  	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/tapCell7T.tcl

export DIE_AREA    = 0 0 625 100
export CORE_AREA   = 20 20 600 80

export PLACE_DENSITY = uniform
export ABC_CLOCK_PERIOD_IN_PS = 1000
