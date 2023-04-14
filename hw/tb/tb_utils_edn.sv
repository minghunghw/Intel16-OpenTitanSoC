module tb;

    localparam CLK_PERIOD   = 10;
    localparam NumEndPoints = 8;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    edn_pkg::edn_req_t [NumEndPoints-1:0] edn_i;
    edn_pkg::edn_rsp_t [NumEndPoints-1:0] edn_o;

    csrng_pkg::csrng_req_t  csrng_cmd_o;
    csrng_pkg::csrng_rsp_t  csrng_cmd_i;

    prim_alert_pkg::alert_rx_t [edn_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [edn_reg_pkg::NumAlerts-1:0] alert_tx_o;

    logic      intr_edn_cmd_req_done_o;
    logic      intr_edn_fatal_err_o;

    csrng_pkg::csrng_rsp_t CSRNG_RSP_RDY;
    
    assign CSRNG_RSP_RDY = '{
        csrng_req_ready:    1'b1,
        default:            '0
    };

    tlul_pkg::tl_h2d_t tl_i_enc;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    edn u_edn (
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

    logic         ack;
    logic         sts;
    logic         valid;
    logic         fips;
    logic [127:0] bus;
    logic [127:0] genbits = 128'h8d0e0c5f_a5a88277_e7ee1e47_222218a5;

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        correct                         = 0;
        tl_i                            = tlul_pkg::TL_H2D_DEFAULT;
        edn_i                           = edn_pkg::EDN_REQ_DEFAULT;
        csrng_cmd_i                     = CSRNG_RSP_RDY;
        alert_rx_i                      = {edn_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

        @(negedge clk_i)
        rst_ni      = 1;
        
        // set control register enable
        `CTRL_ENABLE;

        // wait application interface status until ready
        `WAIT_SW_STS;

        // do instantiate command request
        `CMD_INSTANTIATE;

        // give response stimuli from csrng
        `CMD_INSTANTIATE_RSP;

        // wait interrupt until ready
        `WAIT_INT_STS;

        // do generate command request
        `CMD_GENERATE;

        // give response stimuli from edn
        `CMD_GENERATE_EDN_RSP;

        // check edn response value
        `CHECK_EDN_RSP(genbits[31:0]);
        `CHECK_EDN_RSP(genbits[63:32]);
        `CHECK_EDN_RSP(genbits[95:64]);
        `CHECK_EDN_RSP(genbits[127:96]);

        // give response stimuli from csrng
        `CMD_GENERATE_CSRNG_RSP;

        // wait interrupt until ready
        `WAIT_INT_STS;

        // do uninstantiate command request
        `CMD_UNINSTANTIATE;

        // give response stimuli from csrng
        `CMD_UNINSTANTIATE_RSP;

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

task automatic invoke_edn;
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

task automatic invoke_csrng;
    input         ack;
    input         sts;
    input         valid;
    input         fips;
    input [127:0] bus;
    output csrng_pkg::csrng_rsp_t csrng_cmd_i;
    csrng_cmd_i.csrng_req_ready = 1;
    csrng_cmd_i.csrng_rsp_ack   = ack;
    csrng_cmd_i.csrng_rsp_sts   = sts;
    csrng_cmd_i.genbits_valid   = valid;
    csrng_cmd_i.genbits_fips    = fips;
    csrng_cmd_i.genbits_bus     = bus;
endtask