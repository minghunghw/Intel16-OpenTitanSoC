
export IP = /afs/eecs.umich.edu/vlsida/projects/restricted/intel/hengyu

VCFILE	= top.vc

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
	$(VCS) -f $(VCFILE) -o simv_top


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
