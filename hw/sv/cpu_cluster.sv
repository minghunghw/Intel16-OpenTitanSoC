module cpu_cluster (
    input  clk_i,
    input  rst_ni,

    input  ibex_pkg::ibex_mubi_t    fetch_enable_i,
    input  prim_mubi_pkg::mubi4_t   en_ifetch_i,

    // Host interface
    input  tlul_pkg::tl_d2h_t tl_core_i,
    output tlul_pkg::tl_h2d_t tl_core_o,

    // Device interface
    input  tlul_pkg::tl_h2d_t tl_instr_i,
    output tlul_pkg::tl_d2h_t tl_instr_o,
    input  tlul_pkg::tl_h2d_t tl_data_i,
    output tlul_pkg::tl_d2h_t tl_data_o,

    // rv_ibex_core clk/rst
    input logic clk_edn_i,
    input logic rst_edn_ni,
    input logic clk_esc_i,
    input logic rst_esc_ni,
    input logic clk_otp_i,
    input logic rst_otp_ni,
    input lc_ctrl_pkg::lc_tx_t    lc_cpu_en_i,
    input lc_ctrl_pkg::lc_tx_t    pwrmgr_cpu_en_i,
    input prim_esc_pkg::esc_tx_t  esc_tx_i,
    input tlul_pkg::tl_h2d_t      cfg_tl_d_i,
    input edn_pkg::edn_rsp_t      edn_i,
    input otp_ctrl_pkg::sram_otp_key_rsp_t icache_otp_key_i,
    input prim_alert_pkg::alert_rx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_rx_i
);
    //                  /----  ibex -|      /---->  ---->  ----\
    //   instr     <---| 2to1        |---> | 1to2          2to1 |---->  data
    //    sram          \----|              \----|  |--->  ----/        sram
    //                       |                   |  |
    //                 slave |            master |  | slave
    // ----------------------------------------------------------------------
    //                           main crossbar

    tlul_pkg::tl_d2h_t  ibex_i_i;
    tlul_pkg::tl_h2d_t  ibex_i_o;
    tlul_pkg::tl_d2h_t  ibex_d_i;
    tlul_pkg::tl_h2d_t  ibex_d_o;
    ibex_pkg::crash_dump_t crash_dump;
    logic               debug_fault_seen;
    logic               alert_minor;
    logic               alert_major_internal;
    logic               alert_major_bus;
    logic               core_sleep;

    tlul_pkg::tl_h2d_t  xbar_2to1_2_instr;
    tlul_pkg::tl_d2h_t  instr_2_xbar_2to1;
    tlul_pkg::tl_h2d_t  xbar_2to1_2_data;
    tlul_pkg::tl_d2h_t  data_2_xbar_2to1;

    tlul_pkg::tl_d2h_t  xbar_2to1_2_xbar_1to2;
    tlul_pkg::tl_h2d_t  xbar_1to2_2_xbar_2to1;

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

    // ibex_tlul u_ibex_tlul (
    //     .clk_i                  (clk_i                               ),
    //     .rst_ni                 (rst_ni                              ),
    //     .test_en_i              (1'b1                                ),
    //     .ram_cfg_i              (prim_ram_1p_pkg::RAM_1P_CFG_DEFAULT ),
    //     .hart_id_i              (32'b0                               ),
    //     .boot_addr_i            (32'b0                               ),
    //     .tl_i_i                 (ibex_i_i                            ),
    //     .tl_i_o                 (ibex_i_o                            ),
    //     .tl_d_i                 (ibex_d_i                            ),
    //     .tl_d_o                 (ibex_d_o                            ),
    //     .irq_software_i         (1'b0                                ),
    //     .irq_timer_i            (1'b0                                ),
    //     .irq_external_i         (1'b0                                ),
    //     .irq_nm_i               (1'b0                                ),
    //     .debug_req_i            (1'b0                                ),
    //     .crash_dump_o           (crash_dump                          ),
    //     .debug_fault_seen_o     (debug_fault_seen                    ),
    //     .fetch_enable_i         (fetch_enable_i                      ),
    //     .alert_minor_o          (alert_minor                         ),
    //     .alert_major_internal_o (alert_major_internal                ),
    //     .alert_major_bus_o      (alert_major_bus                     ), 
    //     .core_sleep_o           (core_sleep                          ),
    //     .scan_rst_ni            (1'b1                                ),
    //     .scanmode_i             (prim_mubi_pkg::MuBi4False           )
    // );

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
    .corei_tl_h_i                 (ibex_i_i                            ),
    .corei_tl_h_o                 (ibex_i_o                            ),

    // Data memory interface
    .cored_tl_h_i                 (ibex_d_i                            ),
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

    mem_tlul u_imem_tlul (
        .clk_i       (clk_i             ),
        .rst_ni      (rst_ni            ),
        .en_ifetch_i (en_ifetch_i       ),
        .tl_i        (xbar_2to1_2_instr ),
        .tl_o        (instr_2_xbar_2to1 )
    );

    mem_tlul u_dmem_tlul (
        .clk_i       (clk_i            ),
        .rst_ni      (rst_ni           ),
        .en_ifetch_i (en_ifetch_i      ),
        .tl_i        (xbar_2to1_2_data ),
        .tl_o        (data_2_xbar_2to1 )
    );

    xbar_2to1 u_ixbar_2to1 (
        .clk_i      (clk_i                    ),
        .rst_ni     (rst_ni                   ),
        .tl_core_i  (ibex_i_o                 ),
        .tl_core_o  (ibex_i_i                 ),
        .tl_main_i  (tl_instr_i               ),
        .tl_main_o  (tl_instr_o               ),

        .tl_sram_o  (xbar_2to1_2_instr        ),
        .tl_sram_i  (instr_2_xbar_2to1        ),
        .scanmode_i (prim_mubi_pkg::MuBi4False)
    );

    xbar_2to1 u_dxbar_2to1 (
        .clk_i      (clk_i                     ),
        .rst_ni     (rst_ni                    ),
        .tl_core_i  (xbar_1to2_2_xbar_2to1     ),
        .tl_core_o  (xbar_2to1_2_xbar_1to2     ),
        .tl_main_i  (tl_data_i                 ),
        .tl_main_o  (tl_data_o                 ),

        .tl_sram_o  (xbar_2to1_2_data          ),
        .tl_sram_i  (data_2_xbar_2to1          ),
        .scanmode_i (prim_mubi_pkg::MuBi4False )
    );

    xbar_1to2 u_dxbar_1to2 (
        .clk_i      (clk_i                     ),
        .rst_ni     (rst_ni                    ),
        .tl_core_i  (ibex_d_o                  ),
        .tl_core_o  (ibex_d_i                  ),

        .tl_sram_o  (xbar_1to2_2_xbar_2to1     ),
        .tl_sram_i  (xbar_2to1_2_xbar_1to2     ),
        .tl_main_o  (tl_core_o                 ),
        .tl_main_i  (tl_core_i                 ),
        .scanmode_i (prim_mubi_pkg::MuBi4False )
    );

endmodule