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
///   Max lock time test for LJPLL
///         configure all fuses to maximum lock time and see what happens
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
   mdiv_ratio = 6'b000000;
//   dut.tap_in  = '0;
   dfx_in.fuse.start_mode = 1'b1;
   dfx_in.fuse.tllm_en = 1'b1;
   dfx_in.fuse.tllm_prchg_mode = 1'b1;
   dfx_in.fuse.tllm_sw_latency = 2'b11;
   dfx_in.fuse.fz_lockcnt  = 3'b111;
   dfx_in.fuse.startcnt = 3'b111;
   $display("[%.0f ps] [INFO] [FUSE] Fuse Bus: %x\n", $realtime(), dfx_in.fuse);
   

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
      ratio    = 8'd125;
      fraction = 24'd0;
   `else
      ratio    = $dist_uniform(seed, 2, ((1 << ($bits(ratio)-2))     - 1'b1));
      fraction = $dist_uniform(seed, 0, ((1 << $bits(fraction))  - 1'b1));
   `endif

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

   // deassert reset
   //
   pllen    = 1'b1;
   
   $display("[%.0f ps] [INFO] [PLL ENABLE] PLL Enabled\n", $realtime());

   fork
      begin
         @(posedge lock);
         disable LOCK_TIMEOUT;
      end
      begin : LOCK_TIMEOUT
         repeat(1079 * 2) #(phase_clk_ref);
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

