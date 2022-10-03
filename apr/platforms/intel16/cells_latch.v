module $_DLATCH_P_(input E, input D, output Q);
    b15lsn000hn1n02x5 _TECHMAP_REPLACE_ (
        .d(D),
        .clk(E),
        .o(Q)
        );
endmodule

module $_DLATCH_N_(input E, input D, output Q);
    b15lsn080hn1n02x5 _TECHMAP_REPLACE_ (
        .d(D),
        .clkb(E),
        .o(Q)
        );
endmodule