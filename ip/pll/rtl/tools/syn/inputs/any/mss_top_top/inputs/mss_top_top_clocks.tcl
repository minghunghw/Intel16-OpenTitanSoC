
#source mss_top_top_clock_params.tcl
rdt_source_if_exists mss_top_top_clock_params.tcl

#found domain MSS_TOPCLK in scope mss_top
create_clock -period $periodCache(clk) -waveform $waveCache(clk) -name clk 


