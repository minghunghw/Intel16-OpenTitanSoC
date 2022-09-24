
######################################
## List of procs used by this script
## None
##
#######################################

# This file is used for scan architecture definition
# Copy $env(INTEL_ASIC)/kit/asicflows/<EDA_VENDOR>/syn/scan_stitch_template.tcl into
# local ./scripts directory and modify the default settings as necessary
# All variables must be defined

#1. Test clocks: Specify test_clock name, period in ps, the domain it belongs to
#2. Test resets: Specify reset name, it's value during scan_shift; Set to {none} if no test resets
#3. Set INTEL_SCAN_ENABLE {name_of_scanen_port/value_during_shift} to define an existing or a new port as scan_enable
#4. Set INTEL_SCAN_CLOCK_UNGATE {name_of_clock_gating_enable} to define an existing or a new port as clock_gating_enable 
#5. Test mode constraints: Specify ATPG mode configuration settings like (scan_mode1/1 scan_mode2/0); Set to {none} if no test constants
#6. Scan_in, Scan_out: Specify existing ports, like (scan_in0/scan_out0, scan_in1/scan_out1). If 'none', default ports (test_si*/test_so*) will be created
#7. Scan_chain length: {default} length is 750; Specify a # to set different scan chain length
#8. Scan_compression information: Set to {enable} for compression, and specify compression chain length  
#   INTEL_SCAN_EDT_CHANNELS: variable ONLY needed for Mentor DFT flow
#9. INTEL_SCAN_ATSPEED_CLK_CTRL: Specify {pll_clock_output_pin,oscillator_refclk_for_this_pll,shift_clock_name} 
#                                Set to {none} if atspeed_clk_ctrl logic is not inserted


# 1. Test clocks
set INTEL_SCAN_CLOCKS                     {clk/100000/domain1}

# 2. Test resets
set INTEL_SCAN_RESETS                     {rstb/high}

# 3. Scan_enable
set INTEL_SCAN_ENABLE                     {scan_enable/high}

# 4. Clock_gating enable
set INTEL_SCAN_CLOCK_UNGATE               {clk_gating_en}

# 5. Test mode constraints
set INTEL_SCAN_CONSTRAINTS                {none}

# 6. Scan_in, scan_out
set INTEL_SCAN_IN_SCAN_OUT                {none}

# 7. Scan_chain length
set INTEL_SCAN_CHAIN_LENGTH               {default}

# 8. Scan_compression
set INTEL_SCAN_COMPRESSION                {disable}
set INTEL_SCAN_COMPRESSED_CHAIN_LENGTH    100

#The following variable needed for Mentor DFT flow ONLY
set INTEL_SCAN_EDT_CHANNELS               2

# 9. At-speed clock controller
set INTEL_SCAN_ATSPEED_CLK_CTRL          {none}

