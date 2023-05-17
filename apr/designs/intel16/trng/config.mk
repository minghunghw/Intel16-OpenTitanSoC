export DESIGN_NAME = trng
export PLATFORM    = intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

export CORE_UTILIZATION    = 10
export CORE_ASPECT_RATIO   = 1
export CORE_MARGIN         = 1

export PLACE_DENSITY = uniform