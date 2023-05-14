waive_lp -add ISO_GLITCH_waiver1 -tag ISO_STRATCONTROL_GLITCH -filter {(UPFNet:NetName =~ "*iip2211ringpll_hip/ipll_dig_lsbank/reset_b_xxl") AND (DriverNode =~ "*iip2211ringpll_sip/sip/reset_sync__Reset_b_XXnnnL")}
waive_lp -add ISO_GLITCH_waiver2 -tag ISO_STRATCONTROL_GLITCH -filter {(UPFNet:NetName =~ "*iip2211ringpll_hip/powergood") AND (DriverNode =~ "*iip2211ringpll_sip/sip/dfx/dfx__powergood")}
#waive_lp -add ISO_STRAT_waiver1 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/refclkdiv/clkout")}
waive_lp -add ISO_STRAT_waiver2 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/pll_core/viewana/ViewPinNH[1]")}
waive_lp -add ISO_STRAT_waiver4 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/pll_core/viewana/ViewPinNH[0]")}
waive_lp -add ISO_STRAT_waiver3 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/ip2211ringpll_pll_glitchlessmux/muxclk")}
waive_lp -add ISO_STRAT_waiver5 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/dca/dca_ana/clkout")}
waive_lp -add LS_REDUND_waiver1 -tag LS_STRATEGY_REDUND -filter {(Source:ConstValue  =~ "0")}
waive_lp -add NO_LOAD_waiver1 -tag UPF_SUPPLY_NOLOAD -filter {(UPFSupply  =~ "vnnaon_nom")}
waive_lp -add NO_STATE_waiver1 -tag UPF_SUPPLY_NOSTATE -filter {(Supplies:UPFSupply  =~ "*ground")}
waive_lp -add PSW_STATE_waiver1 -tag PSW_SUPPLY_STATE -filter {(UPFSupply  =~ "vccldo_hv")}
waive_lp -add PSW_IN_EXTRA_waiver1 -tag PSW_IN_EXTRA -filter {(InputPort  =~ "*ldo/in")} 
waive_lp -add PSW_OUT_EXTRA_waiver1 -tag PSW_OUT_EXTRA -filter {(OutputPort  =~ "*ldo/out")}
waive_lp -add LS_REDUND_waiver2 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__dca_ctrl[0]")}
waive_lp -add LS_REDUND_waiver3 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__dca_ctrl[4]")}
waive_lp -add LS_REDUND_waiver4 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__dca_ctrl[2]")}
waive_lp -add LS_REDUND_waiver5 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__dca_ctrl[5]")}
waive_lp -add LS_REDUND_waiver6 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__dca_ctrl[3]")}
waive_lp -add LS_REDUND_waiver7 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__dca_ctrl[1]")}
waive_lp -add LS_REDUND_waiver8 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*powergood_vnn")}
waive_lp -add LS_REDUND_waiver9 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/reset_sync__Reset_b_XXnnnL")}
waive_lp -add LS_MISSING_waiver1 -tag LS_STRATEGY_MISSING -filter {(SegmentSourceDomain =~ "ip2211ringpll_pd") AND (SegmentSinkDomain =~ "PD_DIST")}
waive_lp -add LS_MISSING_waiver2 -tag LS_STRATEGY_MISSING -filter {(SegmentSourceDomain =~ "PD_DIST") AND (SegmentSinkDomain =~ "ip2211ringpll_pd")}
waive_lp -add PSW_CONTROL_GLITCH_waiver -tag PSW_CONTROL_GLITCH -filter {(DesignDriver:DrivingNode =~ "iip2211ringpll_sip/sip/dfx/I_OR_dfx__ldo_enable_a/OUT")}
waive_lp -add ISO_STRAT_waiver6 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_vinvoltsel_a[0]")}
waive_lp -add ISO_STRAT_waiver7 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_bypass_a")}
waive_lp -add ISO_STRAT_waiver8 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/ljpll_rtdr/tdr_data_out/Q[10]")}
waive_lp -add ISO_STRAT_waiver9 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/ljpll_rtdr/tdr_data_out/Q[11]")}
waive_lp -add ISO_STRAT_waiver10 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_extrefsel_a")}
waive_lp -add ISO_STRAT_waiver11 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[3]")}
waive_lp -add ISO_STRAT_waiver12 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[2]")}
waive_lp -add ISO_STRAT_waiver13 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[1]")}
waive_lp -add ISO_STRAT_waiver14 -tag ISO_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[0]")}
waive_lp -add LS_STRAT_MISS_waiver0 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/ljpll_rtdr/tdr_data_out/Q[10]")}
waive_lp -add LS_STRAT_MISS_waiver1 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/clkplldiv0")}
waive_lp -add LS_STRAT_MISS_waiver2 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_hip/clkplldiv1")}
waive_lp -add LS_STRAT_MISS_waiver3 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_bypass_a")}
waive_lp -add LS_STRAT_MISS_waiver4 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_extrefsel_a")}
waive_lp -add LS_STRAT_MISS_waiver5 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_vinvoltsel_a[0]")}
waive_lp -add LS_STRAT_MISS_waiver6 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__ldo_enable_a")}
waive_lp -add LS_STRAT_MISS_waiver7 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/ljpll_rtdr/tdr_data_out/Q[11]")}
waive_lp -add LS_STRAT_MISS_waiver8 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[3]")}
waive_lp -add LS_STRAT_MISS_waiver9 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[2]")}
waive_lp -add LS_STRAT_MISS_waiver10 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[1]")}
waive_lp -add LS_STRAT_MISS_waiver11 -tag LS_STRATEGY_MISSING -filter {(Source:PinName =~ "*iip2211ringpll_sip/sip/dfx/dfx__fz_ldo_reftrim_a[0]")}
waive_lp -add LS_STRAT_NOSHIFT_waiver0 -tag LS_STRATEGY_NOSHIFT -filter {(Source:PinName =~ "*iip2211ringpll_hip/vcozdiv0/fdiv_core/clkout")}
waive_lp -add LS_STRAT_NOSHIFT_waiver1 -tag LS_STRATEGY_NOSHIFT -filter {(Source:PinName =~ "*iip2211ringpll_hip/vcozdiv1/fdiv_core/clkout")}
waive_lp -add  PSW_CONTROL_STATE_waiver0 -tag PSW_CONTROL_STATE -filter {(DriverNode =~ "*iip2211ringpll_sip/sip/dfx/I_OR_dfx__ldo_enable_a/OUT")}




