module mux_2to1 (
    a,
    b,
    sel,
    o
);

input a;
input b;
input sel;
output o;

b0mmbn022an1n02x5 u_mux (.a(a), .b(b), .sa(sel), .o(o));

endmodule

module mux_4to1 (
    input a,
    input b,
    input c,
    input d,
    input [1:0] sel,
    output o
);

    wire w1, w2;

    mux_2to1 m1 (.a(a), .b(b), .sel(sel[0]), .o(w1));
    mux_2to1 m2 (.a(c), .b(d), .sel(sel[0]), .o(w2));
    mux_2to1 m3 (.a(w1), .b(w2), .sel(sel[1]), .o(o));

endmodule

module mux_8to1 (
    input a,
    input b,
    input c,
    input d,
    input e,
    input f,
    input g,
    input h,
    input [2:0] sel,
    output o
);

    wire w1, w2;

    mux_4to1 m1 (.a(a), .b(b), .c(c), .d(d), .sel(sel[1:0]), .o(w1));
    mux_4to1 m2 (.a(e), .b(f), .c(g), .d(h), .sel(sel[1:0]), .o(w2));
    mux_2to1 m3 (.a(w1), .b(w2), .sel(sel[2]), .o(o));

endmodule