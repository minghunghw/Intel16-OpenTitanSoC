export DESIGN_NAME = mem_tlul
export PLATFORM    = intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sdc

export ADDITIONAL_LEFS 	+= ../ip/mem/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.lef
export ADDITIONAL_GDS	+= ../ip/mem/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.gds

export ABC_AREA      	= 1

export DIE_AREA    = 0 0 200 200 
export CORE_AREA   = 10 10 190 190 

export PLACE_DENSITY = 0.35
export ABC_CLOCK_PERIOD_IN_PS = 1000
