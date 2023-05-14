############## RUN_VIVADO_HAPS.TCL ##############
### Purpose: Default TCL script for Integrated 
### Vivado Place and Route run.
### Target Vivado Release: Vivado 2014.2/Vivado 2014.3 
### History: 
###�Added Switch for Strategy mode to replace If
### Added PrepareReadback to write logic location file
### Added Property to Promte/Demote Warning/Error message
### Improved Incremental Flow commands for readability 
### End History
################################################# 
#################################################
###     SET DESIGN VARIABLES      ###
#################################################
set DesignName  	"cpu"
set FamilyName  	"VIRTEX7"
set DeviceName  	"XC7V2000T"
set PackageName 	"FLG1925"
set SpeedGrade  	"-1"
set TopModule   	"cpu"
set PartName    	"XC7V2000TFLG1925-1"
set InputMode   	"EDIF"
set Flow   			"Standard" ;# Flow can be set to "Incremental" or "Standard"
set StrategyMode	"default";
#StrategyMode can be set to "timing_qor","fast_turn_around" or "default" 
#Only one StrategyMode can be specified at a time
set PrepareReadback "0"; set_property SEVERITY {Warning} [get_drc_checks NSTD-1]; set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

#################################################
###     SETUP STRATEGY AND FLAGS    ###
#################################################
puts "StrategyMode is ${StrategyMode}"
switch -- $StrategyMode {
    "timing_qor" {
        set opt_design_flags    "-directive Explore"
        set place_design_flags  "-directive Explore"
        set route_design_flags  "-directive Explore"
    }
    "fast_turn_around" {
        set opt_design_flags    "-directive RuntimeOptimized"
        set place_design_flags  "-directive RuntimeOptimized"
        set route_design_flags  "-directive RuntimeOptimized"
    }
    default {
        set opt_design_flags    ""
        set place_design_flags  ""
        set route_design_flags  ""
    }
}

#################################################
###     SETUP DESIGN     ###
#################################################
set_property target_part ${PartName} [current_fileset -constrset]
set_property design_mode GateLvl [current_fileset]

### Turn off a restriction on the number of clock objects allowed in a list for create_*clock commands
catch {set_param sta.maxSourcesPerClock -1}

### Suppresses warning about multiple objects in a clock list
catch {set_msg_config -id {Constraints 18-633} -suppress}

### Demotes error to warning about GTGREFCLK_ACTIVE inserted for multiview instrumentation
catch {set_property SEVERITY {warning} [get_drc_checks REQP-46]}
catch {set_property SEVERITY {warning} [get_drc_checks REQP-56]}


### Promotes critical warning on unroutability to an error
catch {set_msg_config -id {Route 35-162} -new_severity ERROR}

if {${InputMode} == "EDIF"} {
     set_property edif_top_file ${DesignName}.edf [current_fileset]
     if {[file exists ${DesignName}.edf]} { read_edif ${DesignName}.edf }    
     if {[file exists ${DesignName}_edif.xdc]} { read_xdc ${DesignName}_edif.xdc }
     if {[file exists "dtd_ddr3_ht3_constr.tcl"]} {source dtd_ddr3_ht3_constr.tcl}
     set TopModule [find_top]
} 

if {${InputMode} == "VM"} {
     if {[file exists ${DesignName}.vm]} { read_verilog ${DesignName}.vm }    
     if {[file exists ${DesignName}.xdc]} { read_xdc ${DesignName}.xdc }    
     set TopModule [find_top]
     set_property top ${TopModule} [current_fileset] 
}

#################################################
###    RUN DESIGN     ###
#################################################
#run link_design
link_design
if {[file exists "clock_groups.tcl"]} {source clock_groups.tcl}
#Evaluate options and run opt_design
eval opt_design $opt_design_flags

###     FOR INCREMENTAL FLOW     ###
puts "Flow is ${Flow}"
if {${Flow} == "Incremental"} {
	#Use DCP from previous P&R run for Incremental Flow
	if {[file exists "${DesignName}.dcp"]} {
	puts "Using ${DesignName}.dcp for Incremental Place and Route" 
	read_checkpoint -incremental ${DesignName}.dcp
	report_incremental_reuse
	} else {
	puts "${DesignName}.dcp does not exist. Running Place and Route" 
	}
}
#Evaluate options and run place_design
eval place_design $place_design_flags
write_checkpoint -force post_place.dcp
	
#Evaluate options and run route_design
eval route_design $route_design_flags
#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
write_checkpoint -force ${DesignName}.dcp
#################################################
###     GENERATE REPORTS     ###
#################################################
report_utilization -file area.txt
report_utilization -slr -file slr.txt
report_timing_summary -nworst 3 -max_paths 3 -file ${DesignName}_timing_summary.txt
report_clock_utilization -verbose -file clock_utilization.txt
report_io -file pinloc.txt
report_drc -file post_route_drc.txt
report_clock_interaction -file ${DesignName}_clock_interaction.rpt
write_xdc -no_fixed_only -constraints valid -force ${DesignName}_post_par.xdc

#################################################
###     SAVE VIVADO PROJECT     ###
#################################################
save_project_as -force ${DesignName}
save_constraints -force

#################################################
###     GENERATE BITSTREAM     ###
#################################################
#set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN {Enable} [current_design]
set_property BITSTREAM.GENERAL.COMPRESS {True} [current_design]
if {${PrepareReadback} == "1"} {
	set_property BITSTREAM.CONFIG.PERSIST {Yes} [current_design]
	set_property CONFIG_MODE {S_SELECTMAP} [current_design]
	write_bitstream -logic_location_file -force ${DesignName}.bit
} else {
	#run write_bitstream
	write_bitstream -force ${DesignName}.bit
}
