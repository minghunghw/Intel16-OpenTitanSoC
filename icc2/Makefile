# Workspace and environment seup
# --------------------------------
export INTEL_KITS_DIR 	:= /afs/eecs.umich.edu/kits/Intel/P1222.4/2022.08
export INTEL_PROJ_DIR	:= /afs/eecs.umich.edu/vlsida/projects/restricted/intel
export INTEL_ASIC		:= $(INTEL_KITS_DIR)/adf224_r0.9HP1_s
export LAYERSTACK 		:= m11_1x_3xa_1xb_1xc_2yb_2ga_mim2_1gb__bumpp
export INTEL_PDK  		:= $(INTEL_KITS_DIR)/pdk224_r0.9HP3
export INTEL_STDCELLS	:= $(INTEL_KITS_DIR)/lib224_b0m_6t_108pp_pdk090_r1v0p0_fv
export INTEL_TIC 		:= $(INTEL_KITS_DIR)/pdk224_r0.9HP3
export APR_TCL_DIR 		:= $(INTEL_ASIC)/asicflows/synopsys/apr
export STD_TCL_DIR 		:= $(INTEL_ASIC)/asicflows/synopsys/tech.dot4.6t108.tp0
export ICC2_NDM			:= $(INTEL_PROJ_DIR)/ndm/6t_108pp

# Design parameters
# --------------------------------
export DESIGN_NAME 		:= gpio

# Place & Route reltaed targets
# --------------------------------
all: apr

apr:
	cd $(DESIGN_NAME) && \
	icc2_shell -64 -x \
	"source $(STD_TCL_DIR)/tech_config.tcl; \
	source $(APR_TCL_DIR)/run.tcl;"

clean:
	rm -rf $(DESIGN_NAME)/ddc 
	rm -rf $(DESIGN_NAME)/logs   
	rm -rf $(DESIGN_NAME)/mwdb 
	rm -rf $(DESIGN_NAME)/ndm
	rm -rf $(DESIGN_NAME)/fe_extraction
	rm -rf $(DESIGN_NAME)/ICV_metalfill
	rm -rf $(DESIGN_NAME)/CLIBs
	rm -rf $(DESIGN_NAME)/outputs 
	rm -rf $(DESIGN_NAME)/reports 
	rm -rf $(DESIGN_NAME)/synopsys_cache 
	rm -rf $(DESIGN_NAME)/alib-52 
	rm -rf $(DESIGN_NAME)/WORK
	rm -rf $(DESIGN_NAME)/*.svf 
	rm -rf $(DESIGN_NAME)/.*tcl
	rm -rf $(DESIGN_NAME)/*.log
	rm -rf $(DESIGN_NAME)/*.txt
	rm -rf $(DESIGN_NAME)/*.ems
	rm -rf $(DESIGN_NAME)/udul_default_fin*

nuke: clean