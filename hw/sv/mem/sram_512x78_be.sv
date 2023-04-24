module sram_512x78_be (
    input clk,              //Input Clock
    input ren,              //Read Enable
    input wen,              //Write Enable
    input [8:0] adr,        //Input Address
    input [2:0] mc,         //Controls extending write duration
    input mcen,             //Enable read margin control 
    input clkbyp,           //clock bypass enable  
    input [77:0] din,       //Input Write Data 
    input [77:0] wbeb,      //Write Bit enable
    input [1:0] wa,
    input [1:0] wpulse,
    input wpulseen,
    input fwen,
    input vddp,
    inout vss,
    output [77:0] q
);

endmodule