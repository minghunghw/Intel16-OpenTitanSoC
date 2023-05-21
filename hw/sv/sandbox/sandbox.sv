module sandbox (
    output [31:0] dq,
    output [31:0] drv0,
    output [31:0] drv1,
    output [31:0] drv2,
    output [31:0] enabq,
    output [31:0] enq,
    input  [31:0] outi,
    output [31:0] pd,
    output [31:0] ppen,
    output [31:0] prg_slew,
    output [31:0] puq,
    output [31:0] pwrup_pull_en,
    output [31:0] pwrupzhl
);

// decoder signals
logic               clk;
logic               rst_n;
logic               valid;
logic [4:0]         addr;
logic [9:0]         data;
logic [2:0][9:0]    reg_ratio;
logic               reg_pllen;
logic [1:0]         reg_vcodiv;
logic               reg_idfx_fscan_rstbypen;
logic               reg_bypass;
logic [31:0][2:0]   reg_trngsel;
logic [15:0]        reg_noisesel;

// trng siganls
logic               clktrng;
logic               clkro;

// pll signals
logic               clkref;
logic               lock;
logic               clkpll;
logic               clkpll0;
logic               clkpll1;

// noise signals
logic               clknoise;
logic [3:0]         VB; 
logic               Iout;

// pad mapping
// 0:       clk         , in
// 1:       rst_n       , in
// 2:       valid       , in
// 7-3:     addr[4:0]   , in
// 17-8:    data[9:0]   , in
// 18:      clktrng     , in
// 19:      clkro       , out
// 20:      clkref      , in
// 21:      lock        , out
// 22:      clkpll      , out
// 23:      clkpll0     , out
// 24:      clkpll1     , out
// 25:      clknoise    , in
// 29-26:   VB[3:0]     , in
// 30:      IOUT        , out

decoder u_decoder (
    .*
);

trng u_trng (
    .clk        (clktrng        ),
    .sel        (reg_trngsel    ),
    .clk_ro     (clkro          ),
    .dout       (               )
);

ringpll u_ringpll (
    .powergood_vnn             ( 1'b1                     ),    
    .ldo_vref                  ( 1'b0                     ),
    .ldo_enable                ( 1'b0                     ),
    .fz_ldo_vinvoltsel         ( 2'b0                     ),
    .fz_ldo_faststart          ( 1'b0                     ),
    .fz_ldo_bypass             ( 1'b1                     ),
    .fz_ldo_extrefsel          ( 1'b1                     ),
    .fz_ldo_fbtrim             ( 4'd2                     ),
    .fz_ldo_reftrim            ( 4'hA                     ),
    .clkref                    ( clkref                   ),
    .bypass                    ( reg_bypass               ),
    .pllen                     ( reg_pllen                ),
    .pllfwen_b                 ( 1'b0                     ),
    .ratio                     ( reg_ratio[0]             ),
    .fraction                  ( 24'b0                    ),
    .mdiv_ratio                ( 6'b0                     ),
    .mash_order_plus_one       ( 1'b0                     ),
    .ssc_cyc_to_peak_m1        ( 9'h1D8                   ),
    .ssc_en                    ( 1'b0                     ),
    .ssc_frac_step             ( 24'hE6829A               ),
    .vcodiv_ratio              ( reg_vcodiv               ),
    .zdiv0_ratio               ( reg_ratio[1]             ),
    .zdiv0_ratio_p5            ( 1'b0                     ),
    .zdiv1_ratio               ( reg_ratio[2]             ),
    .zdiv1_ratio_p5            ( 1'b0                     ),
    .fz_cp1trim                ( 5'h6                     ),
    .fz_cp2trim                ( 5'h14                    ),
    .fz_cpnbias                ( 2'd1                     ),
    .fz_dca_cb                 ( 2'b0                     ),
    .fz_dca_ctrl               ( 6'h25                    ),
    .fz_irefgen                ( 5'h1A                    ),
    .fz_lockcnt                ( 3'h4                     ),
    .fz_lockforce              ( 1'b1                     ),
    .fz_lockstickyb            ( 1'b0                     ),
    .fz_lockthresh             ( 4'hC                     ),
    .fz_lpfclksel              ( 1'b0                     ),
    .fz_nopfdpwrgate           ( 1'b1                     ),
    .fz_pfd_pw                 ( 3'b0                     ),
    .fz_pfddly                 ( 2'd3                     ),
    .fz_skadj                  ( 5'h1C                    ),
    .fz_spare                  ( 5'b0                     ),
    .fz_startup                ( 6'h9                     ),
    .fz_tight_loopb            ( 1'b0                     ),
    .fz_vcosel                 ( 1'b1                     ),
    .fz_vcotrim                ( 11'h3C9                  ),
    .idvdisable_bi             ( 1'b0                     ),
    .idvfreqai                 ( 1'b0                     ),
    .idvfreqbi                 ( 1'b0                     ),
    .idvpulsei                 ( 1'b0                     ),
    .idvtclki                  ( 1'b0                     ),
    .idvtctrli                 ( 1'b0                     ),
    .idvtdi                    ( 1'b0                     ),
    .idvtresi                  ( 1'b0                     ),
    .tck                       ( 1'b0                     ),
    .tcapturedr                ( 1'b0                     ),
    .tdi                       ( 1'b0                     ),
    .treg_en                   ( 1'b0                     ),
    .trst_n                    ( 1'b0                     ),
    .tshiftdr                  ( 1'b0                     ),
    .tupdatedr                 ( 1'b0                     ),
    .idfx_fscan_sdi            ( 3'b0                     ),
    .idfx_fscan_mode           ( 1'b0                     ),
    .idfx_fscan_shiften        ( 1'b0                     ),
    .idfx_fscan_rstbypen       ( reg_idfx_fscan_rstbypen  ),
    .idfx_fscan_byprstb        ( 1'b0                     ),
    .idfx_fscan_clkungate      ( 1'b0                     ),
    .clkpostdist               ( 1'b0                     ),
    .lock                      ( lock                     ),
    .clkpll                    ( clkpll                   ),
    .clkpll0                   ( clkpll0                  ),
    .clkpll1                   ( clkpll1                  )
);

Noise_injection_block_Stuck u_noise (
    .Random     (clknoise       ),
    .S          (reg_noisesel   ),
    .VB         (VB             ),
    .Iout       (Iout           )
);

xbar_west u_xbar_west (
    .*
);

endmodule