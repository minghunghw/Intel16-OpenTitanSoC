`ifndef MASH_MOD_TB_SV
`define MASH_MOD_TB_SV

//`include "mash_mod.sv"
//`include "ssc_mod.sv"

module mash_mod_tb();

   localparam RATIO_BITS = 8;
   localparam FRAC_BITS  = 24;
   localparam ORDER      = 2;
   localparam FMOD_BITS  = 9;

   real  Expected;
   real  RatioSum;
   int    NumRatios;
   real  RatioAvg;

   bit                      ssc_mod_dfx__ClkModMXH;
   logic                    reset_sync__Reset_b_XXnnnL;
   logic                    EarlyLockXXnnnH;
   logic                    lock;
   logic                    dfx__mash_order_plus_one;
   logic [RATIO_BITS-1:0]   dfx__ratio;
   logic [FRAC_BITS-1:0]    dfx__fraction;
  
   logic [RATIO_BITS-1:0]   dfx__RatioStepNH;
   logic [FRAC_BITS-1:0]    dfx__FracStepNH;
   logic                    dfx__ssc_en;
   logic [1:0]              dfx__ssc_mode;
   logic [FMOD_BITS-1:0]    dfx__ssc_cyc_to_peak_m1;
   logic [RATIO_BITS-1:0]   ssc__RatioMXH;
   logic [FRAC_BITS-1:0]    ssc__FractionMXH;
   
   logic [RATIO_BITS-1:0]   mash__RatioMXH;
   logic                    mash__HalfIntMXH;
   logic                    mash__PllModOnNH;
   logic                    ssc__ReloadMXH;
   
   // FIXME: this needs to be parameterized
   //
   assign dfx__ssc_en             = 1'b0;
   assign dfx__ssc_mode           = 2'b00;
   assign dfx__RatioStepNH        = '0;
   assign dfx__FracStepNH         = 34779;
   assign dfx__ssc_cyc_to_peak_m1 = 9'd299;

   // SSC Modulator
   //
   ssc_mod #(.FRAC_BITS(FRAC_BITS),
             .RATIO_BITS(RATIO_BITS),
             .FMOD_BITS(FMOD_BITS))
   ssc_mod ( .* );

   // MASH modulator
   //
   mash_mod #(.FRAC_BITS(FRAC_BITS),
              .RATIO_BITS(RATIO_BITS),
              .ORDER(ORDER))
   mash_mod ( .* );

   // Generate a running average of the ratio
   //
   always_ff @(posedge ssc_mod_dfx__ClkModMXH) begin
      if (lock) begin
         RatioSum <= RatioSum + mash__RatioMXH + ((mash__HalfIntMXH) ? 0.5 : 0);
         NumRatios <= NumRatios + 1;
      end
   end

   always_comb RatioAvg = RatioSum / NumRatios;

   //always @(RatioAvg) begin
   //   //$display("[%t] [INFO] RATIO SUM     : %f", $realtime(), RatioSum);
   //   //$display("[%t] [INFO] NUM RATIOS    : %d", $realtime(), NumRatios);
   //   $display("[%t] [INFO] RATIO AVERAGE : %f", $realtime(), RatioAvg);
   //end

   // Clock Gen
   //
   always ssc_mod_dfx__ClkModMXH = #10 ~ssc_mod_dfx__ClkModMXH;

   initial begin
      $fsdbDumpvars(0, mash_mod_tb, "+all");
      
      $display("SEED: %d", $get_initial_random_seed());
      
      $display("[%t] [INFO] RATIO BITS    : %d", $realtime(), RATIO_BITS);
      $display("[%t] [INFO] FRAC_BITS     : %d", $realtime(), FRAC_BITS );
      $display("[%t] [INFO] ORDER         : %d", $realtime(), ORDER);
      
      EarlyLockXXnnnH            = 1'b0;
      lock                 = 1'b0;
      reset_sync__Reset_b_XXnnnL = 1'b0;
      dfx__mash_order_plus_one   = $dist_uniform($get_initial_random_seed(), 0, 1);
      dfx__ratio                 = $dist_uniform($get_initial_random_seed(), 1<<(ORDER-1+dfx__mash_order_plus_one-1), (1 << RATIO_BITS) - 1'b1);
      dfx__fraction              = $dist_uniform($get_initial_random_seed(), 0, (1 << FRAC_BITS)  - 1'b1);
      Expected                   = dfx__ratio + real'(dfx__fraction) / (1 << FRAC_BITS);
      
      $display("[%t] [INFO] MASH ORDER + 1: %d", $realtime(), dfx__mash_order_plus_one);
      $display("[%t] [INFO] RATIO         : %d", $realtime(), dfx__ratio);
      $display("[%t] [INFO] FRACTION      : %d", $realtime(), dfx__fraction);
      $display("[%t] [INFO] EXPECTED      : %f", $realtime(), Expected);

      repeat(5) @(negedge ssc_mod_dfx__ClkModMXH);
     
      // Deassert Reset
      //
      reset_sync__Reset_b_XXnnnL = 1'b1;
      
      
      repeat(2000) @(negedge ssc_mod_dfx__ClkModMXH);
      
      EarlyLockXXnnnH = 1'b1;
      lock = 1'b1;
      
      repeat(15000) @(negedge ssc_mod_dfx__ClkModMXH);

      $display("[%t] [INFO] RATIO AVERAGE : %f", $realtime(), RatioAvg);

      $finish();
   end

endmodule

`endif
