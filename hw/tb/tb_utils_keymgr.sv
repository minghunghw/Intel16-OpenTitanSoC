module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;
    logic rst_shadowed_ni;
    logic clk_edn_i;
    logic rst_edn_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    keymgr_pkg::hw_key_req_t aes_key_o;
    keymgr_pkg::hw_key_req_t kmac_key_o;
    keymgr_pkg::otbn_key_req_t otbn_key_o;

    kmac_pkg::app_req_t kmac_data_o;
    kmac_pkg::app_rsp_t kmac_data_i;

    logic kmac_en_masking_i;

    lc_ctrl_pkg::lc_tx_t lc_keymgr_en_i;
    lc_ctrl_pkg::lc_keymgr_div_t lc_keymgr_div_i;
    otp_ctrl_pkg::otp_keymgr_key_t otp_key_i;
    otp_ctrl_pkg::otp_device_id_t otp_device_id_i;
    flash_ctrl_pkg::keymgr_flash_t flash_i;

    edn_pkg::edn_req_t edn_o;
    edn_pkg::edn_rsp_t edn_i;

    rom_ctrl_pkg::keymgr_data_t rom_digest_i;

    logic intr_op_done_o;

    prim_alert_pkg::alert_rx_t [keymgr_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [keymgr_reg_pkg::NumAlerts-1:0] alert_tx_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    keymgr u_keymgr (
        .tl_i   (tl_i_enc ),
        .*
    );

    logic  [ 2:0] opcode;
    logic  [31:0] addr;
    logic  [31:0] data;
    logic  [31:0] ev;

    kmac_pkg::app_rsp_t kmac_data;

    assign kmac_data = '{
        ready: 1'b1,
        done:  1'b1,
        digest_share0: ,
        digest_share1: ,
        error: 1'b1
    };

    assign clk_edn_i = clk_i;
    assign rst_shadowed_ni = rst_ni;
    assign rst_edn_ni = rst_ni;

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i                            = tlul_pkg::TL_H2D_DEFAULT;
        kmac_data_i                     = kmac_pkg::APP_RSP_DEFAULT;
        kmac_en_masking_i               = 1;
        lc_keymgr_en_i                  = lc_ctrl_pkg::On;
        lc_keymgr_div_i                 = '0;
        otp_key_i                       = otp_ctrl_pkg::OTP_KEYMGR_KEY_DEFAULT;
        otp_device_id_i                 = '0;
        flash_i                         = flash_ctrl_pkg::KEYMGR_FLASH_DEFAULT;
        edn_i                           = edn_pkg::EDN_RSP_DEFAULT;
        rom_digest_i                    = '0;
        alert_rx_i                      = {keymgr_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

        @(negedge clk_i)
        rst_ni      = 1;

        // set interrupt enable
        `INTR_ENABLE;

        // set operation sw gen, dest otbn
        `OP_CTRL_SW;

        // start operation
        `KEYMGR_START;

        // wait until operation is complete
        // `WAIT_OP_STS;

        // check fault status
        // `CHECK_FAULT;

        // check err status
        // `CHECK_ERROR;

        // wait (tl_o.d_valid == 1);
        // if (cio_gpio_o == 32'hffff_ffff) begin
        //     $display("%c[1;32m",27);
        //     $display("SUCCESS\n");
        //     $display("%c[0m",27);
        // end else begin
        //     $display("%c[1;31m",27);
        //     $display("FAILED\n");
        //     $display("%c[0m",27);
        // end
	    $finish;
    end

endmodule

task automatic invoke_keymgr;
    input  [ 2:0] opcode;
    input  [31:0] addr;
    input  [31:0] data;
    output tlul_pkg::tl_h2d_t tl_i;
    tl_i.a_valid    = 1;
    tl_i.a_opcode   = tlul_pkg::tl_a_op_e'(opcode);
    tl_i.a_param    = 0;
    tl_i.a_size     = 2;
    tl_i.a_source   = 0;
    tl_i.a_address  = addr;
    tl_i.a_mask     = 4'hf;
    tl_i.a_data     = data;
    tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i.d_ready    = 1;
endtask