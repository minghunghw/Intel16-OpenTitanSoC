module pllmap_top(
    input clk                       ,
    input rst_n                     ,
    input mosi                      ,
    input sclk                      ,
    input tx_finish                 ,
    input start                     ,
    input ss_n                      ,                        
    output logic lock               ,   
    output logic clkpll             ,   
    output logic clkpll0            ,   
    output logic clkpll1            ,   
    output logic [1:0]view_dig_out  ,       
    output logic [2:0]odfx_fscan_sdo,        
    output logic [1:0]viewanabus    ,        
    output logic idvdisable_bo      ,   
    output logic idvfreqao          ,   
    output logic idvfreqbo          ,   
    output logic idvpulseo          ,   
    output logic idvtclko           ,   
    output logic idvtctrlo          ,   
    output logic idvtdo             ,   
    output logic idvtreso           ,   
    output logic tdo                

);
pllMap_pkg::pllmap2pll pllcontrol;
wire r_finish;
wire [511:0]data_o;
pllMap_pkg::pllmap2pll pllmap_i;
assign pllmap_i = data_o;


SPI_SLAVE#(
    .DATA_WIDTH ( 512 )
)u_SPI_SLAVE(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .mosi       ( mosi       ),
    .sclk       ( sclk       ),
    .tx_finish  ( tx_finish  ),
    .start      ( start      ),
    .ss_n       ( ss_n       ),
    .data_o     ( data_o     ),
    .r_finish   ( r_finish   )
);

pll_mapcore u_pll_mapcore(
    .valid                              ( r_finish                        ),
    .clk                                ( clk                             ),
    .rst_n                              ( rst_n                           ),
    .pllmap_i                           ( pllmap_i                        ),
    .pllcontrol                         ( pllcontrol                      )
);

ringpll u_ringpll(

    .powergood_vnn                                      ( pllcontrol.powergood_vnn                                      ),
    .ldo_vref                                           ( pllcontrol.ldo_vref                                           ),//*
    .ldo_enable                                         ( pllcontrol.ldo_enable                                         ),
    .fz_ldo_vinvoltsel                                  ( pllcontrol.fz_ldo_vinvoltsel                                  ),
    .fz_ldo_faststart                                   ( pllcontrol.fz_ldo_faststart                                   ),
    .fz_ldo_bypass                                      ( pllcontrol.fz_ldo_bypass                                      ),
    .fz_ldo_extrefsel                                   ( pllcontrol.fz_ldo_extrefsel                                   ),
    .fz_ldo_fbtrim                                      ( pllcontrol.fz_ldo_fbtrim                                      ),
    .fz_ldo_reftrim                                     ( pllcontrol.fz_ldo_reftrim                                     ),
    .clkref                                             ( clk                                                           ),///////////
    .bypass                                             ( pllcontrol.bypass                                             ),
    .pllen                                              ( pllcontrol.pllen                                              ),
    .pllfwen_b                                          ( pllcontrol.pllfwen_b                                          ),
    .ratio                                              ( pllcontrol.ratio                                              ),
    .fraction                                           ( pllcontrol.fraction                                           ),
    .mdiv_ratio                                         ( pllcontrol.mdiv_ratio                                         ),
    .mash_order_plus_one                                ( pllcontrol.mash_order_plus_one                                ),
    .ssc_cyc_to_peak_m1                                 ( pllcontrol.ssc_cyc_to_peak_m1                                 ),
    .ssc_en                                             ( pllcontrol.ssc_en                                             ),
    .ssc_frac_step                                      ( pllcontrol.ssc_frac_step                                      ),
    .vcodiv_ratio                                       ( pllcontrol.vcodiv_ratio                                       ),
    .zdiv0_ratio                                        ( pllcontrol.zdiv0_ratio                                        ),
    .zdiv0_ratio_p5                                     ( pllcontrol.zdiv0_ratio_p5                                     ),
    .zdiv1_ratio                                        ( pllcontrol.zdiv1_ratio                                        ),
    .zdiv1_ratio_p5                                     ( pllcontrol.zdiv1_ratio_p5                                     ),
    .fz_cp1trim                                         ( pllcontrol.fz_cp1trim                                         ),
    .fz_cp2trim                                         ( pllcontrol.fz_cp2trim                                         ),
    .fz_cpnbias                                         ( pllcontrol.fz_cpnbias                                         ),
    .fz_dca_cb                                          ( pllcontrol.fz_dca_cb                                          ),
    .fz_dca_ctrl                                        ( pllcontrol.fz_dca_ctrl                                        ),
    .fz_irefgen                                         ( pllcontrol.fz_irefgen                                         ),
    .fz_lockcnt                                         ( pllcontrol.fz_lockcnt                                         ),
    .fz_lockforce                                       ( pllcontrol.fz_lockforce                                       ),
    .fz_lockstickyb                                     ( pllcontrol.fz_lockstickyb                                     ),
    .fz_lockthresh                                      ( pllcontrol.fz_lockthresh                                      ),
    .fz_lpfclksel                                       ( pllcontrol.fz_lpfclksel                                       ),
    .fz_nopfdpwrgate                                    ( pllcontrol.fz_nopfdpwrgate                                    ),
    .fz_pfd_pw                                          ( pllcontrol.fz_pfd_pw                                          ),
    .fz_pfddly                                          ( pllcontrol.fz_pfddly                                          ),
    .fz_skadj                                           ( pllcontrol.fz_skadj                                           ),
    .fz_spare                                           ( pllcontrol.fz_spare                                           ),
    .fz_startup                                         ( pllcontrol.fz_startup                                         ),
    .fz_tight_loopb                                     ( pllcontrol.fz_tight_loopb                                     ),
    .fz_vcosel                                          ( pllcontrol.fz_vcosel                                          ),
    .fz_vcotrim                                         ( pllcontrol.fz_vcotrim                                         ),
    .idvdisable_bi                                      ( pllcontrol.idvdisable_bi                                      ),
    .idvfreqai                                          ( pllcontrol.idvfreqai                                          ),
    .idvfreqbi                                          ( pllcontrol.idvfreqbi                                          ),
    .idvpulsei                                          ( pllcontrol.idvpulsei                                          ),
    .idvtclki                                           ( pllcontrol.idvtclki                                           ),
    .idvtctrli                                          ( pllcontrol.idvtctrli                                          ),
    .idvtdi                                             ( pllcontrol.idvtdi                                             ),
    .idvtresi                                           ( pllcontrol.idvtresi                                           ),
    .idvdisable_bo                                      ( idvdisable_bo                                                 ),//
    .idvfreqao                                          ( idvfreqao                                                     ),//
    .idvfreqbo                                          ( idvfreqbo                                                     ),//
    .idvpulseo                                          ( idvpulseo                                                     ),//
    .idvtclko                                           ( idvtclko                                                      ),//
    .idvtctrlo                                          ( idvtctrlo                                                     ),//
    .idvtdo                                             ( idvtdo                                                        ),//
    .idvtreso                                           ( idvtreso                                                      ),//
    .tdo                                                ( tdo                                                           ),//
    .tck                                                ( pllcontrol.tck                                                ),
    .tcapturedr                                         ( pllcontrol.tcapturedr                                         ),
    .tdi                                                ( pllcontrol.tdi                                                ),
    .treg_en                                            ( pllcontrol.treg_en                                            ),
    .trst_n                                             ( pllcontrol.trst_n                                             ),
    .tshiftdr                                           ( pllcontrol.tshiftdr                                           ),
    .tupdatedr                                          ( pllcontrol.tupdatedr                                          ),
    .idfx_fscan_sdi                                     ( pllcontrol.idfx_fscan_sdi                                     ),
    .idfx_fscan_mode                                    ( pllcontrol.idfx_fscan_mode                                    ),
    .idfx_fscan_shiften                                 ( pllcontrol.idfx_fscan_shiften                                 ),
    .idfx_fscan_rstbypen                                ( pllcontrol.idfx_fscan_rstbypen                                ),
    .idfx_fscan_byprstb                                 ( pllcontrol.idfx_fscan_byprstb                                 ),
    .idfx_fscan_clkungate                               ( pllcontrol.idfx_fscan_clkungate                               ),
    .odfx_fscan_sdo                                     ( odfx_fscan_sdo                                                ),//
    .viewanabus                                         ( viewanabus                                                    ),//
    .clkpostdist                                        ( pllcontrol.clkpostdist                                        ),
    .lock                                               ( lock                                                          ),//
    .clkpll                                             ( clkpll                                                        ),//
    .clkpll0                                            ( clkpll0                                                       ),//
    .clkpll1                                            ( clkpll1                                                       ),//
    .view_dig_out                                       ( view_dig_out                                                  )//
);
endmodule

                