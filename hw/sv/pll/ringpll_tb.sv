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
   `ifdef UPF
   import UPF::*;
   `endif
//--------------------------------------------------------------------------------
//`include "ljpll_dfx.vh"
`ifndef ip2211_ringpll_LJPLL_DFX_VH
`define ip2211_ringpll_LJPLL_DFX_VH
typedef struct packed {
      logic        base0;
      logic        base1;
      logic        val0;
      logic        val1;
} t_odcs_state;

typedef struct packed {
  logic                  odcsenable;           // ODCS :: ODCS enable
  logic                  dualtrigswap;         // ODCS :: Swap dual trigger functions
  logic                  dualtrigen;           // ODCS :: Enable dual triggering mode
  logic                  stayinbase1;          // ODCS :: Configure FSM to stay in B1
  logic [3:0]            riseoncnt;            // ODCS :: ON counter initial value
  logic [3:0]            riseoffcnt;           // ODCS :: OFF counter initial value
  logic [4:0]            risebase0;            // ODCS :: Base0 delay code
  logic [4:0]            risebase1;            // ODCS :: Base1 delay code
  logic [4:0]            riseval0;             // ODCS :: Val0 delay code
  logic [4:0]            riseval1;             // ODCS :: Val1 delay code
  logic [3:0]            falloncnt;            // ODCS :: ON counter initial value
  logic [3:0]            falloffcnt;           // ODCS :: OFF counter initial value
  logic [4:0]            fallbase0;            // ODCS :: Base0 delay code
  logic [4:0]            fallbase1;            // ODCS :: Base1 delay code
  logic [4:0]            fallval0;             // ODCS :: Val0 delay code
  logic [4:0]            fallval1;             // ODCS :: Val0 delay code
} t_odcs_config;

typedef struct packed {
  logic                  usetaptrig;           // OPSP :: Trigger using Tap instead of ubp
  logic                  trigger;              // OPSP :: Opsp tap based trigger
  logic                  opspen;               // OPSP :: Feature enable
  logic                  finedelsel;           // OPSP :: Add 40ps
  logic [1:0]            coursedelsel;         // OPSP :: 1|2|3|4 phase selection
  logic                  drvedgesel;           // OPSP :: Select falling edge driver
} t_opsp_config;

typedef struct packed {
  logic                  odcsfalltrig;         // ODCS :: FallTrigStatus
  logic                  odcsrisetrig;         // ODCS :: RiseTrigStatus
  logic                  stmtrig;              // STM :: StmTrigSeen
  logic [4:0]            dummydldelay;         // DUMMYDL :: DLDelaySetting
  logic                  opspfallsamp;         // OPSP :: OpspFallSamp
  logic                  opsprisesamp;         // OPSP :: OpspRiseSamp
} t_odcs_status;

typedef struct packed {
  logic                  stmwren;              // STM :: Disable clock modulation; can be used to stop mod...
  logic                  usetaptrigger;        // STM :: Trigger from ClkModStart instead of ubkpoint (not...
  logic                  clkmodstop;           // STM :: Stop clock modulation
  logic                  clkmodstart;          // STM :: Start clock modulation if UseTapTrigger=1 (not en...
  logic [27:0]           modcount;             // STM :: Period of modulation in PLL output clock cycles
  logic [1:0]            modesel;              // STM :: Mode select
  logic                  stoplevel;            // STM :: Level at which clock stops
} t_stm_config;

typedef struct packed {
  logic                  usedlclk;             // reg[8]     DUMMYDL :: Use DL clk in pll FB div
  logic [4:0]            dldelayovrd;          // reg[7:3]   DUMMYDL :: Delay line override encoding
  logic                  dldelayovrden;        // reg[2]     DUMMYDL :: Select delay override setting
  logic                  dlrun;                // reg[1]     DUMMYDL :: Enable delay locking loop
  logic                  dlylineen;            // reg[0]     DUMMYDL :: Enable delay line clock only
} t_dummydl_config;

typedef struct packed {
   logic [1:0]  view_dig_out;
} t_ljpll_view_out_ifc;

typedef struct packed {
//   logic [9:0]              misc_cfg;            // SPARES! -- these are spare fuse bits routed to the HIP
   logic                    disable_run_upd;     // Disable SSC/ratio runtime updates. When this bit is set, all SSC reg writes are rejected after PLL lock.
   logic                    tight_loop;          // Tight Loop Select Bit (optional as a fuse for tight loop only PLLs) // fz_tight_loopb
   //logic                    tie_lockrst_zero;    // Force the lock reset to 0 until after sticky lock asserts // fz_lockforce
   logic                    fz_lockforce;    // Force the lock reset to 0 until after sticky lock asserts // fz_lockforce
   logic [3:0]              startup_rdac;        // Startup RDAC setting
   logic [2:0]              pfd_chop_val;        // PFD chop value
   logic [2:0]              pfd_residual_pw;     // PFD residual pulse width - maps to fz_pfd_pw
// logic [2:0]              fz_pfd_pw;                // NEW - maps to pfd_residual_pw  ^^^
   logic [4:0]              cp1_trim;            // Charge pump 1 trim       // fz_cp1trim
   logic [4:0]              cp2_trim;            // Charge pump 2 trim       // fz_cp2trim
   logic [4:0]              skadj_ctrl;          // Skew Adjust Control // fz_skadj
   logic [2:0]              fz_lockcnt;             // lock count before lock assert // fz_lockcnt
   logic [2:0]              startcnt;            // iref ramp time counter
   logic [3:0]              lockthresh;          // lock threshold setting to AIP // fz_lockthresh
   logic                    lockstickyb;         //NEW fuse: Lock detect sticky enable bar Fusedefault value = 0 // fz_lockstickyb
   logic [2:0]              iref_ctune;          // IREF course tune bits
   logic [3:0]              iref_ftune;          // IREF fine tune bits
   logic                    mash_order_plus_one; // MASH modulator order control
   logic                    lp_cp_en;            // Low power charge pump mode chicken bit
   logic [1:0]              lpf_itrim;           // SR-LPF (internal to AIP) current trim
   logic [3:0]              ro_freq_sel;         // Ring oscillator frequency control
   logic [2:0]              iref_mode;           // IREF operating mode
   logic [2:0]              cp_mode;             // CP operating mode
   logic [1:0]              sr_lpf_mode;         // SR LPF Mode
   logic [1:0]              dca_cb;              // Static DCA capacitor bank control // fz_dca_cb
   logic                    start_mode;          // 2 different start modes 0=parallel iref/vctl pulldn, 1=serial iref 1st, vctl 2nd
   logic [3:0]              vco_trim_pg;         // PG trim
   logic [2:0]              vco_trim_cb;         // CB trim
//   logic [1:0]              pvd_mode;            // PVD mode (/1, /2, /4, /8)
   logic                    tllm_en;             // tight loop lock mode enable
   logic                    tllm_prchg_mode;     // gate clock distribution during tight loop lock
   logic [1:0]              tllm_sw_latency;     // wait some cycles after distribution ungated before switching to long loop
   logic [5:0]              dca_ctrl;            // Static DCA control bits // fz_dca_ctrl
   logic                    fz_vcosel;            //NEW fuse: VCO select (0=low freq., 1=high freq range)
   logic                          fz_ldo_faststart;       //NEW PIN: Enables LDO fast startup mode
   logic                          fz_ldo_bypass;          //NEW PIN: Enables LDO bypass
   logic [1:0]                    fz_ldo_vinvoltsel;           //NEW PIN: set to 1 if using 1.24v ldo input
   logic                          fz_ldo_extrefsel;       //NEW PIN: Selects external voltage ref (ldo_vref)
   logic [3:0]                    fz_ldo_fbtrim;          //NEW PIN: Adjust LDO feedback divider
   logic [3:0]                    fz_ldo_reftrim;         //NEW PIN: Adjust LDO internal voltage ref
   logic [1:0]                   fz_cpnbias;        //NEW fuse: CP nbias tuning
   logic [4:0]                   fz_irefgen;    //NEW fuse: Iref current
   logic                         fz_nopfdpwrgate;   //NEW fuse: Disable PFD power gating
   logic                         fz_lpfclksel;      //NEW fuse: LPF clock selection
   logic [1:0]                   fz_pfddly;         //NEW fuse: PFD power gating delay section
   logic [4:0]                   fz_spare;          //NEW fuse: spare bits
   logic [5:0]                   fz_startup;    //NEW fuse: PLL startup circuit tuning
  logic [10:0]                  fz_vcotrim;        //NEW fuse: VCO trim
} t_ljpll_fuse_ifc;

typedef struct packed {
   logic                    ovrd_enable_sel;
   logic                    ovrd_enable_val;
   logic                    ovrd_powergood_sel;
   logic                    ovrd_powergood_val;
   logic                    ovrd_bypass_sel;
   logic                    ovrd_bypass_val;
   logic                    ovrd_ratio_sel;
   logic [9:0]              ovrd_ratio_val;
   logic                    ovrd_frac_sel;
   logic [23:0]             ovrd_frac_val;
   logic                    openloop;
   logic                    adc_start;
   logic [1:0]              adc_start_cnt;
   logic [1:0]              adc_clkdiv;
   logic                    adc_freeze;
   logic                    adc_chop_en;
   logic                    adc_use_vref;
   logic [2:0]              adc_sel_in;
   logic [1:0]              view_en;
   logic [1:0]              view_ana_en;
   logic [1:0][4:0]         view_sel;
   logic                    ssc_mod_dfx_en;
   logic                    ssc_mod_dfx_trigger;
   logic [1:0]              ssc_mod_dfx_steps;
   logic [1:0]              ssc_mod_dfx_clkdiv;

   logic                    tap_fuseoverride;         // 1= enabled, 0=disbled
//   logic [9:0]              ovrd_misc_cfg;            // SPARES! -- these are spare fuse bits routed to the HIP
//   logic                    ovrd_disable_run_upd;     // Disable SSC/ratio runtime updates. When this bit is set, all SSC reg writes are rejected after PLL lock.
   logic                    ovrd_tight_loop;          // Tight Loop Select Bit (optional as a fuse for tight loop only PLLs)
   //logic                    ovrd_tie_lockrst_zero;    // Force the lock reset to 0 until after sticky lock asserts
   logic                    ovrd_fz_lockforce;    // Force the lock reset to 0 until after sticky lock asserts
//   logic [3:0]              ovrd_startup_rdac;        // Startup RDAC setting
//   logic [2:0]              ovrd_pfd_chop_val;        // PFD chop value
   logic [2:0]              ovrd_pfd_residual_pw;     // PFD residual pulse width
   logic [4:0]              ovrd_cp1_trim;            // Charge pump 1 trim
   logic [4:0]              ovrd_cp2_trim;            // Charge pump 2 trim
   logic [4:0]              ovrd_skadj_ctrl;          // Skew Adjust Control
   logic [2:0]              ovrd_fz_lockcnt;             // lock count before lock assert
//   logic [2:0]              ovrd_startcnt;            // iref ramp time counter
   logic [3:0]              ovrd_lockthresh;          // lock threshold setting to AIP
   logic                    ovrd_lockstickyb;         //NEW fuse: Lock detect sticky enable bar Fusedefault value = 0
//   logic [2:0]              ovrd_iref_ctune;          // IREF course tune bits
//   logic [3:0]              ovrd_iref_ftune;          // IREF fine tune bits
   logic                    ovrd_mash_order_plus_one; // MASH modulator order control
//   logic                    ovrd_lp_cp_en;            // Low power charge pump mode chicken bit
//   logic [1:0]              ovrd_lpf_itrim;           // SR-LPF (internal to AIP) current trim
//   logic [3:0]              ovrd_ro_freq_sel;         // Ring oscillator frequency control
//   logic [2:0]              ovrd_iref_mode;           // IREF operating mode
//   logic [2:0]              ovrd_cp_mode;             // CP operating mode
//   logic [1:0]              ovrd_sr_lpf_mode;         // SR LPF Mode
   logic [1:0]              ovrd_dca_cb;              // Static DCA capacitor bank control
//   logic                    ovrd_start_mode;          // 2 different start modes 0=parallel iref/vctl pulldn, 1=serial iref 1st, vctl 2nd
//   logic [3:0]              ovrd_vco_trim_pg;         // PG trim
//   logic [2:0]              ovrd_vco_trim_cb;         // CB trim
//   logic [1:0]              ovrd_pvd_mode;            // PVD mode (/1, /2, /4, /8)
   logic                    ovrd_tllm_en;             // tight loop lock mode enable
//   logic                    ovrd_tllm_prchg_mode;     // gate clock distribution during tight loop lock
//   logic [1:0]              ovrd_tllm_sw_latency;     // wait some cycles after distribution ungated before switching to long loop
   logic [5:0]              ovrd_dca_ctrl;            // Static DCA control bits

   // Brought in to over write via TAP
   //
   logic [1:0]                   ovrd_fz_cpnbias;        //NEW fuse: CP nbias tuning
   logic [4:0]                   ovrd_fz_irefgen;    //NEW fuse: Iref current
   logic                         ovrd_fz_nopfdpwrgate;   //NEW fuse: Disable PFD power gating
   logic [2:0]                   ovrd_fz_pfd_pw;         // NEW
   logic                         ovrd_fz_lpfclksel;      //NEW fuse: LPF clock selection
   logic [1:0]                   ovrd_fz_pfddly;         //NEW fuse: PFD power gating delay section
   logic [4:0]                   ovrd_fz_spare;          //NEW fuse: spare bits
   logic [5:0]                   ovrd_fz_startup;    //NEW fuse: PLL startup circuit tuning
   logic                         ovrd_fz_vcosel;    //NEW fuse: VCO sel
   logic [10:0]                  ovrd_fz_vcotrim;        //NEW fuse: VCO trim

   logic                         ovrd_ldo_enable;             //new -nd
   logic [1:0]                   ovrd_fz_ldo_vinvoltsel;      //new -nd
   logic                         ovrd_fz_ldo_bypass;          //new -nd
   logic                         ovrd_fz_ldo_extrefsel;       //new -nd
   logic                         ovrd_fz_ldo_faststart;       //new -nd
   logic [3:0]                   ovrd_fz_ldo_fbtrim;          //new -nd
   logic [3:0]                   ovrd_fz_ldo_reftrim;         //new -nd
   logic [5:0]                   ovrd_mdiv_ratio;             //new -nd
   logic [1:0]                   ovrd_vcodiv_ratio;           //new -nd
   logic [9:0]                   ovrd_zdiv0_ratio;            //new -nd
   logic                         ovrd_zdiv0_ratio_p5;         //new -nd
   logic [9:0]                   ovrd_zdiv1_ratio;            //new -nd
   logic                         ovrd_zdiv1_ratio_p5;         //new -nd
   logic                         start_measurement;        //new -nd

   logic                         ta_ldo_hiz_debug;            //new -nd
   logic                         ta_ldo_idq_debug;            //new -nd
   logic [4:0]                   ta_spare;                    //NEW TAP: spare bits

   logic                         ta_openloop2;                 //new -nd
   logic [3:0]                   ta_vctlrdac;                  //new -nd
   // IDV interface
 //  logic                         ovrd_idvdisable_bi;          // new -nd
 //  logic                         ovrd_idvfreqai;              // new -nd
 //  logic                         ovrd_idvfreqbi;              // new -nd
 //  logic                         ovrd_idvpulsei;              // new -nd
 //  logic                         ovrd_idvvtclki;              // new -nd
 //  logic                         ovrd_idvvtctrli;             // new -nd
 //  logic                         ovrd_idvtdi;                 // new -nd
 //  logic                         ovrd_idvtresi;               // new -nd
 //  logic                         ovrd_clkidvih;               // new -nd
 //  logic                         ovrd_pllen;                  // new -nd

   //t_stm_config             stm_config;
   //t_odcs_config            odcs_dig_config;
   //t_dummydl_config         odcs_dll_config;
   //t_opsp_config            opsp_config;
   //logic [1:0]              odcs_tuner_cb;
} t_ljpll_tap_in_ifc;

typedef struct packed {
   logic [7:0]   ssc_ratio_step;
   logic [23:0]  ssc_frac_step;
   logic         ssc_en;              // SSC enable bit
   logic [1:0]   ssc_mode;            // SSC spread mode (upspread/downspread/centerspread)
   logic [8:0]   ssccyctopeakm1;
} t_ljpll_reg_ifc;

typedef struct packed {
   logic idvtclki;
   logic idvtdi;
   logic idvtresi;
   logic idvtctrli;
   logic idvdisable_bi;
   logic idvfreqai;
   logic idvfreqbi;
   logic idvpulsei;
} t_ljpll_idv_in_ifc;
typedef struct packed {
   logic idvtclko;
   logic idvtdo;
   logic idvtreso;
   logic idvtctrlo;
   logic idvdisable_bo;
   logic idvfreqao;
   logic idvfreqbo;
   logic idvpulseo;
} t_ljpll_idv_out_ifc;

typedef struct packed {
   logic OdcsActTrigM736H;
   logic AnalogActTrigM736H;
} t_ljpll_odcs_trig_ifc;

typedef struct packed {
   logic         pll_enable;
   logic         dist_pwr_good;
   logic         iref_done;
   logic         pfd_en;
   logic [1:0]   unlock_count;
   logic [11:0]  lock_time;
   logic [9:0]   pll_ratio;
   logic         pll_half_int;
   logic         lock;
   logic         raw_lock;
   logic [9:0]   adc_dig_out;
   logic         adc_start;
   logic         adc_done;
   logic         ssc_mod_dfx_run;
   logic         ssc_mod_dfx_trig;
   logic [1:0]   tctrlfsmstate;
   logic [14:0]  view_freq_count;
   //t_odcs_status odcs;
} t_ljpll_tap_out_ifc;
typedef struct packed {
   t_ljpll_fuse_ifc    fuse;
   t_ljpll_reg_ifc     register;
   t_ljpll_tap_in_ifc  tap;
   t_ljpll_idv_in_ifc  idv; //SSG: Removed by . Is directly used
   t_ljpll_odcs_trig_ifc odcs;
   logic                 global_align;
   logic                 ssc_prof_update_req;
   logic                 ratio_update_req;
} t_ljpll_dfx_in_ifc;

typedef struct packed {
   t_ljpll_view_out_ifc view;
//   t_ljpll_tap_out_ifc  tap;
   t_ljpll_idv_out_ifc  idv; //SSG: Removed by . Is directly used
   logic                ssc_prof_update_ack;
   logic                ratio_update_ack;
} t_ljpll_dfx_out_ifc;

`endif


///=====================================================================================================================
//`include "dfx_bit_blast.sv"
`ifndef DFX_BIT_BLAST_SV
`define DFX_BIT_BLAST_SV

//`include "ljpll_dfx_tb.vh"

module dfx_bit_blast
 (
   input  t_ljpll_dfx_in_ifc       dfx_in,
   output  t_ljpll_dfx_out_ifc      dfx_out,

   // DFX IN
   // FUSE
//   output logic [9:0]                   dfx_in_fuse.misc_cfg,
//   output logic                         dfx_in_fuse.disable_run_upd,
   output logic                         fz_tight_loopb,
   output logic                         fz_lockforce,
//   output logic [3:0]                   dfx_in_fuse.startup_rdac,
//   output logic [2:0]                   dfx_in_fuse.pfd_chop_val,
   output logic [2:0]                   fz_pfd_pw,
   output logic [4:0]                   fz_cp1trim,
   output logic [4:0]                   fz_cp2trim,
   output logic [4:0]                   fz_skadj,
   output logic [2:0]                   fz_lockcnt,
//   output logic [2:0]                   dfx_in_fuse.startcnt,
   output logic [3:0]                   fz_lockthresh,
   output logic                         fz_lockstickyb,
//   output logic [2:0]                   dfx_in_fuse.iref_ctune,
//   output logic [3:0]                   dfx_in_fuse.iref_ftune,
   output logic                         mash_order_plus_one,
//   output logic                         dfx_in_fuse.lp_cp_en,
//   output logic [1:0]                   dfx_in_fuse.lpf_itrim,
//   output logic [3:0]                   dfx_in_fuse.ro_freq_sel,
//   output logic [2:0]                   dfx_in_fuse.iref_mode,
//   output logic [2:0]                   dfx_in_fuse.cp_mode,
//   output logic [1:0]                   dfx_in_fuse.sr_lpf_mode,
   output logic [5:0]                   fz_dca_ctrl,
   output logic [1:0]                   fz_dca_cb,
   output logic                          fz_vcosel,
   output logic                          fz_ldo_faststart,       //NEW PIN: Enables LDO fast startup mode
   output logic                          fz_ldo_bypass,          //NEW PIN: Enables LDO bypass
   output logic [1:0]                    fz_ldo_vinvoltsel,           //NEW PIN: set to 1 if using 1.24v ldo input
   output logic                          fz_ldo_extrefsel,       //NEW PIN: Selects external voltage ref (ldo_vref)
   output logic [3:0]                    fz_ldo_fbtrim,          //NEW PIN: Adjust LDO feedback divider
   output logic [3:0]                    fz_ldo_reftrim,         //NEW PIN: Adjust LDO internal voltage ref
   output logic [1:0]                   fz_cpnbias,        //NEW fuse. CP nbias tuning
   output logic [4:0]                   fz_irefgen,    //NEW fuse. Iref current
   output logic                         fz_nopfdpwrgate,   //NEW fuse. Disable PFD power gating
   output logic                         fz_lpfclksel,      //NEW fuse. LPF clock selection
   output logic [1:0]                   fz_pfddly,         //NEW fuse. PFD power gating delay section
   output logic [4:0]                   fz_spare,          //NEW fuse. spare bits
   output logic [5:0]                   fz_startup,   //NEW fuse. PLL startup circuit tuning
   output logic [10:0]                  fz_vcotrim,        //NEW fuse. VCO trim
//   output logic                         dfx_in_fuse.start_mode,
//   output logic [3:0]                   dfx_in_fuse.vco_trim_pg,
//   output logic [1:0]                   dfx_in_fuse.vco_trim_cb,
//   output logic [1:0]                   dfx_in_fuse.pvd_mode,
//   output logic                         dfx_in_fuse.tllm_en,
//   output logic                         dfx_in_fuse.tllm_prchg_mode,
//   output logic [1:0]                   dfx_in_fuse.tllm_sw_latency,

   // REG
//   output logic [7:0]                   dfx_in_register.ssc_ratio_step,
   output logic [23:0]                   ssc_frac_step,
   output logic                         ssc_en,
   output logic [8:0]                   ssccyctopeakm1,
//   output logic [1:0]                   dfx_in_register.ssc_mode,

   // IDV IN
   output logic                         idvtclki,
   output logic                         idvtdi,
   output logic                         idvtresi,
   output logic                         idvtctrli,
   output logic                         idvdisable_bi,
   output logic                         idvfreqai,
   output logic                         idvfreqbi,
   output logic                         idvpulsei,

   // COMMON
//   output logic                         dfx_in_global_align,
//   output logic                         dfx_in_ssc_prof_update_req,
//   output logic                         dfx_in_ratio_update_req,

   // DFX OUT
   input logic [1:0]                   view_dig_out,

//   input logic                         dfx_out_dist_pwr_good,
//   input logic                         dfx_out_iref_done,
//   input logic                         dfx_out_pfd_en,
//   input logic [1:0]                   dfx_out_unlock_count,
//   input logic [11:0]                   dfx_out_lock_time,
//   input logic [7:0]                   dfx_out_pll_ratio,
//   input logic                         dfx_out_pll_half_int,
//   input logic                         dfx_out_lock,
//   input logic                         dfx_out_raw_lock,
//   input logic [9:0]                   dfx_out_adc_dig_out,
//   input logic                         dfx_out_adc_start,
//   input logic                         dfx_out_adc_done,
//   input logic                         dfx_out_ssc_mod_dfx_run,
//   input logic                         dfx_out_ssc_mod_dfx_trig,
//   input logic [1:0]                   dfx_out_tctrlfsmstate,

   input logic                         idvtclko,
   input logic                         idvtdo,
   input logic                         idvtreso,
   input logic                         idvtctrlo,
   input logic                         idvdisable_bo,
   input logic                         idvfreqao,
   input logic                         idvfreqbo,
   input logic                         idvpulseo
//   input logic                         dfx_out_ssc_prof_update_ack,
//   input logic                         dfx_out_ratio_update_ack
);

//assign  dfx_in_fuse.misc_cfg   =    10'b0;
//assign  dfx_in_fuse.disable_run_upd   =   1'b0;
assign  fz_tight_loopb   =    dfx_in.fuse.tight_loop;
//assign  fz_lockforce   =    dfx_in.fuse.tie_lockrst_zero;
assign  fz_lockforce   =    dfx_in.fuse.fz_lockforce;
//assign  dfx_in_fuse.startup_rdac   =    dfx_in.fuse.startup_rdac;
//assign  dfx_in_fuse.pfd_chop_val   =    dfx_in.fuse.pfd_chop_val;
assign  fz_pfd_pw   =    dfx_in.fuse.pfd_residual_pw;
assign  fz_cp1trim   =    dfx_in.fuse.cp1_trim;
assign  fz_cp2trim   =    dfx_in.fuse.cp2_trim;
assign  fz_skadj   =    dfx_in.fuse.skadj_ctrl;
//assign  fz_lockcnt   =    dfx_in.fuse.lockcnt;
assign  fz_lockcnt   =    dfx_in.fuse.fz_lockcnt;
//assign  dfx_in_fuse.startcnt   =    dfx_in.fuse.startcnt;
assign  fz_lockthresh   =    dfx_in.fuse.lockthresh;
assign fz_lockstickyb   = dfx_in.fuse.lockstickyb;
//assign  dfx_in_fuse.iref_ctune   =    dfx_in.fuse.iref_ctune;
//assign  dfx_in_fuse.iref_ftune   =    dfx_in.fuse.iref_ftune;
assign  mash_order_plus_one   =    dfx_in.fuse.mash_order_plus_one;
//assign  dfx_in_fuse.lp_cp_en   =    dfx_in.fuse.lp_cp_en;
//assign  dfx_in_fuse.lpf_itrim   =    dfx_in.fuse.lpf_itrim;
//assign  dfx_in_fuse.ro_freq_sel   =    dfx_in.fuse.ro_freq_sel;
//assign  dfx_in_fuse.iref_mode   =    dfx_in.fuse.iref_mode;
//assign  dfx_in_fuse.cp_mode   =    dfx_in.fuse.cp_mode;
//assign  dfx_in_fuse.sr_lpf_mode   =    dfx_in.fuse.sr_lpf_mode;
assign  fz_dca_ctrl   =    dfx_in.fuse.dca_ctrl;
assign  fz_dca_cb   =    dfx_in.fuse.dca_cb;
assign  fz_vcosel =    dfx_in.fuse.fz_vcosel;
assign   fz_ldo_faststart  = dfx_in.fuse.fz_ldo_faststart  ;       //NEW PIN: Enables LDO fast startup mode
assign   fz_ldo_bypass     = dfx_in.fuse.fz_ldo_bypass     ;          //NEW PIN: Enables LDO bypass
assign   fz_ldo_vinvoltsel = dfx_in.fuse.fz_ldo_vinvoltsel ;           //NEW PIN: set to 1 if using 1.24v ldo input
assign   fz_ldo_extrefsel  = dfx_in.fuse.fz_ldo_extrefsel  ;       //NEW PIN: Selects external voltage ref (ldo_vref)
assign   fz_ldo_fbtrim     = dfx_in.fuse.fz_ldo_fbtrim     ;          //NEW PIN: Adjust LDO feedback divider
assign   fz_ldo_reftrim    = dfx_in.fuse.fz_ldo_reftrim    ;
assign     fz_cpnbias      = dfx_in.fuse.fz_cpnbias     ;        //NEW fuse. CP nbias tuning
assign     fz_irefgen      = dfx_in.fuse.fz_irefgen     ;    //NEW fuse. Iref current
assign     fz_nopfdpwrgate = dfx_in.fuse.fz_nopfdpwrgate;   //NEW fuse. Disable PFD power gating
assign     fz_lpfclksel    = dfx_in.fuse.fz_lpfclksel   ;      //NEW fuse. LPF clock selection
assign     fz_pfddly       = dfx_in.fuse.fz_pfddly      ;         //NEW fuse. PFD power gating delay section
assign     fz_spare        = dfx_in.fuse.fz_spare       ;          //NEW fuse. spare bits
assign     fz_startup      = dfx_in.fuse.fz_startup     ;    //NEW fuse. PLL startup circuit tuning
assign     fz_vcotrim      = dfx_in.fuse.fz_vcotrim     ;        //NEW fuse. VCO trim
//assign  dfx_in_fuse.start_mode   =    dfx_in.fuse.start_mode;
//assign  dfx_in_fuse.vco_trim_pg   =    dfx_in.fuse.vco_trim_pg;
//assign  dfx_in_fuse.vco_trim_cb   =    dfx_in.fuse.vco_trim_cb;
//assign  dfx_in_fuse.pvd_mode   =    dfx_in.fuse.pvd_mode;
//assign  dfx_in_fuse.tllm_en   =    dfx_in.fuse.tllm_en;
//assign  dfx_in_fuse.tllm_prchg_mode   =    dfx_in.fuse.tllm_prchg_mode;
//assign  dfx_in_fuse.tllm_sw_latency   =    dfx_in.fuse.tllm_sw_latency;

//assign  dfx_in_register.ssc_ratio_step   =    dfx_in.register.ssc_ratio_step;
assign  ssc_frac_step   =    dfx_in.register.ssc_frac_step;
assign  ssc_en   =    dfx_in.register.ssc_en;
assign ssccyctopeakm1 = dfx_in.register.ssccyctopeakm1;

//assign  dfx_in_register.ssc_mode   =    dfx_in.register.ssc_mode;

assign  idvtclki   =    dfx_in.idv.idvtclki;
assign  idvtdi   =    dfx_in.idv.idvtdi;
assign  idvtresi   =    dfx_in.idv.idvtresi;
assign  idvtctrli   =    dfx_in.idv.idvtctrli;
assign  idvdisable_bi   =    dfx_in.idv.idvdisable_bi;
assign  idvfreqai   =    dfx_in.idv.idvfreqai;
assign  idvfreqbi   =    dfx_in.idv.idvfreqbi;
assign  idvpulsei   =    dfx_in.idv.idvpulsei;

//assign  dfx_in_global_align   =    dfx_in.global_align;
//assign  dfx_in_ssc_prof_update_req   =    dfx_in.ssc_prof_update_req;
//assign  dfx_in_ratio_update_req   =    dfx_in.ratio_update_req;

assign  dfx_out.view.view_dig_out   =    view_dig_out;

assign  dfx_out.idv.idvtclko   =    idvtclko;
assign  dfx_out.idv.idvtdo   =    idvtdo;
assign  dfx_out.idv.idvtreso   =    idvtreso;
assign  dfx_out.idv.idvtctrlo   =    idvtctrlo;
assign  dfx_out.idv.idvdisable_bo   =    idvdisable_bo;
assign  dfx_out.idv.idvfreqao   =    idvfreqao;
assign  dfx_out.idv.idvfreqbo   =    idvfreqbo;
assign  dfx_out.idv.idvpulseo   =    idvpulseo;

//assign  dfx_out.ssc_prof_update_ack   =    dfx_out_ssc_prof_update_ack;
//assign  dfx_out.ratio_update_ack   =    dfx_out_ratio_update_ack;

///========================================================================================================
/// Module End
///========================================================================================================

endmodule
`endif


//`include "ip2211ringpll.sv"

module ringpll_tb 
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
      logic vccpll_nom;
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

   t_ljpll_dfx_in_ifc       dfx_in;
   t_ljpll_dfx_out_ifc      dfx_out;
   t_ljpll_tap_in_ifc       tap_in;
   t_ljpll_tap_out_ifc      tap_out;


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

 // End of dfx_bit_blast connection  to testbench level

   //Instantiating dfx_bit_blast
   dfx_bit_blast                    dfx_bit_blast ( .* );

   // RTDR interface
   //       
   //logic                         stap_reset_b;
   //logic                         stap_rtdr_tck;
   //logic                         stap_rtdr_capture;
   //logic                         stap_rtdr_shift;
   //logic                         stap_rtdr_update;
   //logic                         stap_rtdr_tdi;
   //logic                         stap_rtdr_irdecoder_drselect;
   //logic                         stap_rtdr_tdo;

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
  
   initial
      emu_fastclk = 1'b0;

   always @ (emu_fastclk) 
     emu_fastclk <= #125ps ~emu_fastclk;
   //#25000 emu_fastclk = ~emu_fastclk;

//`endif
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

   // Testbench Signal Generation
   //
   time phase_clk_ref;
   time period_clk_ref;
   time expected_clk_out_period;
   bit enable_ref;

   // period = 2 * phase
   //
   always_comb period_clk_ref = phase_clk_ref << 1;

   always_comb begin
   if (mdiv_ratio == 6'b0) begin
   expected_clk_out_period =  fraction[23] ? (2*period_clk_ref) / ((2*ratio) +1) : ((period_clk_ref* 1)/ ratio);
    end
    else begin
    expected_clk_out_period =  fraction[23] ? (2*period_clk_ref) / ((2*ratio) +1) : ((period_clk_ref* mdiv_ratio)/ ratio);
    end
    end
   
   always @ (posedge enable_ref or clkref) begin
      if (enable_ref===1'b1) begin
         clkref <= #(phase_clk_ref) ~clkref;
      end
   end


   // IREF clock is always equal to ref clock in the testbench
   //
   //assign ClkIrefXIH = clkref;

   // Feedback clock is always tied back to the post distribution clock
   //
   assign clkpostdist = PostDistEnNH ? clkpll : 1'b0;

   // Measurement circuitry
   //
   time lock_time, start_time;
   time clk_out_period, prev_edge_time;
   time clk_out_period_at_lock;

   always_ff @(posedge pllen) begin
      start_time <= $realtime();
   end

   always_ff @(posedge clkpll) begin
      clk_out_period <= $realtime() - prev_edge_time;
      prev_edge_time <= $realtime();
   end
   
   always_ff @(posedge lock) begin
      lock_time <= $realtime() - start_time;
      clk_out_period_at_lock <= clk_out_period;
   end

   int unsigned max_ratio, min_ratio;
   int unsigned upspread_range, downspread_range, centerspread_range;
   
   int unsigned tmp;

   logic use_mash_ssc;
   int i;
int done=0;


   // Initial begin for generating FSDB
   //
   initial begin


//		@(posedge pllen);
//	     force ldo_enable = 1'b0;
//	#1us force ldo_enable  = 1'b1;

      // Setup the simulation to pass exit codes for VCS
      //
      exit_code=0;
      //dpi_exit_handler();

      if ($test$plusargs("FSDB")) begin
         $display(" FSDB dumping");
         $fsdbDumpSVA;
         $fsdbDumpvars(0, ringpll_tb, "+all");
      end

      $display("OUTPUT START");

      if (!($value$plusargs("ntb_random_seed=%d",seed))) begin
         seed = {$random()};
      end
      $display("SEED: %d", seed);
   
      //$display("SYNC_GEN_EN           :  %d", SYNC_GEN_EN        );
      //$display("SYNC_GEN_PIPE_STAGE   : %d",  SYNC_GEN_PIPE_STAGE);
      //$display("SSC_EN                :  %d", SSC_EN             );
      //$display("TLLM_EN               :  %d", TLLM_EN            );
      //$display("FMOD_BITS             :  %d", FMOD_BITS          );
    
      //PostDistEnNH = SYNC_GEN_EN || $dist_uniform(seed, 0, 1);
      PostDistEnNH = 1'b1;

      $display("Post Dist Clock Is %s", PostDistEnNH ? "Enabled" : "Disabled");
      if ($test$plusargs("TAP")) begin
         mdiv_ratio = 6'b000000; //tdoi added during FEV changes//
         run_reset_test();
         for ( i=0;i<34;i++) begin
 mdiv_ratio = 6'b000000;
   $display("reset task done ");
         done=1;
       wait(done==0);
   $display("TAPtask done ");
#50us;

            end

      end
      if ($test$plusargs("RESET_TEST")) begin
          for( i=0;i<17;i++)begin
vcodiv_ratio = 2'b00;
 mdiv_ratio = 6'b000000;
 if(i==1)  mdiv_ratio = 6'b000010;
 if(i==2)  mdiv_ratio = 6'b000011;
 if(i==3)  mdiv_ratio = 6'b000001;
 if(i==4)  mdiv_ratio = 6'b000100;
  if(i==5)  mdiv_ratio = 6'b000101;
  if(i==6)  mdiv_ratio = 6'b000110;   
 if(i==7)  mdiv_ratio = 6'b000111;
 if(i==8)  mdiv_ratio = 6'b001000;
 if(i==9)  vcodiv_ratio = 2'b01;
 if(i==10)  vcodiv_ratio = 2'b11;
 if(i==11)  vcodiv_ratio = 2'b10;
  if(i==14) fraction[23]='b1;
 
  
 fork
 begin 
  run_reset_test();
         repeat(10) @(posedge clkref);
#100us;
     end
 if ($test$plusargs("RESET_TEST")) begin
  //   wait(ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL==1);
 // wait(ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.lock_detector__RawLockXXnnnL==1) ; 
 #50us;
 if(i==0) begin
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=0;
         repeat(5) @(posedge clkref);
release ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH;
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=1;
         repeat(5) @(posedge clkref);
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=0;
         repeat(5) @(posedge clkref);
release ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH;
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=1;
         repeat(5) @(posedge clkref);
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=0;
         repeat(5) @(posedge clkref);
release ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH;
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=1;
         repeat(5) @(posedge clkref);
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=0;
         repeat(5) @(posedge clkref);
release ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH;
force ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH=1;
release ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH;
         repeat(5) @(posedge clkref);
//ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.LockCntTripXXnnnH
/*ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=0;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=1;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=0;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=1;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=0;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=1;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=0;
         repeat(5) @(posedge clkref);
   ringpll_tb.dut.iip2211ringpll_sip.sip.ip2211ringpll_lock_detector.RawLockNnnnL=1;
         repeat(5) @(posedge clkref);
*/
     end
 end
 join;
     end
     //
       //  run_reset_test();
//	 repeat(10) @(posedge clkref);
//         run_reset_test();
      end
	
	if ($test$plusargs("EMU_RESET_TEST")) begin
	ratio = 'd1;
         fraction = 24'b0;
pllen = 1'b0;                  	
ldo_enable = 1'b0;                      
bypass   = 1'b0;                        
dfx_in   = 'd0;                         
mdiv_ratio = 6'b000000;                 
dfx_in.fuse.tight_loop = 1'b0;          
         
         
         run_emu_reset_test();
       #500us;  repeat(10) @(posedge clkref);
	ratio = 'd2;
	fraction = 24'b0;
    run_emu_reset_test();
     #500us;  	 repeat(10) @(posedge clkref);
	ratio = 'd4;
	fraction = 24'b0;
    run_emu_reset_test();
     #500us;  	repeat(10) @(posedge clkref);
	ratio = 'd2;
	fraction[23] = 'b1;
         run_emu_reset_test();
       #500us;     #500us;      repeat(10) @(posedge clkref);
	ratio = 'd1;
	fraction = 24'b0;
        bypass = 'd1;
        i=1;

         run_emu_reset_test();

           #500us;     repeat(10) @(posedge clkref);
	ratio = 'd1;
	fraction[23] = 1;
         run_emu_reset_test();
     #500us;  	repeat(10) @(posedge clkref);

      end


//    else if ($test$plusargs("ODCS_CAL_TEST")) begin
//         run_reset_test();
//         repeat(10) @(posedge clkref);
//         run_odcs_bypass_cal_test();
//    end

      else if ($test$plusargs("TLLM_EN_TEST")) begin
         run_tllm_en_test();
         repeat(10) @(posedge clkref);
      end
      else if ($test$plusargs("SINGLE_LOCK_TEST")) begin
       mdiv_ratio = 6'b000000; //tdoi - added during FEV- fix//
         run_reset_test();
         repeat(10) @(posedge clkref);
      end
      else if ($test$plusargs("RATIO_TEST")) begin
	  // FIXME - Temporarily modified - 
         //for (int i=2; i<(1 << RATIO_BITS); i++) begin
         for (int i=1020; i< 1024; i++) begin
            run_ratio_test(i);
	    #25us;
            repeat(10) @(posedge clkref);
         end
   pllen = 1'b0;
#30us;         
      end
      else if ($test$plusargs("DFX_BUS_COUNT")) begin
         $display("---------------------------IN---------------------------");
         $display("FUSE BITS          : %d", $bits(dfx_in.fuse));
         $display("TAP BITS IN        : %d", $bits(tap_in));
         $display("REGISTER BITS IN   : %d", $bits(dfx_in.register));
//         $display("ODCS TRIGGERS IN   : %d", $bits(dfx_in.odcs));
         $display("IDV BITS IN        : %d", $bits(dfx_in.idv));
         $display("---------------------------OUT---------------------------");
         $display("TAP BITS OUT       : %d", $bits(tap_out));
         $display("IDV BITS OUT       : %d", $bits(dfx_out.idv));
         $display("VIEW BITS OUT      : %d", $bits(dfx_out.view));
      end
      else if ($test$plusargs("MAX_LOCK_TIME")) begin
         $display("Max Lock test is Running now");
         run_max_lock_time_test();
      end
      else if ($test$plusargs("FRAC_TEST")) begin
         run_frac_test();
      end
      else if ($test$plusargs("ADC_TEST")) begin
         run_adc_test();
      end
   `ifdef UPF
//pst coverage 
   //temp    supply_on("vccdist_nom", 0.74);
 // valid power on 
   repeat(8) #(phase_clk_ref);
      supply_on("vccdig_nom", 0.74);
supply_on("vccdist_nom", 0.74);

      // wait 4 ticks
      //
      repeat(8) #(phase_clk_ref);

      // bring up analog supply
      //
  
    $display("debug1");
      supply_on("vccldo_hv", 1.32);
      $display("debug2");
      repeat(8) #(phase_clk_ref);
      supply_on("vccldo_hv", 1.32);
//max min 
      #5us;

      supply_on("vccdig_nom", 0.674);
#5us;

      supply_on("vccdig_nom", 0.675);
#5us;

      supply_on("vccdig_nom", 0.826);
#5us;

      supply_on("vccdig_nom", 0.825);
#5us;

      supply_on("vnnaon_nom", 0.674);
#5us;

      supply_on("vnnaon_nom", 0.675);
#5us;

      supply_on("vnnaon_nom", 0.826);
#5us;

      supply_on("vnnaon_nom", 0.825);
#5us;

      supply_on("vccdist_nom", 0.674);
#5us;

      supply_on("vccdist_nom", 0.675);
#5us;

      supply_on("vccdist_nom", 0.826);
#5us;

      supply_on("vccdist_nom", 0.825);
#5us;

      supply_on("vccldo_hv", 1.14);
#5us;

      supply_on("vccldo_hv", 1.15);
#5us;

      supply_on("vccldo_hv", 1.33);
#5us;

      supply_on("vccldo_hv", 1.32);
 #5us;
      supply_off("vccldo_hv");
#5us;
      supply_off("vccdist_nom");
      supply_off("vccdig_nom");
  #5us;
      supply_off("vnnaon_nom");
      pllen = 1'b0;
#5us;
      supply_on("vccldo_hv", 1.32);
#5us;
      supply_on("vccdig_nom", 0.74);
#5us;
      supply_on("vccdist_nom", 0.74);
#5us;
      supply_on("vccldo_hv", 1.32);
  #5us;
      supply_on("vnnaon_nom", 0.825);
#5us;
pllen = 1'b1;
   ldo_enable = 1'b1;
  
#50us;
      supply_off("vccdist_nom");
#5us;
      supply_off("vccldo_hv");
#5us;
      supply_off("vccdig_nom");
#5us;
      supply_off("vnnaon_nom");
//s2 state
//
powergood_vnn=0;
pllen=0;
#5us;
//supply_on("vccdig_nom", 0.74);
      supply_on("vnnaon_nom", 0.675);
#5us;
      supply_on("vccldo_hv", 1.32);
#5us;
      pllen=1;
#5us;

powergood_vnn=1;

#5us;
      supply_on("vccdig_nom", 0.74);
    #5us;
    supply_on("vccdist_nom", 0.74);

    #5us;
      supply_off("vccdig_nom");
#5us;

      supply_off("vccdist_nom");
 #5us;
   supply_off("vccldo_hv");
#5us;
    
`endif    

//     if ($test$plusargs("TAP")) begin
 //        done=0;
////         wait (done==1);

 //    end
//else begin
    #30us;
//end 
$finish;
   end
   
   final begin
      // Transfer the value of the exit code to the DPI C domain
      //dpi_set_exit_code(exit_code);
   end

   task run_max_lock_time_test;
      `include "max_lock_time.sv"
   endtask

 //  task run_reset_test;
 //     `include "reset_test.sv";
 //  endtask
   
   task run_tllm_en_test;
      `include "tllm_en_test.sv";
   endtask

   task run_ratio_test(int TestRatioNH);
      `include "ratio_test.sv";
   endtask
    
//   task run_odcs_bypass_cal_test;
//      `include "odcs_cal_bypass.sv"
//   endtask

   task run_frac_test;
      `include "frac_test.sv"
   endtask

   task run_adc_test;
      `include "adc_test.sv"
   endtask
   task run_tap_test;
  pllen = 1'b0;
   ldo_enable = 1'b0;
   bypass   = 1'b0;
   dfx_in   = 'd0;
//   mdiv_ratio = 6'b000000;
dfx_in.fuse.tight_loop = 1'b0;

#100us;
ratio=100;
pllen=1;
#100us;
pllen=0;

endtask

task run_emu_reset_test;
  //`include "reset_test.sv";
   // reset is down + bypass = 0, drive dfx bus inputs
   //
   //pllen = 1'b0;
  // ldo_enable = 1'b0;
 //  bypass   = 1'b0;
//   dfx_in   = 'd0;
 //  mdiv_ratio = 6'b000000;
//   dfx_in.fuse.tight_loop = 1'b0;

//   dut.tap_in   = 'd0;
//   dfx_in.fuse.tight_loop      = 1'b1;

   `ifdef LJPLL_MSV
   //`ifdef 1'b1
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
      //SscCycToPeakm1              = 'd299;
      ssc_cyc_to_peak_m1              = 'd299;
   `else
      for (int i=0; i<$bits(dfx_in.fuse); ++i) begin
         dfx_in.fuse[i] = $dist_uniform(seed, 0, 1);
      end
         dfx_in.fuse.fz_spare = 5'b00000;
      for (int i=0; i<$bits(dfx_in.register); ++i) begin
         dfx_in.register[i] = $dist_uniform(seed, 0, 1);
      end
      for (int i=0; i<$bits(ssc_cyc_to_peak_m1); ++i) begin
         ssc_cyc_to_peak_m1[i] = $dist_uniform(seed, 0, 1);
      end
   `endif
//tdoi 
dfx_in.fuse.fz_lockforce = 'd0;

    if (~PostDistEnNH)
       dfx_in.fuse.tight_loop = 1'b1;
         dfx_in.fuse.fz_spare = 5'b00000;
         dfx_in.fuse.tight_loop = 1'b0;
    if (dfx_in.fuse.start_mode)
      dfx_in.fuse.iref_mode = $dist_uniform(seed, 0, 3);
         dfx_in.fuse.fz_spare = 5'b00000;
         dfx_in.fuse.tight_loop = 1'b0;

   `ifdef UPF
      // turn off vss domain
      //
      UPF::supply_on("vss", 0.0);
      UPF::supply_off("vnnaon_nom");
      UPF::supply_off("vccdig_nom");
      UPF::supply_off("vccldo_hv");
      UPF::supply_off("vccdist_nom");

   `else
   //`ifdef LJPLL_USE_PWR_PINS
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      vccdig_nom  = 1'b0;
      vccldo_hv  = 1'b0;
      vccdist_nom = 1'b0;
   `endif
   `endif

   // powergood is down
   //
   //PllDistPwrGoodNnnnH = 1'b0;

   // Set Ref Clk Period
   //
   phase_clk_ref = 20833ps;

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
      //tdoi//if (!($value$plusargs("ratio=%d",ratio))) begin
      //tdoi//  ratio = 'd2;
      //tdoi//  $display("[%.0f ps] [INFO] ratio value if 2",$realtime()); 
      //tdoi//  //ratio    = $dist_uniform(seed, 0, {8{1'b1}});
      //tdoi//end
      //if (!($value$plusargs("fraction=%d",fraction))) begin
       //  fraction = $dist_uniform(seed, 0, {24{1'b1}});
      //end
   `endif
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF] SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
      //fraction          = 24'b0;
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
    //  if (!($value$plusargs("fraction=%d",fraction))) begin
    //     fraction = $dist_uniform(seed, 0, {24{1'b1}});
    // end
   `endif
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF]  SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
     // fraction          = 24'b0;
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
      //if (!($value$plusargs("fraction=%d",fraction))) begin
      //   fraction = $dist_uniform(seed, 0, {24{1'b1}});
      //end
   `endif
   if (SYNC_GEN_EN) begin
     $display("[%.0f ps] [INFO] [SSC_FORCE_OFF]  SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
      //fraction          = 24'b0;
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
      UPF::supply_on("vccdist_nom", 0.74);
      UPF::supply_on("vccdig_nom", 0.74);

      // wait 4 ticks
      //
      repeat(8) #(phase_clk_ref);

      // bring up analog supply
      //
      UPF::supply_on("vccldo_hv", 0.74);
  `else
   //`ifdef LJPLL_USE_PWR_PINS
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      vccdist_nom = 1'b1;
      vccdig_nom  = 1'b1;

      // wait 4 ticks
      //
      repeat(8) #(phase_clk_ref);

      vccldo_hv = 1'b1;
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

   ldo_enable   <= 1'b1;
   $display("[%.0f ps] [INFO] [PLL ENABLE] LDO Enabled\n", $realtime());

   repeat(10) #(phase_clk_ref);
   pllen    <= 1'b1;


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
if(i==1) #100us;
i=0;
   repeat(10) #(phase_clk_ref);
   pllen    <= 1'b0; //temp

   repeat(10) #(phase_clk_ref);
   ldo_enable    <= 1'b0;// temp


   endtask

   task run_reset_test;
      //`include "reset_test.sv";
   // reset is down + bypass = 0, drive dfx bus inputs
   //
   pllen = 1'b0;
   ldo_enable = 1'b0;
   bypass   = 1'b0;
   dfx_in   = 'd0;
//   mdiv_ratio = 6'b000000;
dfx_in.fuse.tight_loop = 1'b0;

//   dut.tap_in   = 'd0;
//   dfx_in.fuse.tight_loop      = 1'b1;

   `ifdef LJPLL_MSV
   //`ifdef 1'b1
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
      //SscCycToPeakm1              = 'd299;
      ssc_cyc_to_peak_m1              = 'd299;
   `else
      for (int i=0; i<$bits(dfx_in.fuse); ++i) begin
         dfx_in.fuse[i] = $dist_uniform(seed, 0, 1);
      end
         dfx_in.fuse.fz_spare = 5'b00000;
      for (int i=0; i<$bits(dfx_in.register); ++i) begin
         dfx_in.register[i] = $dist_uniform(seed, 0, 1);
      end
      for (int i=0; i<$bits(ssc_cyc_to_peak_m1); ++i) begin
         ssc_cyc_to_peak_m1[i] = $dist_uniform(seed, 0, 1);
      end
   `endif
    if (~PostDistEnNH)
       dfx_in.fuse.tight_loop = 1'b1;
         dfx_in.fuse.fz_spare = 5'b00000;
         dfx_in.fuse.tight_loop = 1'b0;
    if (dfx_in.fuse.start_mode)
      dfx_in.fuse.iref_mode = $dist_uniform(seed, 0, 3);
         dfx_in.fuse.fz_spare = 5'b00000;
         dfx_in.fuse.tight_loop = 1'b0;

   `ifdef UPF
      // turn off vss domain
      //
      supply_on("vss", 0.0);

      supply_off("vccldo_hv");
  #5us;
  supply_off("vccdist_nom");
#5us;
      supply_off("vccdig_nom");
      supply_off("vnnaon_nom");
#5us;
   `else
   //`ifdef LJPLL_USE_PWR_PINS
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      vccdig_nom  = 1'b0;
      vccldo_hv  = 1'b0;
      vccdist_nom = 1'b0;
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
         if(i!=14)
         fraction = 24'd0;
         dfx_in.register.ssc_en = 1'b1;
      end else if (~SYNC_GEN_EN && $dist_uniform(seed,0,1)) begin
         $display("[%.0f ps] [INFO] [FRAC_N] Frac-N will be enabled for this test! Fraction = 0.9\n", $realtime());
         // 0.9
         //
         fraction = 24'd15099494;
      end else if (~SYNC_GEN_EN) begin
         dfx_in.register.ssc_en = 1'b0;
      if(i!=14)   fraction = 24'd0;
        $display("[%.0f ps] [INFO] [SSC_FRAC_N_DISABLE] SSC/Frac-N will be off for this test\n", $realtime());
      end
   `else
      if (!($value$plusargs("ratio=%d",ratio))) begin
         ratio    = $dist_uniform(seed, 0, {8{1'b1}});
      end
      if (!($value$plusargs("fraction=%d",fraction))) begin
       if(i!=14)  fraction = $dist_uniform(seed, 0, {24{1'b1}});
      end
    dfx_in.fuse.fz_lockforce=0;
    
        if(i==6) begin
          //bypass=1;
          ratio=136;
      end
        if(i==13) begin
          bypass=1;
          ratio=20;
      end
      if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
       if(i==15) begin
       //   bypass=1;
          ratio=80;
      end
   if(i==16) begin
          bypass=1;
          ratio=5;
      end
 `endif
   if (SYNC_GEN_EN) begin
      $display("[%.0f ps] [INFO] [SSC_FORCE_OFF] SSC/Frac-N cannot be enabled unless the SYNC_GEN_EN param = 0\n", $realtime());
     if(i!=14)  fraction          = 24'b0;
      dfx_in.register.ssc_en = 1'b0;
      if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
 end
       if(i==6) begin
          //bypass=1;
          ratio=136;
      end
        if(i==13) begin
          bypass=1;
          ratio=20;
      end
      if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
       if(i==15) begin
       //   bypass=1;
          ratio=80;
      end
  if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
  if(i==16) begin
          bypass=1;
          ratio=5;
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
    if(i==6) begin
          //bypass=1;
          ratio=136;
      end
    if(i==16) begin
          bypass=1;
          ratio=5;
      end
   if(i==13) begin
          bypass=1;
          ratio=20;
      end
      if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
       if(i==15) begin
       //   bypass=1;
          ratio=80;
      end
   if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
   if(i==16) begin
          bypass=1;
          ratio=5;
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
          if(i==6) begin
          //bypass=1;
          ratio=136;
      end
         if(i==16) begin
          bypass=1;
          ratio=5;
      end
   if(i==13) begin
          bypass=1;
          ratio=20;
      end
      if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
       if(i==15) begin
       //   bypass=1;
          ratio=80;
      end
  if(i==14)begin
          fraction[23]='b1;
          ratio=5;
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
   ratio=$urandom_range(255,1);
   if(i==6) begin
          //bypass=1;
          ratio=136;
      end

    if(i==16) begin
          bypass=1;
          ratio=5;
      end
if(i==13) begin
          bypass=1;
          ratio=20;
      end

   if(i==14)begin
          fraction[23]='b1;
          ratio=5;
      end
       if(i==15) begin
       //   bypass=1;
          ratio=80;
      end

   // wait 4 ticks
   //
   repeat(8) #(phase_clk_ref);

///========================================================================================================
/// Bring ANA domains up and stop RO
///========================================================================================================

   `ifdef UPF
      // bring up vref supply
      //
      supply_on("vnnaon_nom",0.74);
  //temp    supply_on("vccdist_nom", 0.74);
      repeat(8) #(phase_clk_ref);
      supply_on("vccdig_nom", 0.74);
supply_on("vccdist_nom", 0.74);

      // wait 4 ticks
      //
      repeat(8) #(phase_clk_ref);

      // bring up analog supply
      //
      $display("debug1");
      supply_on("vccldo_hv", 1.32);
      $display("debug2");
      repeat(8) #(phase_clk_ref);
  `else
   //`ifdef LJPLL_USE_PWR_PINS
   `ifndef ip2211ringpll_INTC_NO_PWR_PINS
      vccdist_nom = 1'b1;
      vccdig_nom  = 1'b1;

      // wait 4 ticks
      //
      repeat(8) #(phase_clk_ref);

      vccldo_hv = 1'b1;
   `endif
   `endif
      $display("debug3");

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

   //if(i==1) ldo_enable   <= 1'b1;
   $display("[%.0f ps] [INFO] [PLL ENABLE] LDO Enabled\n", $realtime());

   repeat(10) #(phase_clk_ref);
   pllen    <= 1'b1;

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
         repeat(1900 * 2) #(phase_clk_ref);

repeat (8) @(posedge clkref);

   if (dfx_in.register.ssc_en) begin
      repeat(2*(ssc_cyc_to_peak_m1+1) + 10) @(posedge clkref);
   end

   repeat(10) #(phase_clk_ref);
   pllen    <= 1'b0;

   repeat(10) #(phase_clk_ref);
// if(i==1)   ldo_enable    <= 1'b0;
      $display("debug91");

    // if ($test$plusargs("TAP")) begin
  
  endtask
// sampling expected value
//@(posedge trst_n )


//TAP TEST//
   
   logic tck_en;
   logic [268:0] p_tdi;
   logic [8:0] count;
  logic  expected_dfx__reset_b ;
   logic  expected_dfx__powergood ;
   logic  expected_dfx__bypass ;
   logic  [9:0] expected_dfx__ratio ;
   logic  [23:0] expected_dfx__frac;
    logic expected_openloop;
    logic expected_adc_start;
    logic [1:0] expected_adc_start_cnt; 
    logic [1:0] expected_adc_clkdiv;
    logic expected_adc_freeze;
    logic expected_adc_chop_en;
    logic expected_adc_use_vref;
    logic [2:0] expected_adc_sel_in;
    logic [1:0] expected_view_en;
    logic [1:0] expected_view_ana_en;
    logic [1:0] [4:0] expected_view_sel ;
    //logic expected_view_sel0[4:0];
    logic expected_ssc_mod_dfx_en;
    logic expected_ssc_mod_dfx_trigger;
    logic[1:0]  expected_ssc_mod_dfx_steps;
    logic[1:0] expected_ssc_mod_dfx_clkdiv;
    logic expected_tap_fuseoverride;
    logic expected_ovrd_tight_loop;
    logic expected_ovrd_fz_lockforce;
    logic [2:0] expected_ovrd_pfd_residual_pw;
    logic [4:0] expected_ovrd_cp1_trim;
    logic [4:0] expected_ovrd_cp2_trim;
    logic [4:0] expected_ovrd_skadj_ctrl;
    logic [2:0] expected_ovrd_fz_lockcnt;
    logic [3:0] expected_ovrd_lockthresh;
    logic expected_ovrd_lockstickyb;
    logic expected_ovrd_mash_order_plus_one;
    logic [1:0] expected_ovrd_dca_cb;
    logic expected_ovrd_tllm_en;
    logic [5:0]expected_ovrd_dca_ctrl;
    logic [1:0] expected_ovrd_fz_cpnbias;
    logic [4:0] expected_ovrd_fz_irefgen;
    logic expected_ovrd_fz_nopfdpwrgate;
    logic [2:0] expected_ovrd_fz_pfd_pw;
    logic expected_ovrd_fz_lpfclksel;
    logic [1:0] expected_ovrd_fz_pfddly;
    logic [4:0] expected_ovrd_fz_spare;
    logic [5:0] expected_ovrd_fz_startup;
    logic expected_ovrd_fz_vcosel;
    logic [10:0] expected_ovrd_fz_vcotrim;
    logic expected_ovrd_ldo_enable;
    logic [1:0] expected_ovrd_fz_ldo_vinvoltsel;
    logic expected_ovrd_fz_ldo_bypass;
    logic expected_ovrd_fz_ldo_extrefsel;
    logic expected_ovrd_fz_ldo_faststart;
    logic [3:0] expected_ovrd_fz_ldo_fbtrim;
    logic [3:0] expected_ovrd_fz_ldo_reftrim;
    logic [5:0] expected_ovrd_mdiv_ratio;
    logic [1:0] expected_ovrd_vcodiv_ratio;
    logic [9:0] expected_ovrd_zdiv0_ratio;
    logic expected_ovrd_zdiv0_ratio_p5;
    logic [9:0] expected_ovrd_zdiv1_ratio;
    logic expected_ovrd_zdiv1_ratio_p5;
    logic expected_start_measurement;
    logic expected_ta_ldo_hiz_debug;
    logic expected_ta_ldo_idq_debug;
    logic [4:0] expected_ta_spare;
    logic expected_ta_openloop2;
    logic [3:0] expected_ta_vctlrdac;
    /*
* initial 
   begin
	tck_en   = 1'b0;
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6688; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_FDFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6288; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_FBFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6688; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_F9FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6A88; 
	p_tdi    = 269'h1000_FFFF_0000_FFFF_0000_0000_0000_F7FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6E88; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_F5FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6688; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_F3FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6288; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_F1FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6E88; 
	//p_tdi    = 269'h3000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6A88; 
        tdi      = 1'b0;
       // tck      = 1'b0;
	tshiftdr = 1'b0;
	tupdatedr= 1'b0;
	treg_en	 = 1'b0;
	trst_n   = 1'b0;
	
	count 	 = 9'd0;
	//tclkdr	 = 1'b0;
	tcapturedr	 = 1'b0;
	
	@(posedge pllen);
	tck_en = 1'b1;
	
	 #10ps trst_n    	= 1'b1;
	 #5ps treg_en		= 1'b1;
	 #5ps tshiftdr   	= 1'b1;
	 #14.01us tshiftdr  	= 1'b0;
	 #59ns tupdatedr	= 1'b1;
	 #54ns tupdatedr  	= 1'b0;
	 p_tdi    = 269'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00000000_00000000_0000;
	 #5ps count		= 9'd0;
	 #5ps tshiftdr   	= 1'b1;
	 #14000ns treg_en	= 1'b0;
	 tshiftdr  		= 1'b0;
	 #100ps treg_en		= 1'b1;
	 tcapturedr		= 1'b1;
	 #49ns tcapturedr	= 1'b0;
	 treg_en		= 1'b0;


   end
 */ 

   assign tck = tck_en ? clkref : 1'b0;

   always @(posedge tck) begin
	   if (count < 269) begin
		   tdi = p_tdi[count];
		   count = count + 1;
	   end
	   else begin
		   tdi = 0;
		   count = 0;
           tupdatedr	= 1'b1;
@(posedge tck) 	  tupdatedr  	= 1'b0;
	 p_tdi    = 269'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00000000_00000000_0000;

	   end
   end
   
// DFT TEST //
   initial begin
	   powergood_vnn = 1'b0;
	   ldo_vref = 1'b0;
	   #833ns powergood_vnn = 1'b1;
	   #10ns ldo_vref = 0.6;
   end

   initial begin 
 


     if ($test$plusargs("TAP")) begin
         forever begin
         // enable_ref = 1'b1;
      //write new test 
       tck_en = 1'b0;
//	p_tdi    = 269'h1000_FFFF_0000_FFFF_0000_0000_0000_F7FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6E88; 
   p_tdi=269'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF; 

if(i!=0) begin
p_tdi[199:190]=$urandom_range(255,0); //ratio
p_tdi[188:165]=$random; //frac
p_tdi[188]=$urandom_range(1,0); //frac[23]
p_tdi[205]=$urandom_range(1,0); //enable 
p_tdi[203]=$urandom_range(1,0); // power good 
p_tdi[201]=$urandom_range(1,0); //bypass
p_tdi[164]=$urandom_range(1,0); //open loop 
p_tdi[163]=$urandom_range(1,0);// adc start 
p_tdi[162:161]=$urandom_range(7,0); //adc start count 
p_tdi[160:159]=$urandom_range(7,0); //adc_clkdiv 

p_tdi[158]=$urandom_range(1,0);// adc freeze
p_tdi[157]=$urandom_range(1,0);// adc chop en
p_tdi[156]=$urandom_range(1,0);// adc use vref
p_tdi[155:153]=$urandom_range(7,0); //adc sel in

p_tdi[152:151]=$urandom_range(4,0); //Enable view_dig_out[0] and 1 debug output
p_tdi[150:149]=$urandom_range(4,0); //Enable viewanabus[1] and 0  debug output

p_tdi[148:144]=$urandom_range(32,0); //view sel 1
p_tdi[143:139]=$urandom_range(32,0); //view sel 0
if(i>16) p_tdi[143:139]=20;

if(i==3)
p_tdi[201]=1; //bypass
else
p_tdi[201]=0; //bypass

if(i==4)
p_tdi[130]=1; //lck force 
else
p_tdi[130]=0; //lck force 


p_tdi[138]=$urandom_range(1,0); //ssc_mod_dfx_en 
p_tdi[137]=$urandom_range(1,0);// ssc_mod_dfx_trigger 
p_tdi[136:135]=$urandom_range(4,0); //ssc_mod_dfx_steps 
p_tdi[134:133]=$urandom_range(4,0); //assc_mod_dfx_clkdiv

p_tdi[132]=$urandom_range(1,0); //tap_fuseoverride

p_tdi[131]=$urandom_range(1,0); //ovrd_tight_loop

p_tdi[129:127]=$urandom_range(4,0); //ovrd_pfd_residual_pw

p_tdi[12]=$urandom_range(1,0); //start_measurement12

p_tdi[11]=$urandom_range(1,0); //ta_ldo_hiz_debug
p_tdi[10]=$urandom_range(1,0); //ta_ldo_idq_debug

p_tdi[9:5]=$urandom_range(32,0); //ta_spare
p_tdi[4]=$urandom_range(1,0); //tta_openloop2
p_tdi[3:0]=$urandom_range(32,0); //ta_vctlrdac
if(i==32)begin
p_tdi[143:139]=20;// view sel 0;
p_tdi[152:151]='h1; //Enable view_dig_out[0] and 1 debug output view_en
p_tdi[150:149]='h2; //Enable viewanabus[1] and 0  debug output view_ana_en

p_tdi[12]=1; //start measurement 
p_tdi[205]=1; //enable 
p_tdi[203]=1; // power good 
p_tdi[201]=0; //bypass


$display("%0t ps for bist",$time);
end

end
if(i==1 || i==2) p_tdi[131:13]=0;
 tdi      = 1'b0;
       // tck      = 1'b0;
	tshiftdr = 1'b0;
	tupdatedr= 1'b0;
	treg_en	 = 1'b0;
	trst_n   = 1'b0;
$display("clkref");
    @(posedge clkref )
$display("clkref2");


	count 	 = 9'd0;
	//tclkdr	 = 1'b0;
	tcapturedr	 = 1'b0;

    #10us;
$display("debug_inside before TAP test");

calculate_exp();


wait(done==1)  
$display("debug_inside TAP test"); 
    tck_en = 1'b1;
	
	 #10ps trst_n    	= 1'b1;
	 #5ps treg_en		= 1'b1;
	 #5ps tshiftdr   	= 1'b1;
	 #14.01us tshiftdr  	= 1'b0;
//	 #59ns tupdatedr	= 1'b1;
//	 #54ns tupdatedr  	= 1'b0;
//	 p_tdi    = 269'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00000000_00000000_0000;
//	 #5ps count		= 9'd0;
	 #5ps tshiftdr   	= 1'b1;
	 #14000ns treg_en	= 1'b0;
	 tshiftdr  		= 1'b0;
	 #100ps treg_en		= 1'b1;
	 tcapturedr		= 1'b1;
	 #49ns tcapturedr	= 1'b0;
	 treg_en		= 1'b0;
     $display("pllen 1 ends %t",$time);
     compare_value();

 #10us;
tshiftdr   	= 1'b1;
#100us;
//save tdo values here 
tshiftdr   	= 1'b0;

 #500us;
done=0;
end

 end 
 else begin
    

       @(posedge clkref )
   tck_en = 1'b0;
	p_tdi    = 269'h1000_FFFF_0000_FFFF_0000_0000_0000_F7FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6E88; 
    tdi      = 1'b0;
       // tck      = 1'b0;
	tshiftdr = 1'b0;
	tupdatedr= 1'b0;
	treg_en	 = 1'b0;
	trst_n   = 1'b0;
	
	count 	 = 9'd0;
	//tclkdr	 = 1'b0;
	tcapturedr	 = 1'b0;
  forever  begin
//@(posedge clkref )
@(pllen)
//#10ps;
if(pllen==0)begin
$display("pllen 0 %t",$time);
    tck_en = 1'b0;
	p_tdi    = 269'h1000_FFFF_0000_FFFF_0000_0000_0000_F7FF_0000_FFFF_0000_FFFF_0000_FFFF_0000_FFFF_6E88; 
     if ($test$plusargs("TAP")) begin
//  if(i==0)   p_tdi= 'hF;
  p_tdi=269'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF; 

      end
          tdi      = 1'b0;
       // tck      = 1'b0;
	tshiftdr = 1'b0;
	tupdatedr= 1'b0;
	treg_en	 = 1'b0;
	trst_n   = 1'b0;
	
	count 	 = 9'd0;
	//tclkdr	 = 1'b0;
	tcapturedr	 = 1'b0;
end
else begin
$display("pllen 1 %t",$time);
	tck_en = 1'b1;
     if ($test$plusargs("TAP")) begin
// @(posedge clkref )

//    pllen=0;
     end	
	 #10ps trst_n    	= 1'b1;
	 #5ps treg_en		= 1'b1;
	 #5ps tshiftdr   	= 1'b1;
	 #14.01us tshiftdr  	= 1'b0;
	 #59ns tupdatedr	= 1'b1;
	 #54ns tupdatedr  	= 1'b0;
	 p_tdi    = 269'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00000000_00000000_0000;
	 #5ps count		= 9'd0;
	 #5ps tshiftdr   	= 1'b1;
	 #14000ns treg_en	= 1'b0;
	 tshiftdr  		= 1'b0;
	 #100ps treg_en		= 1'b1;
	 tcapturedr		= 1'b1;
	 #49ns tcapturedr	= 1'b0;
	 treg_en		= 1'b0;
     $display("pllen 1 ends %t",$time);

end
end
end

end
task calculate_exp();
expected_dfx__reset_b = p_tdi[206] ? p_tdi[205] : pllen ;
expected_dfx__powergood = p_tdi[204] ? p_tdi[203] : powergood_vnn  ;
expected_dfx__bypass = p_tdi[202] ? p_tdi[201] : bypass ;
expected_dfx__ratio[9:0] = p_tdi[200] ? p_tdi[199:190]: ratio[9:0] ;
expected_dfx__frac[23:0] = p_tdi[189] ? p_tdi[188:165] : fraction ;
expected_openloop = p_tdi[164];
expected_adc_start = p_tdi[163]; 
expected_adc_start_cnt[1:0] = p_tdi[162:161]; 
expected_adc_clkdiv[1:0] = p_tdi[160:159];
expected_adc_freeze = p_tdi[158];
expected_adc_chop_en = p_tdi[157];
expected_adc_use_vref = p_tdi[156];
expected_adc_sel_in [2:0]= p_tdi[155:153];
//expected_view_en[1:0] = p_tdi[152:151];
//expected_view_ana_en = p_tdi[150:149];
expected_view_sel [1][4:0]= p_tdi[148:144];
expected_view_sel [0][4:0] = p_tdi[143:139];
expected_ssc_mod_dfx_en = p_tdi[138];
expected_ssc_mod_dfx_trigger = p_tdi[137];
expected_ssc_mod_dfx_steps[1:0] = p_tdi[136:135];
expected_ssc_mod_dfx_clkdiv[1:0] = p_tdi[134:133];
expected_tap_fuseoverride = p_tdi[132];
expected_ovrd_tight_loop = p_tdi[131];
expected_ovrd_fz_lockforce = p_tdi[130];
expected_ovrd_pfd_residual_pw[2:0] = p_tdi[129:127];
expected_ovrd_cp1_trim[4:0] = p_tdi[126:122];
expected_ovrd_cp2_trim[4:0] = p_tdi[121:117];
expected_ovrd_skadj_ctrl[4:0] = p_tdi[116:112];
expected_ovrd_fz_lockcnt[2:0] = p_tdi[111:109];
expected_ovrd_lockthresh[3:0] = p_tdi[108:105];
expected_ovrd_lockstickyb = p_tdi[104];
expected_ovrd_mash_order_plus_one  = p_tdi[103];
expected_ovrd_dca_cb[1:0] = p_tdi[102:101];
expected_ovrd_tllm_en = p_tdi[100];
expected_ovrd_dca_ctrl[5:0] = p_tdi[99:94];
expected_ovrd_fz_cpnbias[1:0] = p_tdi[93:92];
expected_ovrd_fz_irefgen[4:0] = p_tdi[91:87];
expected_ovrd_fz_nopfdpwrgate = p_tdi[86];
expected_ovrd_fz_pfd_pw[2:0] = p_tdi[85:83];
expected_ovrd_fz_lpfclksel = p_tdi[82];
expected_ovrd_fz_pfddly[1:0] = p_tdi[81:80];
expected_ovrd_fz_spare[4:0] = p_tdi[79:75];
expected_ovrd_fz_startup[5:0] = p_tdi[74:69];
expected_ovrd_fz_vcosel = p_tdi[68];
expected_ovrd_fz_vcotrim[10:0] = p_tdi[67:57];
expected_ovrd_ldo_enable  = p_tdi[56];
expected_ovrd_fz_ldo_vinvoltsel[1:0] = p_tdi[55:54];
expected_ovrd_fz_ldo_bypass  = p_tdi[53];
expected_ovrd_fz_ldo_extrefsel = p_tdi[52];
expected_ovrd_fz_ldo_faststart = p_tdi[51];
expected_ovrd_fz_ldo_fbtrim[3:0] = p_tdi[50:47];
expected_ovrd_fz_ldo_reftrim[3:0] = p_tdi[46:43];
expected_ovrd_mdiv_ratio[5:0] = p_tdi[42:37];
expected_ovrd_vcodiv_ratio[1:0] = p_tdi[36:35];
expected_ovrd_zdiv0_ratio[9:0] = p_tdi[34:25];
expected_ovrd_zdiv0_ratio_p5 = p_tdi[24];
expected_ovrd_zdiv1_ratio[9:0] = p_tdi[23:14];
expected_ovrd_zdiv1_ratio_p5 = p_tdi[13];
expected_start_measurement = p_tdi[12];
expected_ta_ldo_hiz_debug = p_tdi[11];
expected_ta_ldo_idq_debug = p_tdi[10];
expected_ta_spare[4:0] = p_tdi[9:5];
expected_ta_openloop2 = p_tdi[4];
expected_ta_vctlrdac[3:0] = p_tdi[3:0];

endtask    


task compare_value();

     $display("Starting checks for all expected values,p_tdi value is %x, %t",p_tdi , $time);

    
    if (expected_dfx__reset_b != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__reset_b)
    $error("\n%t dfx_reset_b is not matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__reset_b ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__reset_b);
else    $display("\n%t dfx_reset_b is matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__reset_b ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__reset_b);

if (expected_dfx__powergood != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__powergood)
    $error("\n%t dfx_powerggod is not matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__powergood ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__powergood);
else   $display("\n%t dfx_powerggod is matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__powergood ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__powergood);


if (expected_dfx__bypass != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__bypass)
    $error("\n%t dfx_bypass is not matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__bypass ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__bypass);
else $display("\n%t dfx_bypass is matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__bypass ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__bypass);


if (expected_dfx__ratio[9:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ratio[9:0])
    $error("\n%t dfx_ratio is not matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__ratio[9:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ratio[9:0]);
else $display("\n%t dfx_ratio is matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__ratio[9:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ratio[9:0]);


if (expected_dfx__frac[23:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__fraction[23:0])
    $error("\n%t dfx_frac is not matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__frac[23:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__fraction[23:0]);
else $display("\n%t dfx_frac is matching p_tdi expected %d, p_tdi %d",$time,expected_dfx__frac[23:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__fraction[23:0]);

 if (expected_openloop != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx__openloop)
     $error("\n%t dfx__openloop is not matching p_tdi expected %d, p_tdi %d",$time,expected_openloop,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx__openloop);
 else $display("\n%t dfx__openloop is matching p_tdi expected %d, p_tdi %d",$time,expected_openloop,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx__openloop);


     if (expected_adc_start != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_start)
    $error("\n%t dfx__adc_start is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_start,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_start);
 else $display("\n%t dfx__adc_start is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_start,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_start);


     if (expected_adc_start_cnt[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_start_cnt[1:0])
    $error("\n%t dfx__adc_start_cnt is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_start_cnt[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_start_cnt[1:0]);
 else $display("\n%t dfx__adc_start_cnt is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_start_cnt[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_start_cnt[1:0]);


    if (expected_adc_clkdiv != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_clkdiv[1:0])
    $error("\n%t dfx__adc_clkdiv is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_clkdiv ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_clkdiv[1:0]);
    else $display("\n%t dfx__adc_clkdiv is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_clkdiv ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_clkdiv[1:0]);

if (expected_adc_freeze != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_freeze)
    $error("\n%t dfx__adc_freeze is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_freeze , ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_freeze);
else $display("\n%t dfx__adc_freeze is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_freeze , ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_freeze);


if (expected_adc_chop_en != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_chop_en)
    $error("\n%tdfx__adc_chop_en is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_chop_en ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_chop_en);
else $display("\n%tdfx__adc_chop_en is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_chop_en ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_chop_en);


if (expected_adc_use_vref != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_use_vref )
    $error("\n%t dfc__adc_use_vref is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_use_vref ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_use_vref);
else $display("\n%t dfc__adc_use_vref is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_use_vref ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_use_vref);


if (expected_adc_sel_in[2:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_sel_in[2:0])
    $error("\n%t dfx__adc_sel_in is not matching p_tdi expected %d, p_tdi %d",$time,expected_adc_sel_in ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_sel_in[2:0] );
else $display("\n%t dfx__adc_sel_in is matching p_tdi expected %d, p_tdi %d",$time,expected_adc_sel_in ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__adc_sel_in[2:0] );


//if (expected_view_en[1:0] != );
    //else $display("\n%t dfx__adc_view_en is not matching p_tdi expected %d, p_tdi %d",$time,expected_view_en[1:0] ,);

    if (expected_view_sel[1] [4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ViewSelNnnnH [1])
    $error("\n%t dfx_view_Sel is not matching p_tdi expected %d, p_tdi %d",$time,expected_view_sel[1][4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ViewSelNnnnH[1][4:0]);
else $display("\n%t dfx_view_Sel is matching p_tdi expected %d, p_tdi %d",$time,expected_view_sel[1][4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ViewSelNnnnH[1][4:0]);


if (expected_view_sel[0] [4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ViewSelNnnnH [0])
    $error("\n%t dfx_view_Sel is not matching p_tdi expected %d, p_tdi %d",$time,expected_view_sel[0][4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ViewSelNnnnH[0][4:0]);
else $display("\n%t dfx_view_Sel is matching p_tdi expected %d, p_tdi %d",$time,expected_view_sel[0][4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ViewSelNnnnH[0][4:0]);


if (expected_ssc_mod_dfx_en != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscDfxEnNH )
    $error("\n%t ssc_mod_dfx_en is not matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_en , ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscDfxEnNH);
else $display("\n%t ssc_mod_dfx_en is matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_en , ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscDfxEnNH);


if (expected_ssc_mod_dfx_trigger != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModTrigNH)
    $error("\n%t ssc_mod_dfx_trigger is not matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_trigger ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModTrigNH);
else $display("\n%t ssc_mod_dfx_trigger is matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_trigger ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModTrigNH);


if (expected_ssc_mod_dfx_steps[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModStepsNH[1:0])
    $error("\n%t ssc_mod_dfx_steps is not matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_steps[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModStepsNH[1:0]);
else $display("\n%t ssc_mod_dfx_steps is matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_steps[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModStepsNH[1:0]);


if (expected_ssc_mod_dfx_clkdiv[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModClkDivNH[1:0] )
    $error("\n%t ssc_mod_dfx_clkdiv is not matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_clkdiv[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModClkDivNH[1:0]);
else $display("\n%t ssc_mod_dfx_clkdiv is matching p_tdi expected %d, p_tdi %d",$time,expected_ssc_mod_dfx_clkdiv[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__SscModClkDivNH[1:0]);


if (expected_tap_fuseoverride != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__fuseoverride)
    $error("\n%t tap_fuseoverride is not matching p_tdi expected %d, p_tdi %d",$time,expected_tap_fuseoverride ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__fuseoverride);
else $display("\n%t tap_fuseoverride is matching p_tdi expected %d, p_tdi %d",$time,expected_tap_fuseoverride ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__fuseoverride);


if (expected_ovrd_tight_loop != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_tight_loop)
    $error("\n%t ovrd_tight_loop is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_tight_loop ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_tight_loop);
else $display("\n%t ovrd_tight_loop is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_tight_loop ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_tight_loop);


if (expected_ovrd_fz_lockforce != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lockforce)
    $error("\n%t ovrd_fz_lockforce is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_lockforce ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lockforce);
 else $display("\n%t ovrd_fz_lockforce is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_lockforce ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lockforce);



if (expected_ovrd_pfd_residual_pw[2:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_pfd_residual_pw[2:0] )
    $error("\n%t ovrd_pfd_residual_pw is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_pfd_residual_pw[2:0], ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_pfd_residual_pw[2:0] );
else $display("\n%t ovrd_pfd_residual_pw is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_pfd_residual_pw[2:0], ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_pfd_residual_pw[2:0] );


if (expected_ovrd_cp1_trim[4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_cp1_trim[4:0])
    $error("\n%t ovrd_cp1_trim is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_cp1_trim[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_cp1_trim[4:0]);
else $display("\n%t ovrd_cp1_trim is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_cp1_trim[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_cp1_trim[4:0]);


if (expected_ovrd_cp2_trim[4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_cp2_trim[4:0])
    $error("\n%t ovrd_cp2_trim is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_cp2_trim[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_cp2_trim[4:0]);
 else $display("\n%t ovrd_cp2_trim is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_cp2_trim[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_cp2_trim[4:0]);


if (expected_ovrd_skadj_ctrl[4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_skadj_ctrl[4:0])
    $error("\n%t ovrd_skadj_ctrl is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_skadj_ctrl[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_skadj_ctrl[4:0]);
else $display("\n%t ovrd_skadj_ctrl is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_skadj_ctrl[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_skadj_ctrl[4:0]);


if (expected_ovrd_fz_lockcnt[2:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lockcnt[2:0])
    $error("\n%t ovrd_fz_lockcnt is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_lockcnt[2:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lockcnt[2:0]);
else $display("\n%t ovrd_fz_lockcnt is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_lockcnt[2:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lockcnt[2:0]);

if (expected_ovrd_lockthresh[3:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_lockthresh[3:0])
    $error("\n%t ovrd_lock_thresh  is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_lockthresh[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_lockthresh[3:0]);
else $display("\n%t ovrd_lock_thresh  is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_lockthresh[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_lockthresh[3:0]);



if (expected_ovrd_lockstickyb != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_lockstickyb)
    $error("\n%t ovrd_lockstickyb is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_lockstickyb ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_lockstickyb);
else $display("\n%t ovrd_lockstickyb is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_lockstickyb ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_lockstickyb);

if (expected_ovrd_mash_order_plus_one != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_mash_order_plus_one)
    $error("\n%t ovrd_mash_order_plus_one is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_mash_order_plus_one ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_mash_order_plus_one);
 else $display("\n%t ovrd_mash_order_plus_one is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_mash_order_plus_one ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_mash_order_plus_one);

if (expected_ovrd_dca_cb[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_dca_cb[1:0] )
    $error("\n%t is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_dca_cb[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_dca_cb[1:0]);
else $display("\n%t is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_dca_cb[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_dca_cb[1:0]);


if (expected_ovrd_tllm_en != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_tllm_en)
    $error("\n%t ovrd_tllm_en is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_tllm_en ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_tllm_en);
 else $display("\n%t ovrd_tllm_en is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_tllm_en ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_tllm_en);


if (expected_ovrd_dca_ctrl[5:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_dca_ctrl[5:0] )
    $error("\n%t ovrd_dca_ctrl[5:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_dca_ctrl[5:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_dca_ctrl[5:0]);
else $display("\n%t ovrd_dca_ctrl[5:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_dca_ctrl[5:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_dca_ctrl[5:0]);


if (expected_ovrd_fz_cpnbias[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_cpnbias[1:0])
    $error("\n%t ovrd_fz_cpnbias[1:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_cpnbias[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_cpnbias[1:0]);
 else $display("\n%t ovrd_fz_cpnbias[1:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_cpnbias[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_cpnbias[1:0]);


if (expected_ovrd_fz_irefgen[4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_irefgen[4:0])
    $error("\n%t ovrd_fz_irefgen is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_irefgen[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_irefgen[4:0]);
else $display("\n%t ovrd_fz_irefgen is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_irefgen[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_irefgen[4:0]);


if (expected_ovrd_fz_nopfdpwrgate != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_nopfdpwrgate)
    $error("\n%t overd_fz_nopfdpwrgate is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_nopfdpwrgate ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_nopfdpwrgate);
 else $display("\n%t overd_fz_nopfdpwrgate is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_nopfdpwrgate ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_nopfdpwrgate);


if (expected_ovrd_fz_pfd_pw[2:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_pfd_pw[2:0])
    $error("\n%t ovrd_fz_pfd_pw[2:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_pfd_pw[2:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_pfd_pw[2:0]);
else $display("\n%t ovrd_fz_pfd_pw[2:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_pfd_pw[2:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_pfd_pw[2:0]);


if (expected_ovrd_fz_lpfclksel != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lpfclksel)
    $error("\n%t ovrd_fz_lpfclksel is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_lpfclksel ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lpfclksel);
else $display("\n%t ovrd_fz_lpfclksel is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_lpfclksel ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_lpfclksel);


if (expected_ovrd_fz_pfddly[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_pfddly[1:0])
    $error("\n%t ovrd_fz_pfddly[1:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_pfddly[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_pfddly[1:0]);
else $display("\n%t ovrd_fz_pfddly[1:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_pfddly[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_pfddly[1:0]);


if (expected_ovrd_fz_spare[4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_spare[4:0])
    $error("\n%t ovrd_fz_spare is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_spare[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_spare[4:0]);
else $display("\n%t ovrd_fz_spare is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_spare[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_spare[4:0]);

if (expected_ovrd_fz_startup[5:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_startup[5:0] )
    $error("\n%t ovrd_fz_startup[5:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_startup[5:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_startup[5:0]);
else $display("\n%t ovrd_fz_startup[5:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_startup[5:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_startup[5:0]);


if (expected_ovrd_fz_vcosel != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_vcosel)
    $error("\n%t ovrd_fz_vcosel is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_vcosel ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_vcosel);
else $display("\n%t ovrd_fz_vcosel is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_vcosel ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_vcosel);


if (expected_ovrd_fz_vcotrim[10:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_vcotrim[10:0])
    $error("\n%t ovrd_fz_vcotrim[10:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_vcotrim[10:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_vcotrim[10:0]);
else $display("\n%t ovrd_fz_vcotrim[10:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_vcotrim[10:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_vcotrim[10:0]);


if (expected_ovrd_ldo_enable != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_ldo_enable)
    $error("\n%t ovrd_ldo_enable is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_ldo_enable ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_ldo_enable);
else $display("\n%t ovrd_ldo_enable is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_ldo_enable ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_ldo_enable);



if (expected_ovrd_fz_ldo_vinvoltsel[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_vinvoltsel[1:0])
    $error("\n%t ovrd_fz_ldo_vinvoltsel[1:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_vinvoltsel[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_vinvoltsel[1:0]);
 else $display("\n%t ovrd_fz_ldo_vinvoltsel[1:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_vinvoltsel[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_vinvoltsel[1:0]);


if (expected_ovrd_fz_ldo_bypass!= ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_bypass)
    $error("\n%t ovrd_fz_ldo_bypass isnot matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_bypass,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_bypass);
else $display("\n%t ovrd_fz_ldo_bypass is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_bypass,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_bypass);


if (expected_ovrd_fz_ldo_extrefsel != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_extrefsel)
    $error("\n%t ovrd_fz_ldo_extrefsel is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_extrefsel ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_extrefsel);
else $display("\n%t ovrd_fz_ldo_extrefsel is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_extrefsel ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_extrefsel);

if (expected_ovrd_fz_ldo_faststart != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_faststart)
    $error("\n%t ovrd_fz_ldo_faststart is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_faststart ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_faststart);
else $display("\n%t ovrd_fz_ldo_faststart is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_faststart ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_faststart);

if (expected_ovrd_fz_ldo_fbtrim[3:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_fbtrim[3:0])
    $error("\n%t ovrd_fz_ldo_fbtrim[3:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_fbtrim[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_fbtrim[3:0]);
else $display("\n%t ovrd_fz_ldo_fbtrim[3:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_fbtrim[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_fbtrim[3:0]);


if (expected_ovrd_fz_ldo_reftrim[3:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_reftrim[3:0])
    $error("\n%t ovrd_fz_ldo_reftrim[3:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_reftrim[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_reftrim[3:0]);
 else $display("\n%t ovrd_fz_ldo_reftrim[3:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_fz_ldo_reftrim[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_fz_ldo_reftrim[3:0]);


if (expected_ovrd_mdiv_ratio[5:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_mdiv_ratio[5:0])
    $error("\n%t ovrd_mdiv_ratio[5:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_mdiv_ratio[5:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_mdiv_ratio[5:0]);
else $display("\n%t ovrd_mdiv_ratio[5:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_mdiv_ratio[5:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_mdiv_ratio[5:0]);


if (expected_ovrd_vcodiv_ratio[1:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_vcodiv_ratio[1:0])
    $error("\n%t ovrd_vcodiv_ratio[1:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_vcodiv_ratio[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_vcodiv_ratio[1:0]);
else $display("\n%t ovrd_vcodiv_ratio[1:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_vcodiv_ratio[1:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_vcodiv_ratio[1:0]);


if (expected_ovrd_zdiv0_ratio[9:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv0_ratio[9:0])
    $error("\n%t ovrd_zdiv0_ratio[9:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv0_ratio[9:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv0_ratio[9:0]);
else $display("\n%t ovrd_zdiv0_ratio[9:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv0_ratio[9:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv0_ratio[9:0]);

if (expected_ovrd_zdiv0_ratio_p5 != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv0_ratio_p5)
    $error("\n%t ovrd_zdiv0_ratio_p5 is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv0_ratio_p5 ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv0_ratio_p5);
else $display("\n%t ovrd_zdiv0_ratio_p5 is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv0_ratio_p5 ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv0_ratio_p5);


if (expected_ovrd_zdiv1_ratio[9:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv1_ratio[9:0])
    $error("\n%t ovrd_zdiv1_ratio[9:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv1_ratio[9:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv1_ratio[9:0]);
else $display("\n%t ovrd_zdiv1_ratio[9:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv1_ratio[9:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv1_ratio[9:0]);


if (expected_ovrd_zdiv1_ratio_p5 != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv1_ratio_p5)
    $error("\n%t ovrd_zdiv1_ratio_p5 is not matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv1_ratio_p5 ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv1_ratio_p5);
else $display("\n%t ovrd_zdiv1_ratio_p5 is matching p_tdi expected %d, p_tdi %d",$time,expected_ovrd_zdiv1_ratio_p5 ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.ovrd_zdiv1_ratio_p5);


if (expected_start_measurement != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__start_measurement)
    $error("\n%t start_measurement is not matching p_tdi expected %d, p_tdi %d",$time,expected_start_measurement ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__start_measurement);
 else $display("\n%t start_measurement is matching p_tdi expected %d, p_tdi %d",$time,expected_start_measurement ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__start_measurement);

if (expected_ta_ldo_hiz_debug != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_ldo_hiz_debug)
    $error("\n%t ta_ldo_hiz_debug is not matching p_tdi expected %d, p_tdi %d",$time,expected_ta_ldo_hiz_debug ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_ldo_hiz_debug);
 else $display("\n%t ta_ldo_hiz_debug is matching p_tdi expected %d, p_tdi %d",$time,expected_ta_ldo_hiz_debug ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_ldo_hiz_debug);


if (expected_ta_ldo_idq_debug != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_ldo_idq_debug)
    $error("\n%t ta_ldo_idq_debug is not matching p_tdi expected %d, p_tdi %d",$time,expected_ta_ldo_idq_debug ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_ldo_idq_debug);
else $display("\n%t ta_ldo_idq_debug is matching p_tdi expected %d, p_tdi %d",$time,expected_ta_ldo_idq_debug ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_ldo_idq_debug);


if (expected_ta_spare[4:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_spare[4:0])
    $error("\n%t ta_spare[4:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ta_spare[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_spare[4:0]);
else $display("\n%t ta_spare[4:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ta_spare[4:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_spare[4:0]);


if (expected_ta_openloop2 != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_openloop2)
    $error("\n%t ta_openloop2 is not matching p_tdi expected %d, p_tdi %d",$time,expected_ta_openloop2 ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_openloop2);
 else $display("\n%t ta_openloop2 is matching p_tdi expected %d, p_tdi %d",$time,expected_ta_openloop2 ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_openloop2);


if (expected_ta_vctlrdac[3:0] != ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_vctlrdac[3:0])
    $error("\n%t ta_vctlrdac[3:0] is not matching p_tdi expected %d, p_tdi %d",$time,expected_ta_vctlrdac[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_vctlrdac[3:0]);
else $display("\n%t ta_vctlrdac[3:0] is matching p_tdi expected %d, p_tdi %d",$time,expected_ta_vctlrdac[3:0] ,ringpll_tb.dut.iip2211ringpll_sip.sip.dfx.dfx__ta_vctlrdac[3:0]);

$display("ending checks for all expected values, %t", $time);
 
 endtask 

endmodule

