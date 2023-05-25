module xbar (
    output        clk_i,
    output        rst_ni,
    output        fetch_enable_i,
    output        en_ifetch_i,
    output        spi_sclk,
    output        spi_cs,
    input   [1:0] spi_mode,
    output        spi_sdi0,
    output        spi_sdi1,
    output        spi_sdi2,
    output        spi_sdi3,
    input         spi_sdo0,
    input         spi_sdo1,
    input         spi_sdo2,
    input         spi_sdo3,
    input  [31:0] gpio_o,

    output [47:0] dq,
    output [47:0] drv0,
    output [47:0] drv1,
    output [47:0] drv2,
    output [47:0] enabq,
    output [47:0] enq,
    input  [47:0] outi,
    output [47:0] pd,
    output [47:0] ppen,
    output [47:0] prg_slew,
    output [47:0] puq,
    output [47:0] pwrup_pull_en,
    output [47:0] pwrupzhl
);

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
    

    `PAD_IN(clk_i, 0)
    `PAD_IN(rst_ni, 1)
    `PAD_IN(fetch_enable_i, 2)
    `PAD_IN(en_ifetch_i, 3)
    `PAD_IN(spi_sclk, 4)
    `PAD_IN(spi_cs, 5)
    `PAD_OUT(spi_mode[0], 6)
    `PAD_OUT(spi_mode[1], 7)
    `PAD_IN(spi_sdi0, 8)
    `PAD_IN(spi_sdi1, 9)
    `PAD_IN(spi_sdi2, 10)
    `PAD_IN(spi_sdi3, 11)
    `PAD_OUT(spi_sdo0, 12)
    `PAD_OUT(spi_sdo1, 13)
    `PAD_OUT(spi_sdo2, 14)
    `PAD_OUT(spi_sdo3, 15)
    `PAD_OUT(gpio_o[0], 16)
    `PAD_OUT(gpio_o[1], 17)
    `PAD_OUT(gpio_o[2], 18)
    `PAD_OUT(gpio_o[3], 19)
    `PAD_OUT(gpio_o[4], 20)
    `PAD_OUT(gpio_o[5], 21)
    `PAD_OUT(gpio_o[6], 22)
    `PAD_OUT(gpio_o[7], 23)
    `PAD_OUT(gpio_o[8], 24)
    `PAD_OUT(gpio_o[9], 25)
    `PAD_OUT(gpio_o[10], 26)
    `PAD_OUT(gpio_o[11], 27)
    `PAD_OUT(gpio_o[12], 28)
    `PAD_OUT(gpio_o[13], 29)
    `PAD_OUT(gpio_o[14], 30)
    `PAD_OUT(gpio_o[15], 31)
    `PAD_OUT(gpio_o[16], 32)
    `PAD_OUT(gpio_o[17], 33)
    `PAD_OUT(gpio_o[18], 34)
    `PAD_OUT(gpio_o[19], 35)
    `PAD_OUT(gpio_o[20], 36)
    `PAD_OUT(gpio_o[21], 37)
    `PAD_OUT(gpio_o[22], 38)
    `PAD_OUT(gpio_o[23], 39)
    `PAD_OUT(gpio_o[24], 40)
    `PAD_OUT(gpio_o[25], 41)
    `PAD_OUT(gpio_o[26], 42)
    `PAD_OUT(gpio_o[27], 43)
    `PAD_OUT(gpio_o[28], 44)
    `PAD_OUT(gpio_o[29], 45)
    `PAD_OUT(gpio_o[30], 46)
    `PAD_OUT(gpio_o[31], 47)

endmodule