`timescale 1ps / 1ps


module dhy ();

	
		logic	vccdig;
		logic	vss;


     logic				ldo_enable;		
     logic	[1:0]			fz_ldo_vinvoltsel;	
     logic				fz_ldo_bypass;		
     logic                         	fz_ldo_extrefsel;	
     logic                         	fz_ldo_faststart;	
     logic [3:0]                   	fz_ldo_fbtrim;		
     logic [3:0]                   	fz_ldo_reftrim;		

     logic [1:0]                   	view_mux_viewoutnnnnh;

     logic                         	pll_core_pfdlockrstnnnnh;
     logic                         	pll_fbgen_clkfbmxh;
     logic                         	clkrefxxh;
     logic                         	bypassnnnnh;
     logic                         	reset_b_nnnnh;

     logic                         	plldistpwrgoodnnnnh;
     logic [9:0]    			rationnnnh;
     logic [23:0]    			fractionnnnnh;
     logic [5:0]    			mdiv_ratio;	
     logic				mash_order_plus_one;   
     logic [8:0]			ssccyctopeakm1;    
     logic				ssc_en;    		
     logic [23:0] 			ssc_frac_step;		

     logic [1:0]			vcodiv_ratio;		
     logic [9:0]			zdiv0_ratio;		
     logic 				zdiv0_ratio_p5;		
     logic [9:0]			zdiv1_ratio;		
     logic 				zdiv1_ratio_p5;		
  
     logic [4:0]			fz_cp1trim;		
     logic [4:0]			fz_cp2trim;		
     logic [1:0]			fz_cpnbias;		
     logic [1:0]			fz_dca_cb;		
     logic [5:0]			fz_dca_ctrl;		
     logic [4:0]			fz_irefgen;		
     logic [2:0]			fz_lockcnt;		
     logic 				fz_lockforce;	
     logic 				fz_lockstickyb;	
     logic [3:0]			fz_lockthresh;	
     logic 				fz_lpfclksel;		
     logic 				fz_nopfdpwrgate;	
     logic [2:0]			fz_pfd_pw;	
     logic [1:0]			fz_pfddly;	
     logic [4:0]			fz_skadj;	

     logic [4:0]			fz_spare;	 
   
   							 
   							
   							
     logic [5:0]			fz_startup;	
     logic 				fz_tight_loopb;		
     logic 				fz_vcosel;		
     logic [10:0]			fz_vcotrim;	
  // IDV interface
    logic				idvdisable_bi;	
    logic                         	idvfreqai;		
    logic                         	idvfreqbi;		
    logic                         	idvpulsei;		
    logic                         	idvtclki;		
    logic                         	idvtctrli;		
    logic                         	idvtdi;		
    logic                         	idvtresi;		

    logic                         	idvdisable_bo;	 
    logic                         	idvfreqao;		 
    logic                         	idvfreqbo;		 
    logic                         	idvpulseo;		 
    logic                         	idvtclko;		 
    logic                         	idvtctrlo;		 
    logic                         	idvtdo;		 
    logic                         	idvtreso;		 


   // RTDR interface
   //
    logic                         	tdo;
    logic                         	tck;
    logic                         	tcapturedr; 
    logic                         	tdi;
    logic                         	treg_en; 
    logic                         	trst_n; 
    logic                         	tshiftdr;
    logic                         	tupdatedr;


    logic [9:0]                   	view_adc_dig_out;
    logic                         	view_adc_done;
    logic				clkidvih;		

    logic				ldo_enable_a;		
    logic				ta_ldo_hiz_debug;	
    logic				ta_ldo_idq_debug;	

    logic [1:0]				fz_ldo_vinvoltsel_a;	
    logic				fz_ldo_bypass_a;	
    logic                         	fz_ldo_extrefsel_a;     
    logic                         	fz_ldo_faststart_a;     
    logic [3:0]                   	fz_ldo_fbtrim_a;        
    logic [3:0]                   	fz_ldo_reftrim_a;       

    logic                         	dfx_powergood;

    logic                         	reset_sync_bypassxxnnnl;
    logic                         	reset_sync_bypassenxxnnnl;
    logic                         	reset_sync_reset_b_xxnnnl;

    logic [9:0]    			mash_ratiomxh;
    logic                         	mash_halfintmxh;
    logic [5:0]    			mdiv_ratio_a;		

    logic [1:0]    			vcodiv_ratio_a;		
    logic [9:0]				zdiv0_ratio_a;		
    logic 				zdiv0_ratio_p5_a;	
    logic [9:0]				zdiv1_ratio_a;		
    logic 				zdiv1_ratio_p5_a;	

    logic [4:0]				ta_spare;

    logic                         	idv_fub_idvgateennh;
    logic [4:0]                   	dfx_cp1_trim;
    logic [4:0]                   	dfx_cp2_trim;
    logic [1:0]                   	fz_cpnbias_a; 		
    logic [1:0]                   	fz_dca_cb_a;
    logic [5:0]                   	dfx_dca_ctrl;
    logic [4:0]				fz_irefgen_a;		 



    logic [3:0]                   	dfx_lockthresh;
     logic 				fz_lpfclksel_a;			
     logic 				fz_nopfdpwrgate_a;	
     logic [2:0]			fz_pfd_pw_a;		
     logic [1:0]			fz_pfddly_a;		
    logic [4:0]                  	dfx_skadj_ctrl;
     logic [4:0]			fz_spare_a;		
     logic [5:0]			fz_startup_a;		
    logic                        	dfx_tight_loop;
     logic 				fz_vcosel_a;		
     logic [10:0]			fz_vcotrim_a;		


   // Tight loop lock mode
   //
    logic                         	tlctrl_sip_tightloopxxnnnh;

    logic                         	adc_ctl_startxxh;
    logic                         	adc_ctl_reset_bxxl;
    logic [1:0]                   	dfx_adc_clkdiv;
    logic                         	dfx_adc_freeze;
    logic                         	dfx_adc_chop_en;
    logic                         	dfx_adc_use_vref;
    logic [2:0]                   	dfx_adc_sel_in;

   // LOCK signals
   //
    logic                         	lock_detector_rawlockxxnnnl;
    logic                         	lockxxnnnl;
    logic                         	earlylockxxnnnh;

    logic [3:0]                   	idv_rdacctlth;
    logic                         	startup_gen_vctlrdacenxxh;
    logic                         	startup_gen_pfdenxxh;

    logic                         	ssc_directionmxh;
    logic                         	ssc_mod_dfx_clkmodmxh;
    logic                         	vctl_trim_fsm_vctlrdacshortxxh;

    logic [1:0]                   	dfx_viewdigennnnnh;
    logic [1:0]                   	dfx_viewanaennnnnh;
    logic [4:0]                   	dfx_viewselnnnnh0;
    logic [4:0]                   	dfx_viewselnnnnh1;

   //Scan interface
     logic [2:0]                   	idfx_fscan_sdi;
     logic                         	idfx_fscan_mode;
     logic                         	idfx_fscan_shiften;
     logic                         	idfx_fscan_rstbypen;
     logic                         	idfx_fscan_byprstb;
     logic                         	idfx_fscan_clkungate;
     logic [2:0]                   	odfx_fscan_sdo;
     logic [7:0]	count;

   // Global Alignment
   //
   logic                         	global_align_gateclkdistxxnnnl;


    logic vnnaon_nom               ;
    logic vccdig_nom               ;
    logic vccldo_hv                ;
    logic vccdist_nom              ;
    logic vss                      ; 
    logic bypass                   ;
    logic pllen                    ;
    logic pllfwen_b                ;

    logic [1:0] viewanabus               ;
    logic clkpostdist              ;
    logic lock                     ;
    logic clkpll                   ;
    logic clkpll0                  ;
    logic clkpll1                  ;
    logic [1:0] view_dig_out             ;     
    logic powergood_vnn;		// Power good control signal 


ringpll u_ringpll(
    // .vnnaon_nom                                         ( vnnaon_nom                                         ),
    // .vccdig_nom                                         ( vccdig_nom                                         ),
    // .vccldo_hv                                          ( vccldo_hv                                          ),
    // .vccdist_nom                                        ( vccdist_nom                                        ),
    // .vss                                                ( vss                                                ),
    .powergood_vnn                                      ( 1'b1                                               ),
    .ldo_vref                                           ( ldo_vref                                           ),//*
    .ldo_enable                                         ( ldo_enable                                         ),
    .fz_ldo_vinvoltsel                                  ( fz_ldo_vinvoltsel                                  ),
    .fz_ldo_faststart                                   ( fz_ldo_faststart                                   ),
    .fz_ldo_bypass                                      ( fz_ldo_bypass                                      ),
    .fz_ldo_extrefsel                                   ( fz_ldo_extrefsel                                   ),
    .fz_ldo_fbtrim                                      ( fz_ldo_fbtrim                                      ),
    .fz_ldo_reftrim                                     ( fz_ldo_reftrim                                     ),
    .clkref                                             ( clkrefxxh                                          ),
    .bypass                                             ( bypassnnnnh                                             ),
    .pllen                                              ( pllen                                              ),
    .pllfwen_b                                          ( pllfwen_b                                          ),
    .ratio                                              ( rationnnnh                                         ),
    .fraction                                           ( fractionnnnnh                                      ),
    .mdiv_ratio                                         ( mdiv_ratio                                         ),
    .mash_order_plus_one                                ( mash_order_plus_one                                ),
    .ssc_cyc_to_peak_m1                                 ( ssccyctopeakm1                                     ),
    .ssc_en                                             ( ssc_en                                             ),
    .ssc_frac_step                                      ( ssc_frac_step                                      ),
    .vcodiv_ratio                                       ( vcodiv_ratio                                       ),
    .zdiv0_ratio                                        ( zdiv0_ratio                                        ),
    .zdiv0_ratio_p5                                     ( zdiv0_ratio_p5                                     ),
    .zdiv1_ratio                                        ( zdiv1_ratio                                        ),
    .zdiv1_ratio_p5                                     ( zdiv1_ratio_p5                                     ),
    .fz_cp1trim                                         ( fz_cp1trim                                         ),
    .fz_cp2trim                                         ( fz_cp2trim                                         ),
    .fz_cpnbias                                         ( fz_cpnbias                                         ),
    .fz_dca_cb                                          ( fz_dca_cb                                          ),
    .fz_dca_ctrl                                        ( fz_dca_ctrl                                        ),
    .fz_irefgen                                         ( fz_irefgen                                         ),
    .fz_lockcnt                                         ( fz_lockcnt                                         ),
    .fz_lockforce                                       ( fz_lockforce                                       ),
    .fz_lockstickyb                                     ( fz_lockstickyb                                     ),
    .fz_lockthresh                                      ( fz_lockthresh                                      ),
    .fz_lpfclksel                                       ( fz_lpfclksel                                       ),
    .fz_nopfdpwrgate                                    ( fz_nopfdpwrgate                                    ),
    .fz_pfd_pw                                          ( fz_pfd_pw                                          ),
    .fz_pfddly                                          ( fz_pfddly                                          ),
    .fz_skadj                                           ( fz_skadj                                           ),
    .fz_spare                                           ( fz_spare                                           ),
    .fz_startup                                         ( fz_startup                                         ),
    .fz_tight_loopb                                     ( fz_tight_loopb                                     ),
    .fz_vcosel                                          ( fz_vcosel                                          ),
    .fz_vcotrim                                         ( fz_vcotrim                                         ),
    .idvdisable_bi                                      ( idvdisable_bi                                      ),
    .idvfreqai                                          ( idvfreqai                                          ),
    .idvfreqbi                                          ( idvfreqbi                                          ),
    .idvpulsei                                          ( idvpulsei                                          ),
    .idvtclki                                           ( idvtclki                                           ),
    .idvtctrli                                          ( idvtctrli                                          ),
    .idvtdi                                             ( idvtdi                                             ),
    .idvtresi                                           ( idvtresi                                           ),
    .idvdisable_bo                                      ( idvdisable_bo                                      ),
    .idvfreqao                                          ( idvfreqao                                          ),
    .idvfreqbo                                          ( idvfreqbo                                          ),
    .idvpulseo                                          ( idvpulseo                                          ),
    .idvtclko                                           ( idvtclko                                           ),
    .idvtctrlo                                          ( idvtctrlo                                          ),
    .idvtdo                                             ( idvtdo                                             ),
    .idvtreso                                           ( idvtreso                                           ),
    .tdo                                                ( tdo                                                ),
    .tck                                                ( tck                                                ),
    .tcapturedr                                         ( tcapturedr                                         ),
    .tdi                                                ( tdi                                                ),
    .treg_en                                            ( treg_en                                            ),
    .trst_n                                             ( trst_n                                             ),
    .tshiftdr                                           ( tshiftdr                                           ),
    .tupdatedr                                          ( tupdatedr                                          ),
    .idfx_fscan_sdi                                     ( idfx_fscan_sdi                                     ),
    .idfx_fscan_mode                                    ( idfx_fscan_mode                                    ),
    .idfx_fscan_shiften                                 ( idfx_fscan_shiften                                 ),
    .idfx_fscan_rstbypen                                ( idfx_fscan_rstbypen                                ),
    .idfx_fscan_byprstb                                 ( idfx_fscan_byprstb                                 ),
    .idfx_fscan_clkungate                               ( idfx_fscan_clkungate                               ),
    .odfx_fscan_sdo                                     ( odfx_fscan_sdo                                     ),
    .viewanabus                                         ( viewanabus                                         ),
    .clkpostdist                                        ( clkpostdist                                        ),
    .lock                                               ( lock                                               ),
    .clkpll                                             ( clkpll                                             ),
    .clkpll0                                            ( clkpll0                                            ),
    .clkpll1                                            ( clkpll1                                            ),
    .view_dig_out                                       ( view_dig_out                                       )
);

   initial begin
		clkrefxxh = 1'b0;
	end

	always #26041  clkrefxxh = ~clkrefxxh;




	initial begin 
        clkpostdist         = 1'b0;
        pllfwen_b           = 1'b0;
        pllen               =1'b1;
  		ldo_enable			= 1'b0;		
  		fz_ldo_vinvoltsel		= 2'd0;	
  		fz_ldo_bypass			= 1'b1;		
     		fz_ldo_extrefsel		= 1'b1;	
     		fz_ldo_faststart		= 1'b0;	
     		fz_ldo_fbtrim			= 4'd2;		
     		fz_ldo_reftrim			= 4'hA;		

     		view_mux_viewoutnnnnh		= 2'd0;

     		pll_core_pfdlockrstnnnnh	= 1'b0;
     		pll_fbgen_clkfbmxh		= 1'b0;
     		clkrefxxh			= 1'b0;
		bypassnnnnh			= 1'b0;
		reset_b_nnnnh			= 1'b0;

     		plldistpwrgoodnnnnh		= 1'b0;
  		rationnnnh			= 10'hBC;
  		fractionnnnnh			= 24'd0;
  		mdiv_ratio			= 'd0;	
  		mash_order_plus_one		= 'd0;   
  		ssccyctopeakm1			= 9'h1D8;    
  		ssc_en				= 1'b0;    		
  		ssc_frac_step			= 24'hE6829A;		

  		vcodiv_ratio			= '0;		
  		zdiv0_ratio			= 10'hC7;		
  		zdiv0_ratio_p5			= 'd0;		
  		zdiv1_ratio			= 10'h19;		
  		zdiv1_ratio_p5			= 'd0;		
  
  		fz_cp1trim			= 5'h6;		
  		fz_cp2trim			= 5'h14;		
  		fz_cpnbias			= 2'd1;		
  		fz_dca_cb			= 2'd0;		
  		fz_dca_ctrl			= 6'h25;		
  		fz_irefgen			= 5'h1A;		
  		fz_lockcnt			= 3'h4;		
  		fz_lockforce			= 1'b1;	
  		fz_lockstickyb			= 1'b0;	
  		fz_lockthresh			= 4'hC;	
  		fz_lpfclksel			= 1'b0;		
  		fz_nopfdpwrgate			= 1'b1;	
  		fz_pfd_pw			= 'd0;	
  		fz_pfddly			= 'd3;	
  		fz_skadj			= 5'h1C;	

  		fz_spare			= 'd0;	 
  
  				 
  				
  				
  		fz_startup			= 6'h9;	
  		fz_tight_loopb			= 1'b0;		
  		fz_vcosel			= 1'b1;		
  		fz_vcotrim			= 11'h3C9;	
  
  		idvdisable_bi			= 1'b0;	
    		idvfreqai			= 1'b0;		
    		idvfreqbi			= 1'b0;		
    		idvpulsei			= 1'b0;		
    		idvtclki			= 1'b0;		
    		idvtctrli			= 1'b0;		
    		idvtdi				= 1'b0;		
    		idvtresi			= 1'b0;		

                tck				= 1'b0;
                tcapturedr			= 1'b0; 
                tdi				= 1'b0;
                treg_en				= 1'b0; 
                trst_n				= 1'b0; 
                tshiftdr			= 1'b0;
                tupdatedr			= 1'b0;


                view_adc_dig_out		= 10'd0;
                view_adc_done			= 1'd0;
 		clkidvih			= 1'b0;

                idfx_fscan_sdi			= 1'b0;
                idfx_fscan_mode			= 1'b0;
                idfx_fscan_shiften		= 1'b0;
                idfx_fscan_rstbypen		= 1'b0;
                idfx_fscan_byprstb		= 1'b0;
                idfx_fscan_clkungate		= 1'b0;
		@(negedge clkrefxxh) 
        idfx_fscan_rstbypen = 1'b1;
        @(negedge clkrefxxh) 
        idfx_fscan_rstbypen = 1'b0;
		#6us plldistpwrgoodnnnnh	= 1'b1;
		#200ns ldo_enable 		= 1'b1;
		#500ns reset_b_nnnnh		= 1'b1;

	end

endmodule






