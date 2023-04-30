module ibex_cluster (
    input  clk_i,
    input  rst_ni,
    input  fetch_enable_i,
    input  tlul_pkg::tl_d2h_t  ibex_i_i,
    input tlul_pkg::tl_d2h_t  ibex_d_i,
    output tlul_pkg::tl_h2d_t  ibex_i_o,
    output tlul_pkg::tl_h2d_t  ibex_d_o
    //instruction and data interface

);
    // unused ports
    logic clk_edn_i; 
    logic rst_edn_ni; 
    logic clk_esc_i; 
    logic rst_esc_ni; 
    logic clk_otp_i;
    logic rst_otp_ni; 
    prim_esc_pkg::esc_tx_t  esc_tx_i;
    tlul_pkg::tl_h2d_t      cfg_tl_d_i;  
    edn_pkg::edn_rsp_t      edn_i; 
    otp_ctrl_pkg::sram_otp_key_rsp_t icache_otp_key_i; 
    prim_alert_pkg::alert_rx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_rx_i; 
    // Reset feedback to rstmgr
    logic                   rst_cpu_n_o; 
    // Escalation input for NMI
    prim_esc_pkg::esc_rx_t  esc_rx_o;
    // Crash dump information
    rv_core_ibex_pkg::cpu_crash_dump_t crash_dump_o;
    // CPU Control Signals
    pwrmgr_pkg::pwr_cpu_t   pwrmgr_o;
    // peripheral interface access
    tlul_pkg::tl_d2h_t      cfg_tl_d_o;
    // connection to edn
    edn_pkg::edn_req_t      edn_o;
    // connection to otp scramble interface
    otp_ctrl_pkg::sram_otp_key_req_t icache_otp_key_o;
    // interrupts and alerts
    prim_alert_pkg::alert_tx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_tx_o;
    // cpu_en for ibex
    lc_ctrl_pkg::lc_tx_t    lc_cpu_en_i;
    lc_ctrl_pkg::lc_tx_t    pwrmgr_cpu_en_i; 

    tlul_pkg::tl_d2h_t  ibex_d_i_enc;
    tlul_pkg::tl_d2h_t  ibex_i_i_enc;


    //rv_core_ibex unused signal assignment
    assign lc_cpu_en_i = (fetch_enable_i) ? lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::On) : lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::Off);
    assign pwrmgr_cpu_en_i = (fetch_enable_i) ? lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::On) : lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::Off);
    assign clk_edn_i   = 0;
    assign rst_edn_ni   = 0;
    assign clk_esc_i   = 0;
    assign rst_esc_ni  = 0;
    assign clk_otp_i   = 0;
    assign rst_otp_ni  = 0;
    assign esc_tx_i            = prim_esc_pkg::ESC_TX_DEFAULT;
    assign cfg_tl_d_i          = tlul_pkg::TL_H2D_DEFAULT;
    assign edn_i               = edn_pkg::EDN_RSP_DEFAULT;
    assign icache_otp_key_i    = otp_ctrl_pkg::SRAM_OTP_KEY_RSP_DEFAULT;
    assign alert_rx_i          = prim_alert_pkg::ALERT_RX_DEFAULT;


    tlul_rsp_intg_gen u_tlul_gen_instr (
        .tl_i   (ibex_i_i),
        .tl_o   (ibex_i_i_enc)
    );

    tlul_rsp_intg_gen u_tlul_gen_data (
        .tl_i   (ibex_d_i),
        .tl_o   (ibex_d_i_enc)
    );

    rv_core_ibex #(
        .AlertAsyncOn(      {rv_core_ibex_reg_pkg::NumAlerts{1'b1}}), //add
        .PMPEnable(1'b0),
        .PMPGranularity(    0),
        .PMPNumRegions(     4),
        .MHPMCounterNum(    0),
        .MHPMCounterWidth(  40),
        .RV32E(             1'b0),
        .RV32M(             ibex_pkg::RV32MFast),
        .RV32B(             ibex_pkg::RV32BNone),
        .RegFile(           ibex_pkg::RegFileFF),
        .BranchTargetALU(   1'b0),
        .WritebackStage(    1'b1),
        .ICache(            1'b0),
        .ICacheECC(         1'b0),
        .ICacheScramble(    1'b0),
        .BranchPredictor(   1'b0),
        .DbgTriggerEn(      1'b0),
        .DbgHwBreakNum(     1),
        .SecureIbex(        1'b1),// need to be 1 for   `ASSERT_PRIM_ONEHOT_ERROR_TRIGGER_ALERT(RvCoreRegWeOnehotCheck_A, u_core.gen_regfile_ff.register_file_i.gen_wren_check.u_prim_onehot_check, alert_tx_o[2])
        .RndCnstLfsrSeed(   ibex_pkg::RndCnstLfsrSeedDefault),
        .RndCnstLfsrPerm(   ibex_pkg::RndCnstLfsrPermDefault),
        .DmHaltAddr(        32'h1A110808),
        .DmExceptionAddr(   32'h1A110808),
        .PipeLine(          1'b0), //add
        .RndCnstIbexKeyDefault(    ibex_pkg::RndCnstIbexKeyDefault),  //change name
        .RndCnstIbexNonceDefault(  ibex_pkg::RndCnstIbexNonceDefault) //change name
    )
    u_rv_core_ibex ( 
        // Clock and Reset
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        // Clock domain for edn
        .clk_edn_i(clk_edn_i),
        .rst_edn_ni(rst_edn_ni),
        // Clock domain for escalation receiver
        .clk_esc_i(clk_esc_i),
        .rst_esc_ni(rst_esc_ni),
        // Reset feedback to rstmgr
        .rst_cpu_n_o(rst_cpu_n_o),

        .ram_cfg_i      (prim_ram_1p_pkg::RAM_1P_CFG_DEFAULT ),  
        .hart_id_i      (32'b0                               ),
        .boot_addr_i    (32'b0                               ),
        // Instruction memory interface
        .corei_tl_h_i                 (ibex_i_i_enc                            ),
        .corei_tl_h_o                 (ibex_i_o                            ),
        // Data memory interface
        .cored_tl_h_i                 (ibex_d_i_enc                            ),
        .cored_tl_h_o                 (ibex_d_o                            ),   
        // Interrupt inputs
        .irq_software_i (1'b0                                ),
        .irq_timer_i    (1'b0                                ),
        .irq_external_i (1'b0                                ),
        // Escalation input for NMI
        .esc_tx_i(esc_tx_i),
        .esc_rx_o(esc_rx_o),
        // watchdog NMI input
        .nmi_wdog_i     (1'b0                                ),
        // Debug Interface
        .debug_req_i    (1'b0                                ),
        // Crash dump information
        .crash_dump_o(crash_dump_o),
        // CPU Control Signals
        .lc_cpu_en_i(lc_cpu_en_i),
        .pwrmgr_cpu_en_i(pwrmgr_cpu_en_i),
        .pwrmgr_o(pwrmgr_o),
        // dft bypass
        .scan_rst_ni    (1'b1                                ),
        .scanmode_i     (prim_mubi_pkg::MuBi4False           ),
        // peripheral interface access
        .cfg_tl_d_i(cfg_tl_d_i),
        .cfg_tl_d_o(cfg_tl_d_o),
        // connection to edn
        .edn_o(edn_o),
        .edn_i(edn_i),
        // connection to otp scramble interface
        .clk_otp_i(clk_otp_i),
        .rst_otp_ni(rst_otp_ni),
        .icache_otp_key_o(icache_otp_key_o),
        .icache_otp_key_i(icache_otp_key_i),
        // fpga build info
        .fpga_info_i    (32'b0                               ),   
        // interrupts and alerts
        .alert_rx_i(alert_rx_i),
        .alert_tx_o(alert_tx_o)
    );

endmodule