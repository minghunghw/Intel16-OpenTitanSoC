// `define  AES_CTRL_SHADOWED_OPERATION_MASK           32'h0b11
// `define  AES_CTRL_SHADOWED_OPERATION_OFFSET         0
// `define  AES_CTRL_SHADOWED_MODE_MASK                32'h0b111111
// `define  AES_CTRL_SHADOWED_MODE_OFFSET              2
// `define  AES_CTRL_SHADOWED_KEY_LEN_MASK             32'h0b111
// `define  AES_CTRL_SHADOWED_KEY_LEN_OFFSET           8
// `define  AES_CTRL_SHADOWED_MANUAL_OPERATION_OFFSET  15
// `define  AES_STATUS_INPUT_READY_OFFSET              4
// `define  AES_STATUS_OUTPUT_VALID_OFFSET             3

// `define  AES_KEY_SHARE0_0_OFFSET                           ( 32'h1a108000 + 32'h04 )
// `define  AES_KEY_SHARE0_1_OFFSET                           ( 32'h1a108000 + 32'h08 )
// `define  AES_KEY_SHARE0_2_OFFSET                           ( 32'h1a108000 + 32'h0c )
// `define  AES_KEY_SHARE0_3_OFFSET                           ( 32'h1a108000 + 32'h10 )
// `define  AES_KEY_SHARE0_4_OFFSET                           ( 32'h1a108000 + 32'h14 )
// `define  AES_KEY_SHARE0_5_OFFSET                           ( 32'h1a108000 + 32'h18 )
// `define  AES_KEY_SHARE0_6_OFFSET                           ( 32'h1a108000 + 32'h1c )
// `define  AES_KEY_SHARE0_7_OFFSET                           ( 32'h1a108000 + 32'h20 )
// `define  AES_KEY_SHARE1_0_OFFSET                           ( 32'h1a108000 + 32'h24 )
// `define  AES_KEY_SHARE1_1_OFFSET                           ( 32'h1a108000 + 32'h28 )
// `define  AES_KEY_SHARE1_2_OFFSET                           ( 32'h1a108000 + 32'h2c )
// `define  AES_KEY_SHARE1_3_OFFSET                           ( 32'h1a108000 + 32'h30 )
// `define  AES_KEY_SHARE1_4_OFFSET                           ( 32'h1a108000 + 32'h34 )
// `define  AES_KEY_SHARE1_5_OFFSET                           ( 32'h1a108000 + 32'h38 )
// `define  AES_KEY_SHARE1_6_OFFSET                           ( 32'h1a108000 + 32'h3c )
// `define  AES_KEY_SHARE1_7_OFFSET                           ( 32'h1a108000 + 32'h40 )
// `define  AES_IV_0_OFFSET                                   ( 32'h1a108000 + 32'h44 )
// `define  AES_IV_1_OFFSET                                   ( 32'h1a108000 + 32'h48 )
// `define  AES_IV_2_OFFSET                                   ( 32'h1a108000 + 32'h4c )
// `define  AES_IV_3_OFFSET                                   ( 32'h1a108000 + 32'h50 )
// `define  AES_DATA_IN_0_OFFSET                              ( 32'h1a108000 + 32'h54 )
// `define  AES_DATA_IN_1_OFFSET                              ( 32'h1a108000 + 32'h58 )
// `define  AES_DATA_IN_2_OFFSET                              ( 32'h1a108000 + 32'h5c )
// `define  AES_DATA_IN_3_OFFSET                              ( 32'h1a108000 + 32'h60 )
// `define  AES_DATA_OUT_0_OFFSET                             ( 32'h1a108000 + 32'h64 )
// `define  AES_DATA_OUT_1_OFFSET                             ( 32'h1a108000 + 32'h68 )
// `define  AES_DATA_OUT_2_OFFSET                             ( 32'h1a108000 + 32'h6c )
// `define  AES_DATA_OUT_3_OFFSET                             ( 32'h1a108000 + 32'h70 )
// `define  AES_CTRL_SHADOWED_OFFSET                          ( 32'h1a108000 + 32'h74 )
// `define  AES_STATUS_OFFSET                                 ( 32'h1a108000 + 32'h84 )

// util/dvsim/dvsim.py hw/ip/aes/dv/aes_unmasked_sim_cfg.hjson -i aes_smoke --tool vcs --gui

module tb;

    localparam CLK_PERIOD   = 10;
    localparam EDN_CLK_PERIOD   = 18;

    logic                                      clk_i;
    logic                                      rst_ni;
    logic                                      rst_shadowed_ni;
    // Idle indicator for clock manager
    prim_mubi_pkg::mubi4_t                     idle_o;
    // Life cycle
    lc_ctrl_pkg::lc_tx_t                       lc_escalate_en_i;
    // Entropy distribution network (EDN) interface
    logic                                      clk_edn_i;
    logic                                      rst_edn_ni;
    edn_pkg::edn_req_t                         edn_o;
    edn_pkg::edn_rsp_t                         edn_i;
    // Key manager (keymgr) key sideload interface
    keymgr_pkg::hw_key_req_t                   keymgr_key_i;
    // Bus interface
    tlul_pkg::tl_h2d_t                         tl_i,tl_i_enc;
    tlul_pkg::tl_d2h_t                         tl_o;
    // Alerts
    prim_alert_pkg::alert_rx_t [aes_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [aes_reg_pkg::NumAlerts-1:0] alert_tx_o;


    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    aes  #(
        .SecMasking(0), // so there will be no edn_req
        .SecSBoxImpl(1)
        )u_aes (
        .tl_i   (tl_i_enc ),
        .*
    );


    logic [7:0][31:0] key_share0, key_share1;
    logic [7:0][31:0] iv;
    logic [3:0][31:0] input_data, output_data;
    logic [ 2:0]    opcode;
    logic [31:0]    addr;
    logic [31:0]    data, aes_ctrl;
    int correct;

    initial clk_i = 0;
    initial clk_edn_i=0;
    initial rst_ni = 0;
    initial rst_shadowed_ni=0;
    initial rst_edn_ni=0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;
    always #(EDN_CLK_PERIOD/2.0) clk_edn_i = ~clk_edn_i;


    initial begin
        correct=0;
        //input variables 
        lc_escalate_en_i=lc_ctrl_pkg::LC_TX_DEFAULT; //off
        tl_i = tlul_pkg::TL_H2D_DEFAULT;
        edn_i=0;
        alert_rx_i= {aes_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};

        //set key_share values
        key_share0 = 0;
        key_share0[0] = 32'ha6155d49;
        key_share0[1] = 32'hd53d9ea5;
        key_share0[2] = 32'hdab9df3a;
        key_share0[3] = 32'h36a17e36;
        key_share1 = 0;
        iv[0] = 32'h497c3320;
        iv[1] = 32'hcdcc88ec;
        iv[2] = 32'hfb9843f1;
        iv[3] = 32'h38440fd8;
        input_data[0] = 32'hbb388f1a;
        input_data[1] = 32'h34cad614;
        input_data[2] = 32'hb9aea5bc;
        input_data[3] = 32'h2160cce5;

        // set aes to IDLE
        @(negedge clk_i) 
        rst_ni = 1;
        rst_shadowed_ni=1;
        @(negedge clk_i)
        rst_edn_ni=1;
        
        // respond edn_req
        `EDN_ACK;

        // check status
        `WAIT_STATUS(32'h11)

        // initialize control register
        `INIT_CTRL(aes_pkg::AES_ENC)
        
        // wait ctrl signal done
        `WAIT_STATUS(32'h11)

        // Write IV
        `WR_IV_KEY(iv, key_share0, key_share1)

        //refresh status to IDLE
        `EDN_ACK;

        // check status - wait status to be idle
        `WAIT_STATUS(32'h11)

        `WR_INPUT(input_data)

        //  wait calculation done
        `WAIT_STATUS(32'h19)

        @(negedge clk_i) //must be 1 cycle


        `RD_OUTPUT(output_data)

        ///////////////////////////// start decryption /////////////////////////////////////////

        // initialize control register
        `INIT_CTRL(aes_pkg::AES_DEC)
        
        // wait ctrl signal done
        `WAIT_STATUS(32'h11)

        // Write IV
        `WR_IV_KEY(iv, key_share0, key_share1)

        //refresh status to IDLE
        `EDN_ACK;

        // check status - wait status to be idle
        `WAIT_STATUS(32'h11)

        `WR_INPUT(output_data)

        //  wait calculation done
        `WAIT_STATUS(32'h19)

        // @(negedge clk_i) // no requirement

        `RD_OUTPUT(output_data)

        `CHECK_RESULT(correct)

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

task automatic invoke_status_reg;
    input [ 2:0]    opcode;
    input [31:0]    addr;
    input [31:0]    data;
    output tlul_pkg::tl_h2d_t tl_i;
begin
    tl_i.a_valid    = 1;
    tl_i.a_opcode   = tlul_pkg::tl_a_op_e'(opcode);
    tl_i.a_param    = 0;
    tl_i.a_size     = 1;
    tl_i.a_source   = 0;
    tl_i.a_address  = addr;
    tl_i.a_mask     = 4'h1;
    tl_i.a_data     = data;
    tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i.d_ready    = 1;
end
endtask


task automatic invoke_aes;
    input [ 2:0]    opcode;
    input [31:0]    addr;
    input [31:0]    data;
    output tlul_pkg::tl_h2d_t tl_i;
begin
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
end
endtask