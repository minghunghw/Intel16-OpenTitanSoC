//`define SLE_TOP_PCH pch_sle_top
//`define SLE_SIM
//`define EMULATION_VEL

`ifndef __EMU_CLK_DIV_SV__
`define __EMU_CLK_DIV_SV__

`timescale 1ps/1ps
module emu_clk_div
(
    enable,               // active high enable for the clk_out
    numerator,            // numerator, can be changed on the fly
    denominator,          // denominator, can be changed on the fly
    input_clk,            // input clock feeding into the divider

    clk_out               //output clock
);

input    enable;               // active high enable for the clk_out
input  [31:0]  numerator;      // numerator, can be changed on the fly
input  [31:0]  denominator;    // denominator, can be changed on the fly
input    input_clk;            // input clock feeding into the divider

output   clk_out;              //output clock

reg lock;
logic clk_out_i;
logic clk_out;



`ifdef EMULATION

`ifdef EMULATION_SIM  // for the simulation run on emulation code. This is not gate level simulation though.
longint clk_out_period;

initial begin
    #100
    clk_out_i = 1;
    forever #(clk_out_period) clk_out_i = ~clk_out_i;
end
    always_comb begin
        case ({enable, numerator, denominator})
        
        //generate  357 MHz clock assuming input clk 5GHz (num:1 denom:14)
        {1'b1, 32'h1, 32'he } : clk_out_period = 1400; // rounded number 1400.56

        //generate  250 MHz clock assuming input clk 5GHz (num:1 denom:20)
        {1'b1, 32'h1, 32'h14 } : clk_out_period = 2000;

        //generate  200 MHz clock assuming input clk 5GHz (num:1 denom:25)
        {1'b1, 32'h1, 32'h19 } : clk_out_period = 2500;

        //generate  125 MHz clock assuming input clk 5GHz (num:1 denom:40)
        {1'b1, 32'h1, 32'h28 } : clk_out_period = 4000;

        //generate  100 MHz clock assuming input clk 5GHz (num:1 denom:50)
        {1'b1, 32'h1, 32'h32 } : clk_out_period = 5000;

        //generate  100 MHz clock assuming input clk 4.2GHz (num:1 denom:42)
        {1'b1, 32'h1, 32'h2A } : clk_out_period = 5000;

        // by default tie the clock output to be extremely slow to show wrong frequency
        default                : clk_out_period = 500000;
        
        endcase
    
    end

`elsif EMULATION_CLOCKS //case for normal emulation model where EMULATION_CLOCKS points to the clock generator hierarchy

    always_comb begin
        case ({enable, numerator, denominator})
        
        //generate  357 MHz clock assuming input clk 5GHz (num:1 denom:14)
        {1'b1, 32'h1, 32'he } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_357MHz;

        //generate  250 MHz clock assuming input clk 5GHz (num:1 denom:20)
        {1'b1, 32'h1, 32'h14 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_250MHz;

        //generate  200 MHz clock assuming input clk 5GHz (num:1 denom:25)
        {1'b1, 32'h1, 32'h19 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_200MHz;

        //generate  125 MHz clock assuming input clk 5GHz (num:1 denom:40)
        {1'b1, 32'h1, 32'h28 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_125MHz;

        //generate  100 MHz clock assuming input clk 5GHz (num:1 denom:50)
        {1'b1, 32'h1, 32'h32 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_100MHz;

        //generate  100 MHz clock assuming input clk 4.2GHz (num:1 denom:42)
        {1'b1, 32'h1, 32'h2A } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_100MHz;


        // by default tie the clock output to ground for debug easiness
        default                : clk_out_i = 1'b0;
        
        endcase
    
    end
`else // For other cases like IP EFFM compile, FC EFFM compile etc
`endif

//assigning the clk_out to the output port
assign clk_out = clk_out_i;


`endif //EMULATION



endmodule

`endif //__EMU_CLK_DIV_SV__
