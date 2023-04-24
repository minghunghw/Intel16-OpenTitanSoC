module sram_8192x39_be (
    input clk,              //Input Clock
    input ren,              //Read Enable
    input wen,              //Write Enable
    input [12:0] adr,       //Input Address
    input [2:0] mc,         //Controls extending write duration
    input mcen,             //Enable read margin control 
    input clkbyp,           //clock bypass enable  
    input [38:0] din,       //Input Write Data 
    input [38:0] wbeb,      //Write Bit enable
    input [1:0] wa,
    input [1:0] wpulse,
    input wpulseen,
    input fwen,
    input vddp,
    inout vss,
    output [38:0] q
);

endmodule