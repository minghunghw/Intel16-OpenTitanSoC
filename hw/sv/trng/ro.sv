module ro (
    sel, 
    start, 
    clk_ro
);

input [31:0][2:0] sel;
input start;
output clk_ro;

logic start0, start1;
logic [31:0] out;
genvar i;

assign start0 = ~(start & clk_ro);
assign start1 = ~(start & out[15]);

stage stage0 (.sel(sel[0]), .in(start0), .out(out[0]));
generate
    for (i=0; i<15; i++) begin
        stage u_stage(.sel(sel[i+1]), .in(out[i]), .out(out[i+1]));
    end
endgenerate

stage stage16 (.sel(sel[16]), .in(start1), .out(out[16]));
generate
    for (i=16; i<30; i++) begin
        stage u_stage(.sel(sel[i+1]), .in(out[i]), .out(out[i+1]));
    end
endgenerate
stage stage31 (.sel(sel[31]), .in(out[30]), .out(clk_ro));

endmodule