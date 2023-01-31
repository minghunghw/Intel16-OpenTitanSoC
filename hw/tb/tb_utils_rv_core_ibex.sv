
module tb;    
    localparam CLK_PERIOD   = 10;

    logic                   clk_i;
    logic                   rst_ni;
    logic                   clk_edn_i;
    logic                   rst_edn_ni;
    logic                   clk_esc_i;
    logic                   rst_esc_ni;
    logic                   clk_otp_i;
    logic                   rst_otp_ni;

    // Reset feedback to rstmgr
    logic                   rst_cpu_n_o;

    // instruction memory interface 
    tlul_pkg::tl_d2h_t      corei_tl_h_i;
    tlul_pkg::tl_h2d_t      corei_tl_h_o;

    // data memory interface 
    tlul_pkg::tl_d2h_t      cored_tl_h_i;
    tlul_pkg::tl_h2d_t      cored_tl_h_o;

    // Escalation input for NMI
    prim_esc_pkg::esc_tx_t  esc_tx_i;
    prim_esc_pkg::esc_rx_t  esc_rx_o;

    // Crash dump information
    rv_core_ibex_pkg::cpu_crash_dump_t crash_dump_o;

    // CPU Control Signals
    lc_ctrl_pkg::lc_tx_t    lc_cpu_en_i;
    lc_ctrl_pkg::lc_tx_t    pwrmgr_cpu_en_i;
    pwrmgr_pkg::pwr_cpu_t   pwrmgr_o;

    // peripheral interface access
    tlul_pkg::tl_h2d_t      cfg_tl_d_i;
    tlul_pkg::tl_d2h_t      cfg_tl_d_o;

    // connection to edn
    edn_pkg::edn_req_t      edn_o;
    edn_pkg::edn_rsp_t      edn_i;

    // connection to otp scramble interface
    otp_ctrl_pkg::sram_otp_key_req_t icache_otp_key_o;
    otp_ctrl_pkg::sram_otp_key_rsp_t icache_otp_key_i;

    // interrupts and alerts
    prim_alert_pkg::alert_rx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_tx_o;

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
        .ram_cfg_i      (prim_ram_1p_pkg::RAM_1P_CFG_DEFAULT ),  
        .hart_id_i      (32'b0                               ),
        .boot_addr_i    (32'b0                               ),
        .irq_software_i (1'b0                                ),
        .irq_timer_i    (1'b0                                ),
        .irq_external_i (1'b0                                ),
        .nmi_wdog_i     (1'b0                                ),
        .debug_req_i    (1'b0                                ),
        .scan_rst_ni    (1'b1                                ),
        .scanmode_i     (prim_mubi_pkg::MuBi4False           ),
        .fpga_info_i    (32'b0                               ),           
        .*
    );

    initial begin 
        clk_i       = 0;
        rst_ni      = 0;
        clk_edn_i   = 0;
        rst_edn_ni   = 0;
        clk_esc_i   = 0;
        rst_esc_ni  = 0;
        clk_otp_i   = 0;
        rst_otp_ni  = 0;
    end 
    always #(CLK_PERIOD/2.0) begin
        clk_i = ~clk_i;
        // clk_edn_i = ~clk_edn_i;
        // clk_esc_i = ~clk_esc_i;
        // clk_otp_i = ~clk_otp_i;
    end

    initial begin
        
        corei_tl_h_i        = tlul_pkg::TL_D2H_DEFAULT;
        cored_tl_h_i        = tlul_pkg::TL_D2H_DEFAULT;
        esc_tx_i            = prim_esc_pkg::ESC_TX_DEFAULT;
        lc_cpu_en_i         = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::On);
        pwrmgr_cpu_en_i     = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::On);
        cfg_tl_d_i          = tlul_pkg::TL_H2D_DEFAULT;
        edn_i               = edn_pkg::EDN_RSP_DEFAULT;
        icache_otp_key_i    = otp_ctrl_pkg::SRAM_OTP_KEY_RSP_DEFAULT;
        alert_rx_i          = prim_alert_pkg::ALERT_RX_DEFAULT;
        

        @(negedge clk_i)
        rst_ni      = 1;
        // rst_edn_ni   = 1;
        // rst_esc_ni  = 1;
        // rst_otp_ni  = 1;

        wait (corei_tl_h_o.a_valid == 1);
        if (corei_tl_h_o.a_address != 128) begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        
        @(posedge clk_i)
        invoke_rv_core_ibex(corei_tl_h_i);

        @(negedge clk_i)
        wait (corei_tl_h_o.a_valid == 1);
        if (corei_tl_h_o.a_address != 132) begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        $display("%c[1;32m",27);
        $display("SUCCESS\n");
        $display("%c[0m",27);
	    $finish;
    end

endmodule

task automatic invoke_rv_core_ibex;
    output tlul_pkg::tl_d2h_t corei_tl_h_i;
begin
    corei_tl_h_i.d_valid    = 1;
    corei_tl_h_i.d_opcode   = tlul_pkg::AccessAckData;
    corei_tl_h_i.d_param    = 0;
    corei_tl_h_i.d_size     = 2;
    corei_tl_h_i.d_source   = 0;
    corei_tl_h_i.d_sink     = 0;
    corei_tl_h_i.d_data     = 0;
    corei_tl_h_i.d_user     = tlul_pkg::TL_D_USER_DEFAULT;
    corei_tl_h_i.a_ready    = 1;
end
endtask