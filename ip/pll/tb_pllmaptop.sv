module tb_pllmaptop();

    reg                         clk         ;
    reg                         rst_n       ;
    reg     [511:0]             data_i      ;
    reg                         start       ;
    reg                         miso        ;
    reg     [9:0]               ratio;

    wire                        mosi        ;
    wire                        sclk        ;
    wire                        finish      ;
    wire                        ss_n        ;
    wire    [511:0]             data_o      ;
    wire                        r_finish    ;


    pllMap_pkg::pllmap2pll pllcontrol;

<<<<<<< HEAD
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
    .clk       ( clk       ),
    .rst_n     ( rst_n     ),
    .mosi      ( mosi      ),
    .sclk      ( sclk      ),
    .tx_finish ( finish ),
    .start     ( start     ),
    .ss_n      ( ss_n      ),
    .pllcontrol  ( pllcontrol  )
);

 




    initial begin
         clk = 1'b0;
         rst_n = 1'b0;
         start = 1'b0;
         ratio = 10'd6;
         datachange(0,1,1,ratio,data_i);
         miso = 1'b0;
         #30
         rst_n = 1'b1;
         #10;
         @(posedge clk);
         start <= 1'b1;
         @(posedge clk);
         start <= 1'b0;
         @(negedge finish);
         ratio = 10'hC7;
         datachange(0,1,0,ratio,data_i);
         repeat(2) @(posedge clk);
         start = 1'b1;
         @(posedge clk);
         start = 1'b0;
         #1000000 $finish;
=======
    SPI_MASTER #(
        .DATA_WIDTH ( 512        ),
        .CLK_FREQ   ( 50_000_000 ),
        .SCLK_FREQ  ( 5_000_000  )
    ) u_SPI_MASTER(
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
        .clk        ( clk           ),
        .rst_n      ( rst_n         ),
        .mosi       ( mosi          ),
        .sclk       ( sclk          ),
        .tx_finish  ( tx_finish     ),
        .start      ( start         ),
        .ss_n       ( ss_n          ),
        .pllcontrol ( pllcontrol    )
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        start = 1'b0;
        ratio = 10'd6;
        datachange(0,1,1,ratio,data_i);
        miso = 1'b0;
        #30
        rst_n = 1'b1;
        #10;
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
        #1000000 $finish;
>>>>>>> 93cc18e4886adea73e7b9247b4c0912b6e9382e1
    end

    always #(10) clk = ~clk;
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


