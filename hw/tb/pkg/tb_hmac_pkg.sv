`define HMAC_WR(opcode, addr, data)             \
    @(negedge clk_i)                            \
    invoke_hmac(opcode, addr, data, tl_i);      \
    @(negedge clk_i)                            \
    tl_i = tlul_pkg::TL_H2D_DEFAULT;

`define HMAC_RD(opcode, addr, data, ev)             \
    while (1) begin                                 \
        @(negedge clk_i)                            \
        invoke_hmac(opcode, addr, data, tl_i);      \
        @(negedge clk_i)                            \
        tl_i = tlul_pkg::TL_H2D_DEFAULT;            \
        if (tl_o.d_data == ev && tl_o.d_valid)      \
            break;                                  \
    end

`define HMAC_MODE                               \
    opcode  = tlul_pkg::PutFullData;            \
    addr    = hmac_reg_pkg::HMAC_CFG_OFFSET;    \
    data    = 6;                                \
    `HMAC_WR(opcode, addr, data);

`define INTR_ENABLE                                     \
    opcode  = tlul_pkg::PutFullData;                    \
    addr    = hmac_reg_pkg::HMAC_INTR_ENABLE_OFFSET;    \
    data    = 7;                                        \
    `HMAC_WR(opcode, addr, data);

`define SET_HMAC_KEY(id, key)                       \
    opcode  = tlul_pkg::PutFullData;                \
    addr    = hmac_reg_pkg::HMAC_KEY_``id``_OFFSET; \
    data    = key;                                  \
    `HMAC_WR(opcode, addr, data);

`define START_HMAC_CONFIG                       \
    opcode  = tlul_pkg::PutFullData;            \
    addr    = hmac_reg_pkg::HMAC_CMD_OFFSET;    \
    data    = 1;                                \
    `HMAC_WR(opcode, addr, data);

`define START_HMAC_OP                           \
    opcode  = tlul_pkg::PutFullData;            \
    addr    = hmac_reg_pkg::HMAC_CMD_OFFSET;    \
    data    = 2;                                \
    `HMAC_WR(opcode, addr, data);

`define WAIT_INT_STS                            \
    opcode  = tlul_pkg::Get;                    \
    addr    = hmac_reg_pkg::HMAC_STATUS_OFFSET; \
    data    = 0;                                \
    ev      = 1;                                \
    `HMAC_RD(opcode, addr, data, ev);

`define SEND_HMAC_MSG(address, value)   \
    opcode  = tlul_pkg::PutFullData;    \
    addr    = address;                  \
    data    = value;                    \
    `HMAC_WR(opcode, addr, data);

`define READ_MSG_LENGTH(length)                             \
    opcode  = tlul_pkg::Get;                                \
    addr    = hmac_reg_pkg::HMAC_MSG_LENGTH_LOWER_OFFSET;   \
    data    = 0;                                            \
    ev      = length;                                       \
    `HMAC_RD(opcode, addr, data, ev);

`define READ_DIGEST(id, value)                          \
    opcode  = tlul_pkg::Get;                            \
    addr    = hmac_reg_pkg::HMAC_DIGEST_``id``_OFFSET;  \
    data    = 0;                                        \
    ev      = value;                                    \
    `HMAC_RD(opcode, addr, data, ev);                   \
    correct += 1;

`define READ_ERROR                                  \
    opcode  = tlul_pkg::Get;                        \
    addr    = hmac_reg_pkg::HMAC_ERR_CODE_OFFSET;   \
    data    = 0;                                    \
    ev      = hmac_pkg::NoError;                    \
    `HMAC_RD(opcode, addr, data, ev);   