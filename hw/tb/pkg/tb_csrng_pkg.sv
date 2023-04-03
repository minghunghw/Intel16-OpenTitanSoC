`define CSRNG_WR(opcode, addr, data)            \
    @(negedge clk_i)                            \
    invoke_csrng(opcode, addr, data, tl_i);     \
    @(negedge clk_i)                            \
    tl_i = tlul_pkg::TL_H2D_DEFAULT;

`define CSRNG_RD(opcode, addr, data, ev)        \
    while (1) begin                             \
        @(negedge clk_i)                        \
        invoke_csrng(opcode, addr, data, tl_i); \
        @(negedge clk_i)                        \
        tl_i = tlul_pkg::TL_H2D_DEFAULT;        \
        if (tl_o.d_data == ev && tl_o.d_valid)  \
            break;                              \
    end

`define CMD(glen, flag0, clen, cmd) \
    {7'h0, glen, flag0, clen, cmd}

`define WR_REG_ENABLE                               \
    opcode  = tlul_pkg::PutFullData;                \
    addr    = csrng_reg_pkg::CSRNG_REGWEN_OFFSET;   \
    data    = 1;                                    \
    `CSRNG_WR(opcode, addr, data);

`define CTRL_ENABLE                             \
    opcode  = tlul_pkg::PutFullData;            \
    addr    = csrng_reg_pkg::CSRNG_CTRL_OFFSET; \
    data    = {3{prim_mubi_pkg::MuBi4True}};    \
    `CSRNG_WR(opcode, addr, data);

`define WAIT_SW_STS                                     \
    opcode  = tlul_pkg::Get;                            \
    addr    = csrng_reg_pkg::CSRNG_SW_CMD_STS_OFFSET;   \
    data    = 0;                                        \
    ev      = 1;                                        \
    `CSRNG_RD(opcode, addr, data, ev);

`define CMD_INSTANTIATE                                 \
    opcode  = tlul_pkg::PutFullData;                    \
    addr    = csrng_reg_pkg::CSRNG_CMD_REQ_OFFSET;      \
    glen    = 0;                                        \
    flag0   = prim_mubi_pkg::MuBi4True;                 \
    clen    = 4'hc;                                     \
    cmd     = csrng_pkg::INS;                           \
    data    = `CMD(glen, flag0, clen, cmd);             \
    `CSRNG_WR(opcode, addr, data);                      \
    for (int i=11; i>=0; i--) begin                     \
        `WAIT_SW_STS;                                   \
        opcode  = tlul_pkg::PutFullData;                \
        addr    = csrng_reg_pkg::CSRNG_CMD_REQ_OFFSET;  \
        data    = seed[i];                              \
        `CSRNG_WR(opcode, addr, data);                  \
    end                                                 

`define WAIT_INT_STS                                    \
    opcode  = tlul_pkg::Get;                            \
    addr    = csrng_reg_pkg::CSRNG_INTR_STATE_OFFSET;   \
    data    = 0;                                        \
    ev      = 1;                                        \
    `CSRNG_RD(opcode, addr, data, ev);

`define CMD_GENERATE                                    \
    opcode  = tlul_pkg::PutFullData;                    \
    addr    = csrng_reg_pkg::CSRNG_CMD_REQ_OFFSET;      \
    glen    = 1;                                        \
    flag0   = 0;                                        \
    clen    = 0;                                        \
    cmd     = csrng_pkg::GEN;                           \
    data    = `CMD(glen, flag0, clen, cmd);             \
    `CSRNG_WR(opcode, addr, data);                      

`define WAIT_GENBITS_VLD                                \
    opcode  = tlul_pkg::Get;                            \
    addr    = csrng_reg_pkg::CSRNG_GENBITS_VLD_OFFSET;  \
    data    = 0;                                        \
    ev      = 1;                                        \
    `CSRNG_RD(opcode, addr, data, ev);

`define CHECK_GENBITS(expected_value)               \
    opcode  = tlul_pkg::Get;                        \
    addr    = csrng_reg_pkg::CSRNG_GENBITS_OFFSET;  \
    data    = 0;                                    \
    ev      = expected_value;                       \
    @(negedge clk_i)                                \
    invoke_csrng(opcode, addr, data, tl_i);         \
    @(negedge clk_i)                                \
    tl_i = tlul_pkg::TL_H2D_DEFAULT;                \
    correct += 1