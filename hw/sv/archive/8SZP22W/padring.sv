module padring (
    // core interface
    output wire        clk_i,
    output wire        rst_ni,
    output wire        fetch_enable_i,
    output wire        en_ifetch_i,
    output wire        spi_sclk,
    output wire        spi_cs,
    input  wire [1:0]  spi_mode,
    output wire        spi_sdi0,
    output wire        spi_sdi1,
    output wire        spi_sdi2,
    output wire        spi_sdi3,
    input  wire        spi_sdo0,
    input  wire        spi_sdo1,
    input  wire        spi_sdo2,
    input  wire        spi_sdo3,
    input  wire [31:0] gpio_o,

    // pad interface
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

// Digital IO helper macros
// -----------------------------------------
// - <orient> is either e1 or n1
// - hybrid IO pin descriptions:
//
//  pad             :   data external in/out
//  ana_io_1v8      :   analog in/out pin from/to core
//  outi_1v8        :   data output to core
//  outi            :   data output to core
//  dq              :   data input pin from core
//  drv0            :   drive strength configuration bit 0
//  drv1            :   drive strength configuration bit 1
//  drv2            :   drive strength configuration bit 2
//  enq             :   disable output driver
//  enabq           :   disbale receiver
//  pd              :   enable weak pull down
//  puq             :   disable weak pull up
//  pwrupzhl        :   core power down status
//  pwrup_pull_en   :   state definition in combination with pwrupzhl
//  ppen            :   push pull/ open deain select pin
//  prg_slew        :   slew programmability

// Digital input
`define DIGITAL_IN(from_ext, to_chip, orient)   \
    sdio_1v8_``orient u_din_``from_ext (        \
        .pad           (from_ext),              \
        .ana_io_1v8    (        ),              \
        .outi_1v8      (        ),              \
        .outi          (to_chip ),              \
        .dq            (1'b0    ),              \
        .drv0          (1'b0    ),              \
        .drv1          (1'b0    ),              \
        .drv2          (1'b0    ),              \
        .enq           (1'b1    ),              \
        .enabq         (1'b0    ),              \
        .pd            (1'b0    ),              \
        .puq           (1'b1    ),              \
        .pwrupzhl      (1'b0    ),              \
        .pwrup_pull_en (1'b0    ),              \
        .ppen          (1'b0    ),              \
        .prg_slew      (1'b0    )               \
    );

// Digital output
`define DIGITAL_OUT(to_ext, from_chip, orient)  \
    sdio_1v8_``orient u_dout_``to_ext (         \
        .pad           (to_ext     ),           \
        .ana_io_1v8    (           ),           \
        .outi_1v8      (           ),           \
        .outi          (           ),           \
        .dq            (~from_chip ),           \
        .drv0          (1'b0       ),           \
        .drv1          (1'b0       ),           \
        .drv2          (1'b0       ),           \
        .enq           (1'b0       ),           \
        .enabq         (1'b1       ),           \
        .pd            (1'b0       ),           \
        .puq           (1'b1       ),           \
        .pwrupzhl      (1'b0       ),           \
        .pwrup_pull_en (1'b0       ),           \
        .ppen          (1'b1       ),           \
        .prg_slew      (1'b0       )            \
    );

// Digital output bus
`define DIGITAL_OUT_BUS(to_ext, from_chip, orient, n)   \
    sdio_1v8_``orient u_dout_``to_ext [n-1:0] (         \
        .pad           (to_ext     ),                   \
        .ana_io_1v8    (           ),                   \
        .outi_1v8      (           ),                   \
        .outi          (           ),                   \
        .dq            (~from_chip ),                   \
        .drv0          (1'b0       ),                   \
        .drv1          (1'b0       ),                   \
        .drv2          (1'b0       ),                   \
        .enq           (1'b0       ),                   \
        .enabq         (1'b1       ),                   \
        .pd            (1'b0       ),                   \
        .puq           (1'b1       ),                   \
        .pwrupzhl      (1'b0       ),                   \
        .pwrup_pull_en (1'b0       ),                   \
        .ppen          (1'b1       ),                   \
        .prg_slew      (1'b0       )                    \
    );

// IO VDD
`define IO_VDD_ARRAY_INST(orient, n) \
    sup1v8_``orient u_IOVDD [n-1:0] ();

// Analog input
`define ANALOG_IN(from_ext, to_chip, orient)    \
    ana_io_``orient u_ain_``from_ext (          \
        .pad    (from_ext ),                    \
        .d      (to_chip  )                     \
    );

// Analog output
`define ANALOG_OUT(to_ext, from_chip, orient)   \
    ana_io_``orient u_aout_``to_ext (           \
        .pad    (to_ext    ),                   \
        .d      (from_chip )                    \
    );
    
`IO_VDD_ARRAY_INST(n1, 10)

`DIGITAL_IN(clk_i_PAD, clk_i, n1)
`DIGITAL_IN(rst_ni_PAD, rst_ni, n1)

`DIGITAL_IN(fetch_enable_i_PAD, fetch_enable_i, n1)
`DIGITAL_IN(en_ifetch_i_PAD, en_ifetch_i, n1)

`DIGITAL_IN(spi_sclk_PAD, spi_sclk, n1)
`DIGITAL_IN(spi_cs_PAD, spi_cs, n1)
`DIGITAL_OUT_BUS(spi_mode_PAD, spi_mode, n1, 2)

`DIGITAL_IN(spi_sdi0_PAD, spi_sdi0, n1)
`DIGITAL_IN(spi_sdi1_PAD, spi_sdi1, n1)
`DIGITAL_IN(spi_sdi2_PAD, spi_sdi2, n1)
`DIGITAL_IN(spi_sdi3_PAD, spi_sdi3, n1)

`DIGITAL_OUT(spi_sdo0_PAD, spi_sdo0, n1)
`DIGITAL_OUT(spi_sdo1_PAD, spi_sdo1, n1)
`DIGITAL_OUT(spi_sdo2_PAD, spi_sdo2, n1)
`DIGITAL_OUT(spi_sdo3_PAD, spi_sdo3, n1)

`DIGITAL_OUT_BUS(gpio_o_PAD, gpio_o, n1, 32)

endmodule