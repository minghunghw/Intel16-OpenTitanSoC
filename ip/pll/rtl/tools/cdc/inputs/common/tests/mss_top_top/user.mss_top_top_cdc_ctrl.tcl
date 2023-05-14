#-----------------------------------------------------------------------
# Description: Unit CDC control script.
#-----------------------------------------------------------------------

#----------------------Define Clocks------------------------------------
#Example1: netlist clock cpu_clk_in -group CPU_CLK_GR0

#found domain MSS_TOPCLK in scope mss_top
netlist clock clk -group MSS_TOP_MSS_TOPCLK_GROUP -module mss_top_top







#----------------------Define Resets------------------------------------
#Directive "netlist reset" will add signals to the list of
#resets or remove the specified signals from the list of resets.

#Example1: netlist reset rst_* -negedge -module pci 
#Example2: netlist reset -remove rst_a  -module crc_16_calc








#----------------------Define constants-------------------------------
#Example1: netlist constant scan_mode         1'b0
#Example2: netlist constant U0.scan_mode[1:4] 1'b1







#----------------------Define stable signals---------------------------
#CDC analysis considers a stable signal as properly synchronized.
#The -stable option has no effect if signal is not an Rx or Tx of a CDC
#crossing, or if signal cannot be propagated to an Rx of a CDC crossing,
#or if signal drives an input of combinational logic whose output is not
#stable

#Example2: cdc signal tx_status -stable 







#----------------------Define black box-------------------------------
#User-defined black box:
#If the clock domain for a port is specified (using a netlist port domain
#directive), the port is included in CDC analysis. Otherwise, fanin/fanout
#logic of the port is ignored. No CDC crossing is reported for the port,
#but a warning is issued (netlist-44). Ports asynchronous with the defined clocks should
#be identified as such using the -async argument.

#Example1: netlist blackbox module_name







#----------------------Define Port Domain-------------------------------
#Identify the clock domain for the top level or black box ports

#Example: netlist port domain port_name1 -clock cclk

netlist port domain data -clock MSS_TOP_CLK_GROUP -module mss_top_top





#---------------------Source TCL Scripts-------------------------------
#If your unit has other CDC tcl scripts.
#do "file_name.tcl"

set test_location [exec ToolConfig.pl get_tool_var run_cdc CDC_TEST_LOCATION]
if { "$test_location" == "" } { set test_location "tools/cdc/inputs" }


