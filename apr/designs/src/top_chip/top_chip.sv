module top_chip (
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

input  clk_i;
input  en_ifetch_i;
input  fetch_enable_i;
input  rst_ni;
input  spi_cs;
input  spi_sclk;
input  spi_sdi0;
input  spi_sdi1;
input  spi_sdi2;
input  spi_sdi3;
output spi_sdo0;
output spi_sdo1;
output spi_sdo2;
output spi_sdo3;
output [15:0] gpio_o;
output [ 1:0] spi_mode;

wire [15:0] float_gpio;

wire VDD;
wire VSS;

wire [31:0] dq;
wire [ 3:0] enabq;
wire [ 3:0] enq;
wire [31:0] outi;
wire [ 3:0] ppen;
wire [23:0] float_outi;

// 3:1 output, 0 input
assign dq       = {gpio_o, spi_mode, spi_sdo3, spi_sdo2, spi_sdo1, spi_sdo0, 11'h7ff};
assign enabq    = 4'b1110;
assign enq      = 4'b0001;
assign outi     = {float_outi, clk_i, en_ifetch_i, fetch_enable_i, rst_ni, spi_cs, spi_sclk, spi_sdi0, spi_sdi1};
assign ppen     = 4'b1110;

top_core u_top_core (
    .VDD            (VDD                  ),
    .VSS            (VSS                  ),
    .clk_i          (clk_i                ),
    .en_ifetch_i    (en_ifetch_i          ),
    .fetch_enable_i (fetch_enable_i       ),
    .rst_ni         (rst_ni               ),
    .spi_cs         (spi_cs               ),
    .spi_sclk       (spi_sclk             ),
    .spi_sdi0       (spi_sdi0             ),
    .spi_sdi1       (spi_sdi1             ),
    .spi_sdi2       (spi_sdi2             ),
    .spi_sdi3       (spi_sdi3             ),
    .spi_sdo0       (spi_sdo0             ),
    .spi_sdo1       (spi_sdo1             ),
    .spi_sdo2       (spi_sdo2             ),
    .spi_sdo3       (spi_sdo3             ),
    .gpio_o         ({float_gpio, gpio_o} ),
    .spi_mode       (spi_mode             )
);

uni_2x2sub4x4_gpio_top_lef_LEFT_SIDE u_uni_2x2sub4x4_gpio_top_lef_LEFT_SIDE (
    .vdd            (VDD   ),
    .vss            (VSS   ),
    .dq             (~dq   ),
    .drv0           (4'b0  ),
    .drv1           (4'b0  ),
    .drv2           (4'b0  ),
    .enabq          (enabq ),
    .enq            (enq   ),
    .outi           (outi  ),      
    .pd             (4'b0  ),
    .ppen           (ppen  ),
    .prg_slew       (4'b0  ),
    .puq            (4'hf  ),
    .pwrup_pull_en  (4'b0  ),
    .pwrupzhl       (4'b0  )
);

endmodule