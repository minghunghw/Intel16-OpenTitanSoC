///////////////////////////////////////////////////////////////////////////////
// Intel Confidential                                                        
///////////////////////////////////////////////////////////////////////////////
// Copyright 2021 Intel Corporation.                                         
// The information contained herein is the proprietary and confidential      
// information of Intel or its licensors, and is supplied subject to, and    
// may be used only in accordance with, previously executed agreements       
// with Intel ,                                                                                                   
// EXCEPT AS MAY OTHERWISE BE AGREED IN WRITING:                            
// (1) ALL MATERIALS FURNISHED BY INTEL HEREUNDER ARE PROVIDED "AS IS"      
//      WITHOUT WARRANTY OF ANY KIND;                            
// (2) INTEL SPECIFICALLY DISCLAIMS ANY WARRANTY OF NONINFRINGEMENT, FITNESS 
//      FOR A PARTICULAR PURPOSE OR MERCHANTABILITY; AND                     
// (3) INTEL WILL NOT BE LIABLE FOR ANY COSTS OF PROCUREMENT OF SUBSTITUTES, 
//      LOSS OF PROFITS, INTERRUPTION OF BUSINESS, OR                       
//      FOR ANY OTHER SPECIAL, CONSEQUENTIAL OR INCIDENTAL DAMAGES,        
//      HOWEVER CAUSED, WHETHER FOR BREACH OF WARRANTY, CONTRACT,            
//      TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE.
/// Description:
///
///   Reset test for LJPLL along with Tight Loop Long Mode (TLLM) enabled.
///
///=====================================================================================================================

///========================================================================================================
/// Initialize power domains + resets
///========================================================================================================
   // reset is down + bypass = 0, drive dfx bus inputs
   //
   pllen = 1'b0;
   ldo_enable = 1'b0;
   powergood_vnn = 1'b0;
   bypass   = 1'b0;
   dfx_in   = 'd0;
   mdiv_ratio = 6'b000000;


//   dut.tap_in   = 'd0;
//   dfx_in.fuse.tight_loop      = 1'b1;

   //`ifdef LJPLL_MSV
   `ifdef 1'b1
      dfx_in.fuse.tight_loop      = 1'b1;
      dfx_in.fuse.startup_rdac    = 3'b101; 
      dfx_in.fuse.pfd_chop_val    = 3'd0;
      dfx_in.fuse.pfd_residual_pw = 3'd1;
      dfx_in.fuse.cp1_trim        = 5'd12;
      dfx_in.fuse.cp2_trim        = 5'd13;
      dfx_in.fuse.lockthresh      = 4'd2;
      dfx_in.fuse.lockstickyb     = 1'd0;
      dfx_in.fuse.iref_ctune      = 3'd5;
      dfx_in.fuse.iref_ftune      = 4'd13;
      dfx_in.fuse.vco_trim_pg     = 4'd2;
      dfx_in.fuse.lpf_itrim       = 2'd1;
      dfx_in.fuse.sr_lpf_mode     = 2'b01;
      dfx_in.register.ssc_frac_step      = 24'd34952;
      dfx_in.fuse.fz_spare = 5'b01000;
      //SscCycToPeakm1              = 'd299;
      ssc_cyc_to_peak_m1              = 'd299;
   `else
      for (int i=0; i<$bits(dfx_in.fuse); ++i) begin
         dfx_in.fuse[i] = $dist_uniform(seed, 0, 1);
      end
	 dfx_in.fuse.fz_spare = 5'b01000;
      for (int i=0; i<$bits(dfx_in.register); ++i) begin
         dfx_in.register[i] = $dist_uniform(seed, 0, 1);
      end
      for (int i=0; i<$bits(ssc_cyc_to_peak_m1); ++i) begin
         ssc_cyc_to_peak_m1[i] = $dist_uniform(seed, 0, 1);
      end
   `endif
    if (~PostDistEnNH)
       dfx_in.fuse.tight_loop = 1'b1;
	 dfx_in.fuse.fz_spare = 5'b01000;
    if (dfx_in.fuse.start_mode)
      dfx_in.fuse.iref_mode = $dist_uniform(seed, 0, 3);
	 dfx_in.fuse.fz_spare = 5'b01000;

   `ifdef UPF
      // turn off vss domain
      //
      UPF::supply_on("vss", 0.0);
      
      // turn off vccpll domain
      //
      UPF::supply_off("vccpll");

      // turn off DIST domain
      //
      UPF::supply_off("vccdist");
      
      // turn off VREF domain
      //
      //UPF::supply_off("vccref");
   `else
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      vccpll  = 1'b0;
      //vccref  = 1'b0;
      vccdist = 1'b0;
   `endif
   `endif

   // powergood is down
   //
   //PllDistPwrGoodNnnnH = 1'b0;

   // Set Ref Clk Period
   //
   phase_clk_ref = 26041ps;

   // wait 4 ticks 
   //
   repeat(8) #(phase_clk_ref);


///========================================================================================================
/// Initialize inputs
///========================================================================================================

   // drive inputs
   //
   `ifdef LJPLL_MSV
      ratio    = 10'd125;
      mdiv_ratio = 6'b0;
      if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [SSC_EN] SSC will be enabled for this test!\n", $realtime());
         fraction = 24'd0;
         dfx_in.register.ssc_en = 1'b1;
      end else if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [FRAC_N] Frac-N will be enabled for this test! Fraction = 0.9\n", $realtime());
         // 0.9
         //
         fraction = 24'd15099494;
      end else if (~SYNC_GEN_EN) begin
         dfx_in.register.ssc_en = 1'b0;
         fraction = 24'd0;
         $display("[%.0f ps] [INFO] [SSC_FRAC_N_DISABLE] SSC/Frac-N will be off for this test\n", $realtime());
      end
   `else
      if (!($value$plusargs("ratio=%d",ratio))) begin
         ratio    = $dist_uniform(seed, 0, {8{1'b1}});
      end
      if (!($value$plusargs("fraction=%d",fraction))) begin
         fraction = $dist_uniform(seed, 0, {24{1'b1}});
      end
   `endif
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF] SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
      fraction          = 24'b0;
      dfx_in.register.ssc_en = 1'b0;
   end
   `ifndef LJPLL_MSV
   else begin 
      max_ratio = '1;
      min_ratio = {8'd2 , 24'd0};
      use_mash_ssc = (fraction!=24'd0) || $dist_uniform(seed,0,1);
      // If the mash modulator is in use, the SSC min and max ratios should
      // take into account the maximum mash induced offset
      //   for order 3 MASH the range of the deltas are : [-3, +4]
      //   for order 2 MASH the range of the deltas are : [-1, +2]
      //
      //   The deltas are divided by 2 because we have an exact half
      //   integer feedback divider
      //
      if (use_mash_ssc) begin
         max_ratio = max_ratio - (dfx_in.fuse.mash_order_plus_one ? {8'd2,24'd0}  : {8'd1,24'd0});
         min_ratio = min_ratio + (dfx_in.fuse.mash_order_plus_one ? {8'd1,24'd0}  : {8'd0,1'b1,23'd0});
      end
      if ({ratio, fraction} > max_ratio)
         {ratio, fraction} = max_ratio;
      else if ({ratio, fraction} < min_ratio)
         {ratio, fraction} = min_ratio;

      upspread_range   = max_ratio - {ratio, fraction};
      downspread_range = {ratio, fraction} - min_ratio;
      if (upspread_range < downspread_range)
         centerspread_range = 2 * upspread_range;
      else
         centerspread_range = 2 * downspread_range;

      $display("[%.0f ps] [INFO] [SSC_RANGE] Center: %d\n", $realtime(), centerspread_range);
      $display("[%.0f ps] [INFO] [SSC_RANGE] Down  : %d\n", $realtime(), downspread_range);
      $display("[%.0f ps] [INFO] [SSC_RANGE] Up    : %d\n", $realtime(), upspread_range);
      $display("[%.0f ps] [INFO] [SSC_RAND] Use SSC Mash : %b\n", $realtime(), use_mash_ssc);
   end

   if (dfx_in.register.ssc_en) begin
      tmp = '0;
      // if downspread
      if (dfx_in.register.ssc_mode == 2'b00) begin
         if (use_mash_ssc) begin
            // we can go anywhere in the downspread range
            //
            tmp = $dist_uniform(seed, 0, downspread_range / (ssc_cyc_to_peak_m1 + 1));
         end else begin
            tmp[31:24] = $dist_uniform(seed, 0, downspread_range[31:24] / (ssc_cyc_to_peak_m1 + 1)); // 0 to x steps
         end
      end else if (dfx_in.register.ssc_mode==2'b01) begin
         if (use_mash_ssc) begin
            // we can go anywhere in the upspread range
            //
            tmp = $dist_uniform(seed, 0, upspread_range / (ssc_cyc_to_peak_m1 + 1));
         end else begin
            tmp[31:24] = $dist_uniform(seed, 0, upspread_range[31:24] / (ssc_cyc_to_peak_m1 + 1)); // 0 to x steps
         end
      end
      else begin
         if (use_mash_ssc) begin
            // we can go anywhere in the centerspread range
            //
            tmp = $dist_uniform(seed, 0, centerspread_range / (ssc_cyc_to_peak_m1 + 1));
         end else begin
            tmp[31:24] = $dist_uniform(seed, 0, centerspread_range[31:24] / (ssc_cyc_to_peak_m1 + 1)); // 0 to x steps
         end
      end
      //{dfx_in.register.ssc_ratio_step, dfx_in.register.ssc_frac_step} = tmp;
      {dfx_in.register.ssc_ratio_step, dfx_in.register.ssc_frac_step} = tmp;
   end
   `endif
      
   // drive inputs - ND
   //
   `ifdef LJPLL_MSV
      zdiv0_ratio    = 10'd125;
      zdiv0_ratio_p5 = 0;

      if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [SSC_EN] SSC will be enabled for this test!\n", $realtime());
         fraction = 24'd0;
         dfx_in.register.ssc_en = 1'b1;
      end else if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [FRAC_N] Frac-N will be enabled for this test! Fraction = 0.9\n", $realtime());
         // 0.9
         //
         fraction = 24'd15099494;
      end else if (~SYNC_GEN_EN) begin
         dfx_in.register.ssc_en = 1'b0;
         fraction = 24'd0;
         $display("[%.0f ps] [INFO] [SSC_FRAC_N_DISABLE] SSC/Frac-N will be off for this test\n", $realtime());
      end
   `else
      zdiv0_ratio_p5 = 0;
      if (!($value$plusargs("zdiv0_ratio=%d",zdiv0_ratio))) begin
         zdiv0_ratio    = $dist_uniform(seed, 0, {8{1'b1}});
      end
      if (!($value$plusargs("fraction=%d",fraction))) begin
         fraction = $dist_uniform(seed, 0, {24{1'b1}});
      end
   `endif
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF] SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
      fraction          = 24'b0;
      dfx_in.register.ssc_en = 1'b0;
   end
   `ifndef LJPLL_MSV
   else begin
      max_ratio = '1;
      min_ratio = {8'd2 , 24'd0};
      zdiv0_ratio_p5 = 0;
      use_mash_ssc = (fraction!=24'd0) || $dist_uniform(seed,0,1);
      // If the mash modulator is in use, the SSC min and max ratios should
      // take into account the maximum mash induced offset
      //   for order 3 MASH the range of the deltas are : [-3, +4]
      //   for order 2 MASH the range of the deltas are : [-1, +2]
      //
      //   The deltas are divided by 2 because we have an exact half
      //   integer feedback divider
      //
      if (use_mash_ssc) begin
         max_ratio = max_ratio - (dfx_in.fuse.mash_order_plus_one ? {8'd2,24'd0}  : {8'd1,24'd0});
         min_ratio = min_ratio + (dfx_in.fuse.mash_order_plus_one ? {8'd1,24'd0}  : {8'd0,1'b1,23'd0});
      end
      if ({zdiv0_ratio, fraction} > max_ratio)
         {zdiv0_ratio, fraction} = max_ratio;
      else if ({zdiv0_ratio, fraction} < min_ratio)
         {zdiv0_ratio, fraction} = min_ratio;

      upspread_range   = max_ratio - {zdiv0_ratio, fraction};
      downspread_range = {zdiv0_ratio, fraction} - min_ratio;
      if (upspread_range < downspread_range)
         centerspread_range = 2 * upspread_range;
      else
         centerspread_range = 2 * downspread_range;

      $display("[%.0f ps] [INFO] [SSC_RANGE] Center: %d\n", $realtime(), centerspread_range);
      $display("[%.0f ps] [INFO] [SSC_RANGE] Down  : %d\n", $realtime(), downspread_range);
      $display("[%.0f ps] [INFO] [SSC_RANGE] Up    : %d\n", $realtime(), upspread_range);
      $display("[%.0f ps] [INFO] [SSC_RAND] Use SSC Mash : %b\n", $realtime(), use_mash_ssc);
   end
   `endif



  // drive inputs - ND
   //
   `ifdef LJPLL_MSV
      zdiv1_ratio    = 10'd125;
      zdiv1_ratio_p5 = 0;
      if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [SSC_EN] SSC will be enabled for this test!\n", $realtime());
         fraction = 24'd0;
         dfx_in.register.ssc_en = 1'b1;
      end else if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [FRAC_N] Frac-N will be enabled for this test! Fraction = 0.9\n", $realtime());
         // 0.9
         //
         fraction = 24'd15099494;
      end else if (~SYNC_GEN_EN) begin
         dfx_in.register.ssc_en = 1'b0;
         fraction = 24'd0;
         $display("[%.0f ps] [INFO] [SSC_FRAC_N_DISABLE] SSC/Frac-N will be off for this test\n", $realtime());
      end
   `else
      zdiv1_ratio_p5 = 0;
      if (!($value$plusargs("zdiv1_ratio=%d",zdiv1_ratio))) begin
         zdiv1_ratio    = $dist_uniform(seed, 0, {8{1'b1}});
      end
      if (!($value$plusargs("fraction=%d",fraction))) begin
         fraction = $dist_uniform(seed, 0, {24{1'b1}});
      end
   `endif
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF] SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
      fraction          = 24'b0;
      dfx_in.register.ssc_en = 1'b0;
   end
   `ifndef LJPLL_MSV
   else begin
      max_ratio = '1;
      min_ratio = {8'd2 , 24'd0};
      zdiv1_ratio_p5 = 0;
      use_mash_ssc = (fraction!=24'd0) || $dist_uniform(seed,0,1);
      // If the mash modulator is in use, the SSC min and max ratios should
      // take into account the maximum mash induced offset
      //   for order 3 MASH the range of the deltas are : [-3, +4]
      //   for order 2 MASH the range of the deltas are : [-1, +2]
      //
      //   The deltas are divided by 2 because we have an exact half
      //   integer feedback divider
      //
      if (use_mash_ssc) begin
         max_ratio = max_ratio - (dfx_in.fuse.mash_order_plus_one ? {8'd2,24'd0}  : {8'd1,24'd0});
         min_ratio = min_ratio + (dfx_in.fuse.mash_order_plus_one ? {8'd1,24'd0}  : {8'd0,1'b1,23'd0});
      end
      if ({zdiv1_ratio, fraction} > max_ratio)
         {zdiv1_ratio, fraction} = max_ratio;
      else if ({zdiv1_ratio, fraction} < min_ratio)
         {zdiv1_ratio, fraction} = min_ratio;

      upspread_range   = max_ratio - {zdiv1_ratio, fraction};
      downspread_range = {zdiv1_ratio, fraction} - min_ratio;
      if (upspread_range < downspread_range)
         centerspread_range = 2 * upspread_range;
      else
         centerspread_range = 2 * downspread_range;

      $display("[%.0f ps] [INFO] [SSC_RANGE] Center: %d\n", $realtime(), centerspread_range);
      $display("[%.0f ps] [INFO] [SSC_RANGE] Down  : %d\n", $realtime(), downspread_range);
      $display("[%.0f ps] [INFO] [SSC_RANGE] Up    : %d\n", $realtime(), upspread_range);
      $display("[%.0f ps] [INFO] [SSC_RAND] Use SSC Mash : %b\n", $realtime(), use_mash_ssc);
   end
   `endif






   $display("[%.0f ps] [INFO] [FUSE]     Fuse Bus:     %x\n", $realtime(), dfx_in.fuse);
   $display("[%.0f ps] [INFO] [REGISTER] Register Bus: %x\n", $realtime(), dfx_in.register);
   $display("[%.0f ps] [INFO] [REGISTER] ssc_cyc_to_peak_m1: %x\n", $realtime(), ssc_cyc_to_peak_m1);
  

   $display("[%.0f ps] [INFO] [RATIO] Ratio: %d\n", $realtime(), ratio);
   $display("[%.0f ps] [INFO] [ZDIV0_RATIO] Ratio: %d\n", $realtime(), zdiv0_ratio);
   $display("[%.0f ps] [INFO] [ZDIV1_RATIO] Ratio: %d\n", $realtime(), zdiv1_ratio);

   $display("[%.0f ps] [INFO] [FRACTION] Fraction: %d\n", $realtime(), fraction);

   // wait 4 ticks 
   //
   repeat(8) #(phase_clk_ref);

///========================================================================================================
/// Bring ANA domains up and stop RO
///========================================================================================================
   
   `ifdef UPF
      // bring up vref supply
      //
      UPF::supply_on("vccdist", 0.74);
      //UPF::supply_on("vccref", 0.74);
  
      // wait 4 ticks 
      //
      repeat(8) #(phase_clk_ref);

      // bring up analog supply
      //
      UPF::supply_on("vccpll", 0.74);
      
   `else
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      vccdist = 1'b1;
      //vccref  = 1'b1;
      
      // wait 4 ticks 
      //
      repeat(8) #(phase_clk_ref);

      vccpll = 1'b1;
   `endif
   `endif
  
   // start ref
   //
   enable_ref = 1'b1;
   
   // wait 4 ticks 
   //
   repeat(8) #(phase_clk_ref);

   // Bring up powergood
   //
   //PllDistPwrGoodNnnnH = 1'b1;
  
   // FIXME: add checking for toggling on clkpllmh after powergood assertion

   // wait 5 ticks 
   //
   repeat(10) #(phase_clk_ref);

///========================================================================================================
/// Start PLL (enable)
///========================================================================================================
   #(phase_clk_ref);
   
   // deassert reset
   //
   pllen    <= 1'b1;
   #1
   ldo_enable   <= 1'b1;
   powergood_vnn   <= 1'b1;
   dfx_in.fuse.fz_spare <= 5'b01000;
 
   $display("[%.0f ps] [INFO] [PLL ENABLE] PLL Enabled\n", $realtime());

   //repeat(5729) #(phase_clk_ref);
   //bypass <= 1'b0;

   fork
      begin
         @(posedge lock);
         disable LOCK_TIMEOUT;
      end
      begin : LOCK_TIMEOUT
         @(posedge dut.reset_sync__Reset_b_XXnnnL);
         repeat(190 * 2) #(phase_clk_ref);
         $display("[%.0f ps] [ERROR] [LOCK_TIMEOUT] Lock timed out - did not meet lock spec!\n", $realtime());
         exit_code |= 1;
      end   : LOCK_TIMEOUT
   join_any

   #1;
   
   //if (lock === 1'b1) begin
   if ((lock === 1'b1) && (bypass === 1'b0)) begin
         $display("[%.0f ps] [INFO] [LOCK_TIME] Lock Time: %.0f ps\n", $realtime(), lock_time);
         $display("[%.0f ps] [INFO] [CLKOUT_PERIOD] Clock Output Period @ Lock Time: %.0f ps  Expected: %.0f ps\n", $realtime(), clk_out_period_at_lock, expected_clk_out_period);
   end

   //if (clk_out_period_at_lock > (expected_clk_out_period + 800ps) ||
   //    clk_out_period_at_lock < (expected_clk_out_period - 800ps)) begin
   if ((clk_out_period_at_lock > (expected_clk_out_period + 800ps) ||
       clk_out_period_at_lock < (expected_clk_out_period - 800ps)) && (bypass === 1'b0)) begin
         
         $display("[%.0f ps] [ERROR] [OUTPUT_FREQ_ERROR] Output period (%.0f ps) is not within +/- 800ps of the expected output frequency!, Expected Output Period: %.0f ps\n", $realtime(), clk_out_period_at_lock, expected_clk_out_period);
         exit_code |= 1;

   end

	//BYPASS mode
   if ((lock === 1'b1) && (bypass === 1'b1)) begin
         $display("[%.0f ps] [INFO] [CLKOUT_PERIOD] Clock Output Period @ Lock Time: %.0f ps  Expected: %.0f ps\n", $realtime(), clk_out_period_at_lock, period_clk_ref);
   end
///========================================================================================================
/// Run PLL for 8 ref clk cycles (allow runtime assertions to fire)
///========================================================================================================

repeat (8) @(posedge clkref);

   if (dfx_in.register.ssc_en) begin
      repeat(2*(ssc_cyc_to_peak_m1+1) + 10) @(posedge clkref);
   end


