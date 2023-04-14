`define KEYMGR_WR(opcode, addr, data)           \
    @(negedge clk_i)                            \
    invoke_keymgr(opcode, addr, data, tl_i);    \
    @(negedge clk_i)                            \
    tl_i = tlul_pkg::TL_H2D_DEFAULT;

`define KEYMGR_RD(opcode, addr, data, ev)           \
    while (1) begin                                 \
        @(negedge clk_i)                            \
        invoke_keymgr(opcode, addr, data, tl_i);    \
        @(negedge clk_i)                            \
        tl_i = tlul_pkg::TL_H2D_DEFAULT;            \
        if (tl_o.d_data == ev && tl_o.d_valid)      \
            break;                                  \
    end

`define INTR_ENABLE                                         \
    opcode  = tlul_pkg::PutFullData;                        \
    addr    = keymgr_reg_pkg::KEYMGR_INTR_ENABLE_OFFSET;    \
    data    = 1;                                            \
    `KEYMGR_WR(opcode, addr, data);

`define CMD(op, dest) \
    {18'h0, dest, 5'h0, op, 4'h0}

`define OP_CTRL_SW                                              \
    opcode  = tlul_pkg::PutFullData;                            \
    addr    = keymgr_reg_pkg::KEYMGR_CONTROL_SHADOWED_OFFSET;   \
    data    = `CMD(keymgr_pkg::OpGenSwOut, keymgr_pkg::Otbn);   \
    `KEYMGR_WR(opcode, addr, data);

`define KEYMGR_START                                \
    opcode  = tlul_pkg::PutFullData;                \
    addr    = keymgr_reg_pkg::KEYMGR_START_OFFSET;  \
    data    = 1;                                    \
    `KEYMGR_WR(opcode, addr, data);

`define WAIT_OP_STS                                     \
    opcode  = tlul_pkg::Get;                            \
    addr    = keymgr_reg_pkg::KEYMGR_OP_STATUS_OFFSET;  \
    data    = 0;                                        \
    ev      = 2;                                        \
    `KEYMGR_RD(opcode, addr, data, ev);

`define CHECK_ERROR                                     \
    opcode  = tlul_pkg::Get;                            \
    addr    = keymgr_reg_pkg::KEYMGR_ERR_CODE_OFFSET;   \
    data    = 0;                                        \
    ev      = 0;                                        \
    `KEYMGR_RD(opcode, addr, data, ev);

`define CHECK_FAULT                                         \
    opcode  = tlul_pkg::Get;                                \
    addr    = keymgr_reg_pkg::KEYMGR_FAULT_STATUS_OFFSET;   \
    data    = 0;                                            \
    ev      = 0;                                            \
    `KEYMGR_RD(opcode, addr, data, ev);

`define WAIT_SW_STS                                     \
    opcode  = tlul_pkg::Get;                            \
    addr    = keymgr_reg_pkg::KEYMGR_INTR_STATE_OFFSET; \
    data    = 0;                                        \
    ev      = 1;                                        \
    `KEYMGR_RD(opcode, addr, data, ev);