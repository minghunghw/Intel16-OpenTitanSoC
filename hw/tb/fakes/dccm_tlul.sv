/*
    This module is functionally similar to:
    https://github.com/msaligane/opentitan_soc/blob/main/memory/instr_mem_tlul.sv

    The differences are:
    - Updated adapter_srams are used
    - Available to set up for testing w/o the presence of SPI interface
    - Simply undefine NO_COMM_PROTOCOL once SPI is set up
*/

module dccm_tlul (
    input clk_i,
    input rst_ni,

    input  tlul_pkg::tl_h2d_t tl_d_i,
    output tlul_pkg::tl_d2h_t tl_d_o
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

// Assuming dram returns data after 1-cycle
// Assuming dram is always on
fake_dram dccm (
    .CLK   (clk_i),
    .EN    (1'b0),               // chip enable
    .Q     (mem2adapter_rdata),  // read data
    .WEN   (adapter2mem_we),     // write enable
    .WMASK (adapter2mem_wdata),  // write mask
    .D     (adapter2mem_wmask),  // write data
    .A     (adapter2mem_addr)    // address
);

tlul_adapter_sram #(
    .SramAw (11),
    .Outstanding(2)
) iccm_adapter (
    .clk_i,
    .rst_ni,

    // TL-UL interface
    .tl_i         (tl_d_i),
    .tl_o         (tl_d_o),

    // control interface
    .en_ifetch_i  (prim_mubi_pkg::MuBi4False),

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
    else if (adapter2mem_we) begin
        mem2adapter_rvalid <= 1'b0;
    end
    else begin
        mem2adapter_rvalid <= adapter2mem_req;
    end
end

endmodule