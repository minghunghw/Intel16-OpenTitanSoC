module stage (
	sel,
	in,
	out
);

input [2:0] sel;
input in;
output out;

logic out, out0, out1, out2, out3, out4, out5, out6, out7;

b0minv000an1n02x5 inv0 (.a(in), .o1(out0));
b0minv000an1n03x5 inv1 (.a(in), .o1(out1));
b0minv000an1n04x5 inv2 (.a(in), .o1(out2));
b0minv000an1n06x5 inv3 (.a(in), .o1(out3));
b0minv000an1n08x5 inv4 (.a(in), .o1(out4));
b0minv000an1n12x5 inv5 (.a(in), .o1(out5));
b0minv000an1n16x5 inv6 (.a(in), .o1(out6));
b0minv000an1n20x5 inv7 (.a(in), .o1(out7));

always @(sel) begin
	case (sel)
	   3'h0: out = out0;
	   3'h1: out = out1;
	   3'h2: out = out2;
	   3'h3: out = out3;
	   3'h4: out = out4;
	   3'h5: out = out5;
	   3'h6: out = out6;
	   3'h7: out = out7;
	endcase
end

endmodule