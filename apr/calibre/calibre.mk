
submit: finish
	rm -rf ./submit && mkdir -p ./submit
	calibredrv -64 $(CALIBRE_MERGE) convert $(RESULTS_DIR)/6_final.gds submit/$(TOP_LEVEL) oas
	calibredrv -64 $(CALIBRE_MERGE) fill_merge $(PLATFORM_DIR)/die_frame/$(DIE_FRAME) submit/$(DIE_FRAME) oas $(RESULTS_DIR)/6_final.gds
	tar -zvcf $(SUBMISSION) submit

calibre: calibre_drc calibre_antenna calibre_density calibre_hveos calibre_lvs

calibre_drc: finish
	rm -rf calibre/drc && mkdir -p calibre/drc && cd calibre/drc && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -drc -hier -turbo -hyper $(Calibre_RUNSET)/p1222_drcc.svrf | tee drcc.log

calibre_antenna: finish
	rm -rf calibre/antenna && mkdir -p calibre/antenna && cd calibre/antenna && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -drc -hier -turbo -hyper $(Calibre_RUNSET)/p1222_IPall.svrf | tee drcIPall.log

calibre_density: finish
	rm -rf calibre/density && mkdir -p calibre/density && cd calibre/density && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -drc -hier -turbo -hyper $(Calibre_RUNSET)/p1222_denall.svrf | tee denall.log

calibre_hveos: finish
	rm -rf calibre/hveos && mkdir -p calibre/hveos && cd calibre/hveos && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -perc -ldl -hier -turbo -hyper $(Calibre_RUNSET)/p1222_drcperc.svrf | tee drcperc.log

calibre_lvs: finish
	rm -rf calibre/lvs && mkdir -p calibre/lvs && cd calibre/lvs && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	\
	icv_nettran -verilog $(DR_INPUT_NETLIST) -sp $(INTEL_STDCELLS)/*/spice/*.sp \
	-cell $(DR_DESIGN_NAME) -outType SPICE -outName $(DR_DESIGN_NAME).sp \
	-noflatten -mprop -sp-slashSpace -logFile ./icv_nettran.log && \
	\
	calibre -lvs -hier -turbo -hyper $(Calibre_RUNSET)/p1222_lvs.svrf | tee lvs.log
