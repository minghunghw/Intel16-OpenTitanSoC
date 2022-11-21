export DESIGN_NAME = top_core
export PLATFORM    = intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sdc

export ADDITIONAL_LEFS 	+= ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/lef/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.lef
export ADDITIONAL_GDS	+= ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/gds/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.gds
export ADDITIONAL_CDL	+= ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/spice/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.sp

export CORE_UTILIZATION    = 30
export CORE_ASPECT_RATIO   = 1
export CORE_MARGIN         = 1

export PLACE_DENSITY = uniform
export ABC_CLOCK_PERIOD_IN_PS = 1000

export CORNERS = BC WC TC