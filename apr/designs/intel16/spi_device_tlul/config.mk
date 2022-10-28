export DESIGN_NAME = spi_device_tlul
export PLATFORM    = intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sdc

export DIE_AREA    = 0 0 250 250
export CORE_AREA   = 1.26 1.89 248 248

export PLACE_DENSITY = uniform
export ABC_CLOCK_PERIOD_IN_PS = 1000
