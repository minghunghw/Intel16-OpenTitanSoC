module rf_512x32_be (
    input ickwp0,               // write clock port 0
    input iwenp0,               // write enable port 0
    input [8:0] iawp0,          // write address port 0
    input [31:0] idinp0,        // write data port 0
    input [31:0] ibwep0,        // write segment enable port 0
    input ickrp0,               // read clock port 0
    input irenp0,               // read enable port 0
    input [8:0] iarp0,          // read address port 0
    input iclkbyp,              // self-timed clock bypass select
    input imce,                 // self-timed clock high phase width select enable
    input [1:0] irmce,          // self-timed clock high phase width select
    input ifuse,
    input [3:0] iwmce,
    input vcc_nom,                                                     
    inout vss,
    output [31:0] odoutp0       // read data port 0
);

endmodule