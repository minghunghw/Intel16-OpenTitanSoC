`define NUM_ENTRY 1024

/*
    This module is used as a fallback option
    which hopes to bypasses the tilelink bus and
    writes directly to fake SRAM

    After loading the SRAM, this module returns
    expected tilelink packets back to the core.

    Note: This module is supposedly not functional
    if no xbar_main / xbar_periph is present.
    The intent of drafting the module in question is
    to bypass the xbars -- which is not possible AFAIK

    And since the xbar is required either this module or 
    iccm_tlul (hw/tb/fakes) is used in the testbench, it made 
    more sense to test the opentitan_soc (hw/sv/ibex) directly instead
*/

module ibex_tlul_iccm (
    // System inputs
    input logic clk_i,
    input logic rst_ni,

    // Input from testbench to load fake instructions
    input logic                          valid,
    input logic [TL_DW-1:0]              instr,
    input logic [$clog2(`NUM_ENTRY)-1:0] addr,
    input logic                          finish,
    input tlul_pkg::tl_h2d_t.a_address   ibex2iccm_addr,

    // Output from fake instruction memory to wrapper imem interface
    output tlul_pkg::tl_d2h_t iccm2ibex_pkt
);

/*
    (outputs) Fake iccm |-> ibex_tlul

    tlul_pkg::tl_d2h_t
    typedef struct packed {
    logic                         d_valid;   -- always 1'b1
    tl_d_op_e                     d_opcode;  -- always 3'b001
    logic                  [2:0]  d_param;   -- unused
    logic  [top_pkg::TL_SZW-1:0]  d_size;    -- always 2'b11
    logic  [top_pkg::TL_AIW-1:0]  d_source;  -- Device always match with host
    logic  [top_pkg::TL_DIW-1:0]  d_sink;    -- unused
    logic   [top_pkg::TL_DW-1:0]  d_data;    -- Outputs stored instructions to core
    tl_d_user_t                   d_user;    -- tlul_pkg::TL_A_USER_DEFAULT
    logic                         d_error;   -- always 1'b0
    logic                         a_ready;   -- always 1'b1
    } tl_d2h_t;
*/

/*
    (inputs) TB |-> Fake iccm

    logic                          valid          -- always 1 till loading of instrs is finished
    logic [TL_DW-1:0]              instr          -- Instruction data
    logic [$clog2(`NUM_ENTRY)-1:0] addr           -- Iterable in TB
    logic                          finish         -- Marker to send ctrl signals to core wrapper
    tlul_pkg::tl_h2d_t.a_address   ibex2iccm_addr -- Requested address from core
*/

/*
    Opcode tl_a_op_e d_opcode specifications:
    3'b000	AccessAck
    3'b001	AccessAckData
    Others are undefined
*/

logic [`NUM_ENTRY-1:0][TL_DW-1:0] instr_memory_r;
logic [`NUM_ENTRY-1:0][TL_DW-1:0] instr_memory_w;

always_comb begin
    instr_memory_w = instr_memory_r;

    // Init unsed outputs here
    iccm2ibex_pkt.param = 3'b000;
    iccm2ibex_pkt.sink  = {top_pkg::TL_DIW{1'b0}};

    if (!finish) begin
        // Update memory with input instructions
        instr_memory_w[addr] = instr;

        // Output default values
        iccm2ibex_pkt.d_valid  = 1'b0;
        iccm2ibex_pkt.d_opcode = 3'b000;
        iccm2ibex_pkt.d_size   = 2'b11;
        iccm2ibex_pkt.d_source = {top_pkg::TL_AIW{1'b0}};
        iccm2ibex_pkt.d_data   = {top_pkg::TL_DW{1'b0}};
        iccm2ibex_pkt.d_user   = tlul_pkg::TL_A_USER_DEFAULT;
        iccm2ibex_pkt.d_error  = 1'b0;
        iccm2ibex_pkt.a_ready  = 1'b0;        
    end
    else begin
        iccm2ibex_pkt.d_valid  = 1'b1;
        iccm2ibex_pkt.d_opcode = 3'b000;
        iccm2ibex_pkt.d_size   = 2'b11;
        iccm2ibex_pkt.d_source = {top_pkg::TL_AIW{1'b0}};
        iccm2ibex_pkt.d_data   = instr_memory_r[ibex2iccm_addr];
        iccm2ibex_pkt.d_user   = tlul_pkg::TL_A_USER_DEFAULT;
        iccm2ibex_pkt.d_error  = 1'b0;
        iccm2ibex_pkt.a_ready  = 1'b1;
    end
end

always_ff @(posedge clk) begin
    if (rst_n) begin
        instr_memory_r <= 'b0;
        instr_memory_w <= 'b0;
    end
    else begin
        instr_memory_r <= instr_memory_w;
    end
end

endmodule