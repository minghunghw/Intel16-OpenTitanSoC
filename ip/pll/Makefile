export TB_SPI           = ../../hw/tb
export IP           = ../../ip
export HW           = ../../hw/sv
export MEM		  	= $(IP)/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/rtl
export OPENTITAN    = $(IP)/opentitan/hw/ip
export IBEX 	   	= $(IP)/opentitan/hw/vendor/lowrisc_ibex
export TOP_EARLGREY = $(IP)/opentitan/hw/top_earlgrey
export IP_AUTOGEN   = $(TOP_EARLGREY)/ip_autogen

TESTBT  = verif/tb/ringpll_tb.sv
SRC1 	= src/rtl/ringpll.sv
SRC2 	= src/rtl/emu_ringpll_clk_pll.sv
SRC3 	= src/rtl/upf_real_conversion_pkg.sv
SRC4 	= verif/tb/max_lock_time.sv
VCFILE1	= top.vc

VCS = vcs -sverilog \
	+vc +v2k -Mupdate -line -full64 -assert svaext -debug_access+r \
	-override_timescale=1ns/1ps +nospecify +notimingcheck \
	+define+INTC_NO_PWR_PINS +define+INTCNOPWR +define+ip2211ringpll_INTC_NO_PWR_PINS +define+EMULATION +define+EMULATION_SIM 
	 



all:    simv
	./simv | tee vcs.log

sim:	simv
	./simv | tee vcs.log

simv_spi: spi_master.v spi_slave.v tb_spi.v
	$(VCS) tb_spi.v spi_master.v spi_slave.v -o simv_spi

simv: spi_master.v spi_slave.v tb_pllmaptop.sv pll_mapcore.sv pll_maptop.sv pllMap_pkg.sv
	$(VCS) pllMap_pkg.sv tb_pllmaptop.sv spi_master.v spi_slave.v pll_mapcore.sv pll_maptop.sv -o simv

simv_top:
	$(VCS) -f $(VCFILE1) -o simv_top


dve_spi:	simv_spi
	./simv_spi -gui &
	
dve_top:	simv_top
	./simv_top -gui &

dve:	simv
	./simv -gui &

clean:
	@rm -rf *simv *simv.daidir csrc vcs.key *.key
	@rm -rf vis_simv vis_simv.daidir
	@rm -rf dve* inter.vpd DVEfiles
	@rm -rf csrc vcdplus.vpd vc_hdrs.h
	@rm -rf *.out *.elf *.dump *.mem *.log
	@rm -f debug_bin
	@rm -f .__*
	@rm -f default.svf
	@rm -rf simv.vdb
	@rm -rf simv_*
	@rm -rf urgReport
	@rm -rf .restartSimSession.tcl.old .synopsys_dve_rebuild.tcl

nuke:   clean
	@rm -rf logs
