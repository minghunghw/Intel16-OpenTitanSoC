export IP = /afs/eecs.umich.edu/vlsida/projects/restricted/intel/hengyu

VCFILE_MAP	= map_top.vc

VCS = vcs -sverilog \
	+vc +v2k -Mupdate -line -full64 -assert svaext -debug_access+r \
	-override_timescale=1ns/1ps +nospecify +notimingcheck \
	+define+INTC_NO_PWR_PINS +define+INTCNOPWR +define+ip2211ringpll_INTC_NO_PWR_PINS \
	+define+EMULATION +define+EMULATION_SIM 

all:    simv_map
	./simv_map | tee vcs.log

simv_map:
	$(VCS) -f $(VCFILE_MAP) -o simv_map

dve_map:	simv_map
	./simv_map -gui &

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
