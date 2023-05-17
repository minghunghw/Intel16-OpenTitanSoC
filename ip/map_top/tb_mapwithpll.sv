module tb_mapwithpll();
    

    logic                       lock               ;   
    logic                       clkpll             ;   
    logic                       clkpll0            ;   
    logic                       clkpll1            ;   
    logic                       [1:0]view_dig_out  ;       
    logic                       [2:0]odfx_fscan_sdo;        
    logic                       [1:0]viewanabus    ;        
    logic                       idvdisable_bo      ;   
    logic                       idvfreqao          ;   
    logic                       idvfreqbo          ;   
    logic                       idvpulseo          ;   
    logic                       idvtclko           ;   
    logic                       idvtctrlo          ;   
    logic                       idvtdo             ;   
    logic                       idvtreso           ;   
    logic                       tdo                ;

    logic                       [1:0]  address     ;
    logic                       [15:0] data        ;
    logic                       rst_n              ;
    logic                       valid              ;
    logic                       clk                ;
    logic                       [2:0] sel [31:0]   ;
    logic                       [15:0]noise_sel    ;
    pllMap_pkg::pllmap2pll      pllcontrol         ;   


map_top u_map_top(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .valid      ( valid      ),
    .address    ( address    ),
    .data       ( data       ),
    .sel        ( sel        ),
    .noise_sel  ( noise_sel  ),
    .pllcontrol ( pllcontrol )
);

ringpll u_ringpll(

    .powergood_vnn             ( pllcontrol.powergood_vnn                                      ),
    .ldo_vref                  ( pllcontrol.ldo_vref                                           ),//*
    .ldo_enable                ( pllcontrol.ldo_enable                                         ),
    .fz_ldo_vinvoltsel         ( pllcontrol.fz_ldo_vinvoltsel                                  ),
    .fz_ldo_faststart          ( pllcontrol.fz_ldo_faststart                                   ),
    .fz_ldo_bypass             ( pllcontrol.fz_ldo_bypass                                      ),
    .fz_ldo_extrefsel          ( pllcontrol.fz_ldo_extrefsel                                   ),
    .fz_ldo_fbtrim             ( pllcontrol.fz_ldo_fbtrim                                      ),
    .fz_ldo_reftrim            ( pllcontrol.fz_ldo_reftrim                                     ),
    .clkref                    ( clk                                                           ),///////////
    .bypass                    ( pllcontrol.bypass                                             ),
    .pllen                     ( pllcontrol.pllen                                              ),
    .pllfwen_b                 ( pllcontrol.pllfwen_b                                          ),
    .ratio                     ( pllcontrol.ratio                                              ),
    .fraction                  ( pllcontrol.fraction                                           ),
    .mdiv_ratio                ( pllcontrol.mdiv_ratio                                         ),
    .mash_order_plus_one       ( pllcontrol.mash_order_plus_one                                ),
    .ssc_cyc_to_peak_m1        ( pllcontrol.ssc_cyc_to_peak_m1                                 ),
    .ssc_en                    ( pllcontrol.ssc_en                                             ),
    .ssc_frac_step             ( pllcontrol.ssc_frac_step                                      ),
    .vcodiv_ratio              ( pllcontrol.vcodiv_ratio                                       ),
    .zdiv0_ratio               ( pllcontrol.zdiv0_ratio                                        ),
    .zdiv0_ratio_p5            ( pllcontrol.zdiv0_ratio_p5                                     ),
    .zdiv1_ratio               ( pllcontrol.zdiv1_ratio                                        ),
    .zdiv1_ratio_p5            ( pllcontrol.zdiv1_ratio_p5                                     ),
    .fz_cp1trim                ( pllcontrol.fz_cp1trim                                         ),
    .fz_cp2trim                ( pllcontrol.fz_cp2trim                                         ),
    .fz_cpnbias                ( pllcontrol.fz_cpnbias                                         ),
    .fz_dca_cb                 ( pllcontrol.fz_dca_cb                                          ),
    .fz_dca_ctrl               ( pllcontrol.fz_dca_ctrl                                        ),
    .fz_irefgen                ( pllcontrol.fz_irefgen                                         ),
    .fz_lockcnt                ( pllcontrol.fz_lockcnt                                         ),
    .fz_lockforce              ( pllcontrol.fz_lockforce                                       ),
    .fz_lockstickyb            ( pllcontrol.fz_lockstickyb                                     ),
    .fz_lockthresh             ( pllcontrol.fz_lockthresh                                      ),
    .fz_lpfclksel              ( pllcontrol.fz_lpfclksel                                       ),
    .fz_nopfdpwrgate           ( pllcontrol.fz_nopfdpwrgate                                    ),
    .fz_pfd_pw                 ( pllcontrol.fz_pfd_pw                                          ),
    .fz_pfddly                 ( pllcontrol.fz_pfddly                                          ),
    .fz_skadj                  ( pllcontrol.fz_skadj                                           ),
    .fz_spare                  ( pllcontrol.fz_spare                                           ),
    .fz_startup                ( pllcontrol.fz_startup                                         ),
    .fz_tight_loopb            ( pllcontrol.fz_tight_loopb                                     ),
    .fz_vcosel                 ( pllcontrol.fz_vcosel                                          ),
    .fz_vcotrim                ( pllcontrol.fz_vcotrim                                         ),
    .idvdisable_bi             ( pllcontrol.idvdisable_bi                                      ),
    .idvfreqai                 ( pllcontrol.idvfreqai                                          ),
    .idvfreqbi                 ( pllcontrol.idvfreqbi                                          ),
    .idvpulsei                 ( pllcontrol.idvpulsei                                          ),
    .idvtclki                  ( pllcontrol.idvtclki                                           ),
    .idvtctrli                 ( pllcontrol.idvtctrli                                          ),
    .idvtdi                    ( pllcontrol.idvtdi                                             ),
    .idvtresi                  ( pllcontrol.idvtresi                                           ),
    .idvdisable_bo             ( idvdisable_bo                                                 ),//
    .idvfreqao                 ( idvfreqao                                                     ),//
    .idvfreqbo                 ( idvfreqbo                                                     ),//
    .idvpulseo                 ( idvpulseo                                                     ),//
    .idvtclko                  ( idvtclko                                                      ),//
    .idvtctrlo                 ( idvtctrlo                                                     ),//
    .idvtdo                    ( idvtdo                                                        ),//
    .idvtreso                  ( idvtreso                                                      ),//
    .tdo                       ( tdo                                                           ),//
    .tck                       ( pllcontrol.tck                                                ),
    .tcapturedr                ( pllcontrol.tcapturedr                                         ),
    .tdi                       ( pllcontrol.tdi                                                ),
    .treg_en                   ( pllcontrol.treg_en                                            ),
    .trst_n                    ( pllcontrol.trst_n                                             ),
    .tshiftdr                  ( pllcontrol.tshiftdr                                           ),
    .tupdatedr                 ( pllcontrol.tupdatedr                                          ),
    .idfx_fscan_sdi            ( pllcontrol.idfx_fscan_sdi                                     ),
    .idfx_fscan_mode           ( pllcontrol.idfx_fscan_mode                                    ),
    .idfx_fscan_shiften        ( pllcontrol.idfx_fscan_shiften                                 ),
    .idfx_fscan_rstbypen       ( pllcontrol.idfx_fscan_rstbypen                                ),
    .idfx_fscan_byprstb        ( pllcontrol.idfx_fscan_byprstb                                 ),
    .idfx_fscan_clkungate      ( pllcontrol.idfx_fscan_clkungate                               ),
    .odfx_fscan_sdo            ( odfx_fscan_sdo                                                ),//
    .viewanabus                ( viewanabus                                                    ),//
    .clkpostdist               ( pllcontrol.clkpostdist                                        ),
    .lock                      ( lock                                                          ),//
    .clkpll                    ( clkpll                                                        ),//
    .clkpll0                   ( clkpll0                                                       ),//
    .clkpll1                   ( clkpll1                                                       ),//
    .view_dig_out              ( view_dig_out                                                  )//
);

    initial begin
        forever begin
            #5
            if($time>1600000000000)  $finish;
        end
    end
    
    //around time 1065000000000 the ratio of clkpll clkpll0 clkpll1 will be changed 
    //the signal valid of module u_pll_mapcore will be pull up and the lock of pllring
    //will be pull down for 1 cycle.then as the same time of reset`s default clk out,the 
    //inital will be finished.


    
    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        data  = 0;
        @(negedge clk) 
        rst_n = 1'b0;
        @(negedge clk) 
        rst_n = 1'b1;
        @(posedge clk);
        @(posedge clk);
        #500000000
        @(negedge clk);
        valid = 1'b1;
        address = 2'd1;
        data[0] = 1'b1;
        data[2:1] = 2'd2;
        data[12:3] = 10'h19;
        data[14:13] = 0;
        @(negedge clk);
        valid = 1'b0;
    end

    // always #(26041) clk = ~clk;
    // task automatic datachange;
    // input read;
    // input write;
    // input pllen;
    // input [9:0]ratio;
    // output [511:0]data;
    // data = 0;
    // data[0] = read;
    // data[1] = write;
    // data[2] = pllen;
    // data[12:3] = ratio;

        
    // endtask //automatic

endmodule


