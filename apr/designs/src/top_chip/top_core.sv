module top_core (
    VDD,
    VSS,
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

inout VDD;
inout VSS;
input clk_i;
input en_ifetch_i;
input fetch_enable_i;
input rst_ni;
input spi_cs;
input spi_sclk;
input spi_sdi0;
input spi_sdi1;
input spi_sdi2;
input spi_sdi3;
output spi_sdo0;
output spi_sdo1;
output spi_sdo2;
output spi_sdo3;
output [31:0] gpio_o;
output [1:0] spi_mode;

endmodule