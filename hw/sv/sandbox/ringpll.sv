module ringpll ( clkpll, clkpll0, clkpll1, idvdisable_bo, idvfreqao, idvfreqbo, idvpulseo, idvtclko, idvtctrlo, idvtdo, idvtreso, lock, odfx_fscan_sdo, tdo, view_dig_out, viewanabus, bypass, clkpostdist, clkref, fraction, fz_cp1trim, fz_cp2trim, fz_cpnbias, fz_dca_cb, fz_dca_ctrl, fz_irefgen, fz_ldo_bypass, fz_ldo_extrefsel, fz_ldo_faststart, fz_ldo_fbtrim, fz_ldo_reftrim, fz_ldo_vinvoltsel, fz_lockcnt, fz_lockforce, fz_lockstickyb, fz_lockthresh, fz_lpfclksel, fz_nopfdpwrgate, fz_pfd_pw, fz_pfddly, fz_skadj, fz_spare, fz_startup, fz_tight_loopb, fz_vcosel, fz_vcotrim, idfx_fscan_byprstb, idfx_fscan_clkungate, idfx_fscan_mode, idfx_fscan_rstbypen, idfx_fscan_sdi, idfx_fscan_shiften, idvdisable_bi, idvfreqai, idvfreqbi, idvpulsei, idvtclki, idvtctrli, idvtdi, idvtresi, ldo_enable, ldo_vref, mash_order_plus_one, mdiv_ratio, pllen, pllfwen_b, powergood_vnn, ratio, ssc_cyc_to_peak_m1, ssc_en, ssc_frac_step, tcapturedr, tck, tdi, treg_en, trst_n, tshiftdr, tupdatedr, vccdig_nom,
     vccdist_nom, vccldo_hv, vcodiv_ratio, vnnaon_nom, vss, zdiv0_ratio, zdiv0_ratio_p5, zdiv1_ratio, zdiv1_ratio_p5 );

output  clkpll, clkpll0, clkpll1, idvdisable_bo, idvfreqao, idvfreqbo, idvpulseo, idvtclko, idvtctrlo, idvtdo, idvtreso, lock, tdo;

input  bypass, clkpostdist, clkref, fz_ldo_bypass, fz_ldo_extrefsel, fz_ldo_faststart, fz_lockforce, fz_lockstickyb, fz_lpfclksel, fz_nopfdpwrgate, fz_tight_loopb, fz_vcosel, idfx_fscan_byprstb, idfx_fscan_clkungate, idfx_fscan_mode, idfx_fscan_rstbypen, idfx_fscan_shiften, idvdisable_bi, idvfreqai, idvfreqbi, idvpulsei, idvtclki, idvtctrli, idvtdi, idvtresi, ldo_enable, ldo_vref, mash_order_plus_one, pllen, pllfwen_b, powergood_vnn, ssc_en, tcapturedr, tck, tdi, treg_en, trst_n, tshiftdr, tupdatedr, vccdig_nom, vccdist_nom, vccldo_hv, vnnaon_nom, vss, zdiv0_ratio_p5, zdiv1_ratio_p5;

output [2:0]  odfx_fscan_sdo;
output [1:0]  view_dig_out;
output [1:0]  viewanabus;

input [1:0]  fz_ldo_vinvoltsel;
input [23:0]  ssc_frac_step;
input [2:0]  fz_pfd_pw;
input [4:0]  fz_irefgen;
input [5:0]  fz_startup;
input [1:0]  fz_dca_cb;
input [8:0]  ssc_cyc_to_peak_m1;
input [4:0]  fz_spare;
input [3:0]  fz_ldo_reftrim;
input [3:0]  fz_ldo_fbtrim;
input [10:0]  fz_vcotrim;
input [23:0]  fraction;
input [9:0]  ratio;
input [5:0]  mdiv_ratio;
input [4:0]  fz_cp2trim;
input [1:0]  vcodiv_ratio;
input [4:0]  fz_cp1trim;
input [4:0]  fz_skadj;
input [3:0]  fz_lockthresh;
input [1:0]  fz_cpnbias;
input [5:0]  fz_dca_ctrl;
input [1:0]  fz_pfddly;
input [2:0]  fz_lockcnt;
input [2:0]  idfx_fscan_sdi;
input [9:0]  zdiv0_ratio;
input [9:0]  zdiv1_ratio;

endmodule