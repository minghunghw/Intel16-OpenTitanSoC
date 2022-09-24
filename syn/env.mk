# Workspace and environment seup
# --------------------------------
export INTEL_KITS_DIR 	:= /afs/eecs.umich.edu/kits/Intel/P1222.4/2022.08/
export INTEL_ASIC		:= $(INTEL_KITS_DIR)/adf224_r0.9HP1_s
export LAYERSTACK 		:= m11_1x_3xa_1xb_1xc_2yb_2ga_mim2_1gb__bumpp
export INTEL_PDK  		:= $(INTEL_KITS_DIR)/pdk224_r0.9HP3
export INTEL_STDCELLS	:= $(INTEL_KITS_DIR)/lib224_b15_7t_108pp_pdk090_r1v0p0_fv
export INTEL_TIC 		:= $(INTEL_KITS_DIR)/pdk224_r0.9HP3
export SYN_TCL_DIR 		:= $(INTEL_ASIC)/asicflows/synopsys/syn
export 7T_108_TCL_DIR 	:= $(INTEL_ASIC)/asicflows/synopsys/tech.dot4.7t108.tp0

# Design parameters
# --------------------------------


# Synthesis-reltaed targets
# --------------------------------
all: dc 

dc:
	dc_shell -64 -topo -x	\
	"source $(7T_108_TCL_DIR)/tech_config.tcl; \
	source $(SYN_TCL_DIR)/run.tcl; \
	runADF"

clean:
	rm -rf ddc logs mwdb outputs reports synopsys_cache alib-52 WORK
	rm -rf .nfs* *.svf *.tcl
