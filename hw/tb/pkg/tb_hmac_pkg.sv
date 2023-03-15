`define HMAC_H2D(opcode, addr, data)            \
    @(negedge clk_i)                            \
    invoke_hmac(opcode, addr, data, tl_i);      \
    @(negedge clk_i)                            \
    tl_i = tlul_pkg::TL_H2D_DEFAULT;

`define SHA256_MODE                             \
    opcode  = tlul_pkg::PutFullData;            \
    addr    = hmac_reg_pkg::HMAC_CFG_OFFSET;    \
    data    = 2;                                \
    `HMAC_H2D(opcode, addr, data);

`define SEND_MSG_FIFO                               \
    opcode  = tlul_pkg::PutFullData;                \
    addr    = hmac_reg_pkg::HMAC_MSG_FIFO_OFFSET;   \
    data    = 32'h12345678;                         \
    `HMAC_H2D(opcode, addr, data);

`define START_HMAC                              \
    opcode  = tlul_pkg::PutFullData;            \
    addr    = hmac_reg_pkg::HMAC_CMD_OFFSET;    \
    data    = 1;                                \
    `HMAC_H2D(opcode, addr, data);

`define READ_DIGEST0                                \
    opcode  = tlul_pkg::Get;                        \
    addr    = hmac_reg_pkg::HMAC_DIGEST_0_OFFSET;   \
    data    = 0;                                    \
    `HMAC_H2D(opcode, addr, data);

`define READ_ERROR                                  \
    opcode  = tlul_pkg::Get;                        \
    addr    = hmac_reg_pkg::HMAC_ERR_CODE_OFFSET;   \
    data    = 0;                                    \
    `HMAC_H2D(opcode, addr, data);