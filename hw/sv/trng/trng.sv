module trng (
    clk,
    sel,
    clk_ro,
    dout
);

input clk;
input [31:0][2:0] sel;
output clk_ro;
output [23:0] dout;

ro u_ro (.sel(sel), .start(clk), .clk_ro(clk_ro));
counter u_counter (.clk(clk), .clk_ro(clk_ro), .dout(dout));

endmodule