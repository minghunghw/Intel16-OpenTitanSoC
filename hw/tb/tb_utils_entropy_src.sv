module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    prim_mubi_pkg::mubi8_t otp_en_entropy_src_fw_read_i;
    prim_mubi_pkg::mubi8_t otp_en_entropy_src_fw_over_i;

    logic rng_fips_o;

    entropy_src_pkg::entropy_src_hw_if_req_t entropy_src_hw_if_i;
    entropy_src_pkg::entropy_src_hw_if_rsp_t entropy_src_hw_if_o;

    entropy_src_pkg::entropy_src_rng_req_t entropy_src_rng_o;
    entropy_src_pkg::entropy_src_rng_rsp_t entropy_src_rng_i;

    entropy_src_pkg::cs_aes_halt_req_t cs_aes_halt_o;
    entropy_src_pkg::cs_aes_halt_rsp_t cs_aes_halt_i;

    entropy_src_pkg::entropy_src_xht_req_t entropy_src_xht_o;
    entropy_src_pkg::entropy_src_xht_rsp_t entropy_src_xht_i;

    prim_alert_pkg::alert_rx_t [entropy_src_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [entropy_src_reg_pkg::NumAlerts-1:0] alert_tx_o;

    logic    intr_es_entropy_valid_o;
    logic    intr_es_health_test_failed_o;
    logic    intr_es_observe_fifo_ready_o;
    logic    intr_es_fatal_err_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    entropy_src u_entropy_src (
        .tl_i   (tl_i_enc ),
        .*
    );

    logic  [ 2:0] opcode;
    logic  [31:0] addr;
    logic  [31:0] data;

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i                            = tlul_pkg::TL_H2D_DEFAULT;
        otp_en_entropy_src_fw_read_i    = prim_mubi_pkg::MuBi8False;
        otp_en_entropy_src_fw_over_i    = prim_mubi_pkg::MuBi8False;
        entropy_src_hw_if_i             = entropy_src_pkg::ENTROPY_SRC_HW_IF_REQ_DEFAULT;
        entropy_src_rng_i               = entropy_src_pkg::ENTROPY_SRC_RNG_RSP_DEFAULT;
        cs_aes_halt_i                   = entropy_src_pkg::CS_AES_HALT_RSP_DEFAULT;
        entropy_src_xht_i               = entropy_src_pkg::ENTROPY_SRC_XHT_RSP_DEFAULT;
        alert_rx_i                      = {entropy_src_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

        @(negedge clk_i)
        rst_ni      = 1;

        #1000;
        @(negedge clk_i)
        opcode  = tlul_pkg::PutFullData;
        addr    = entropy_src_reg_pkg::ENTROPY_SRC_MODULE_ENABLE_OFFSET;
        data    = prim_mubi_pkg::MuBi4True;
        invoke_entropy_src(opcode, addr, data, tl_i);

        #1000;
        @(negedge clk_i)
        entropy_src_hw_if_i = '{es_req: 1'b1, default: '0};
        opcode  = tlul_pkg::Get;
        addr    = entropy_src_reg_pkg::ENTROPY_SRC_ENTROPY_DATA_OFFSET;
        data    = 0;
        invoke_entropy_src(opcode, addr, data, tl_i);

        #1000;
        @(negedge clk_i)
        entropy_src_hw_if_i = entropy_src_pkg::ENTROPY_SRC_HW_IF_REQ_DEFAULT;
        tl_i = tlul_pkg::TL_H2D_DEFAULT;

        #1000;
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

task automatic invoke_entropy_src;
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