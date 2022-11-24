export DESIGN_NAME = top_chip
export PLATFORM    = intel16

export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NAME)/$(DESIGN_NAME).sv))
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

export PLACE_DENSITY = uniform
export ABC_CLOCK_PERIOD_IN_PS = 1000
