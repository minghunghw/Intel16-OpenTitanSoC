export DESIGN_NAME = toy_design
export PLATFORM    = intel16

export CACHED_NETLIST 	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/$(DESIGN_NAME).sv
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

export ADDITIONAL_LIBS  +=  ../ip/memory/rf_512x32_be/lib/rf_512x32_be_tttt_0.85v_25c.lib \
							../ip/memory/rf_1024x36_be/lib/rf_1024x36_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_512x28_be/lib/sram_512x28_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_512x78_be/lib/sram_512x78_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_512x80_be/lib/sram_512x80_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_1024x22_be/lib/sram_1024x22_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_1024x39_be/lib/sram_1024x39_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_4096x76_be/lib/sram_4096x76_be_tttt_0.85v_25c.lib \
							../ip/memory/sram_8192x39_be/lib/sram_8192x39_be_tttt_0.85v_25c.lib \
							$(PLATFORM_DIR)/gpio/hl_4slice_west_io/lib/hl_4slice_west_io.min.etm.lib.lib \
							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/lib/hl_8slice_south_io.min.etm.lib.lib \
							$(PLATFORM_DIR)/gpio/hl_corner_io/lib/hl_corner_io.min.etm.lib.lib \
							$(PLATFORM_DIR)/gpio/gpio_1v2/lib/gpio_1v2_n1_tttt_0p850_1p200_min.TT_25.tttt.lib

export ADDITIONAL_LEFS 	+= 	../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/lef/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.lef \
							../ip/memory/rf_512x32_be/lef/rf_512x32_be.lef \
							../ip/memory/rf_1024x36_be/lef/rf_1024x36_be.lef \
							../ip/memory/sram_512x28_be/lef/sram_512x28_be.lef \
							../ip/memory/sram_512x78_be/lef/sram_512x78_be.lef \
							../ip/memory/sram_512x80_be/lef/sram_512x80_be.lef \
							../ip/memory/sram_1024x22_be/lef/sram_1024x22_be.lef \
							../ip/memory/sram_1024x39_be/lef/sram_1024x39_be.lef \
							../ip/memory/sram_4096x76_be/lef/sram_4096x76_be.lef \
							../ip/memory/sram_8192x39_be/lef/sram_8192x39_be.lef \
							$(PLATFORM_DIR)/gpio/hl_4slice_west_io/lef/hl_4slice_west_io.fill.lef \
							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/lef/hl_8slice_south_io.fill.lef \
							$(PLATFORM_DIR)/gpio/hl_corner_io/lef/hl_corner_io.fill.lef \
							$(PLATFORM_DIR)/gpio/gpio_1v2/lef/gpio_1v2_n1.lef

export ADDITIONAL_GDS	+=  ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/gds/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.gds \
							../ip/memory/rf_512x32_be/gds/rf_512x32_be.gds \
							../ip/memory/rf_1024x36_be/gds/rf_1024x36_be.gds \
							../ip/memory/sram_512x28_be/gds/sram_512x28_be.gds \
							../ip/memory/sram_512x78_be/gds/sram_512x78_be.gds \
							../ip/memory/sram_512x80_be/gds/sram_512x80_be.gds \
							../ip/memory/sram_1024x22_be/gds/sram_1024x22_be.gds \
							../ip/memory/sram_1024x39_be/gds/sram_1024x39_be.gds \
							../ip/memory/sram_4096x76_be/gds/sram_4096x76_be.gds \
							../ip/memory/sram_8192x39_be/gds/sram_8192x39_be.gds \
							$(GDS_DIR)/hl_4slice_west_io.gds \
							$(GDS_DIR)/hl_8slice_south_io.gds \
							$(GDS_DIR)/hl_corner_io.gds \
							$(PLATFORM_DIR)/gpio/gpio_1v2/gds/gpio_1v2_n1.gds

export ADDITIONAL_CDL	+=  ../ip/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/spice/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.sp \
							../ip/memory/rf_512x32_be/spice/rf_512x32_be.sp \
							../ip/memory/rf_1024x36_be/spice/rf_1024x36_be.sp \
							../ip/memory/sram_512x28_be/spice/sram_512x28_be.sp \
							../ip/memory/sram_512x78_be/spice/sram_512x78_be.sp \
							../ip/memory/sram_512x80_be/spice/sram_512x80_be.sp \
							../ip/memory/sram_1024x22_be/spice/sram_1024x22_be.sp \
							../ip/memory/sram_1024x39_be/spice/sram_1024x39_be.sp \
							../ip/memory/sram_4096x76_be/spice/sram_4096x76_be.sp \
							../ip/memory/sram_8192x39_be/spice/sram_8192x39_be.sp \
							$(PLATFORM_DIR)/gpio/hl_4slice_west_io/spice_netlist/hl_4slice_west_io.sp \
							$(PLATFORM_DIR)/gpio/hl_8slice_south_io/spice_netlist/hl_8slice_south_io.sp \
							$(PLATFORM_DIR)/gpio/hl_corner_io/spice_netlist/hl_corner_io.sp \
							$(PLATFORM_DIR)/gpio/gpio_1v2/spice/gpio_1v2_n1.sp

export DIE_AREA    = 0 0 250 250
export CORE_AREA   = 1.26 1.89 248 248

export MACRO_PLACE_CHANNEL = 80 80 
export MACRO_PLACE_HALO    = 40 40

export PLACE_DENSITY = uniform

# export IS_CHIP = 1

# export GLOBAL_ROUTE_ARGS = -allow_congestion

# export MAX_ROUTING_LAYER = gmb

# export CORNERS = BC WC TC