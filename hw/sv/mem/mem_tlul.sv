module mem_tlul (
  input clk_i,
  input rst_ni,

  // TL-UL interface
  input  tlul_pkg::tl_h2d_t tl_d_i,
  output tlul_pkg::tl_d2h_t tl_d_o
);

logic        we;
logic        req;
logic [11:0] addr;
logic [31:0] wdata;
logic [31:0] wmask;
logic [31:0] rdata;
logic        rvalid;
logic        rvalid_buf; 
logic [31:0] we_inv;
logic [3:0]  data_we;
logic [31:0] data_buffer;

always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        rvalid      <= 'b0;
        rvalid_buf  <= 'b0;
        data_buffer <= 'b0;
    end else if (we) begin
        rvalid      <= 'b0;
        rvalid_buf  <= 'b0;
        data_buffer <= rdata;
    end else begin 
        rvalid_buf  <= req;
        rvalid      <= rvalid_buf;
        data_buffer <= rdata;
    end
end 
    
fake_dram u_fake_dram (
    .CLK    (clk_i  ),
    .EN     (req    ),   // chip enable
    .WEN    (wen    ),   // write enable
    .WMASK  (wmask  ),   // write mask
    .D      (wdata  ),   // write data
    .Q      (rdata  ),   // read data
    .A      (addr   )    // address
);

  
tlul_sram_adapter #(
    .SramAw       (12),
    .SramDw       (16), 
    .Outstanding  (4),  
    .ByteAccess   (1),
    .ErrOnWrite   (0),
    .ErrOnRead    (0) 

) u_tlul_sram_adapter (
    .clk_i    (clk_i       ),
    .rst_ni   (rst_ni      ),
    .tl_i     (tl_d_i      ),
    .tl_o     (tl_d_o      ), 
    .req_o    (req         ),
    .gnt_i    (1'b1        ),
    .we_o     (we          ),
    .addr_o   (addr        ),
    .wdata_o  (wdata       ),
    .wmask_o  (wmask       ),
    .rdata_i  (data_buffer ),
    .rvalid_i (rvalid      ),
    .rerror_i (2'b0        )
);

endmodule