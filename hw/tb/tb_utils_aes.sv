`define  AES_CTRL_SHADOWED_OPERATION_MASK           32'h0b11
`define  AES_CTRL_SHADOWED_OPERATION_OFFSET         0
`define  AES_CTRL_SHADOWED_MODE_MASK                32'h0b111111
`define  AES_CTRL_SHADOWED_MODE_OFFSET              2
`define  AES_CTRL_SHADOWED_KEY_LEN_MASK             32'h0b111
`define  AES_CTRL_SHADOWED_KEY_LEN_OFFSET           8
`define  AES_CTRL_SHADOWED_MANUAL_OPERATION_OFFSET  15
`define  AES_STATUS_INPUT_READY_OFFSET              4
`define  AES_STATUS_OUTPUT_VALID_OFFSET             3

`define  AES_KEY_SHARE0_0_OFFSET                           ( 32'h1a108000 + 32'h04 )
`define  AES_KEY_SHARE0_1_OFFSET                           ( 32'h1a108000 + 32'h08 )
`define  AES_KEY_SHARE0_2_OFFSET                           ( 32'h1a108000 + 32'h0c )
`define  AES_KEY_SHARE0_3_OFFSET                           ( 32'h1a108000 + 32'h10 )
`define  AES_KEY_SHARE0_4_OFFSET                           ( 32'h1a108000 + 32'h14 )
`define  AES_KEY_SHARE0_5_OFFSET                           ( 32'h1a108000 + 32'h18 )
`define  AES_KEY_SHARE0_6_OFFSET                           ( 32'h1a108000 + 32'h1c )
`define  AES_KEY_SHARE0_7_OFFSET                           ( 32'h1a108000 + 32'h20 )
`define  AES_KEY_SHARE1_0_OFFSET                           ( 32'h1a108000 + 32'h24 )
`define  AES_KEY_SHARE1_1_OFFSET                           ( 32'h1a108000 + 32'h28 )
`define  AES_KEY_SHARE1_2_OFFSET                           ( 32'h1a108000 + 32'h2c )
`define  AES_KEY_SHARE1_3_OFFSET                           ( 32'h1a108000 + 32'h30 )
`define  AES_KEY_SHARE1_4_OFFSET                           ( 32'h1a108000 + 32'h34 )
`define  AES_KEY_SHARE1_5_OFFSET                           ( 32'h1a108000 + 32'h38 )
`define  AES_KEY_SHARE1_6_OFFSET                           ( 32'h1a108000 + 32'h3c )
`define  AES_KEY_SHARE1_7_OFFSET                           ( 32'h1a108000 + 32'h40 )
`define  AES_IV_0_OFFSET                                   ( 32'h1a108000 + 32'h44 )
`define  AES_IV_1_OFFSET                                   ( 32'h1a108000 + 32'h48 )
`define  AES_IV_2_OFFSET                                   ( 32'h1a108000 + 32'h4c )
`define  AES_IV_3_OFFSET                                   ( 32'h1a108000 + 32'h50 )
`define  AES_DATA_IN_0_OFFSET                              ( 32'h1a108000 + 32'h54 )
`define  AES_DATA_IN_1_OFFSET                              ( 32'h1a108000 + 32'h58 )
`define  AES_DATA_IN_2_OFFSET                              ( 32'h1a108000 + 32'h5c )
`define  AES_DATA_IN_3_OFFSET                              ( 32'h1a108000 + 32'h60 )
`define  AES_DATA_OUT_0_OFFSET                             ( 32'h1a108000 + 32'h64 )
`define  AES_DATA_OUT_1_OFFSET                             ( 32'h1a108000 + 32'h68 )
`define  AES_DATA_OUT_2_OFFSET                             ( 32'h1a108000 + 32'h6c )
`define  AES_DATA_OUT_3_OFFSET                             ( 32'h1a108000 + 32'h70 )
`define  AES_CTRL_SHADOWED_OFFSET                          ( 32'h1a108000 + 32'h74 )
`define  AES_STATUS_OFFSET                                 ( 32'h1a108000 + 32'h84 )


module tb;

    localparam CLK_PERIOD   = 10;

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
        .SecMasking(0) // so there will be no edn_req
        )u_aes (
        .tl_i   (tl_i_enc ),
        .*
    );

    logic [7:0][31:0] key_share0, key_share1;
    logic [7:0][31:0] iv;
    logic [3:0][31:0] input_data, output_data;
    logic [ 2:0]    opcode;
    logic [31:0]    addr;
    logic [31:0]    data, aes_ctrl_val  ;
    logic [31:0] aes_ctrl;
    initial aes_ctrl_val =
        (32'h1 & `AES_CTRL_SHADOWED_OPERATION_MASK) << `AES_CTRL_SHADOWED_OPERATION_OFFSET |
        (32'h2 & `AES_CTRL_SHADOWED_MODE_MASK) << `AES_CTRL_SHADOWED_MODE_OFFSET |
        (32'h1 & `AES_CTRL_SHADOWED_KEY_LEN_MASK) << `AES_CTRL_SHADOWED_KEY_LEN_OFFSET |
        32'h0 << `AES_CTRL_SHADOWED_MANUAL_OPERATION_OFFSET;
    initial clk_i = 0;
    initial clk_edn_i=0;
    initial rst_ni = 0;
    initial rst_shadowed_ni=0;
    initial rst_edn_ni=0;
    always #(5) clk_i = ~clk_i;
    always #(9) clk_edn_i = ~clk_edn_i;

    initial begin
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
        @(negedge clk_i) @(negedge clk_i) @(negedge clk_i) @(negedge clk_i) @(negedge clk_i) @(negedge clk_i) @(negedge clk_i) @(negedge clk_i)
        rst_edn_ni=1;

        wait (edn_o.edn_req == 1);
        @(posedge clk_edn_i)
        edn_i.edn_ack=1;
        edn_i.edn_fips=1;
        edn_i.edn_bus=32'h4807379f;
        @(posedge clk_edn_i)
        edn_i.edn_ack=0;
        @(posedge clk_edn_i)
        @(negedge clk_edn_i)

        wait (edn_o.edn_req == 1);
        @(posedge clk_edn_i)
        edn_i.edn_ack=1;
        edn_i.edn_fips=1;
        edn_i.edn_bus=32'h5e22c820;
        @(posedge clk_edn_i)
        edn_i.edn_ack=0;

        // check status
        while (tl_o.d_data!=32'h11) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end


        // initialize control register
        @(negedge clk_i) @(negedge clk_i)      
        opcode  = tlul_pkg::PutFullData;
        addr    = `AES_CTRL_SHADOWED_OFFSET;
        // 001 0000 0101 
        aes_ctrl=0;
        aes_ctrl[1:0]  = aes_pkg::AES_ENC;   // 2'b01
        aes_ctrl[7:2]  = aes_pkg::AES_ECB;   // 6'b00_0001
        aes_ctrl[10:8] = aes_pkg::AES_128;   // 3'b001
        data    = aes_ctrl;    
        invoke_aes(opcode, addr, data, tl_i); //write to memory
        
        // wait ctrl signal done
        @(negedge clk_i) @(negedge clk_i)
        while (tl_o.d_data!=32'h11) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end

        // Write IV
        for (int i=0; i<4; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_IV_0_OFFSET+i*4;
            data    = iv[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end
        for (int i=0; i<8; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_KEY_SHARE0_0_OFFSET+i*4;
            data    = key_share0[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end
        for (int i=0; i<8; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_KEY_SHARE1_0_OFFSET+i*4;
            data    = key_share1[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end
        @(negedge clk_i) @(negedge clk_i)
        tl_i=0;

        //refresh status to IDLE
        wait (edn_o.edn_req == 1);
        @(posedge clk_edn_i)
        edn_i.edn_ack=1;
        edn_i.edn_fips=1;
        edn_i.edn_bus=32'ha75c309b;
        @(posedge clk_edn_i)
        edn_i.edn_ack=0;
        @(posedge clk_edn_i)
        @(negedge clk_edn_i)

        wait (edn_o.edn_req == 1);
        @(posedge clk_edn_i)
        edn_i.edn_ack=1;
        edn_i.edn_fips=1;
        edn_i.edn_bus=32'h0db244da;
        @(posedge clk_edn_i)
        edn_i.edn_ack=0;
        // check status - wait status to be idle
        while (tl_o.d_data!=32'h11) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end

        for (int i=0; i<4; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_DATA_IN_0_OFFSET +i*4;
            data    = input_data[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end

        //  wait calculation done
        while (tl_o.d_data!=32'h19) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end
        @(negedge clk_i)
        for (int i=0; i<4; i++) begin
            @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_DATA_OUT_0_OFFSET +i*4;
            data    = 0;    
            invoke_aes(opcode, addr, data, tl_i); //read from memory
            @(negedge clk_i) 
            output_data[i]=tl_o.d_data;
        end

        ///////////////////////////// start decode /////////////////////////////////////////
        // initialize control register
        @(negedge clk_i) @(negedge clk_i)      
        opcode  = tlul_pkg::PutFullData;
        addr    = `AES_CTRL_SHADOWED_OFFSET;
        // 001 0000 0110 
        aes_ctrl=0;
        aes_ctrl[1:0]  = aes_pkg::AES_DEC;   // 2'b10
        aes_ctrl[7:2]  = aes_pkg::AES_ECB;   // 6'b00_0001
        aes_ctrl[10:8] = aes_pkg::AES_128;   // 3'b001
        data    = aes_ctrl;    
        invoke_aes(opcode, addr, data, tl_i); //write to memory
        
        // wait ctrl signal done
        @(negedge clk_i) @(negedge clk_i)
        while (tl_o.d_data!=32'h11) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end

        // Write IV
        for (int i=0; i<4; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_IV_0_OFFSET+i*4;
            data    = iv[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end
        for (int i=0; i<8; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_KEY_SHARE0_0_OFFSET+i*4;
            data    = key_share0[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end
        for (int i=0; i<8; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_KEY_SHARE1_0_OFFSET+i*4;
            data    = key_share1[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end
        @(negedge clk_i) @(negedge clk_i)
        tl_i=0;

        //refresh status to IDLE
        wait (edn_o.edn_req == 1);
        @(posedge clk_edn_i)
        edn_i.edn_ack=1;
        edn_i.edn_fips=1;
        edn_i.edn_bus=32'ha75c309b;
        @(posedge clk_edn_i)
        edn_i.edn_ack=0;
        @(posedge clk_edn_i)
        @(negedge clk_edn_i)

        wait (edn_o.edn_req == 1);
        @(posedge clk_edn_i)
        edn_i.edn_ack=1;
        edn_i.edn_fips=1;
        edn_i.edn_bus=32'h0db244da;
        @(posedge clk_edn_i)
        edn_i.edn_ack=0;
        // check status - wait status to be idle
        while (tl_o.d_data!=32'h11) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end

        for (int i=0; i<4; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = `AES_DATA_IN_0_OFFSET +i*4;
            data    = output_data[i];    
            invoke_aes(opcode, addr, data, tl_i); //write to memory
        end

        //  wait calculation done
        while (tl_o.d_data!=32'h19) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::Get;
            addr    = `AES_STATUS_OFFSET;
            data    = 0;    
            invoke_status_reg(opcode, addr, data, tl_i); //read from memory
        end
        @(negedge clk_i)
        @(negedge clk_i)
        for (int i=0; i<4; i++) begin
            opcode  = tlul_pkg::Get;
            addr    = `AES_DATA_OUT_0_OFFSET +i*4;
            data    = 0;    
            invoke_aes(opcode, addr, data, tl_i); //read from memory
            @(negedge clk_i) 
            @(negedge clk_i) 
            if (input_data[i]==tl_o.d_data) $display("[PASS] test case %d, output is %h\n", i, tl_o.d_data);
            else $display("[FAIL] test case %d , should be %h, but actual output is %h\n", i,input_data[i], tl_o.d_data );
        end
        #100
        // $display("SUCCESS\n");
	    $finish;
    end

endmodule

task automatic wait_output_valid;


begin
end
endtask
task automatic wait_input_ready;
    // input clk_i;
    // input tlul_pkg::tl_d2h_t tl_o;
    // output tlul_pkg::tl_h2d_t tl_i;
    // logic [ 2:0]    opcode;
    // logic [31:0]    addr;
    // logic [31:0]    data;

begin
end
endtask

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