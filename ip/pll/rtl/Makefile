export TB           = ../../hw/tb
export IP           = ../../ip
export HW           = ../../hw/sv
export MEM		  	= $(IP)/memory/ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h/rtl
export OPENTITAN    = $(IP)/opentitan/hw/ip
export IBEX 	   	= $(IP)/opentitan/hw/vendor/lowrisc_ibex
export TOP_EARLGREY = $(IP)/opentitan/hw/top_earlgrey
export IP_AUTOGEN   = $(TOP_EARLGREY)/ip_autogen

TEST 	=  i2c
VCFILE	= pll.vc
VCFILE1	= emu_clk.vc
TESTBT  = verif/tb/ringpll_tb.sv
SRC1 	= src/rtl/ringpll.sv
SRC2 	= src/rtl/emu_ringpll_clk_pll.sv
SRC3 	= src/rtl/upf_real_conversion_pkg.sv
SRC4 	= verif/tb/max_lock_time.sv


VCS = vcs -sverilog \
	+vc +v2k -Mupdate -line -full64 -assert svaext -debug_access+r \
	-override_timescale=1ns/1ps +nospecify +notimingcheck \
	+define+INTC_NO_PWR_PINS +define+INTCNOPWR +define+ip2211ringpll_INTC_NO_PWR_PINS +define+EMULATION +define+EMULATION_SIM 
	 



all:    simv
	./simv | tee vcs.log

sim:	simv_pll
	./simv_pll | tee vcs.log

simv:
	$(VCS) -f $(VCFILE) -o simv

simv_pll:
	$(VCS) -f $(VCFILE) -o simv_pll

simv_emu:
	$(VCS) -f $(VCFILE1) -o simv_emu

dve_pll:	simv_pll
	./simv_pll -gui &

dve_emu:	simv_emu
	./simv_emu -gui &
	

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
	@rm -rf simv_pll
	@rm -rf simv_emu
	@rm -rf simv_pll.daidir
	@rm -rf urgReport
	@rm -rf .restartSimSession.tcl.old .synopsys_dve_rebuild.tcl

nuke:   clean
	@rm -rf logs
