module top_chip (
    input  wire        clk_i_PAD,
    input  wire        rst_ni_PAD,
    input  wire        fetch_enable_i_PAD,
    input  wire        en_ifetch_i_PAD,
    input  wire        spi_sclk_PAD,
    input  wire        spi_cs_PAD,
    output wire [1:0]  spi_mode_PAD,
    input  wire        spi_sdi0_PAD,
    input  wire        spi_sdi1_PAD,
    input  wire        spi_sdi2_PAD,
    input  wire        spi_sdi3_PAD,
    output wire        spi_sdo0_PAD,
    output wire        spi_sdo1_PAD,
    output wire        spi_sdo2_PAD,
    output wire        spi_sdo3_PAD,
    output wire [31:0] gpio_o_PAD
);

    wire        clk_i;
    wire        rst_ni;
    wire        fetch_enable_i;
    wire        en_ifetch_i;
    wire        spi_sclk;
    wire        spi_cs;
    wire [1:0]  spi_mode;
    wire        spi_sdi0;
    wire        spi_sdi1;
    wire        spi_sdi2;
    wire        spi_sdi3;
    wire        spi_sdo0;
    wire        spi_sdo1;
    wire        spi_sdo2;
    wire        spi_sdo3;
    wire [31:0] gpio_o;

    top_core u_top_core (
        .*
    );

    padring u_padring (
        .*
    );

endmodule