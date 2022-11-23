module uni_2x2sub4x4_gpio_top_lef_LEFT_SIDE (
    vdd,
    vss,
    dq,
    drv0,
    drv1,
    drv2,
    enabq,
    enq,
    outi,
    pd,
    ppen,
    prg_slew,
    puq,
    pwrup_pull_en,
    pwrupzhl
);

inout          vdd;  
inout          vss;
input  [71:40] dq;
input  [ 8: 5] drv0;
input  [ 8: 5] drv1;
input  [ 8: 5] drv2;
input  [71:40] enabq;
input  [71:40] enq;
output [71:40] outi;
input  [ 8: 5] pd;
input  [ 8: 5] ppen;
input  [ 8: 5] prg_slew;
input  [ 8: 5] puq;
input  [ 8: 5] pwrup_pull_en;
input  [ 8: 5] pwrupzhl;

endmodule