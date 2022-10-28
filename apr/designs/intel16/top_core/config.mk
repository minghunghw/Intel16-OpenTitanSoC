export DESIGN_NAME = top_core
export PLATFORM    = intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sdc

export ADDITIONAL_LEFS 	+= ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/lef/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.lef
export ADDITIONAL_GDS	+= ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/gds/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.gds

export DIE_AREA    = 0 0 500 500
export CORE_AREA   = 1.26 1.89 498 498

export PLACE_DENSITY = uniform
