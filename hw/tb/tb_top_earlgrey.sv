module tb;

    logic [46:0] mio_in_i;
    logic [46:0] mio_out_o;
    logic [46:0] mio_oe_o;

    logic [15:0] dio_in_i;
    logic [15:0] dio_out_o;
    logic [15:0] dio_oe_o;

    prim_pad_wrapper_pkg::pad_attr_t [pinmux_reg_pkg::NMioPads-1:0] mio_attr_o;
    prim_pad_wrapper_pkg::pad_attr_t [pinmux_reg_pkg::NDioPads-1:0] dio_attr_o;

    ast_pkg::adc_ast_req_t                  adc_req_o;
    ast_pkg::adc_ast_rsp_t                  adc_rsp_i;
    edn_pkg::edn_req_t                      ast_edn_req_i;
    edn_pkg::edn_rsp_t                      ast_edn_rsp_o;
    lc_ctrl_pkg::lc_tx_t                    ast_lc_dft_en_o;
    ast_pkg::ast_obs_ctrl_t                 obs_ctrl_i;
    prim_ram_1p_pkg::ram_1p_cfg_t           ram_1p_cfg_i;
    prim_ram_2p_pkg::ram_2p_cfg_t           ram_2p_cfg_i;
    prim_rom_pkg::rom_cfg_t                 rom_cfg_i;
    prim_mubi_pkg::mubi4_t                  clk_main_jitter_en_o;
    prim_mubi_pkg::mubi4_t                  io_clk_byp_req_o;
    prim_mubi_pkg::mubi4_t                  io_clk_byp_ack_i;
    prim_mubi_pkg::mubi4_t                  all_clk_byp_req_o;
    prim_mubi_pkg::mubi4_t                  all_clk_byp_ack_i;
    prim_mubi_pkg::mubi4_t                  hi_speed_sel_o;
    prim_mubi_pkg::mubi4_t                  div_step_down_req_i;
    prim_mubi_pkg::mubi4_t                  calib_rdy_i;
    prim_mubi_pkg::mubi4_t                  flash_bist_enable_i;
    logic                                   flash_power_down_h_i;
    logic                                   flash_power_ready_h_i;
    wire [1:0]                              flash_test_mode_a_io;
    wire                                    flash_test_voltage_h_io;
    logic [7:0]                             flash_obs_o;
    entropy_src_pkg::entropy_src_rng_req_t  es_rng_req_o;
    entropy_src_pkg::entropy_src_rng_rsp_t  es_rng_rsp_i;
    logic                                   es_rng_fips_o;
    tlul_pkg::tl_h2d_t                      ast_tl_req_o;
    tlul_pkg::tl_d2h_t                      ast_tl_rsp_i;
    pinmux_pkg::dft_strap_test_req_t        dft_strap_test_o;
    logic                                   dft_hold_tap_sel_i;
    logic                                   usb_dp_pullup_en_o;
    logic                                   usb_dn_pullup_en_o;
    pwrmgr_pkg::pwr_ast_req_t               pwrmgr_ast_req_o;
    pwrmgr_pkg::pwr_ast_rsp_t               pwrmgr_ast_rsp_i;
    otp_ctrl_pkg::otp_ast_req_t             otp_ctrl_otp_ast_pwr_seq_o;
    otp_ctrl_pkg::otp_ast_rsp_t             otp_ctrl_otp_ast_pwr_seq_h_i;
    wire                                    otp_ext_voltage_h_io;
    logic [7:0]                             otp_obs_o;
    logic [1:0]                             por_n_i;
    logic [31:0]                            fpga_info_i;
    ast_pkg::ast_alert_req_t                sensor_ctrl_ast_alert_req_i;
    ast_pkg::ast_alert_rsp_t                sensor_ctrl_ast_alert_rsp_o;
    ast_pkg::ast_status_t                   sensor_ctrl_ast_status_i;
    logic [8:0]                             ast2pinmux_i;
    prim_mubi_pkg::mubi4_t                  ast_init_done_i;
    logic                                   sck_monitor_o;
    logic                                   usbdev_usb_rx_d_i;
    logic                                   usbdev_usb_tx_d_o;
    logic                                   usbdev_usb_tx_se0_o;
    logic                                   usbdev_usb_tx_use_d_se0_o;
    logic                                   usbdev_usb_rx_enable_o;
    logic                                   usbdev_usb_ref_val_o;
    logic                                   usbdev_usb_ref_pulse_o;

    logic                       clk_main_i;
    logic                       clk_io_i;
    logic                       clk_usb_i;
    logic                       clk_aon_i;

    clkmgr_pkg::clkmgr_out_t    clks_ast_o;
    rstmgr_pkg::rstmgr_out_t    rsts_ast_o;

    logic                       scan_rst_ni;
    logic                       scan_en_i;
    prim_mubi_pkg::mubi4_t      scanmode_i;

    top_earlgrey u_top_earlgrey (
        .*
    );

    initial begin
	    $finish;
    end

endmodule