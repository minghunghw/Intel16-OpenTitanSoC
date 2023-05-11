module pll_mapcore (
    input       valid,
    input       clk,
    input       rst_n,
    input  pllMap_pkg::pllmap2pll pllmap_i,
    output pllMap_pkg::pllmap2pll pllcontrol

    //output pllMap_pkg::pllmap2spi pllmap_o,


);

localparam                       P_NOP          = 1;
localparam                       P_IDLE         = 2;


logic [3:0]                      state;
logic [3:0]                      next_state;
logic                            write_enable;
logic                            read_enable;
logic                            pll_enable;

assign write_enable = pllmap_i.en_write&valid;
assign read_enable  = pllmap_i.en_read&valid;
assign pll_enable   = pllmap_i.pllen;



always_ff @(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		state <= P_IDLE;
	else
		state <= next_state;
end

always_comb begin : writestatechange
    case (state)
        P_NOP: begin
            if(write_enable&&pll_enable) begin
                    next_state = P_IDLE;
            end
            else begin
                next_state = P_NOP;
            end
        end
        P_IDLE: begin
            if(write_enable&&(!pll_enable)) begin
                next_state = P_NOP;
            end   
            else begin
                next_state = P_IDLE;
            end
        end
        default: next_state = P_IDLE;
    endcase
end

always_ff @(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0) begin
	    pllcontrol.pllen               <= 1'b1;
        pllcontrol.ratio               <= 10'd20;
        pllcontrol.fraction            <= 0;
        pllcontrol.vcodiv_ratio        <= 0;
        pllcontrol.zdiv0_ratio         <= 0;
        pllcontrol.zdiv0_ratio_p5      <= 0;
        pllcontrol.zdiv1_ratio         <= 0;
        pllcontrol.zdiv1_ratio_p5      <= 0;
        pllcontrol.powergood_vnn       <= 1'b1;
        pllcontrol.mdiv_ratio          <= 0;  
        
        pllcontrol.tcapturedr          <= 1'b0                ;
        pllcontrol.tck                 <= 1'b0                ;
        pllcontrol.tdi                 <= 1'b0                ;
        pllcontrol.treg_en             <= 1'b0                ;
        pllcontrol.trst_n              <= 1'b0                ;
        pllcontrol.tshiftdr            <= 1'b0                ;
        pllcontrol.tupdatedr           <= 1'b0                ;

        pllcontrol.fz_cp1trim          <= 0   ;
        pllcontrol.fz_cp2trim          <= 0   ;
        pllcontrol.fz_cpnbias          <= 0   ;
        pllcontrol.fz_dca_cb           <= 0   ;
        pllcontrol.fz_dca_ctrl         <= 0   ;
        pllcontrol.fz_irefgen          <= 0   ;
        pllcontrol.fz_irefgen          <= 0   ;
        pllcontrol.fz_ldo_bypass       <= 0   ;
        pllcontrol.fz_ldo_extrefsel    <= 0   ;
        pllcontrol.fz_ldo_faststart    <= 0   ;
        pllcontrol.fz_ldo_fbtrim       <= 0   ;
        pllcontrol.fz_ldo_reftrim      <= 0   ;
        pllcontrol.fz_ldo_vinvoltsel   <= 0   ;
        pllcontrol.fz_lockcnt          <= 0   ;
        pllcontrol.fz_lockforce        <= 0   ;
        pllcontrol.fz_lockstickyb      <= 0   ;
        pllcontrol.fz_lockthresh       <= 0   ;
        pllcontrol.fz_lpfclksel        <= 0   ;
        pllcontrol.fz_nopfdpwrgate     <= 0   ;
        pllcontrol.fz_pfd_pw           <= 0   ;
        pllcontrol.fz_pfddly           <= 0   ;
        pllcontrol.fz_skadj            <= 0   ;
        pllcontrol.fz_spare            <= 0   ;
        pllcontrol.fz_startup          <= 0   ;
        pllcontrol.fz_tight_loopb      <= 0   ;
        pllcontrol.fz_vcosel           <= 0   ;
        pllcontrol.fz_vcotrim          <= 0   ;

        pllcontrol.idfx_fscan_byprstb           <=  0;
        pllcontrol.idfx_fscan_clkungate         <=  0;
        pllcontrol.idfx_fscan_mode              <=  0;
        pllcontrol.idfx_fscan_rstbypen          <=  0;
        pllcontrol.idfx_fscan_sdi               <=  0;
        pllcontrol.idfx_fscan_shiften           <=  0;
        pllcontrol.idvdisable_bi                <=  0;
        pllcontrol.idvfreqai                    <=  0;
        pllcontrol.idvfreqbi                    <=  0;
        pllcontrol.idvpulsei                    <=  0;
        pllcontrol.idvtclki                     <=  0;
        pllcontrol.idvtctrli                    <=  0;
        pllcontrol.idvtdi                       <=  0;
        pllcontrol.idvtresi                     <=  0;

        pllcontrol.ssc_frac_step                <=  0;
        pllcontrol.ssc_en                       <=  0;
        pllcontrol.ssc_cyc_to_peak_m1           <=  0;

    end

    else begin
    case (next_state)
    P_NOP: begin
        if(write_enable&&!pll_enable) begin
        pllcontrol.pllen               <= 1'b0;
        end  
    end
    P_IDLE:begin
        if(write_enable&&pll_enable) begin
        pllcontrol.pllen               <= 1'b1;
        
        pllcontrol.ratio               <= pllmap_i.ratio;
        pllcontrol.fraction            <= pllmap_i.fraction;
        pllcontrol.vcodiv_ratio        <= pllmap_i.vcodiv_ratio;
        pllcontrol.zdiv0_ratio         <= pllmap_i.zdiv0_ratio;
        pllcontrol.zdiv0_ratio_p5      <= pllmap_i.zdiv0_ratio_p5;
        pllcontrol.zdiv1_ratio         <= pllmap_i.zdiv1_ratio;
        pllcontrol.zdiv1_ratio_p5      <= pllmap_i.zdiv1_ratio_p5;
        pllcontrol.powergood_vnn       <= 1'b1;
        pllcontrol.mdiv_ratio          <= pllmap_i.mdiv_ratio;                
        end
    end
    endcase
    
    if(write_enable&&pll_enable) begin
            pllcontrol.tcapturedr                   <=  pllmap_i.tcapturedr                    ;
            pllcontrol.tck                          <=  pllmap_i.tck                           ;
            pllcontrol.tdi                          <=  pllmap_i.tdi                           ;
            pllcontrol.treg_en                      <=  pllmap_i.treg_en                       ;
            pllcontrol.trst_n                       <=  pllmap_i.trst_n                        ;
            pllcontrol.tshiftdr                     <=  pllmap_i.tshiftdr                      ;
            pllcontrol.tupdatedr                    <=  pllmap_i.tupdatedr                     ;

            pllcontrol.fz_cp1trim                   <=  pllmap_i.fz_cp1trim           ;
            pllcontrol.fz_cp2trim                   <=  pllmap_i.fz_cp2trim           ;
            pllcontrol.fz_cpnbias                   <=  pllmap_i.fz_cpnbias           ;
            pllcontrol.fz_dca_cb                    <=  pllmap_i.fz_dca_cb            ;
            pllcontrol.fz_dca_ctrl                  <=  pllmap_i.fz_dca_ctrl          ;
            pllcontrol.fz_irefgen                   <=  pllmap_i.fz_irefgen           ;
            pllcontrol.fz_irefgen                   <=  pllmap_i.fz_irefgen           ;
            pllcontrol.fz_ldo_bypass                <=  pllmap_i.fz_ldo_bypass        ;
            pllcontrol.fz_ldo_extrefsel             <=  pllmap_i.fz_ldo_extrefsel     ;
            pllcontrol.fz_ldo_faststart             <=  pllmap_i.fz_ldo_faststart     ;
            pllcontrol.fz_ldo_fbtrim                <=  pllmap_i.fz_ldo_fbtrim        ;
            pllcontrol.fz_ldo_reftrim               <=  pllmap_i.fz_ldo_reftrim       ;
            pllcontrol.fz_ldo_vinvoltsel            <=  pllmap_i.fz_ldo_vinvoltsel    ;
            pllcontrol.fz_lockcnt                   <=  pllmap_i.fz_lockcnt           ;
            pllcontrol.fz_lockforce                 <=  pllmap_i.fz_lockforce         ;
            pllcontrol.fz_lockstickyb               <=  pllmap_i.fz_lockstickyb       ;
            pllcontrol.fz_lockthresh                <=  pllmap_i.fz_lockthresh        ;
            pllcontrol.fz_lpfclksel                 <=  pllmap_i.fz_lpfclksel         ;
            pllcontrol.fz_nopfdpwrgate              <=  pllmap_i.fz_nopfdpwrgate      ;
            pllcontrol.fz_pfd_pw                    <=  pllmap_i.fz_pfd_pw            ;
            pllcontrol.fz_pfddly                    <=  pllmap_i.fz_pfddly            ;
            pllcontrol.fz_skadj                     <=  pllmap_i.fz_skadj             ;
            pllcontrol.fz_spare                     <=  pllmap_i.fz_spare             ;
            pllcontrol.fz_startup                   <=  pllmap_i.fz_startup           ;
            pllcontrol.fz_tight_loopb               <=  pllmap_i.fz_tight_loopb       ;
            pllcontrol.fz_vcosel                    <=  pllmap_i.fz_vcosel            ;
            pllcontrol.fz_vcotrim                   <=  pllmap_i.fz_vcotrim           ;

            pllcontrol.idfx_fscan_byprstb           <=  pllmap_i.idfx_fscan_byprstb            ;
            pllcontrol.idfx_fscan_clkungate         <=  pllmap_i.idfx_fscan_clkungate          ;
            pllcontrol.idfx_fscan_mode              <=  pllmap_i.idfx_fscan_mode               ;
            pllcontrol.idfx_fscan_rstbypen          <=  pllmap_i.idfx_fscan_rstbypen           ;
            pllcontrol.idfx_fscan_sdi               <=  pllmap_i.idfx_fscan_sdi                ;
            pllcontrol.idfx_fscan_shiften           <=  pllmap_i.idfx_fscan_shiften            ;
            pllcontrol.idvdisable_bi                <=  pllmap_i.idvdisable_bi                 ;
            pllcontrol.idvfreqai                    <=  pllmap_i.idvfreqai                     ;
            pllcontrol.idvfreqbi                    <=  pllmap_i.idvfreqbi                     ;
            pllcontrol.idvpulsei                    <=  pllmap_i.idvpulsei                     ;
            pllcontrol.idvtclki                     <=  pllmap_i.idvtclki                      ;
            pllcontrol.idvtctrli                    <=  pllmap_i.idvtctrli                     ;
            pllcontrol.idvtdi                       <=  pllmap_i.idvtdi                        ;
            pllcontrol.idvtresi                     <=  pllmap_i.idvtresi                      ;

            pllcontrol.ssc_frac_step                <=  pllmap_i.ssc_frac_step                 ;
            pllcontrol.ssc_en                       <=  pllmap_i.ssc_en                        ;
            pllcontrol.ssc_cyc_to_peak_m1           <=  pllmap_i.ssc_cyc_to_peak_m1            ;
        end
    end
end

endmodule
