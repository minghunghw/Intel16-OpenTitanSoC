module top_core (
    input  logic   clk_i,
    input  logic   rst_ni,

    input  ibex_pkg::fetch_enable_t fetch_enable_i,
    input  prim_mubi_pkg::mubi4_t   en_ifetch_i,

    // SPI device interface
    input  logic                    spi_sclk,
    input  logic                    spi_cs,
    input  logic                    spi_sdi0,
    input  logic                    spi_sdi1,
    input  logic                    spi_sdi2,
    input  logic                    spi_sdi3,
    output logic                    spi_sdo0,
    output logic                    spi_sdo1,
    output logic                    spi_sdo2,
    output logic                    spi_sdo3
);

    logic  [1:0] spi_mode;

    tlul_pkg::tl_d2h_t core_2_xbar_main;
    tlul_pkg::tl_h2d_t xbar_main_2_core;
    tlul_pkg::tl_d2h_t spi_2_xbar_main;
    tlul_pkg::tl_h2d_t xbar_main_2_spi;
    tlul_pkg::tl_d2h_t jtag_2_xbar_main;
    tlul_pkg::tl_h2d_t xbar_main_2_jtag;

    tlul_pkg::tl_h2d_t xbar_main_2_instr;
    tlul_pkg::tl_d2h_t instr_2_xbar_main;
    tlul_pkg::tl_h2d_t xbar_main_2_data;
    tlul_pkg::tl_d2h_t data_2_xbar_main;
    tlul_pkg::tl_h2d_t xbar_main_2_peri_device;
    tlul_pkg::tl_d2h_t peri_device_2_xbar_main;

    xbar_main u_xbar_main 
    (
        .clk_i              (clk_i                    ),
        .rst_ni             (rst_ni                   ),

        .tl_core_i          (core_2_xbar_main         ),
        .tl_core_o          (xbar_main_2_core         ),
        .tl_spi_i           (spi_2_xbar_main          ),
        .tl_spi_o           (xbar_main_2_spi          ),
        .tl_jtag_i          (jtag_2_xbar_main         ),
        .tl_jtag_o          (xbar_main_2_jtag         ),

        .tl_instr_o         (xbar_main_2_instr        ),
        .tl_instr_i         (instr_2_xbar_main        ),
        .tl_data_o          (xbar_main_2_data         ),
        .tl_data_i          (data_2_xbar_main         ),
        .tl_peri_device_o   (xbar_main_2_peri_device  ),
        .tl_peri_device_i   (peri_device_2_xbar_main  ),
        
        .scanmode_i         (prim_mubi_pkg::MuBi4False),
    );

    spi_device_tlul u_spi_device_tlul 
    (
        .clk_i      (clk_i           ),
        .rst_ni     (rst_ni          ),
        .test_mode  (1'b1            ),
        .spi_sclk   (spi_sclk        ),
        .spi_cs     (spi_cs          ),
        .spi_mode   (spi_mode        ),
        .spi_sdi0   (spi_sdi0        ),
        .spi_sdi1   (spi_sdi1        ),
        .spi_sdi2   (spi_sdi2        ),
        .spi_sdi3   (spi_sdi3        ),
        .spi_sdo0   (spi_sdo0        ),
        .spi_sdo1   (spi_sdi1        ),
        .spi_sdo2   (spi_sdi2        ),
        .spi_sdo3   (spi_sdo3        ),
        .tl_i       (xbar_main_2_spi ),
        .tl_o       (spi_2_xbar_main )
    );

    host_cluster u_host_cluster (
        .clk_i              (clk_i             ),
        .rst_ni             (rst_ni            ),

        .fetch_enable_i     (fetch_enable_i    ),
        .en_ifetch_i        (en_ifetch_i       ),
        .tl_core_i          (xbar_main_2_core  ),
        .tl_core_o          (core_2_xbar_main  ),

        .tl_instr_i         (xbar_main_2_instr ),
        .tl_instr_o         (instr_2_xbar_main ),
        .tl_data_i          (xbar_main_2_data  ),
        .tl_data_o          (data_2_xbar_main  ),
    );

endmodule