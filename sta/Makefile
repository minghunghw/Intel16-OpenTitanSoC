# Workspace and environment seup
# --------------------------------
export INTEL_KITS_DIR 	:= /afs/eecs.umich.edu/kits/Intel/P1222.4/2022.08
export INTEL_ASIC		:= $(INTEL_KITS_DIR)/adf224_r0.9HP1_s
export LAYERSTACK 		:= m11_1x_3xa_1xb_1xc_2yb_2ga_mim2_1gb__bumpp
export INTEL_PDK  		:= $(INTEL_KITS_DIR)/pdk224_r0.9HP3
export INTEL_STDCELLS	:= $(INTEL_KITS_DIR)/lib224_b15_7t_108pp_pdk090_r1v0p0_fv
export INTEL_TIC 		:= $(INTEL_KITS_DIR)/pdk224_r0.9HP3
export STA_TCL_DIR 		:= $(INTEL_ASIC)/asicflows/synopsys/sta
export STD_TCL_DIR 		:= $(INTEL_ASIC)/asicflows/synopsys/tech.dot4.7t108.tp0
export APR_NETLIST		:= ../../apr/netlist
export SYNOPSYS_LC_ROOT := /usr/caen/synopsys-lib-compiler-2022.03-SP3/linux64/lc/bin/lc2_shell_exec

# Design parameters
# --------------------------------
export DESIGN_NAME 		:= gcd

# Synthesis-reltaed targets
# --------------------------------
all: netlist max min power noise

netlist:
	rm -rf $(DESIGN_NAME) && mkdir $(DESIGN_NAME) && cd $(DESIGN_NAME) && \
	mkdir inputs && mkdir scripts && mkdir logs && \
	cp $(APR_NETLIST)/$(DESIGN_NAME)/* inputs && \
	more +6 $(APR_NETLIST)/$(DESIGN_NAME)/$(DESIGN_NAME).sdc > inputs/$(DESIGN_NAME).sdc

max:
	cd $(DESIGN_NAME) && export RUN_TYPE=max && \
	envsubst < ../block_setup.tcl > scripts/block_setup.tcl && \
	pt_shell -x	\
	"source $(STD_TCL_DIR)/tech_config.tcl; \
	source $(STA_TCL_DIR)/run.tcl; \
	exit" | tee logs/max.log

min:
	cd $(DESIGN_NAME) && export RUN_TYPE=min && \
	envsubst < ../block_setup.tcl > scripts/block_setup.tcl && \
	pt_shell -x	\
	"source $(STD_TCL_DIR)/tech_config.tcl; \
	source $(STA_TCL_DIR)/run.tcl; \
	exit" | tee logs/min.log

power:
	cd $(DESIGN_NAME) && export RUN_TYPE=power && \
	envsubst < ../block_setup.tcl > scripts/block_setup.tcl && \
	pt_shell -x	\
	"source $(STD_TCL_DIR)/tech_config.tcl; \
	source $(STA_TCL_DIR)/run.tcl; \
	exit" | tee logs/power.log

noise:
	cd $(DESIGN_NAME) && export RUN_TYPE=noise && \
	envsubst < ../block_setup.tcl > scripts/block_setup.tcl && \
	pt_shell -x	\
	"source $(STD_TCL_DIR)/tech_config.tcl; \
	source $(STA_TCL_DIR)/run.tcl; \
	exit" | tee logs/noise.log

clean:
	rm -rf $(DESIGN_NAME)

nuke: clean