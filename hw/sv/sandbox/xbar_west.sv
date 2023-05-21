module xbar_west (
    output        clk,
    output        rst_n,
    output        valid,
    output [4:0]  addr,
    output [9:0]  data,
    output        clktrng,
    input         clkro,
    output        clkref,
    input         lock,
    input         clkpll,
    input         clkpll0,
    input         clkpll1,
    output        clknoise,
    output [3:0]  VB,
    input         Iout,  

    output [31:0] dq,
    output [31:0] drv0,
    output [31:0] drv1,
    output [31:0] drv2,
    output [31:0] enabq,
    output [31:0] enq,
    input  [31:0] outi,
    output [31:0] pd,
    output [31:0] ppen,
    output [31:0] prg_slew,
    output [31:0] puq,
    output [31:0] pwrup_pull_en,
    output [31:0] pwrupzhl
);

    logic unused_pad;

    `define PAD_IN(to_chip, id)                     \
        assign dq[id]               = 1'b0;         \
        assign drv0[id]             = 1'b0;         \
        assign drv1[id]             = 1'b0;         \
        assign drv2[id]             = 1'b0;         \
        assign enabq[id]            = 1'b0;         \
        assign enq[id]              = 1'b1;         \
        assign pd[id]               = 1'b0;         \
        assign ppen[id]             = 1'b0;         \
        assign prg_slew[id]         = 1'b0;         \
        assign puq[id]              = 1'b1;         \
        assign pwrup_pull_en[id]    = 1'b0;         \
        assign pwrupzhl[id]         = 1'b0;         \
        assign to_chip              = outi[id];

    `define PAD_OUT(from_chip, id)                  \
        assign dq[id]               = ~from_chip;   \
        assign drv0[id]             = 1'b0;         \
        assign drv1[id]             = 1'b0;         \
        assign drv2[id]             = 1'b0;         \
        assign enabq[id]            = 1'b1;         \
        assign enq[id]              = 1'b0;         \
        assign pd[id]               = 1'b0;         \
        assign ppen[id]             = 1'b1;         \
        assign prg_slew[id]         = 1'b0;         \
        assign puq[id]              = 1'b1;         \
        assign pwrup_pull_en[id]    = 1'b0;         \
        assign pwrupzhl[id]         = 1'b0;
    

    `PAD_IN(clk, 0)
    `PAD_IN(rst_n, 1)
    `PAD_IN(valid, 2)
    `PAD_IN(addr[0], 3)
    `PAD_IN(addr[1], 4)
    `PAD_IN(addr[2], 5)
    `PAD_IN(addr[3], 6)
    `PAD_IN(addr[4], 7)
    `PAD_IN(data[0], 8)
    `PAD_IN(data[1], 9)
    `PAD_IN(data[2], 10)
    `PAD_IN(data[3], 11)
    `PAD_IN(data[4], 12)
    `PAD_IN(data[5], 13)
    `PAD_IN(data[6], 14)
    `PAD_IN(data[7], 15)
    `PAD_IN(data[8], 16)
    `PAD_IN(data[9], 17)
    `PAD_IN(clktrng, 18)
    `PAD_OUT(clkro, 19)
    `PAD_IN(clkref, 20)
    `PAD_OUT(lock, 21)
    `PAD_OUT(clkpll, 22)
    `PAD_OUT(clkpll0, 23)
    `PAD_OUT(clkpll1, 24)
    `PAD_IN(clknoise, 25)
    `PAD_IN(VB[0], 26)
    `PAD_IN(VB[1], 27)
    `PAD_IN(VB[2], 28)
    `PAD_IN(VB[3], 29)
    `PAD_OUT(Iout, 30)
    `PAD_IN(unused_pad, 31)

endmodule