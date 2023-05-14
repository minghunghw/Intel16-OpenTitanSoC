##################################################
# Section A: Basic Configuration
##################################################
source [exec ToolConfig.pl get_tool_path intelcdc]/prototype/recon_setup

do [exec ToolConfig.pl get_tool_path intelcdc]/prototype/cdc_global.tcl

##################################################
# End of Section A: Basic Configuration
##################################################

##################################################
# Section B: Clocks
#  Basic Format: netlist clock <clk_name> -group <clkGroup>
##################################################

##################################################
# End of Section B: Clocks
##################################################

##################################################
# Section C: Resets
#  Basic Format: netlist reset <name> [-remove] [-async] [-negedge] -module <module>
##################################################

##################################################
# End of Section C: Resets
##################################################

##################################################
# Section D: Static and Stable signals
#  Basic Format: cdc signal <name> -stable -module <module>
#                netlist constant <name> 1'b[10] -module <module>
##################################################

##################################################
# End of Section D: Static and Stable signals
##################################################

##################################################
# Section E: Waivers
#  Basic Format: cdc report crossing -scheme <scheme> [-from <name>] [-through <name>] [-to <name>] \
#    -module <module> -severity waived -rx_clock <GROUP> -comment "<why waiver is ok, with approver name>"
##################################################
do [exec ToolConfig.pl get_tool_path intelcdc]/prototype/[exec ToolConfig.pl get_facet process]/cdc_global_waivers.tcl

##################################################
# End of Section E: Waivers
##################################################

##################################################
# Global Directives
##################################################
