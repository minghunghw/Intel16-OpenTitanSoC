
calibre: calibre_drc calibre_antenna calibre_density calibre_hveos calibre_lvs

clean_calibre: 
	rm -rf calibre/drc && rm -rf calibre/antenna && \
	rm -rf calibre/density && rm -rf calibre/hveos && rm -rf calibre/lvs

calibre_drc:
	rm -rf calibre/drc && mkdir -p calibre/drc && cd calibre/drc && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -drc -hier -turbo -hyper $(Calibre_RUNSET)/p1222_drcc.svrf | tee drcc.log

calibre_antenna:
	rm -rf calibre/antenna && mkdir -p calibre/antenna && cd calibre/antenna && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -drc -hier -turbo -hyper $(Calibre_RUNSET)/p1222_IPall.svrf | tee drcIPall.log

calibre_density:
	rm -rf calibre/density && mkdir -p calibre/density && cd calibre/density && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -drc -hier -turbo -hyper $(Calibre_RUNSET)/p1222_denall.svrf | tee denall.log

calibre_hveos:
	rm -rf calibre/hveos && mkdir -p calibre/hveos && cd calibre/hveos && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -perc -ldl -hier -turbo -hyper $(Calibre_RUNSET)/p1222_drcperc.svrf | tee drcperc.log

calibre_lvs:
	rm -rf calibre/lvs && mkdir -p calibre/lvs && cd calibre/lvs && \
	sh $(Calibre_RUNSET)/p1222.sh && \
	calibre -lvs -hier -turbo -hyper $(Calibre_RUNSET)/p1222_lvs.svrf | tee lvs.log

view_calibre_drc:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc calibre/drc/$(DR_RVE_FILE)

view_calibre_antenna:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc calibre/antenna/$(DR_RVE_FILE)

view_calibre_density:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc calibre/density/$(DR_RVE_FILE)

view_calibre_hveos:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -drc calibre/hveos/$(DR_RVE_FILE)

view_calibre_lvs:
	calibredrv -m $(DR_INPUT_FILE) -l $(LAYER_PROPERTY) -rve -lvs calibre/lvs/svdb