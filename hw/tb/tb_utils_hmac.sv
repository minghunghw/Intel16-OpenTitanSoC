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

    logic [ 2:0] opcode;
    logic [31:0] addr, data;

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
        
        tl_i           = tlul_pkg::TL_H2D_DEFAULT;
        alert_rx_i     = {hmac_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
        
        @(negedge clk_i)
        rst_ni      = 1;

        // set hmac mode to SHA256-only mode
        `SHA256_MODE;

        // Begin SHA256-only operation
        `START_HMAC;
        
        // send data to MSG_FIFO
        `SEND_MSG_FIFO;

        // Read DIGEST_0 value
        `READ_DIGEST0

        // READ ERR_CODE value
        `READ_ERROR

        // wait (tl_o.d_valid == 1);
        // if (tl_o.d_data == 32'hffff_ffff) begin
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