module ro (
    sel, 
    start, 
    clk_ro
);

input [31:0][2:0] sel;
input start;
output clk_ro;

logic start0, start1;
logic [30:0] out;

b0mnand02an1n08x5 nand0 (.a(start), .b(clk_ro), .o1(start0));
b0mnand02an1n08x5 nand1 (.a(start), .b(out[15]), .o1(start1));

stage u_stage0 (.sel(sel[0]), .in(start0), .out(out[0]));
stage u_stage1 (.sel(sel[1]), .in(out[0]), .out(out[1]));
stage u_stage2 (.sel(sel[2]), .in(out[1]), .out(out[2]));
stage u_stage3 (.sel(sel[3]), .in(out[2]), .out(out[3]));
stage u_stage4 (.sel(sel[4]), .in(out[3]), .out(out[4]));
stage u_stage5 (.sel(sel[5]), .in(out[4]), .out(out[5]));
stage u_stage6 (.sel(sel[6]), .in(out[5]), .out(out[6]));
stage u_stage7 (.sel(sel[7]), .in(out[6]), .out(out[7]));
stage u_stage8 (.sel(sel[8]), .in(out[7]), .out(out[8]));
stage u_stage9 (.sel(sel[9]), .in(out[8]), .out(out[9]));
stage u_stage10 (.sel(sel[10]), .in(out[9]), .out(out[10]));
stage u_stage11 (.sel(sel[11]), .in(out[10]), .out(out[11]));
stage u_stage12 (.sel(sel[12]), .in(out[11]), .out(out[12]));
stage u_stage13 (.sel(sel[13]), .in(out[12]), .out(out[13]));
stage u_stage14 (.sel(sel[14]), .in(out[13]), .out(out[14]));
stage u_stage15 (.sel(sel[15]), .in(out[14]), .out(out[15]));

stage u_stage16 (.sel(sel[16]), .in(start1), .out(out[16]));
stage u_stage17 (.sel(sel[17]), .in(out[16]), .out(out[17]));
stage u_stage18 (.sel(sel[18]), .in(out[17]), .out(out[18]));
stage u_stage19 (.sel(sel[19]), .in(out[18]), .out(out[19]));
stage u_stage20 (.sel(sel[20]), .in(out[19]), .out(out[20]));
stage u_stage21 (.sel(sel[21]), .in(out[20]), .out(out[21]));
stage u_stage22 (.sel(sel[22]), .in(out[21]), .out(out[22]));
stage u_stage23 (.sel(sel[23]), .in(out[22]), .out(out[23]));
stage u_stage24 (.sel(sel[24]), .in(out[23]), .out(out[24]));
stage u_stage25 (.sel(sel[25]), .in(out[24]), .out(out[25]));
stage u_stage26 (.sel(sel[26]), .in(out[25]), .out(out[26]));
stage u_stage27 (.sel(sel[27]), .in(out[26]), .out(out[27]));
stage u_stage28 (.sel(sel[28]), .in(out[27]), .out(out[28]));
stage u_stage29 (.sel(sel[29]), .in(out[28]), .out(out[29]));
stage u_stage30 (.sel(sel[30]), .in(out[29]), .out(out[30]));
stage u_stage31 (.sel(sel[31]), .in(out[30]), .out(clk_ro));

endmodule