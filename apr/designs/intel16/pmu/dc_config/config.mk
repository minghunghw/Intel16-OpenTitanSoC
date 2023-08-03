export DESIGN_NAME = dc_config
export PLATFORM    = intel16

export VERILOG_FILES = ./designs/src/pmu/$(DESIGN_NAME)/$(DESIGN_NAME).sv
export SDC_FILE      = ./designs/$(PLATFORM)/pmu/$(DESIGN_NAME)/constraint.sdc
export ABC_AREA      = 1

export DIE_AREA    = 0 0 100 100
export CORE_AREA   = 1 1 99 99

export PLACE_DENSITY = uniform
export REPAIR_PDN_VIA_LAYER = v1

export ABC_CLOCK_PERIOD_IN_PS = 1000