##################################################
# Section D: Static and Stable signals
#  Basic Format: cdc signal <name> -stable -module <module>
#                netlist constant <name> 1'b[10] -module <module>
##################################################
# disable scan paths in the analysis. 
# NOTE: These constants make the scan clock muxes choose the functional clock 
netlist constant fscan_shiften 	        1'b0 
netlist constant fscan_mode		1'b0 
netlist constant fscan_latchopen	1'b0 
netlist constant fscan_latchclosed_b	1'b1
netlist constant fscan_clkungate 	1'b0 
netlist constant fscan_clkungate_syn 	1'b0 
netlist constant fscan_clkgenctrl	1'b0 
netlist constant fscan_clkgenctrlen	1'b0 
netlist constant fscan_rstbypen 	1'b0 
netlist constant fscan_byprst_b 	1'b1 
netlist constant fscan_byplatrst_b 	1'b1 
netlist constant fscan_ram_wrdis_b	1'b1
netlist constant fscan_ram_rddis_b	1'b1
netlist constant fscan_ram_odis_b	1'b1
netlist constant fscan_ram_awt_mode	1'b0
netlist constant fscan_ram_awt_ren	1'b0
netlist constant fscan_ram_awt_wen	1'b0
netlist constant fscan_ram_bypsel	1'b0
netlist constant fscan_ret_ctrl         1'b0

## add equivalent ports from collage interface
netlist constant *FSCAN_SHIFTEN       1'b0
netlist constant *FSCAN_MODE          1'b0
netlist constant *FSCAN_LATCHOPEN     1'b0
netlist constant *FSCAN_LATCHCLOSED_B 1'b1
netlist constant *FSCAN_CLKUNGATE     1'b0
netlist constant *FSCAN_CLKUNGATE_SYN 1'b0
netlist constant *FSCAN_CLKGENCTRL    1'b0
netlist constant *FSCAN_CLKGENCTRLEN  1'b0
netlist constant *FSCAN_RSTBYPEN      1'b0
netlist constant *FSCAN_BYPRST_B      1'b1
netlist constant *FSCAN_BYPLATRST_B   1'b1
netlist constant *FSCAN_RAM_WRDIS_B   1'b1
netlist constant *FSCAN_RAM_RDDIS_B   1'b1
netlist constant *FSCAN_RAM_ODIS_B    1'b1
netlist constant *FSCAN_RAM_AWT_MODE  1'b0
netlist constant *FSCAN_RAM_AWT_REN   1'b0
netlist constant *FSCAN_RAM_AWT_WEN   1'b0
netlist constant *FSCAN_RAM_BYPSEL    1'b0
netlist constant *FSCAN_RET_CTRL      1'b0

##################################################
# End of Section D: Static and Stable signals
##################################################
