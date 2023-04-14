RM              := rm
RM_FLAGS        := -rfv
DC              := dc_shell-t

# Targets
all: netlist


.PHONY: help
help:
	@echo 'Usage: make [target] ...                                              '
	@echo '                                                                      '
	@echo '  help        Show this help.                                         '
	@echo '  netlist     Synthesize the design and get the netlist file.         '
	@echo '  clean       Remove all the temporary files.                         '
	@echo '  nuke        Remove report, SDC, log, netlist files for synthesis.   '


.PHONY: netlist
netlist:
	mkdir -p run && cd run && \
	$(DC) -f ../synth.tcl | tee ../synth.log


.PHONY: clean
clean:
	@$(RM) $(RM_FLAGS) run *.log


.PHONY: nuke
nuke: clean
	@$(RM) $(RM_FLAGS) ddc netlist rpt sdf
