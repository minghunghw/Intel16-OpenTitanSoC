export DESIGN_NAME = top_chip
export PLATFORM    = intel16

export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NAME)/*.sv))
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

export ADDITIONAL_LEFS 	+= $(sort $(wildcard ./designs/$(PLATFORM)/$(DESIGN_NAME)/lef/*.lef))
export ADDITIONAL_GDS	+= $(sort $(wildcard ./designs/$(PLATFORM)/$(DESIGN_NAME)/gds/*.gds.gz))

export TOP_LEVEL = 1

# gpio     623 x 911
# top_core 357 x 356
export DIE_AREA    = 0 0 650 1300
export CORE_AREA   = 10 10 640 1290

export PLACE_DENSITY = uniform
export ABC_CLOCK_PERIOD_IN_PS = 1000
