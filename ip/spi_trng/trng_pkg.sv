package trngMap_pkg;

module trng (
    clk,
    sel,
    dout
);

input clk;
input [31:0][2:0] sel;
output [23:0] dout;

logic clk_ro;

ro u_ro (.sel(sel), .start(clk), .clk_ro(clk_ro));
counter u_counter (.clk(clk), .clk_ro(clk_ro), .dout(dout));

endmodule

   typedef struct packed {
    logic [31:0][2:0] sel;
   } trngmappkg;






    
endpackage
