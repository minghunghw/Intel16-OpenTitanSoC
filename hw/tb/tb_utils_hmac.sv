module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    prim_alert_pkg::alert_rx_t [hmac_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [hmac_reg_pkg::NumAlerts-1:0] alert_tx_o;

    logic intr_hmac_done_o;
    logic intr_fifo_empty_o;
    logic intr_hmac_err_o;

    prim_mubi_pkg::mubi4_t idle_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    int           correct;
    logic  [ 2:0] opcode;
    logic  [31:0] addr;
    logic  [31:0] data;
    logic  [31:0] ev;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    hmac u_mac (
        .tl_i   (tl_i_enc ),
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        correct        = 0;
        tl_i           = tlul_pkg::TL_H2D_DEFAULT;
        alert_rx_i     = {hmac_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
        
        @(negedge clk_i)
        rst_ni      = 1;

        // set it to full HMAC mode
        `HMAC_MODE;

        // set interrupt enable
        `INTR_ENABLE;

        // set hmac key
        `SET_HMAC_KEY(0, 32'hc5fc6b1e)
        `SET_HMAC_KEY(1, 32'hf2ac248d)
        `SET_HMAC_KEY(2, 32'h648f1f06)
        `SET_HMAC_KEY(3, 32'h2017d8fb)
        `SET_HMAC_KEY(4, 32'h939e18c2)
        `SET_HMAC_KEY(5, 32'h5198292e)
        `SET_HMAC_KEY(6, 32'h4d090cc3)
        `SET_HMAC_KEY(7, 32'h3625df4d)

        // Begin full HMAC operation
        `START_HMAC_CONFIG;

        // wait interrupt until ready
        `WAIT_INT_STS;

        // send message 
        `SEND_HMAC_MSG(12'hca0, 32'h4e95fbef);
        `SEND_HMAC_MSG(12'hf54, 32'hc45e7f97);
        `SEND_HMAC_MSG(12'h8d8, 32'h835f2691);
        `SEND_HMAC_MSG(12'he38, 32'h984161cc);
        `SEND_HMAC_MSG(12'h9c8, 32'h257b2f3d);
        `SEND_HMAC_MSG(12'h820, 32'h3c84757e);
        `SEND_HMAC_MSG(12'hf64, 32'h9a0d7f26);
        `SEND_HMAC_MSG(12'ha28, 32'h316a5749);
        `SEND_HMAC_MSG(12'h8bc, 32'hf635f0f5);
        `SEND_HMAC_MSG(12'hdf8, 32'h3568b3f2);
        `SEND_HMAC_MSG(12'hfd0, 32'hb728f06f);
        `SEND_HMAC_MSG(12'hc14, 32'hb40b0f73);
        `SEND_HMAC_MSG(12'hd4c, 32'hfdfb9235);
        `SEND_HMAC_MSG(12'he1c, 32'hd497ee9e);

        // Begin full HMAC operation
        `START_HMAC_OP;

        // wait interrupt until ready
        `WAIT_INT_STS;

        // wait computation done
        wait(intr_hmac_done_o == 1);

        // Read message length value
        `READ_MSG_LENGTH(32'h000001c0);

        // Read digest value
        `READ_DIGEST(0, 32'hadf96e95);
        `READ_DIGEST(1, 32'h8d6089bb);
        `READ_DIGEST(2, 32'hac0ad507);
        `READ_DIGEST(3, 32'h563738be);
        `READ_DIGEST(4, 32'h0f861c69);
        `READ_DIGEST(5, 32'hef2718fd);
        `READ_DIGEST(6, 32'h0d1901f1);
        `READ_DIGEST(7, 32'hb031c3b3);

        // Read error code value
        `READ_ERROR;

        if (correct == 8) begin
            $display("%c[1;32m",27);
            $display("SUCCESS\n");
            $display("%c[0m",27);
        end else begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
	    $finish;
    end

endmodule

task automatic invoke_hmac;
    input [ 2:0] opcode;
    input [31:0] addr;
    input [31:0] data;
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