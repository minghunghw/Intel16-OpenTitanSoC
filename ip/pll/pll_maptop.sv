module pllmap_top(
    input clk,
    input rst_n,
    input mosi,
    input sclk,
    input tx_finish,
    input start,
    input ss_n,
    output pllMap_pkg::pllmap2pll pllcontrol
);

wire r_finish;
wire [511:0]data_o;
pllMap_pkg::pllmap2pll pllmap_i;
assign pllmap_i = data_o;


SPI_SLAVE#(
    .DATA_WIDTH ( 512 )
)u_SPI_SLAVE(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .mosi       ( mosi       ),
    .sclk       ( sclk       ),
    .tx_finish  ( tx_finish  ),
    .start      ( start      ),
    .ss_n       ( ss_n       ),
    .data_o     ( data_o     ),
    .r_finish   ( r_finish   )
);

pll_mapcore u_pll_mapcore(
    .valid                              ( r_finish                        ),
    .clk                                ( clk                             ),
    .rst_n                              ( rst_n                           ),
    .pllmap_i                           ( pllmap_i                        ),
    .pllcontrol                         ( pllcontrol                      )
);
endmodule