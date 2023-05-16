export DESIGN_NAME 		= chip_earlgrey
export PLATFORM    		= intel16

export CACHED_NETLIST 	= ../syn/$(DESIGN_NAME)/netlist/$(DESIGN_NAME).sv
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

# export ADDITIONAL_LIBS  +=  ../ip/memory/rf_512x32_be/lib/rf_512x32_be_tttt_0.85v_25c.lib \
# 							../ip/memory/rf_1024x36_be/lib/rf_1024x36_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_512x28_be/lib/sram_512x28_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_512x78_be/lib/sram_512x78_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_512x80_be/lib/sram_512x80_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_1024x22_be/lib/sram_1024x22_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_1024x39_be/lib/sram_1024x39_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_4096x76_be/lib/sram_4096x76_be_tttt_0.85v_25c.lib \
# 							../ip/memory/sram_8192x39_be/lib/sram_8192x39_be_tttt_0.85v_25c.lib \
# 							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/lib/hl_8slice_south_io.min.etm.lib.lib \
# 							$(PLATFORM_DIR)/gpio/gpio_1v2/lib/gpio_1v2_n1_tttt_0p850_1p200_min.TT_25.tttt.lib


export ADDITIONAL_LEFS 	+= 	../ip/memory/rf_512x32_be/lef/rf_512x32_be.lef \
							../ip/memory/rf_1024x36_be/lef/rf_1024x36_be.lef \
							../ip/memory/sram_512x28_be/lef/sram_512x28_be.lef \
							../ip/memory/sram_512x78_be/lef/sram_512x78_be.lef \
							../ip/memory/sram_512x80_be/lef/sram_512x80_be.lef \
							../ip/memory/sram_1024x22_be/lef/sram_1024x22_be.lef \
							../ip/memory/sram_1024x39_be/lef/sram_1024x39_be.lef \
							../ip/memory/sram_4096x76_be/lef/sram_4096x76_be.lef \
							../ip/memory/sram_8192x39_be/lef/sram_8192x39_be.lef \
							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/lef/hl_8slice_south_io.fill.lef \
							$(PLATFORM_DIR)/gpio/gpio_1v2/lef/gpio_1v2_n1.lef

export ADDITIONAL_GDS	+=  ../ip/memory/rf_512x32_be/gds/rf_512x32_be.gds \
							../ip/memory/rf_1024x36_be/gds/rf_1024x36_be.gds \
							../ip/memory/sram_512x28_be/gds/sram_512x28_be.gds \
							../ip/memory/sram_512x78_be/gds/sram_512x78_be.gds \
							../ip/memory/sram_512x80_be/gds/sram_512x80_be.gds \
							../ip/memory/sram_1024x22_be/gds/sram_1024x22_be.gds \
							../ip/memory/sram_1024x39_be/gds/sram_1024x39_be.gds \
							../ip/memory/sram_4096x76_be/gds/sram_4096x76_be.gds \
							../ip/memory/sram_8192x39_be/gds/sram_8192x39_be.gds \
							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/gds/hl_8slice_south_io.gds.gz \
							$(PLATFORM_DIR)/gpio/gpio_1v2/gds/gpio_1v2_n1.gds

export ADDITIONAL_CDL	+=  ../ip/memory/rf_512x32_be/spice/rf_512x32_be.sp \
							../ip/memory/rf_1024x36_be/spice/rf_1024x36_be.sp \
							../ip/memory/sram_512x28_be/spice/sram_512x28_be.sp \
							../ip/memory/sram_512x78_be/spice/sram_512x78_be.sp \
							../ip/memory/sram_512x80_be/spice/sram_512x80_be.sp \
							../ip/memory/sram_1024x22_be/spice/sram_1024x22_be.sp \
							../ip/memory/sram_1024x39_be/spice/sram_1024x39_be.sp \
							../ip/memory/sram_4096x76_be/spice/sram_4096x76_be.sp \
							../ip/memory/sram_8192x39_be/spice/sram_8192x39_be.sp \
							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/spice_netlist/hl_8slice_south_io.sp \
							$(PLATFORM_DIR)/gpio/gpio_1v2/spice/gpio_1v2_n1.sp

export CORE_UTILIZATION    = 20
export CORE_ASPECT_RATIO   = 1
export CORE_MARGIN         = 1

export MACRO_PLACE_CHANNEL = 40 40 
export MACRO_PLACE_HALO    = 20 20

export PLACE_DENSITY = uniform
export ABC_CLOCK_PERIOD_IN_PS = 1000

export CORNERS = BC WC TC