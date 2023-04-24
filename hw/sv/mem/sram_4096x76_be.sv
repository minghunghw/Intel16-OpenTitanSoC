module sram_4096x76_be (
    input clk,              //Input Clock
    input ren,              //Read Enable
    input wen,              //Write Enable
    input [11:0] adr,       //Input Address
    input [2:0] mc,         //Controls extending write duration
    input mcen,             //Enable read margin control 
    input clkbyp,           //clock bypass enable  
    input [75:0] din,       //Input Write Data 
    input [75:0] wbeb,      //Write Bit enable
    input [1:0] wa,
    input [1:0] wpulse,
    input wpulseen,
    input fwen,
    input vddp,
    inout vss,
    output [75:0] q
);

endmodule