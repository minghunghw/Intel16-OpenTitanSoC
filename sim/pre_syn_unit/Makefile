SRC_TB 		= ../../hw/tb
SRC_IP		= ../../ip

TB 			= 
TESTBENCH   = $(SRC_TB)/tb_utils_$(TB).sv
VCFILE		= vc/$(TB).vc
SIMFILES    = $(shell cat $(VCFILE))

VCS = SW_VCS=2017.12-SP2-1 vcs -sverilog -debug_pp\
	+vc +v2k -Mupdate -line -full64  -timescale=1ps/1fs\
	+notimingcheck +memcbk +vcs+dumparrays +sdfverbose\
	+define+DUMP_VCD=1 +define+ARM_UD_MODEL 

all:    simv
	./simv | tee program.out

sim:	simv
	./simv | tee program.out

simv:  $(SIMFILES) $(TESTBENCH)
	$(VCS) $^ -o simv

dve:	sim
	./simv -gui &

clean:
	@rm -rf *simv *simv.daidir csrc vcs.key *.key
	@rm -rf vis_simv vis_simv.daidir
	@rm -rf dve* inter.vpd DVEfiles
	@rm -rf csrc vcdplus.vpd vc_hdrs.h
	@rm -f *.out *.elf *.dump *.mem *.log
	@rm -f debug_bin
	@rm -f .__*
	@rm -f default.svf
	@rm -rf simv.vdb
	@rm -rf urgReport
	@rm -rf .restartSimSession.tcl.old .synopsys_dve_rebuild.tcl

nuke:   clean