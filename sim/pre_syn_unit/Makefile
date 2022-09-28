export TB           = ../../hw/tb
export IP           = ../../ip
export HW           = ../../hw/sv
export OPENTITAN    = $(IP)/opentitan/hw/ip

TEST 	= 
VCFILE	= vc/$(TEST).vc


VCS = SW_VCS=2017.12-SP2-1 vcs -sverilog -debug_pp\
	+vc +v2k -Mupdate -line -full64 -assert svaext \
	-override_timescale=1ns/1ps +nospecify +notimingcheck\
	+define+INTC_NO_PWR_PINS +define+INTCNOPWR

all:    simv
	./simv | tee vcs.log

sim:	simv
	./simv | tee vcs.log

simv:
	$(VCS) -f $(VCFILE) -o simv

dve:	sim
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
	@rm -rf urgReport
	@rm -rf .restartSimSession.tcl.old .synopsys_dve_rebuild.tcl

nuke:   clean
	@rm -rf logs