module xbar (
    // gpio
    dq,
    drv0,
    drv1,
    drv2,
    enabq,
    enq,
    outi,
    pd,
    ppen,
    prg_slew,
    puq,
    pwrup_pull_en,
    pwrupzhl,

    // top_core
    clk_i,
    en_ifetch_i,
    fetch_enable_i,
    rst_ni,
    spi_cs,
    spi_sclk,
    spi_sdi0,
    spi_sdi1,
    spi_sdi2,
    spi_sdi3,
    spi_sdo0,
    spi_sdo1,
    spi_sdo2,
    spi_sdo3,
    gpio_o,
    spi_mode
);

output [71:40]  dq;
output [ 8: 5]  drv0;
output [ 8: 5]  drv1;
output [ 8: 5]  drv2;
output [71:40]  enabq;
output [71:40]  enq;
input  [71:40]  outi;
output [ 8: 5]  pd;
output [ 8: 5]  ppen;
output [ 8: 5]  prg_slew;
output [ 8: 5]  puq;
output [ 8: 5]  pwrup_pull_en;
output [ 8: 5]  pwrupzhl;

output          clk_i;
output          en_ifetch_i;
output          fetch_enable_i;
output          rst_ni;
output          spi_cs;
output          spi_sclk;
output          spi_sdi0;
output          spi_sdi1;
output          spi_sdi2;
output          spi_sdi3;
input           spi_sdo0;
input           spi_sdo1;
input           spi_sdo2;
input           spi_sdo3;
input  [31: 0]  gpio_o;
input  [ 1: 0]  spi_mode;

// 8:6 output, 5 input
// 71:50 output, 49:40 input

// output connection
assign dq[71:40]            = ~{gpio_o[15:0], spi_mode[1:0], spi_sdo3, spi_sdo2, spi_sdo1, spi_sdo0, 10'h3ff};
assign drv0[8:5]            = 4'h0;
assign drv1[8:5]            = 4'h0;
assign drv2[8:5]            = 4'h0;
assign enabq[71:40]         = 32'hffff_fc00;
assign enq[71:40]           = 32'h0000_03ff;
assign pd[8:5]              = 4'h0;
assign ppen[8:5]            = 4'b1110;
assign prg_slew[8:5]        = 4'h0;
assign puq[8:5]             = 4'hf;
assign pwrup_pull_en[8:5]   = 4'h0;
assign pwrupzhl[8:5]        = 4'h0;

// input connection
assign clk_i                = outi[40];
assign en_ifetch_i          = outi[41];
assign fetch_enable_i       = outi[42];
assign rst_ni               = outi[43];
assign spi_cs               = outi[44];
assign spi_sclk             = outi[45];
assign spi_sdi0             = outi[46];
assign spi_sdi1             = outi[47];
assign spi_sdi2             = outi[48];
assign spi_sdi3             = outi[49];

endmodule