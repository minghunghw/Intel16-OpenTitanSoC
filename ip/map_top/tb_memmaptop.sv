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




    logic [9:0] reg_ratio [2:0];
    logic reg_pllen;
    logic [1:0]reg_vcodiv;
    logic [2:0] reg_trngsel [31:0];
    logic [3:0] reg_noisesel [3:0];
    logic reg_idfx_fscan_rstbypen;

memmap_top u_memmap_top(
    .valid                          ( valid            ),
    .clk                            ( clk              ),
    .rst_n                          ( rst_n            ),
    .addr                           ( address             ),
    .data                           ( data             ),
    .reg_ratio                      ( reg_ratio            ),
    .reg_pllen                      ( reg_pllen              ),
    .reg_vcodiv                     (reg_vcodiv                 ),
    .reg_trngsel                    ( reg_trngsel            ),
    .reg_noisesel                   ( reg_noisesel            ),
    .reg_idfx_fscan_rstbypen        ( reg_idfx_fscan_rstbypen  )
);

      
ringpll u_ringpll(

    .powergood_vnn             ( 1'b1                                       ),
    .ldo_vref                  ( 1'b0                                           ),//*
    .ldo_enable                ( 1'b0                                         ),
    .fz_ldo_vinvoltsel         ( 0                                  ),
    .fz_ldo_faststart          ( 0                                   ),
    .fz_ldo_bypass             ( 1'b1                                      ),
    .fz_ldo_extrefsel          ( 1'b1                                   ),
    .fz_ldo_fbtrim             ( 4'd2                                      ),
    .fz_ldo_reftrim            ( 4'hA                                      ),
    .clkref                    ( clk                                                           ),///////////
    .bypass                    ( 1'b1                                             ),
    .pllen                     ( reg_pllen                                                     ),
    .pllfwen_b                 ( 1'b0                                          ),
    .ratio                     ( reg_ratio[0]                                                  ),
    .fraction                  ( 0                                           ),
    .mdiv_ratio                ( 0                                         ),
    .mash_order_plus_one       ( 0                                ),
    .ssc_cyc_to_peak_m1        ( 9'h1D8                                 ),
    .ssc_en                    ( 0                                             ),
    .ssc_frac_step             ( 24'hE6829A                                      ),
    .vcodiv_ratio              ( reg_vcodiv                                                    ),
    .zdiv0_ratio               ( reg_ratio[1]                                                  ),
    .zdiv0_ratio_p5            ( 0                                     ),
    .zdiv1_ratio               ( reg_ratio[2]                                                  ),
    .zdiv1_ratio_p5            ( 0                                     ),
    .fz_cp1trim                ( 5'h6                                        ),
    .fz_cp2trim                ( 5'h14                                         ),
    .fz_cpnbias                ( 2'd1                                         ),
    .fz_dca_cb                 ( 0                                          ),
    .fz_dca_ctrl               ( 6'h25                                        ),
    .fz_irefgen                ( 5'h1A                                         ),
    .fz_lockcnt                ( 3'h4                                         ),
    .fz_lockforce              ( 1'b1                                       ),
    .fz_lockstickyb            ( 0                                     ),
    .fz_lockthresh             ( 4'hC                                      ),
    .fz_lpfclksel              ( 0                                       ),
    .fz_nopfdpwrgate           ( 1'b1                                    ),
    .fz_pfd_pw                 ( 0                                         ),
    .fz_pfddly                 ( 'd3                                          ),
    .fz_skadj                  ( 5'h1C                                           ),
    .fz_spare                  ( 0                                           ),
    .fz_startup                ( 6'h9                                         ),
    .fz_tight_loopb            ( 0                                     ),
    .fz_vcosel                 ( 1'b1                                         ),
    .fz_vcotrim                ( 11'h3C9                                         ),
    .idvdisable_bi             ( 0                                      ),
    .idvfreqai                 ( 0                                      ),
    .idvfreqbi                 ( 0                                      ),
    .idvpulsei                 ( 0                                      ),
    .idvtclki                  ( 0                                      ),
    .idvtctrli                 ( 0                                      ),
    .idvtdi                    ( 0                                      ),
    .idvtresi                  ( 0                                      ),
    .idvdisable_bo             ( idvdisable_bo                                                 ),//
    .idvfreqao                 ( idvfreqao                                                     ),//
    .idvfreqbo                 ( idvfreqbo                                                     ),//
    .idvpulseo                 ( idvpulseo                                                     ),//
    .idvtclko                  ( idvtclko                                                      ),//
    .idvtctrlo                 ( idvtctrlo                                                     ),//
    .idvtdo                    ( idvtdo                                                        ),//
    .idvtreso                  ( idvtreso                                                      ),//
    .tdo                       ( tdo                                                           ),//
    .tck                       ( 0                                      ),
    .tcapturedr                ( 0                                      ),
    .tdi                       ( 0                                      ),
    .treg_en                   ( 0                                      ),
    .trst_n                    ( 0                                      ),
    .tshiftdr                  ( 0                                      ),
    .tupdatedr                 ( 0                                      ),
    .idfx_fscan_sdi            (  0                              ),
    .idfx_fscan_mode           (  0                              ),
    .idfx_fscan_shiften        (  0                              ),
    .idfx_fscan_rstbypen       ( reg_idfx_fscan_rstbypen                                       ),
    .idfx_fscan_byprstb        ( 0                             ),
    .idfx_fscan_clkungate      ( 0                             ),
    .odfx_fscan_sdo            ( odfx_fscan_sdo                                                ),//
    .viewanabus                ( viewanabus                                                    ),//
    .clkpostdist               ( 0                                        ),
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
        @(negedge clk);
        valid = 1'b1;
        address = 6'd0;
        data[0] = 1'b1;
        @(negedge clk);
        valid = 1'b1;
        address = 6'd2;
        data[0] = 1'b1;
        @(negedge clk);
        valid = 1'b1;
        address = 6'd2;
        data[0] = 1'b0;
        @(negedge clk);
        valid = 1'b0;
        #5000000
        @(negedge clk);
        valid = 1'b1;
        address = 6'd4;
        data[9:0] = 10'd26;
        @(negedge clk);
        valid = 1'b0;
    end

    always #(26041) clk = ~clk;


        // 6'd0: next_reg_pllen = data[0];
        //     6'd1: next_reg_vcodiv = data[1:0];
        //     6'd2: next_reg_idfx_fscan_rstbypen = data[0];
        //     6'd3: next_reg_ratio[0] = data[9:0];
        //     6'd4: next_reg_ratio[1] = data[9:0];
        //     6'd5: next_reg_ratio[2] = data[9:0];
    // endtask //automatic
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

//   pllcontrol.clkpostdist         <= 1'b0 ;
//         pllcontrol.pllfwen_b           <= 1'b0 ;
//         pllcontrol.bypass              <= 1'b0 ;
//         pllcontrol.ldo_enable          <= 1'b0 ;
// 	    pllcontrol.pllen               <= 1'b1 ;
//         pllcontrol.ratio               <= 10'hBC;
//         pllcontrol.fraction            <= 0;
//         pllcontrol.vcodiv_ratio        <= 0;
//         pllcontrol.zdiv0_ratio         <= 10'hC7;
//         pllcontrol.zdiv0_ratio_p5      <= 0;
//         pllcontrol.zdiv1_ratio         <= 10'h19;
//         pllcontrol.zdiv1_ratio_p5      <= 0;
//         pllcontrol.powergood_vnn       <= 1'b1;
//         pllcontrol.mdiv_ratio          <= 0;
//         pllcontrol.mash_order_plus_one <= 'd0;   
        
//         pllcontrol.tcapturedr          <= 1'b0                ;
//         pllcontrol.tck                 <= 1'b0                ;
//         pllcontrol.tdi                 <= 1'b0                ;
//         pllcontrol.treg_en             <= 1'b0                ;
//         pllcontrol.trst_n              <= 1'b0                ;
//         pllcontrol.tshiftdr            <= 1'b0                ;
//         pllcontrol.tupdatedr           <= 1'b0                ;

//         pllcontrol.fz_cp1trim          <= 5'h6   ;
//         pllcontrol.fz_cp2trim          <= 5'h14  ;
//         pllcontrol.fz_cpnbias          <= 2'd1   ;
//         pllcontrol.fz_dca_cb           <= 0   ;
//         pllcontrol.fz_dca_ctrl         <= 6'h25   ;
//         pllcontrol.fz_irefgen          <= 5'h1A   ;
//         pllcontrol.fz_ldo_bypass       <= 1'b1   ;
//         pllcontrol.fz_ldo_extrefsel    <= 1'b1   ;
//         pllcontrol.fz_ldo_faststart    <= 0   ;
//         pllcontrol.fz_ldo_fbtrim       <= 4'd2   ;
//         pllcontrol.fz_ldo_reftrim      <= 4'hA   ;
//         pllcontrol.fz_ldo_vinvoltsel   <= 0   ;
//         pllcontrol.fz_lockcnt          <= 3'h4  ;
//         pllcontrol.fz_lockforce        <= 1'b1   ;
//         pllcontrol.fz_lockstickyb      <= 0   ;
//         pllcontrol.fz_lockthresh       <= 4'hC   ;
//         pllcontrol.fz_lpfclksel        <= 0   ;
//         pllcontrol.fz_nopfdpwrgate     <= 1'b1   ;
//         pllcontrol.fz_pfd_pw           <= 0   ;
//         pllcontrol.fz_pfddly           <= 'd3   ;
//         pllcontrol.fz_skadj            <= 5'h1C   ;
//         pllcontrol.fz_spare            <= 0   ;
//         pllcontrol.fz_startup          <= 6'h9   ;
//         pllcontrol.fz_tight_loopb      <= 0   ;
//         pllcontrol.fz_vcosel           <= 1'b1   ;
//         pllcontrol.fz_vcotrim          <= 11'h3C9   ;

//         pllcontrol.idfx_fscan_byprstb           <=  0;
//         pllcontrol.idfx_fscan_clkungate         <=  0;
//         pllcontrol.idfx_fscan_mode              <=  0;

//         pllcontrol.idfx_fscan_sdi               <=  0;
//         pllcontrol.idfx_fscan_shiften           <=  0;
//         pllcontrol.idvdisable_bi                <=  0;
//         pllcontrol.idvfreqai                    <=  0;
//         pllcontrol.idvfreqbi                    <=  0;
//         pllcontrol.idvpulsei                    <=  0;
//         pllcontrol.idvtclki                     <=  0;
//         pllcontrol.idvtctrli                    <=  0;
//         pllcontrol.idvtdi                       <=  0;
//         pllcontrol.idvtresi                     <=  0;

//         pllcontrol.ssc_frac_step                <=  24'hE6829A;
//         pllcontrol.ssc_en                       <=  0;
//         pllcontrol.ssc_cyc_to_peak_m1           <=  9'h1D8;

//         pllcontrol.idfx_fscan_rstbypen         <=  0;//

//     end


