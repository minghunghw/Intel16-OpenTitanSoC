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

    logic  [ 2:0] opcode;
    logic  [31:0] addr;
    logic  [31:0] data;

    logic  [12:0] glen;
    logic  [ 3:0] clen;
    logic  [ 2:0] cmd;

    logic  [11:0][31:0] seed = {32'h73bec010, 32'h9262474c, 32'h16a30f76, 32'h531b51de,
                        32'h2ee494e5, 32'hdfec9db3, 32'hcb7a879d, 32'h5600419c,
                        32'hca79b0b0, 32'hdda33b5c, 32'ha468649e, 32'hdf5d73fa};

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i                            = tlul_pkg::TL_H2D_DEFAULT;
        otp_en_csrng_sw_app_read_i      = prim_mubi_pkg::MuBi8False;
        lc_hw_debug_en_i                = lc_ctrl_pkg::LC_TX_DEFAULT;
        entropy_src_hw_if_i             = entropy_src_pkg::ENTROPY_SRC_HW_IF_REQ_DEFAULT;
        cs_aes_halt_i                   = entropy_src_pkg::CS_AES_HALT_REQ_DEFAULT;
        csrng_cmd_i                     = {NHwApps{csrng_pkg::CSRNG_REQ_DEFAULT}};
        alert_rx_i                      = {csrng_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        opcode  = tlul_pkg::PutFullData;
        addr    = csrng_reg_pkg::CSRNG_CTRL_OFFSET;
        data    = {3{prim_mubi_pkg::MuBi4True}};
        invoke_csrng(opcode, addr, data, tl_i);

        @(negedge clk_i)
        tl_i = tlul_pkg::TL_H2D_DEFAULT;

        @(negedge clk_i)
        glen  = 13'h0;
        clen  = 4'h0;
        cmd   = csrng_pkg::UNI;
        csrng_cmd(glen, clen, cmd, csrng_cmd_i[0]);

        @(negedge clk_i)
        csrng_cmd_i[0] = csrng_pkg::CSRNG_REQ_DEFAULT;

        wait(csrng_cmd_o[0].csrng_rsp_ack);

        @(negedge clk_i)
        glen  = 13'h0;
        clen  = 4'hc;
        cmd   = csrng_pkg::INS;
        csrng_cmd(glen, clen, cmd, csrng_cmd_i[0]);

        for (int i=0; i<12; i++) begin
            @(negedge clk_i)
            csrng_cmd_i[0].csrng_req_bus = seed[i];
        end

        @(negedge clk_i)
        csrng_cmd_i[0] = csrng_pkg::CSRNG_REQ_DEFAULT;

        // wait(csrng_cmd_o[0].csrng_rsp_ack);

        // @(negedge clk_i)
        // tl_i = tlul_pkg::TL_H2D_DEFAULT;

        // @(negedge clk_i)
        // opcode  = tlul_pkg::Get;
        // addr    = csrng_reg_pkg::CSRNG_SW_CMD_STS_OFFSET;
        // data    = 0;
        // invoke_csrng(opcode, addr, data, tl_i);

        // @(negedge clk_i)
        // tl_i = tlul_pkg::TL_H2D_DEFAULT;

        // while (tl_o.d_data == 0) begin
        //     @(negedge clk_i)
        //     opcode  = tlul_pkg::Get;
        //     addr    = csrng_reg_pkg::CSRNG_SW_CMD_STS_OFFSET;
        //     data    = 0;
        //     invoke_csrng(opcode, addr, data, tl_i);

        //     @(negedge clk_i)
        //     tl_i = tlul_pkg::TL_H2D_DEFAULT;
        // end

        // @(negedge clk_i)
        // opcode  = tlul_pkg::PutFullData;
        // addr    = csrng_reg_pkg::CSRNG_CMD_REQ_OFFSET;
        // data    = {7'h0, 13'h10, 9'h0, csrng_pkg::GEN};
        // invoke_csrng(opcode, addr, data, tl_i);

        // @(negedge clk_i)
        // tl_i = tlul_pkg::TL_H2D_DEFAULT;

        // @(negedge clk_i)
        // opcode  = tlul_pkg::Get;
        // addr    = csrng_reg_pkg::CSRNG_GENBITS_VLD_OFFSET;
        // data    = 0;
        // invoke_csrng(opcode, addr, data, tl_i);

        // @(negedge clk_i)
        // tl_i = tlul_pkg::TL_H2D_DEFAULT;

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

task automatic csrng_cmd;
    input [12:0] glen;
    input [ 3:0] clen;
    input [ 2:0] cmd;
    output csrng_pkg::csrng_req_t csrng_cmd_i;
    csrng_cmd_i.csrng_req_valid = 1;
    csrng_cmd_i.csrng_req_bus   = {7'h0, glen, 4'h0, clen, 1'h0, csrng_pkg::acmd_e'(cmd)};
    csrng_cmd_i.genbits_ready   = 1;
endtask