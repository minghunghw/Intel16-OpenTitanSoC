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
///   Test Bench for LJPLL
///
///=====================================================================================================================
`timescale 1ps / 1ps




module ringpll_emu_tb 
#(
   parameter bit SYNC_GEN_EN = 1,
   parameter bit [4:0] SYNC_GEN_PIPE_STAGE = 5'd7,
   parameter bit SSC_EN  = 1,
   parameter bit TLLM_EN = 1,
   parameter     FMOD_BITS = 9
) 
();

///========================================================================================================
/// Testbench Begin
///========================================================================================================

   // Random seed declaration
   integer seed;

   //import "DPI-C" task dpi_exit_handler();
   //import "DPI-C" task dpi_set_exit_code(int code);

   // Exit code for the simulation
   integer exit_code;

   bit PostDistEnNH;
   
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      logic vccdig_nom;
      logic vnnaon_nom;
      logic vccldo_hv;	// FIXME
      logic vccdist_nom;
      logic vss;	//FIXME
//      logic vccref;
//      logic vccvdd2;
  
    //  assign vccdig_nom = 1'b1;
      assign vnnaon_nom = 1'b1;
   `endif

   // DUT interface declaration
   bit                           clkref;
   logic			 powergood_vnn;
   logic                         clkpostdist;
   logic                         pllen;
   logic                         bypass;
   logic [9 : 0]                 ratio;
   logic [23 : 0]                fraction;
   logic [1:0]                   vcodiv_ratio = 2'b00;
   logic  [9:0]                   zdiv0_ratio = 10'd125;            // NEW: post pll divider for clkpll0 (N.5 dividerl max = 1024.5)
   logic  [9:0]                   zdiv1_ratio = 10'd125;            // NEW: post pll divider for clkpll1 (N.5 dividerl max = 1024.5)
   logic                          zdiv0_ratio_p5 = 0;         // NEW: point five for clkpll0
   logic                          zdiv1_ratio_p5 = 0;         // NEW: point five for clkpll0
   logic  [5:0]                   mdiv_ratio;
   logic [23:0]                  ssc_frac_step;
   logic [8:0]         ssc_cyc_to_peak_m1;
   logic [8:0]         ssccyctopeakm1;
   logic 			ssc_en;
   logic			mash_order_plus_one;
   logic                        pllfwen_b = 1'b0;
   
 //  logic                         EarlyLockXXnnnH;
   logic                         lock;
//   logic                         FbDivOutMnnnH;
//   logic                         FbDivOutMnnnL;
   logic                         clkpll;
   logic                         clkpll0;
   logic                         clkpll1;
   
   tri [1:0]                     viewanabus;



   localparam RATIO_BITS = $bits(ratio);

 // dfx_bit_blast connection  to testbench level
 //  logic [9:0]                   dfx_in_fuse_misc_cfg;
 //  logic [0:0]                   dfx_in_fuse_disable_run_upd;
   logic [0:0]                   fz_tight_loopb; //dfx_in_fuse_tight_loop;
   logic [0:0]                   fz_lockforce;  //dfx_in_fuse_tie_lockrst_zero;
   logic [2:0]                   fz_lockcnt;    //dfx_in_fuse_lockcnt;
   logic [3:0]                   fz_lockthresh; //dfx_in_fuse_lockthresh;
   logic                         fz_lockstickyb; //NEW fuse: Lock detect sticky enable bar Fusedefault value = 0
   logic [2:0]                   fz_pfd_pw;	//dfx_in_fuse_pfd_residual_pw;
   logic [5:0]                   fz_dca_ctrl;	//dfx_in_fuse_dca_ctrl;
   logic [1:0]                   fz_dca_cb;	//dfx_in_fuse_dca_cb;
   logic [4:0]                   fz_irefgen;    //NEW fuse: Iref current
   logic [5:0]                   fz_startup;    //NEW fuse: PLL startup circuit tuning
   logic [4:0]                   fz_cp1trim;	//dfx_in_fuse_cp1_trim;
   logic [4:0]                   fz_cp2trim;	//dfx_in_fuse_cp2_trim;
   logic                         fz_nopfdpwrgate;   //NEW fuse: Disable PFD power gating
   logic [1:0]                   fz_pfddly;         //NEW fuse: PFD power gating delay section
   logic [1:0]                   fz_cpnbias;        //NEW fuse: CP nbias tuning
   logic                         fz_lpfclksel;      //NEW fuse: LPF clock selection
   logic [10:0]                  fz_vcotrim;        //NEW fuse: VCO trim
   logic [4:0]                   fz_skadj;	//dfx_in_fuse_skadj_ctrl;
   logic                         fz_vcosel;         //NEW fuse: VCO select (0=low freq., 1=high freq range)
   logic [4:0]                   fz_spare;          //NEW fuse: spare bits


// NOT needed - Following are OLD BXT fuses
   logic [3:0]                   dfx_in_fuse_startup_rdac;
   logic [2:0]                   dfx_in_fuse_pfd_chop_val;
   logic [2:0]                   dfx_in_fuse_startcnt;
   logic [2:0]                   dfx_in_fuse_iref_ctune;
   logic [3:0]                   dfx_in_fuse_iref_ftune;
   logic [0:0]                   dfx_in_fuse_lp_cp_en;
   logic [1:0]                   dfx_in_fuse_lpf_itrim;
   logic [3:0]                   dfx_in_fuse_ro_freq_sel;
   logic [2:0]                   dfx_in_fuse_iref_mode;
   logic [2:0]                   dfx_in_fuse_cp_mode;
   logic [1:0]                   dfx_in_fuse_sr_lpf_mode;
   logic [0:0]                   dfx_in_fuse_start_mode;
   logic [3:0]                   dfx_in_fuse_vco_trim_pg;
   logic [1:0]                   dfx_in_fuse_vco_trim_cb;
   logic [1:0]                   dfx_in_fuse_pvd_mode;
   logic [0:0]                   dfx_in_fuse_tllm_en;
   logic [0:0]                   dfx_in_fuse_tllm_prchg_mode;
   logic [1:0]                   dfx_in_fuse_tllm_sw_latency;
//   logic [0:0]                   dfx_in_fuse_;
//   logic [4:0]                   dfx_in_fuse_;
//   logic [1:0]                   dfx_in_fuse_;
//   logic [1:0]                   dfx_in_fuse_;
//   logic [7:0]                   dfx_in_register_ssc_ratio_step;
//   logic [23:0]                   dfx_in_register_ssc_frac_step;
//   logic [0:0]                   dfx_in_register_ssc_en;
   logic [1:0]                   dfx_in_register_ssc_mode;
   logic [0:0]                   dfx_in_tap_ovrd_enable_sel;
   logic [0:0]                   dfx_in_tap_ovrd_enable_val;
   logic [0:0]                   dfx_in_tap_ovrd_powergood_sel;
   logic [0:0]                   dfx_in_tap_ovrd_powergood_val;
   logic [0:0]                   dfx_in_tap_ovrd_bypass_sel;
   logic [0:0]                   dfx_in_tap_ovrd_bypass_val;
   logic [0:0]                   dfx_in_tap_ovrd_ratio_sel;
   logic [7:0]                   dfx_in_tap_ovrd_ratio_val;
   logic [0:0]                   dfx_in_tap_ovrd_frac_sel;
   logic [23:0]                   dfx_in_tap_ovrd_frac_val;
   logic [0:0]                   dfx_in_tap_openloop;
   logic [0:0]                   dfx_in_tap_adc_start;
   logic [1:0]                   dfx_in_tap_adc_start_cnt;
   logic [1:0]                   dfx_in_tap_adc_clkdiv;
   logic [0:0]                   dfx_in_tap_adc_freeze;
   logic [0:0]                   dfx_in_tap_adc_chop_en;
   logic [0:0]                   dfx_in_tap_adc_use_vref;
   logic [2:0]                   dfx_in_tap_adc_sel_in;
   logic [1:0]                   dfx_in_tap_view_en;
   logic [1:0]                   dfx_in_tap_view_ana_en;
   logic [1:0][3:0]                   dfx_in_tap_view_sel;
   logic [0:0]                   dfx_in_tap_ssc_mod_dfx_en;
   logic [0:0]                   dfx_in_tap_ssc_mod_dfx_trigger;
   logic [1:0]                   dfx_in_tap_ssc_mod_dfx_steps;
   logic [1:0]                   dfx_in_tap_ssc_mod_dfx_clkdiv;
   logic [0:0]                   dfx_in_tap_;
   //logic [0:0]                   dfx_in_idv_idvtclki;
   //logic [0:0]                   dfx_in_idv_idvtdi;
   //logic [0:0]                   dfx_in_idv_idvtresi;
   //logic [0:0]                   dfx_in_idv_idvtctrli;
   //logic [0:0]                   dfx_in_idv_idvdisable_bi;
   //logic [0:0]                   dfx_in_idv_idvfreqai;
   //logic [0:0]                   dfx_in_idv_idvfreqbi;
   //logic [0:0]                   dfx_in_idv_idvpulsei;
   logic [0:0]                   idvtclki;
   logic [0:0]                   idvtdi;
   logic [0:0]                   idvtresi;
   logic [0:0]                   idvtctrli;
   logic [0:0]                   idvdisable_bi;
   logic [0:0]                   idvfreqai;
   logic [0:0]                   idvfreqbi;
   logic [0:0]                   idvpulsei;
   logic [0:0]                   dfx_in_global_align;
   logic [0:0]                   dfx_in_ssc_prof_update_req;
   logic [0:0]                   dfx_in_ratio_update_req;
   //logic [1:0]                   dfx_out_view_view_dig_out;
   logic [1:0]                   view_dig_out;
   logic [0:0]                   dfx_out_tap_pll_enable;
   logic [0:0]                   dfx_out_dist_pwr_good;
   logic [0:0]                   dfx_out_iref_done;
   logic [0:0]                   dfx_out_pfd_en;
   logic [1:0]                   dfx_out_unlock_count;
   logic [11:0]                   dfx_out_lock_time;
   logic [7:0]                   dfx_out_pll_ratio;
   logic [0:0]                   dfx_out_pll_half_int;
   logic [0:0]                   dfx_out_lock;
   logic [0:0]                   dfx_out_raw_lock;
   logic [9:0]                   dfx_out_adc_dig_out;
   logic [0:0]                   dfx_out_adc_start;
   logic [0:0]                   dfx_out_adc_done;
   logic [0:0]                   dfx_out_ssc_mod_dfx_run;
   logic [0:0]                   dfx_out_ssc_mod_dfx_trig;
   logic [1:0]                   dfx_out_tctrlfsmstate;

   //logic [0:0]                   dfx_out_idv_idvtclko;
   //logic [0:0]                   dfx_out_idv_idvtdo;
   //logic [0:0]                   dfx_out_idv_idvtreso;
   //logic [0:0]                   dfx_out_idv_idvtctrlo;
   //logic [0:0]                   dfx_out_idv_idvdisable_bo;
   //logic [0:0]                   dfx_out_idv_idvfreqao;
   //logic [0:0]                   dfx_out_idv_idvfreqbo;
   //logic [0:0]                   dfx_out_idv_idvpulseo;
   logic [0:0]                   idvtclko;
   logic [0:0]                   idvtdo;
   logic [0:0]                   idvtreso;
   logic [0:0]                   idvtctrlo;
   logic [0:0]                   idvdisable_bo;
   logic [0:0]                   idvfreqao;
   logic [0:0]                   idvfreqbo;
   logic [0:0]                   idvpulseo;

   logic [0:0]                   dfx_out_ssc_prof_update_ack;
   logic [0:0]                   dfx_out_ratio_update_ack;

  // LDO
   logic                          ldo_vref;               //NEW PIN: LDO reference voltage (0.6v) (Domain: analog)
   logic                          fz_ldo_faststart;       //NEW PIN: Enables LDO fast startup mode
   logic                          fz_ldo_bypass;          //NEW PIN: Enables LDO bypass
   logic [1:0]                    fz_ldo_vinvoltsel;           //NEW PIN: set to 1 if using 1.24v ldo input
   logic                          fz_ldo_extrefsel;       //NEW PIN: Selects external voltage ref (ldo_vref)
   logic [3:0]                    fz_ldo_fbtrim;          //NEW PIN: Adjust LDO feedback divider
   logic [3:0]                    fz_ldo_reftrim;         //NEW PIN: Adjust LDO internal voltage ref
   logic                          ldo_enable;          //NEW PIN: Enable LDO
   //logic			  ta_ldo_hiz_debug;
   //logic			  ta_ldo_idq_debug;


   logic                         trst_n;
   logic                         tck;
   logic                         treg_en;
   logic                         tshiftdr;
   logic                         tupdatedr;
   logic                         tdi;
   logic                         tcapturedr; //tclkdr;
   logic                         tdo;
   logic [2:0]                   odfx_fscan_sdo;
   
//RN New Addition , Initiallize Valuse of these new input ports 
  
//  zdiv0_ratio  = 10'd125;
//  zdiv0_ratio_p5 = 0;
//  zdiv1_ratio    = 10'd125;
//  zdiv1_ratio_p5 = 0;
//  mdiv_ratio = 6'b0;
// // sc_cyc_to_peak_m1   = 'd299;

//`ifdef INTEL_EMULATION

  logic                       emu_fastclk;
  
`ifndef INTEL_EMULATION
   initial
      emu_fastclk = 1'b0;

   always @ (emu_fastclk) 
     emu_fastclk <= #125ps ~emu_fastclk;
   //#25000 emu_fastclk = ~emu_fastclk;

`endif
   // Instantiate DUT
   //
   ringpll 
//   #(
//   .SYNC_GEN_EN           ( SYNC_GEN_EN         ),
//   .SYNC_GEN_PIPE_STAGE   ( SYNC_GEN_PIPE_STAGE ),
//   .SSC_EN                ( SSC_EN              ),
//   .TLLM_EN               ( TLLM_EN             ),
//   .FMOD_BITS             ( FMOD_BITS           )
//   ) 
   dut (
  	`ifndef ip2211ringpll_INTC_NO_PWR_PINS
			    .vnnaon_nom (),
                            .vccdig_nom (),                 // Digital supply
                            .vccldo_hv (),                 // LDO input supply (1.1V nominal)
                            .vccdist_nom (),                // Digital supply for output clocks and clkpostdist input
                            .vss (),                    // Ground
   	`endif
                            .idfx_fscan_sdi(3'b000),
                            .idfx_fscan_mode(1'b0),
                            .idfx_fscan_shiften(1'b0),
                            .idfx_fscan_rstbypen(1'b0),
                            .idfx_fscan_byprstb(1'b1),
                            .idfx_fscan_clkungate(1'b0),
                            .odfx_fscan_sdo(odfx_fscan_sdo),

	//.trst_n(1'b0),
	  .* );


endmodule

