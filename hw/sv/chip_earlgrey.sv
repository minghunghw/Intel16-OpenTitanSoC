module chip_earlgrey (
    output [71:0] dq,
    output [71:0] drv0,
    output [71:0] drv1,
    output [71:0] drv2,
    output [71:0] enabq,
    output [71:0] enq,
    input  [71:0] outi,
    output [71:0] pd,
    output [71:0] ppen,
    output [71:0] prg_slew,
    output [71:0] puq,
    output [71:0] pwrup_pull_en,
    output [71:0] pwrupzhl
);

    wire  [70:0] chip_io;
    logic [70:0] oe;

    chip_earlgrey_asic u_chip_earlgrey_asic (
        .*
    );

    xbar_south u_xbar_south (
        .*
    );

endmodule