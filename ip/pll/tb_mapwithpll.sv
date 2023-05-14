`timescale  1ns/1ns
module tb_pllmaptop();

    reg                         clk         ;
    reg                         rst_n       ;
    reg     [511:0]   data_i                ;
    reg                         start       ;
    reg                         miso        ;
    reg [9:0]ratio;


    wire                        mosi        ;
    wire                        sclk        ;
    wire                        finish      ;
    wire                        ss_n        ;
    wire    [511:0]   data_o                ;
    wire                        r_finish    ;
    logic lock                              ;   
    logic clkpll                            ;   
    logic clkpll0                           ;   
    logic clkpll1                           ;   
    logic [1:0]view_dig_out                 ;       
    logic [2:0]odfx_fscan_sdo               ;        
    logic [1:0]viewanabus                   ;        
    logic idvdisable_bo                     ;   
    logic idvfreqao                         ;   
    logic idvfreqbo                         ;   
    logic idvpulseo                         ;   
    logic idvtclko                          ;   
    logic idvtctrlo                         ;   
    logic idvtdo                            ;   
    logic idvtreso                          ;   
    logic tdo                               ;
    
    pllMap_pkg::pllmap2pll pllcontrol;

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


pllmap_top u_pllmap_top(
    .clk                  ( clk                  ),
    .rst_n                ( rst_n                ),
    .mosi                 ( mosi                 ),
    .sclk                 ( sclk                 ),
    .tx_finish            ( tx_finish            ),
    .start                ( start                ),
    .ss_n                 ( ss_n                 ),
    .lock                 ( lock           ),
    .clkpll               ( clkpll         ),
    .clkpll0              ( clkpll0        ),
    .clkpll1              ( clkpll1        ),
    .view_dig_out         ( view_dig_out   ),
    .odfx_fscan_sdo       ( odfx_fscan_sdo ),
    .viewanabus           ( viewanabus     ),
    .idvdisable_bo        ( idvdisable_bo  ),
    .idvfreqao            ( idvfreqao      ),
    .idvfreqbo            ( idvfreqbo      ),
    .idvpulseo            ( idvpulseo      ),
    .idvtclko             ( idvtclko       ),
    .idvtctrlo            ( idvtctrlo      ),
    .idvtdo               ( idvtdo         ),
    .idvtreso             ( idvtreso       ),
    .tdo                  ( tdo            )
);

 





    initial begin
         clk = 1'b0;
         rst_n = 1'b1;
         start = 1'b0;
         ratio = 10'd6;
         miso = 1'b0;
         @(negedge clk) 
         rst_n = 1'b0;
         @(negedge clk) 
         rst_n = 1'b1;
         @(posedge clk);
         start <= 1'b1;
         @(posedge clk);
         start <= 1'b0;
         @(negedge finish);
         ratio = 10'd11;
         datachange(0,1,0,ratio,data_i);
         repeat(2) @(posedge clk);
         start = 1'b1;
         @(posedge clk);
         start = 1'b0;
    end

    always #(26041) clk = ~clk;
    task automatic datachange;
    input read;
    input write;
    input pllen;
    input [9:0]ratio;
    output [511:0]data;
    data = 0;
    data[0] = read;
    data[1] = write;
    data[2] = pllen;
    data[12:3] = ratio;

        
    endtask //automatic

endmodule


