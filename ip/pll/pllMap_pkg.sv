package pllMap_pkg;

   typedef struct packed {
    logic tcapturedr   ;          
    logic tck          ;          
    logic tdi          ;          
    logic treg_en      ;          
    logic trst_n       ;          
    logic tshiftdr     ;          
    logic tupdatedr    ;
    logic				mash_order_plus_one;           
    
    logic [4:0]fz_cp1trim               ;
    logic [4:0]fz_cp2trim               ;
    logic [1:0]fz_cpnbias               ;
    logic [1:0]fz_dca_cb                ;
    logic [5:0]fz_dca_ctrl              ;
    logic [4:0]fz_irefgen               ;
    logic fz_ldo_bypass                 ;
    logic fz_ldo_extrefsel              ;
    logic fz_ldo_faststart              ;
    logic [3:0]fz_ldo_fbtrim                 ;
    logic [3:0]fz_ldo_reftrim           ;
    logic [1:0]fz_ldo_vinvoltsel        ;
    logic [2:0]fz_lockcnt               ;
    logic fz_lockforce                  ;
    logic fz_lockstickyb                ;
    logic [3:0]fz_lockthresh            ;
    logic fz_lpfclksel                  ;
    logic fz_nopfdpwrgate               ;
    logic [2:0]fz_pfd_pw                ;
    logic [1:0]fz_pfddly                ;
    logic [4:0]fz_skadj                 ;
    logic [4:0]fz_spare                 ;
    logic [5:0]fz_startup               ;
    logic fz_tight_loopb                ;
    logic fz_vcosel                     ;
    logic [10:0]fz_vcotrim              ;

    logic idfx_fscan_byprstb            ;
    logic idfx_fscan_clkungate          ;
    logic idfx_fscan_mode               ;
    logic idfx_fscan_rstbypen           ;
    logic [2:0]idfx_fscan_sdi           ;
    logic idfx_fscan_shiften            ;
    logic idvdisable_bi                 ;
    logic idvfreqai                     ;
    logic idvfreqbi                     ;
    logic idvpulsei                     ;
    logic idvtclki                      ;
    logic idvtctrli                     ;
    logic idvtdi                        ;
    logic idvtresi                      ;
    logic ldo_enable                    ;

    logic [23:0]ssc_frac_step           ;
    logic ssc_en                        ;
    logic [8:0]ssc_cyc_to_peak_m1       ;

    logic clkpostdist                   ;

    logic pllfwen_b                     ;
    logic bypass                        ;

    
    logic [9:0]zdiv0_ratio              ;
    logic zdiv0_ratio_p5                ;
    logic [9:0]zdiv1_ratio              ;
    logic zdiv1_ratio_p5                ;
    logic powergood_vnn                 ;
    logic [5:0]mdiv_ratio               ;

    logic [1:0]vcodiv_ratio             ;
    logic [23:0]fraction                ;
    logic [9:0]ratio                    ;

    logic pllen                         ;

    logic en_write                         ;
    logic en_read                          ; 

    } pllmap2pll;






    
endpackage
