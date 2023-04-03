`define RESET_MASTER                                                                \
    jtag_i.tms    <= #TA 1;                                                         \
    jtag_i.tdi    <= #TA 0;                                                         \
    jtag_i.trst_n <= #TA 0;                                                         \
    // repeat (2) clock();                                                          \
    @(posedge jtag_clk) @(posedge jtag_clk)                                         \
    jtag_i.trst_n <= #TA 1;                                                         \
    ir_select = 'h1;                                                                \
    // clock();                                                                     \
    @(posedge jtag_clk);                                                            \


`define SOFT_RESET                                                                  \
    jtag_i.tms <= #TA 1;                                                            \
    jtag_i.tdi <= #TA 0;                                                            \
    // repeat (6) clock();                                                          \
    @(posedge jtag_clk) @(posedge jtag_clk) @(posedge jtag_clk)                     \
    @(posedge jtag_clk) @(posedge jtag_clk) @(posedge jtag_clk)                     \
    jtag_i.tms <= #TA 0;                                                            \
    // clock();                                                                     \
    @(posedge jtag_clk)                                                             \
    // After softreset the IR should be reset to IDCODE so we have to mirror        \
    // this in our internal state.                                                  \
    ir_select = 'h1;


`define WRITE_TMS(tms_val)                                                          \
    jtag_i.tms <= #TA tms_val;                                                      \
    // clock();                                                                     \
    @(posedge jtag_clk)         


`define WRITE_BITS(wdata, tms_last)                                                 \
    for (int i = 0; i < $size(wdata); i++) begin                                    \
    jtag_i.tdi <= #TA wdata[i];                                                     \
    if (i == ($size(wdata) - 1)) jtag_i.tms <= #TA tms_last;                        \
    // clock();                                                                     \
    @(posedge jtag_clk)                                                             \
    end                                                                             \
    jtag_i.tms <= #TA 0;


// Set IR, but only if it needs to be set.
`define SET_IR(opcode)                                                              \
    logic opcode_unpacked [IrLength];                                               \
    // check whether IR is already set to the right value                           \
    if (ir_select == opcode) return;                                                \
    {<<{opcode_unpacked}} = opcode;                                                 \
    // select DR scan                                                               \
    `WRITE_TMS(1);                                                                   \
    // select IR scan                                                               \
    `WRITE_TMS(1);                                                                   \
    // capture IR                                                                   \
    `WRITE_TMS(0);                                                                   \
    // shift IR                                                                     \
    `WRITE_TMS(0);                                                                   \
    `WRITE_BITS(opcode_unpacked, 1);                                                 \
    // update IR                                                                    \
    `WRITE_TMS(1);                                                                   \
    // run test idle                                                                \
    `WRITE_TMS(0);                                                                   \
    ir_select = opcode; 


// `define GET_IDCODE(idcode)                                                          \
//     logic read_data [32], write_data [32];                                          \
//     write_data = '{default: 1'b0};                                                  \
//     jtag.`SET_IR(IDCODE);                                                            \
//     jtag.shift_dr();                                                                \
//     jtag.readwrite_bits(read_data, write_data, 1'b0);                               \
//     jtag.update_dr(1'b1);                                                           \
//     idcode = {<<{read_data}};
