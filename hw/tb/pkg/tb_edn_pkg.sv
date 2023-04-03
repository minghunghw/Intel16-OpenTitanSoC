`define EDN_WR(opcode, addr, data)              \
    @(negedge clk_i)                            \
    invoke_edn(opcode, addr, data, tl_i);       \
    @(negedge clk_i)                            \
    tl_i = tlul_pkg::TL_H2D_DEFAULT;

`define EDN_RD(opcode, addr, data, ev)          \
    while (1) begin                             \
        @(negedge clk_i)                        \
        invoke_edn(opcode, addr, data, tl_i);   \
        @(negedge clk_i)                        \
        tl_i = tlul_pkg::TL_H2D_DEFAULT;        \
        if (tl_o.d_data == ev && tl_o.d_valid)  \
            break;                              \
    end

`define CSRNG_WR(ack, sts, valid, fips, bus)                \
    @(negedge clk_i)                                        \
    invoke_csrng(ack, sts, valid, fips, bus, csrng_cmd_i);  \
    @(negedge clk_i)                                        \
    csrng_cmd_i = csrng_pkg::CSRNG_RSP_DEFAULT;

`define CMD(glen, flag0, clen, cmd) \
    {7'h0, glen, flag0, clen, cmd}

`define CTRL_ENABLE                                                         \
    opcode  = tlul_pkg::PutFullData;                                        \
    addr    = edn_reg_pkg::EDN_CTRL_OFFSET;                                 \
    data    = {{3{prim_mubi_pkg::MuBi4False}}, prim_mubi_pkg::MuBi4True};   \
    `EDN_WR(opcode, addr, data);

`define WAIT_SW_STS                                     \
    opcode  = tlul_pkg::Get;                            \
    addr    = edn_reg_pkg::EDN_SW_CMD_STS_OFFSET;       \
    data    = 0;                                        \
    ev      = 1;                                        \
    `EDN_RD(opcode, addr, data, ev);

`define CMD_INSTANTIATE                                 \
    opcode  = tlul_pkg::PutFullData;                    \
    addr    = edn_reg_pkg::EDN_SW_CMD_REQ_OFFSET;       \
    glen    = 0;                                        \
    flag0   = prim_mubi_pkg::MuBi4False;                \
    clen    = 0;                                        \
    cmd     = csrng_pkg::INS;                           \
    data    = `CMD(glen, flag0, clen, cmd);             \
    `EDN_WR(opcode, addr, data);                                                                        

`define CMD_INSTANTIATE_RSP                                 \
    wait(csrng_cmd_o.csrng_req_bus[2:0] == csrng_pkg::INS); \
    ack     = 1;                                            \
    sts     = 1;                                            \
    valid   = 0;                                            \
    fips    = 0;                                            \
    bus     = 0;                                            \
    `CSRNG_WR(ack, sts, valid, fips, bus);                  

`define WAIT_INT_STS                                    \
    opcode  = tlul_pkg::Get;                            \
    addr    = edn_reg_pkg::EDN_INTR_STATE_OFFSET;       \
    data    = 0;                                        \
    ev      = 1;                                        \
    `EDN_RD(opcode, addr, data, ev);

`define CMD_GENERATE                                    \
    opcode  = tlul_pkg::PutFullData;                    \
    addr    = edn_reg_pkg::EDN_SW_CMD_REQ_OFFSET;       \
    glen    = 1;                                        \
    flag0   = prim_mubi_pkg::MuBi4False;                \
    clen    = 0;                                        \
    cmd     = csrng_pkg::GEN;                           \
    data    = `CMD(glen, flag0, clen, cmd);             \
    `EDN_WR(opcode, addr, data);           

`define CMD_GENERATE_EDN_RSP                                \
    edn_i[0].edn_req = 1;                                   \
    wait(csrng_cmd_o.csrng_req_bus[2:0] == csrng_pkg::GEN); \
    ack     = 0;                                            \
    sts     = 0;                                            \
    valid   = 1;                                            \
    fips    = 0;                                            \
    bus     = genbits;                                      \
    `CSRNG_WR(ack, sts, valid, fips, bus); 

`define CHECK_EDN_RSP(expected_value)           \
    wait(edn_o[0].edn_bus == expected_value);   \
    correct += 1;

`define CMD_GENERATE_CSRNG_RSP                              \
    ack     = 1;                                            \
    sts     = 1;                                            \
    valid   = 0;                                            \
    fips    = 0;                                            \
    bus     = 0;                                            \
    `CSRNG_WR(ack, sts, valid, fips, bus); 

`define CMD_UNINSTANTIATE                               \
    opcode  = tlul_pkg::PutFullData;                    \
    addr    = edn_reg_pkg::EDN_SW_CMD_REQ_OFFSET;       \
    glen    = 0;                                        \
    flag0   = prim_mubi_pkg::MuBi4False;                \
    clen    = 0;                                        \
    cmd     = csrng_pkg::UNI;                           \
    data    = `CMD(glen, flag0, clen, cmd);             \
    `EDN_WR(opcode, addr, data);     

`define CMD_UNINSTANTIATE_RSP                               \
    wait(csrng_cmd_o.csrng_req_bus[2:0] == csrng_pkg::UNI); \
    ack     = 1;                                            \
    sts     = 0;                                            \
    valid   = 0;                                            \
    fips    = 0;                                            \
    bus     = 0;                                            \
    `CSRNG_WR(ack, sts, valid, fips, bus); 