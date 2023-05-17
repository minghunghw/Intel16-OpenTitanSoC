module map_top (
    input        clk                  ,
    input        rst_n                ,
    input        valid                ,
    input [1:0]  address              ,
    input [15:0] data                 ,
    output logic [2:0] sel [31:0]     ,
    output [15:0]noise_sel            ,
    output pllMap_pkg::pllmap2pll pllcontrol
);

    logic pll_valid            ,
    logic pll_enable           ,
    logic [1:0]pll_ratiosel    ,
    logic [9:0]pll_ratio       ,
    logic [1:0]pll_vcodiv_ratio,
    logic trng_valid           ,
    logic [2:0]trng_sel1       ,
    logic [2:0]trng_sel2       ,
    logic [3:0]trng_sel1adress ,
    logic [3:0]trng_sel2adress ,
    logic noise_valid          ,
    logic [15:0]noise_data   

hit_core u_hit_core(
    .clk                    ( clk              ),
    .rst_n                  ( rst_n            ),
    .valid                  ( valid            ),
    .address                ( address          ),
    .data                   ( data             ),
    .pll_valid              ( pll_valid        ),
    .pll_enable             ( pll_enable       ),
    .pll_ratiosel           ( pll_ratiosel     ),
    .pll_ratio              ( pll_ratio        ),
    .pll_vcodiv_ratio       ( pll_vcodiv_ratio ),
    .trng_valid             ( trng_valid       ),
    .trng_sel1              ( trng_sel1        ),
    .trng_sel2              ( trng_sel2        ),
    .trng_sel1adress        ( trng_sel1adress  ),
    .trng_sel2adress        ( trng_sel2adress  ),
    .noise_valid            ( noise_valid      ),
    .noise_data             ( noise_data       )
);

pll_mapcore u_pll_mapcore(
    .valid            ( pll_valid        ),
    .clk              ( clk              ),
    .rst_n            ( rst_n            ),
    .pll_enable       ( pll_enable       ),
    .pll_ratiosel     ( pll_ratiosel     ),
    .pll_ratio        ( pll_ratio        ),
    .pll_vcodiv_ratio ( pll_vcodiv_ratio ),
    .pllcontrol       ( pllcontrol       )
);


noise_mapcore u_noise_mapcore(
    .valid            ( noise_valid      ),
    .clk              ( clk              ),
    .rst_n            ( rst_n            ),
    .noise_data       ( noise_data       ),
    .noise_sel        ( noise_sel        )
);


trng_mapcore u_trng_mapcore(
    .valid            ( trng_valid       ),
    .clk              ( clk              ),
    .rst_n            ( rst_n            ),
    .trng_sel1        ( trng_sel1        ),
    .trng_sel2        ( trng_sel2        ),
    .trng_sel1adress  ( trng_sel1adress  ),
    .trng_sel2adress  ( trng_sel2adress  ),
    .sel              ( sel              )
);

endmodule