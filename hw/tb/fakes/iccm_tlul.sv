/*
    This module is functionally similar to:
    https://github.com/msaligane/opentitan_soc/blob/main/memory/instr_mem_tlul.sv

    The differences are:
    - Updated adapter_srams are used
    - Available to set up for testing w/o the presence of SPI interface
    - Simply undefine NO_COMM_PROTOCOL once SPI is set up
*/

module iccm_tlul (
    input clk_i,
    input rst_ni,

    input  tlul_pkg::tl_h2d_t tl_i_i,
    output tlul_pkg::tl_d2h_t tl_i_o

    `ifdef NO_COMM_PROTOCOL
        ,input  logic                      tb2iccm_we
        ,input  logic [top_pkg::TL_DW-1:0] tb2mem_wdata
        ,input  logic [top_pkg::TL_DW-1:0] tb2mem_wmask
        ,input  logic [10:0]               tb2mem_waddr
        ,input  logic                      tb2mem_finish
    `endif


);

prim_mubi_pkg::mubi4_t     adapter_ctrl;
prim_mubi_pkg::mubi4_t     adapter2mem_req_type;
logic                      adapter2mem_req;
logic [10:0]               adapter2mem_addr;
logic                      adapter2mem_intg;

logic [top_pkg::TL_DW-1:0] mem2adapter_rdata;
logic                      mem2adapter_rvalid;

// Intentional left dangling for testing
// Will reconnect when instruction input interface is done
logic                      adapter2mem_we;
logic [top_pkg::TL_DW-1:0] adapter2mem_wdata;
logic [top_pkg::TL_DW-1:0] adapter2mem_wmask;


assign adapter_ctrl = prim_mubi_pkg::MuBi4False;

`ifdef NO_COMM_PROTOCOL
    // Steered signal; Controled by steering input tb2mem_finish
    logic [10:0] adapter_address;
    
    // Once the testbench finished programming the iccm
    // we allow the core to send instruction addresses coming out
    // of the iccm_adapter
    assign adapter_address = tb2mem_finish ? adapter2mem_addr : tb2mem_waddr;
`endif

// Assuming dram returns data after 1-cycle
// Assuming dram is always on
fake_dram iccm (
    .CLK   (clk_i),
    .EN    (1'b1),              // chip enable
    .Q     (mem2adapter_rdata)  // read data
    
    `ifdef NO_COMM_PROTOCOL
        ,.WEN   (tb2iccm_we)       // write enable
        ,.WMASK (tb2mem_wmask)     // write mask
        ,.D     (tb2mem_wdata)     // write data
        ,.A     (adapter_address)  // address
    `else
        ,.WEN   (adapter2mem_we)      // write enable
        ,.WMASK (adapter2mem_wdata)   // write mask
        ,.D     (adapter2mem_wmask)   // write data
        ,.A     (adapter2mem_addr)    // address
    `endif
);

tlul_adapter_sram #(
    .SramAw (10)
) iccm_adapter (
    .clk_i,
    .rst_ni,

    // TL-UL interface
    .tl_i         (tl_i_i),
    .tl_o         (tl_i_o),

    // control interface
    .en_ifetch_i  (adapter_ctrl),

    // SRAM interface
    .req_o        (adapter2mem_req),
    .req_type_o   (adapter2mem_req_type),
    .we_o         (adapter2mem_we),
    .addr_o       (adapter2mem_addr),
    .wdata_o      (adapter2mem_wdata),
    .wmask_o      (adapter2mem_wmask),
    .intg_error_o (adapter2mem_intg),
    .rdata_i      (mem2adapter_rdata),
    .rvalid_i     (mem2adapter_rvalid),
    .gnt_i        (1'b1),
    .rerror_i     (2'b00) // 2 bit error [1]: Uncorrectable, [0]: Correctable
);

always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        mem2adapter_rvalid <= 1'b0;
    end
    // Read data should be invalidated
    // when write enable is still active
    `ifdef NO_COMM_PROTOCOL
    else if (tb2iccm_we) begin
    `else
    else if (adapter2mem_we) begin
    `endif
        mem2adapter_rvalid <= 1'b0;
    end
    else begin
        mem2adapter_rvalid <= adapter2mem_req;
    end
end

endmodule