
export IP = /afs/eecs.umich.edu/vlsida/projects/restricted/intel/hengyu

VCFILE_TOP	= top.vc
VCFILE_SPI	= spi.vc
VCFILE_PLL	= pll.vc

VCS = vcs -sverilog \
	+vc +v2k -Mupdate -line -full64 -assert svaext -debug_access+r \
	-override_timescale=1ns/1ps +nospecify +notimingcheck \
	+define+INTC_NO_PWR_PINS +define+INTCNOPWR +define+ip2211ringpll_INTC_NO_PWR_PINS +define+EMULATION +define+EMULATION_SIM 
	 

all:    simv_top
	./simv_top | tee vcs.log

sim:	simv_top
	./simv_top | tee vcs.log

simv_spi:
	$(VCS) -f $(VCFILE_SPI) -o simv_spi

simv_top:
	$(VCS) -f $(VCFILE_TOP) -o simv_top

simv_pll:
	$(VCS) -f $(VCFILE_PLL) -o simv_pll

dve_spi:	simv_spi
	./simv_spi -gui &
	
dve_top:	simv_top
	./simv_top -gui &

dve_pll:	simv_pll
	./simv_pll -gui &

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
