module tb;

    localparam CLK_PERIOD   = 10;
    localparam NHwApps      = 2;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    prim_mubi_pkg::mubi8_t otp_en_csrng_sw_app_read_i;

    lc_ctrl_pkg::lc_tx_t  lc_hw_debug_en_i;

    entropy_src_pkg::entropy_src_hw_if_req_t entropy_src_hw_if_o;
    entropy_src_pkg::entropy_src_hw_if_rsp_t entropy_src_hw_if_i;

    entropy_src_pkg::cs_aes_halt_req_t cs_aes_halt_i;
    entropy_src_pkg::cs_aes_halt_rsp_t cs_aes_halt_o;

    csrng_pkg::csrng_req_t  [NHwApps-1:0] csrng_cmd_i;
    csrng_pkg::csrng_rsp_t  [NHwApps-1:0] csrng_cmd_o;

    prim_alert_pkg::alert_rx_t [csrng_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [csrng_reg_pkg::NumAlerts-1:0] alert_tx_o;

    logic    intr_cs_cmd_req_done_o;
    logic    intr_cs_entropy_req_o;
    logic    intr_cs_hw_inst_exc_o;
    logic    intr_cs_fatal_err_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    csrng u_csrng (
        .tl_i   (tl_i_enc ),
        .*
    );

    int           correct;
    logic  [ 2:0] opcode;
    logic  [31:0] addr;
    logic  [31:0] data;
    logic  [31:0] ev;

    logic  [12:0] glen;
    logic  [ 3:0] flag0;
    logic  [ 3:0] clen;
    logic  [ 3:0] cmd;

    logic  [11:0][31:0] seed = {32'h4dc4bae7, 32'ha04d51ac, 32'h96b0e0e2, 32'h3a3f0e1f, 
                    32'h1621180d, 32'he82ccebb, 32'h81143f88, 32'hbcd7566e, 
                    32'h8af96ec0, 32'h75820244, 32'hfdf65469, 32'heafa7426};

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        correct                         = 0;
        tl_i                            = tlul_pkg::TL_H2D_DEFAULT;
        otp_en_csrng_sw_app_read_i      = prim_mubi_pkg::MuBi8True;
        lc_hw_debug_en_i                = lc_ctrl_pkg::LC_TX_DEFAULT;
        entropy_src_hw_if_i             = entropy_src_pkg::ENTROPY_SRC_HW_IF_REQ_DEFAULT;
        cs_aes_halt_i                   = entropy_src_pkg::CS_AES_HALT_REQ_DEFAULT;
        csrng_cmd_i                     = {NHwApps{csrng_pkg::CSRNG_REQ_DEFAULT}};
        alert_rx_i                      = {csrng_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

        @(negedge clk_i)
        rst_ni      = 1;

        // set write register enable
        `WR_REG_ENABLE;

        // set control register enable
        `CTRL_ENABLE;

        // wait application interface status until ready
        `WAIT_SW_STS;

        // do instantiate command request
        `CMD_INSTANTIATE;

        // wait interrupt until ready
        `WAIT_INT_STS;

        // do generate command request
        `CMD_GENERATE;

        // wait genbits valid until ready
        `WAIT_GENBITS_VLD;

        // check the output of generate
        `CHECK_GENBITS(32'h464c231f);
        `CHECK_GENBITS(32'h44837176);
        `CHECK_GENBITS(32'h7dc83935);
        `CHECK_GENBITS(32'h61b4b2f3);

        // wait interrupt until ready
        `WAIT_INT_STS;
        
        if (correct == 4) begin
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

task automatic invoke_csrng;
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