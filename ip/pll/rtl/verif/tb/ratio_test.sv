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
///   Reset test for LJPLL
///
///=====================================================================================================================

///========================================================================================================
/// Initialize power domains + resets
///========================================================================================================
   // reset is down + bypass = 0, drive dfx bus inputs
   //
   pllen = 1'b0;
   ldo_enable = 1'b0;
   pllfwen_b = 1'b1;
   powergood_vnn = 1'b0;
   bypass   = 1'b0;
   dfx_in   = '0;
//   dut.tap_in   = '0;
mdiv_ratio = 6'b000000;
dfx_in.fuse.tight_loop = 1'b0;


   `ifdef LJPLL_MSV
       //dfx_in.fuse.startup_rdac = 3'b101;
       //dfx_in.fuse.lpf_itrim    = 2'b10;
       //dfx_in.fuse.vco_trim_pg  = 3'b101;
       //dfx_in.fuse.iref_trim    = 3'b101;
       //dfx_in.fuse.iref_rmode   = 2'b10;
       //dfx_in.fuse.cp1_trim     = 4'b0110;
       //dfx_in.fuse.cp2_trim     = 4'b0110;
       //dfx_in.fuse.startcnt     = 3'b011;
       //dfx_in.fuse.lockthresh   = 3'b011;
   `else
      for (int i=0; i<$bits(dfx_in.fuse); ++i) begin
         dfx_in.fuse[i] = $dist_uniform(seed, 0, 1);
      end
      dfx_in.fuse.fz_lockcnt = 3'b0;
	dfx_in.fuse.tight_loop = 1'b0;
   `endif
	 //dfx_in.fuse.fz_spare = 5'b00000;
   $display("[%.0f ps] [INFO] [FUSE] Fuse Bus: %x\n", $realtime(), dfx_in.fuse);
   
   `ifdef UPF
      // turn off vss domain
      //
      //UPF::supply_off("vss");
      
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
   //`ifdef LJPLL_USE_PWR_PINS
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
   phase_clk_ref = 26.041ns;

   // wait 4 ticks 
   //
   repeat(8) #(phase_clk_ref);

///========================================================================================================
/// Initialize inputs
///========================================================================================================
   
   // drive inputs
   //
   ratio    = TestRatioNH; //$dist_uniform(seed, 2, ((1 << 7) - 1'b1));
   fraction = '0; // $dist_uniform(seed, 0, 1);
   dfx_in.fuse.tight_loop = 1'b0;

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
   //`ifdef LJPLL_USE_PWR_PINS
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

   // deassert reset
   //
   ldo_enable = 1'b1;
   powergood_vnn = 1'b1;
   repeat(5) #(phase_clk_ref);
   pllfwen_b = 1'b0;
   repeat(5) #(phase_clk_ref);
   pllen    = 1'b1;
   #1
   
   $display("[%.0f ps] [INFO] [PLL ENABLE] PLL Enabled\n", $realtime());

   fork
      begin
         @(posedge lock);
         disable LOCK_TIMEOUT;
      end
      begin : LOCK_TIMEOUT
	@(posedge dut.reset_sync__Reset_b_XXnnnL);
         repeat(179 * 2) #(phase_clk_ref);
         $display("[%.0f ps] [ERROR] [LOCK_TIMEOUT] Lock timed out - did not meet lock spec!\n", $realtime());
      end   : LOCK_TIMEOUT
   join_any

   #1;
   
   if (lock === 1'b1) begin
         $display("[%.0f ps] [INFO] [LOCK_TIME] Lock Time: %.0f ps\n", $realtime(), lock_time);
         $display("[%.0f ps] [INFO] [CLKOUT_PERIOD] Clock Output Period @ Lock Time: %.0f ps  Expected: %.0f ps\n", $realtime(), clk_out_period_at_lock, expected_clk_out_period);
   end

   if (clk_out_period_at_lock > (expected_clk_out_period + 800ps) ||
       clk_out_period_at_lock < (expected_clk_out_period - 800ps)) begin
         
         $display("[%.0f ps] [ERROR] [OUTPUT_FREQ_ERROR] Output period (%.0f ps) is not within +/- 800ps of the expected output frequency!, Expected Output Period: %.0f ps\n", $realtime(), clk_out_period_at_lock, expected_clk_out_period);

   end

///========================================================================================================
/// Run PLL for 8 ref clk cycles (allow runtime assertions to fire)
///========================================================================================================

repeat (8) @(posedge clkref);
