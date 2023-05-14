//`define SLE_TOP_PCH pch_sle_top
//`define SLE_SIM
//`define EMULATION_VEL

`ifndef __EMU_CLK_PLL_SV__
`define __EMU_CLK_PLL_SV__

`timescale 1ps/1ps
module emu_clk_pll
(
    enable,               // active high enable for the clk_out
    numerator,            // numerator, can be changed on the fly
    denominator,          // denominator, can be changed on the fly
    lock_delay,           // num of ref clks from enable to lock ?? can this be calculated
    ref_clk,              // optional used if edge alignment is need
    outclk_alignment,     // align out clock to refclk  (0 = pos edge , 1 neg ) 
    lock_alignment,       // align lock enable to refclk (0)pos/(1)neg egdge  

    lock,
    clk_out                //output clock
);

input    enable;               // active high enable for the clk_out
input  [31:0]  numerator;      // numerator, can be changed on the fly
input  [31:0]  denominator;    // denominator, can be changed on the fly
input  [31:0]  lock_delay;     // num of ref clks from enable to lock ?? can this be calculated
input    ref_clk;              // optional used if edge alignment is need
input    outclk_alignment;     // align out clock to refclk  (0 = pos edge , 1 neg )        
input    lock_alignment;       // align lock enable to refclk (0)pos/(1)neg egdge       
   
output   lock;
output   clk_out;               //output clock

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
        
        // common cases for HDAPLL listed for now (24MHz, 48MHz, 96MHz)
        // Uncomment the ones that are needed in the model
        
        //generate  357 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h77, 32'h8 } : clk_out_period = 1400; // rounded number 1400.56

        //generate  250 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h7D, 32'hC } : clk_out_period = 2000;

        //generate  200 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h19, 32'h3 } : clk_out_period = 2500;

        //generate  125 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h7D, 32'h18 } : clk_out_period = 4000;

        //generate  100 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h19, 32'h6 } : clk_out_period = 5000;

        //generate  96 MHz clock  assuming ref clk 24MHz
        {1'b1, 32'h4, 32'h1 } : clk_out_period = 5208;
        
        //generate  48 MHz clock  assuming ref clk 24MHz
        {1'b1, 32'h2, 32'h1 } : clk_out_period = 10417;
        
        //generate  24 MHz clock  assuming ref clk 24MHz
        {1'b1, 32'h1, 32'h1 } : clk_out_period = 20833;
        
        // by default tie the clock output to be extremely slow to show wrong frequency
        default                : clk_out_period = 500000;
        
        endcase
    
    end

`elsif EMULATION_CLOCKS //case for normal emulation model where EMULATION_CLOCKS points to the clock generator hierarchy

    always_comb begin
        case ({enable, numerator, denominator})
        
        // common cases for HDAPLL listed for now (24MHz, 48MHz, 96MHz)
        // Uncomment the ones that are needed in the model
        
        //generate  357 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h77, 32'h8 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_357MHz;
        
        //generate  250 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h7D, 32'hC } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_250MHz;
        
        //generate  200 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h19, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_200MHz;
        
        //generate  125 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h7D, 32'h18 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_125MHz;
        
        //generate  100 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h19, 32'h6 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_100MHz;
        
        //generate  96 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h4, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_96MHz;
        
        //generate  48 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h2, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_48MHz;
        
        //generate  24 MHz clock assuming ref clk 24MHz
        {1'b1, 32'h1, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_24MHz;
        
        // by default tie the clock output to ground for debug easiness
        default                : clk_out_i = 1'b0;
        
        endcase
    
    end
`else // For other cases like IP EFFM compile, FC EFFM compile etc
`endif

always_ff @ (posedge clk_out_i or negedge enable)
begin
  if (~enable)
    lock <= 1'b0;
  else
    lock <= 1'b1;
end

//assigning the clk_out to the output port
assign clk_out = clk_out_i;


`endif //EMULATION



endmodule

`endif //__EMU_CLK_PLL_SV__
