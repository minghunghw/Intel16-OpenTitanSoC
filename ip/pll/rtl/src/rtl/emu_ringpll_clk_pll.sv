
//wrapper around emu_clk_pll module

`ifndef WRAPPER__EMU_CLK_PLL_SV__
`define WRAPPER__EMU_CLK_PLL_SV__
//`include "emu_clk_pll.sv"

module emu_ringpll_clk_pll
(
input          enable,               // active high enable for the clk_out
input [31:0]   numerator,            // numerator, can be changed on the fly
input [31:0]   denominator,          // denominator, can be changed on the fly
input [31:0]   lock_delay,           // num of ref clks from enable to lock ?? can this be calculated
input          ref_clk,              // optional used if edge alignment is need
input          outclk_alignment,     // align out clock to refclk  (0 = pos edge , 1 neg ) 
input          lock_alignment,       // align lock enable to refclk (0)pos/(1)neg egdge  

output         lock,
output         clk_out                //output clock
);




   emu_clk_pll emu_pll (
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



endmodule

`endif //WRAPPER__EMU_CLK_PLL_SV__
