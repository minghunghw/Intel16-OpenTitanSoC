`timescale  1ns/1ns
module tb_master_slave();

    reg                         clk         ;
    reg                         rst_n       ;
    reg     [511:0]   data_i                ;
    reg                         start       ;
    reg                         miso        ;

    wire                        mosi        ;
    wire                        sclk        ;
    wire                        finish      ;
    wire                        ss_n        ;
    wire    [511:0]   data_o                ;
    wire                        r_finish    ;
    wire                        tx_finish   ;

SPI_MASTER#(
    .DATA_WIDTH ( 512 ),
    .CLK_FREQ   ( 50_000_000 ),
    .SCLK_FREQ ( 5_000_000 )
)u_SPI_MASTER(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .miso       ( miso       ),
    .data_i     ( data_i     ),
    .start      ( start      ),
    .mosi       ( mosi       ),
    .sclk       ( sclk       ),
    .ss_n       ( ss_n       ),
    .finish     ( finish     )
);


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


    initial begin
         clk = 1'b0;
         rst_n = 1'b0;
         start = 1'b0;
         data_i = 512'h35;
         miso = 1'b0;
         #30
         rst_n = 1'b1;
         #10;
         @(posedge clk);
         start <= 1'b1;
         @(posedge clk);
         start <= 1'b0;
         @(negedge finish);
         data_i = 512'h44;
         repeat(2) @(posedge clk);
         start = 1'b1;
         @(posedge clk);
         start = 1'b0;
         @(negedge finish);
         #100 $finish; // after the second data has been transfered the tb will be finished.
    end

    always #(10) clk = ~clk;

endmodule

