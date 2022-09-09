SRC_TB 		= ../../hw/tb
SRC_IP		= ../../ip

TB 			= 
TESTBENCH   = $(SRC_TB)/tb_utils_$(TB).sv
VCFILE		= vc/$(TB).vc
HEADERS		= 	../../ip/pkg/prim_assert_standard_macros.svh \
				../../ip/pkg/prim_assert.sv \
				../../ip/pkg/prim_mubi_pkg.sv \
				../../ip/pkg/top_pkg.sv \
				../../ip/tlul/rtl/tlul_pkg.sv \
				../../ip/xbar/rtl/tl_main_pkg.sv \

SIMFILES	= 	../../ip/xbar/rtl/xbar_main.sv	\
				../../ip/xbar/rtl/xbar_periph.sv \
				../../ip/tlul/rtl/tlul_fifo_sync.sv \
				../../ip/tlul/rtl/tlul_socket_1n.sv \
				../../ip/tlul/rtl/tlul_socket_m1.sv \
				
# SIMFILES    = $(shell cat $(VCFILE))

VCS = SW_VCS=2017.12-SP2-1 vcs -sverilog -debug_pp\
	+vc +v2k -Mupdate -line -full64  -timescale=1ps/1fs\
	+notimingcheck +memcbk +vcs+dumparrays +sdfverbose\
	+define+DUMP_VCD=1 +define+ARM_UD_MODEL 

all:    simv
	./simv | tee program.out

sim:	simv
	./simv | tee program.out

simv: $(HEADERS) $(SIMFILES) $(TESTBENCH)
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