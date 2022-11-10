
icv: icv_drc icv_antenna icv_density icv_layer icv_iopad icv_template icv_lvs

icv_drc: finish
	rm -rf icv/drc && mkdir -p icv/drc && cd icv/drc && \
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-I $(INTEL_PDK)/libraries/icv/libcells -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/drcd.rs

icv_antenna: finish
	rm -rf icv/antenna && mkdir -p icv/antenna && cd icv/antenna && \
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-I $(INTEL_PDK)/libraries/icv/libcells -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/drc_IPall.rs

icv_density: finish
	rm -rf icv/density && mkdir -p icv/density && cd icv/density && \
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-I $(INTEL_PDK)/libraries/icv/libcells -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/denall.rs

icv_layer: finish
	rm -rf icv/layer && mkdir -p icv/layer && cd icv/layer && \
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-I $(INTEL_PDK)/libraries/icv/libcells -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/drc_IL.rs

icv_iopad: finish
	rm -rf icv/iopad && mkdir -p icv/iopad && cd icv/iopad && \
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-I $(INTEL_PDK)/libraries/icv/libcells -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/drc_LU.rs

icv_template: finish
	rm -rf icv/template && mkdir -p icv/template && cd icv/template && \
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-I $(INTEL_PDK)/libraries/icv/libcells -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/drc_TUC.rs

icv_lvs: finish
	rm -rf icv/lvs && mkdir -p icv/lvs && cd icv/lvs && \
	icv_nettran -verilog $(DR_INPUT_NETLIST) -sp $(INTEL_STDCELLS)/*/spice/*.sp \
	-cell $(DR_DESIGN_NAME) -outName $(DR_DESIGN_NAME).icv \
	-noflatten -mprop -sp-slashSpace -logFile ./icv_nettran.log && \
	\
	icv -host_init 16 -D _drPROCESS=_drdotFour \
	-D _drSECTION_LEVEL=_drYES -D _drLAYERSTACK=$(LAYERSTACK) \
	-c $(DR_DESIGN_NAME) -i $(DR_INPUT_FILE) -f $(DR_INPUT_FILE_FORMAT) -vue \
	-norscache -sf icv -s $(DR_DESIGN_NAME).icv \
	-I $(INTEL_PDK)/libraries/icv/libcells -I . -I $(INTEL_RUNSETS) \
	-I $(INTEL_RUNSETS)/PXL $(INTEL_RUNSETS)/PXL/StandAlone/trclvs.rs

view_icv_drc:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc icv/drc/$(DR_RVE_FILE)

view_icv_antenna:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc icv/antenna/$(DR_RVE_FILE)

view_icv_density:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc icv/density/$(DR_RVE_FILE)

view_icv_layer:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc icv/layer/$(DR_RVE_FILE)

view_icv_iopad:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc icv/iopad/$(DR_RVE_FILE)

view_icv_template:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc icv/template/$(DR_RVE_FILE)

view_icv_lvs:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -lvs icv/lvs/svdb