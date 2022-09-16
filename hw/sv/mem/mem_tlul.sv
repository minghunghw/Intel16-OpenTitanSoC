module mem_tlul (
  input clk_i,
  input rst_ni,

  // TL-UL interface
  input  tlul_pkg::tl_h2d_t tl_d_i,
  output tlul_pkg::tl_d2h_t tl_d_o
);

logic                       we;
logic                       req;
logic   [10:0]              addr;
logic   [31:0]              wdata;
logic                       wen;
logic   [31:0]              wmask;
logic   [31:0]              rdata;
logic                       rvalid;
logic   [31:0]              rdata_buffer;
prim_mubi_pkg::mubi4_t      en_ifetch;
prim_mubi_pkg::mubi4_t      req_type;
logic                       intg_error;

assign en_ifetch = prim_mubi_pkg::MuBi4False;

always_ff @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
        rvalid          <= 'b0;
        rdata_buffer    <= 'b0;
    end else begin 
        rvalid          <= req && ~wen;
        rdata_buffer    <= rdata;
    end
end 
    
fake_dram u_fake_dram (
    .CLK    (clk_i  ),
    .EN     (~req   ),   // chip enable
    .WEN    (~wen   ),   // write enable
    .WMASK  (wmask  ),   // write mask
    .D      (wdata  ),   // write data
    .Q      (rdata  ),   // read data
    .A      (addr   )    // address
);
  
tlul_adapter_sram #(
    .SramAw             (11),
    .SramDw             (32), 
    .Outstanding        (1),  
    .ByteAccess         (1),
    .ErrOnWrite         (0),
    .ErrOnRead          (0),
    .CmdIntgCheck       (0),  
    .EnableRspIntgGen   (0),  
    .EnableDataIntgGen  (0),  
    .EnableDataIntgPt   (0),
    .SecFifoPtr         (0)

) u_tlul_adapter_sram (
    .clk_i          (clk_i       ),
    .rst_ni         (rst_ni      ),
    .tl_i           (tl_d_i      ),
    .tl_o           (tl_d_o      ), 
    .en_ifetch_i    (en_ifetch   ),
    .req_o          (req         ),
    .req_type_o     (req_type    ),
    .gnt_i          (1'b1        ),
    .we_o           (wen         ),
    .addr_o         (addr        ),
    .wdata_o        (wdata       ),
    .wmask_o        (wmask       ),
    .intg_error_o   (intg_error  ),
    .rdata_i        (rdata_buffer),
    .rvalid_i       (rvalid      ),
    .rerror_i       (2'b0        )
);

endmodule