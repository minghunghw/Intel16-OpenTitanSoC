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
///---------------------------------------------------------------------------------------------------------------------
/// Description:
///
///   Reset test for LJPLL
///
///=====================================================================================================================

///========================================================================================================
/// Initialize power domains + resets
///========================================================================================================
   
   // reset is down + bypass = 0, drive dfx bus inputs
   //
   pllen = 1'b0;
   bypass   = 1'b0;
   dfx_in   = '0;
      dfx_in.fuse.tight_loop      = 1'b1;
      dfx_in.fuse.startup_rdac    = 3'b101; 
      dfx_in.fuse.pfd_chop_val    = 3'd0;
      dfx_in.fuse.pfd_residual_pw = 3'd1;
      dfx_in.fuse.cp1_trim        = 5'd12;
      dfx_in.fuse.cp2_trim        = 5'd13;
      dfx_in.fuse.lockthresh      = 4'hF;
      dfx_in.fuse.iref_ctune      = 3'd5;
      dfx_in.fuse.iref_ftune      = 4'd13;
      dfx_in.fuse.vco_trim_pg     = 4'd2;
      dfx_in.fuse.lpf_itrim       = 2'd1;
      dfx_in.fuse.sr_lpf_mode     = 2'b01;
      //dfx_in.register.ssc_frac_step      = 24'd34952;
      ssc_frac_step      = 24'd34952;
      //SscCycToPeakm1              = 'd299;
      ssc_cyc_to_peak_m1              = 'd299;
    if (~PostDistEnNH)
       dfx_in.fuse.tight_loop = 1'b1;
    if (dfx_in.fuse.start_mode)
      dfx_in.fuse.iref_mode = $dist_uniform(seed, 0, 3);
    if (!($value$plusargs("order=%b",dfx_in.fuse.mash_order_plus_one))) begin
      dfx_in.fuse.mash_order_plus_one     = 1'b1;
    end

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
      ratio    = 8'd125;
      if ($test$plusargs("fraction") || (~SYNC_GEN_EN && $dist_uniform(seed,0,1))) begin
         if (!($value$plusargs("fraction=%d",fraction))) begin
            // 0.9
            //
            fraction = 24'd15099494;
         end
         $display("[%.0f ps] [INFO] [FRAC_N] Frac-N will be enabled for this test! Fraction = %d\n", $realtime(), fraction);
      end else if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [SSC_EN] SSC will be enabled for this test!\n", $realtime());
         fraction = 24'd0;
         dfx_in.register.ssc_en = 1'b1;
      end else if (~SYNC_GEN_EN) begin
         dfx_in.register.ssc_en = 1'b0;
         fraction = 24'd0;
         $display("[%.0f ps] [INFO] [SSC_FRAC_N_DISABLE] SSC/Frac-N will be off for this test\n", $realtime());
      end
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF] SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
      fraction          = 24'b0;
      dfx_in.register.ssc_en = 1'b0;
   end
      
   $display("[%.0f ps] [INFO] [SSC] MASH ORDER + 1: %d", $realtime(), dfx_in.fuse.mash_order_plus_one);
   $display("[%.0f ps] [INFO] [FUSE]     Fuse Bus:     %x\n", $realtime(), dfx_in.fuse);
   $display("[%.0f ps] [INFO] [REGISTER] Register Bus: %x\n", $realtime(), dfx_in.register);
   $display("[%.0f ps] [INFO] [REGISTER] ssc_cyc_to_peak_m1: %x\n", $realtime(), ssc_cyc_to_peak_m1);
  

   $display("[%.0f ps] [INFO] [RATIO] Ratio: %d\n", $realtime(), ratio);
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
   
   $display("[%.0f ps] [INFO] [PLL ENABLE] PLL Enabled\n", $realtime());

   fork
      begin
         @(posedge lock);
         disable LOCK_TIMEOUT;
      end
      begin : LOCK_TIMEOUT
    	 @(posedge dut.reset_sync__Reset_b_XXnnnL);
         repeat(190 * 2) #(phase_clk_ref);
         $display("[%.0f ps] [ERROR] [LOCK_TIMEOUT] Lock timed out - did not meet lock spec!\n", $realtime());
      end   : LOCK_TIMEOUT
   join_any

   #1;
   
   if (lock === 1'b1) begin
         $display("[%.0f ps] [INFO] [LOCK_TIME] Lock Time: %.0f ps\n", $realtime(), lock_time);
         $display("[%.0f ps] [INFO] [CLKOUT_PERIOD] Clock Output Period @ Lock Time: %.0f ps  Expected: %.0f ps\n", $realtime(), clk_out_period_at_lock, expected_clk_out_period);
         if (dfx_in.register.ssc_en) begin
            repeat(2*(ssc_cyc_to_peak_m1+1) + 10) @(posedge clkref);
         end else if (|fraction) begin
            repeat(1000) @(posedge clkref);
         end
   end

   if (clk_out_period_at_lock > (expected_clk_out_period + 800ps) ||
       clk_out_period_at_lock < (expected_clk_out_period - 800ps)) begin
         
         $display("[%.0f ps] [ERROR] [OUTPUT_FREQ_ERROR] Output period (%.0f ps) is not within +/- 800ps of the expected output frequency!, Expected Output Period: %.0f ps\n", $realtime(), clk_out_period_at_lock, expected_clk_out_period);

   end

///========================================================================================================
/// Run PLL for 8 ref clk cycles (allow runtime assertions to fire)
///========================================================================================================

repeat (8) @(posedge clkref);

