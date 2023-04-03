`define EDN_ACK            \
    wait (edn_o.edn_req == 1);                  \                    
    @(posedge clk_edn_i)                        \          
    edn_i.edn_ack=1;                            \
    edn_i.edn_fips=1;                           \
    // edn_i.edn_bus=32'h4807379f;              \
    @(posedge clk_edn_i)                        \
    edn_i.edn_ack=0;                            \
    @(posedge clk_edn_i)                        \
    @(negedge clk_edn_i)                        \
    wait (edn_o.edn_req == 1);                  \
    @(posedge clk_edn_i)                        \
    edn_i.edn_ack=1;                            \
    edn_i.edn_fips=1;                           \
    // edn_i.edn_bus=32'h5e22c820;              \
    @(posedge clk_edn_i)                        \
    edn_i.edn_ack=0;                            

`define WAIT_STATUS(cond)                                                        \
    @(negedge clk_i) @(negedge clk_i)                                       \
    while (tl_o.d_data!=cond) begin                                       \
        @(negedge clk_i) @(negedge clk_i)                                   \
        opcode  = tlul_pkg::Get;                                            \
        addr    = aes_reg_pkg::AES_STATUS_OFFSET;                           \
        data    = 0;                                                        \
        //read from memory                                                  \
        invoke_status_reg(opcode, addr, data, tl_i);                        \
    end                  

`define INIT_CTRL(op)                                                       \
    @(negedge clk_i) @(negedge clk_i)                                   \
    opcode  = tlul_pkg::PutFullData;                                    \
    addr    = aes_reg_pkg::AES_CTRL_SHADOWED_OFFSET;                    \
    // 001 0000 0101 = 2'b01 + 6'b00_0001 + 3'b001                      \
    aes_ctrl=0;                                                         \
    aes_ctrl[1:0]  = op;                                                \
    aes_ctrl[7:2]  = aes_pkg::AES_ECB;                                  \
    aes_ctrl[10:8] = aes_pkg::AES_128;                                  \
    data    = aes_ctrl;                                                 \
    //write to memory                                                   \
    invoke_aes(opcode, addr, data, tl_i);                                                   

`define WR_IV_KEY(iv, key_share0, key_share1)                           \
    for (int i=0; i<4; i++) begin                                       \
        @(negedge clk_i) @(negedge clk_i)                               \
        opcode  = tlul_pkg::PutFullData;                                \
        addr    = aes_reg_pkg::AES_IV_0_OFFSET+i*4;                     \
        data    = iv[i];                                                \
        invoke_aes(opcode, addr, data, tl_i);                           \
    end                                                                 \
    for (int i=0; i<8; i++) begin                                       \
        @(negedge clk_i) @(negedge clk_i)                               \
        opcode  = tlul_pkg::PutFullData;                                \
        addr    = aes_reg_pkg::AES_KEY_SHARE0_0_OFFSET+i*4;             \
        data    = key_share0[i];                                        \
        invoke_aes(opcode, addr, data, tl_i);                           \
    end                                                                 \
    for (int i=0; i<8; i++) begin                                       \
        @(negedge clk_i) @(negedge clk_i)                               \
        opcode  = tlul_pkg::PutFullData;                                \
        addr    = aes_reg_pkg::AES_KEY_SHARE1_0_OFFSET+i*4;             \
        data    = key_share1[i];                                        \
        invoke_aes(opcode, addr, data, tl_i);                           \
    end                                                                 \
    @(negedge clk_i) @(negedge clk_i)                                   \
    tl_i=0;


`define WR_INPUT(input_data)                                            \
    for (int i=0; i<4; i++) begin                                       \
        @(negedge clk_i) @(negedge clk_i)                               \
        opcode  = tlul_pkg::PutFullData;                                \
        addr    = aes_reg_pkg::AES_DATA_IN_0_OFFSET +i*4;               \
        data    = input_data[i];                                        \
        invoke_aes(opcode, addr, data, tl_i);                           \
    end

`define RD_OUTPUT(output_data)                                          \
    for (int i=0; i<4; i++) begin                                       \
        @(negedge clk_i)                                                \
        opcode  = tlul_pkg::Get;                                        \
        addr    = aes_reg_pkg::AES_DATA_OUT_0_OFFSET +i*4;              \
        data    = 0;                                                    \
        invoke_aes(opcode, addr, data, tl_i);                           \
        @(negedge clk_i)                                                \
        output_data[i]=tl_o.d_data;                                     \
    end

`define CHECK_RESULT(correct)                                           \
    for (int i=0; i<4; i++) begin                                       \
        if (input_data[i]==output_data[i]) correct += 1;                \
    end 


