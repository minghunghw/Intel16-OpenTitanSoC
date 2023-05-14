// This module generates a clock of frequency specified by the input signals
// The frequency of the generated clock will be  1*numerator/denominator Hz.
// In future, this module definition will be replaced by a transactor that will be designed to work with emulation, effm, and simulation using EMULATION define

`ifndef __EMU_CLK_OSC_SV__
`define __EMU_CLK_OSC_SV__

module emu_clk_osc (enable, numerator, denominator, clk_out);

input  enable; // if not needed parent should tie to 1
input  [31:0] numerator; // multiplier to the base clock of 1Hz
input  [31:0] denominator; // divider to the base clock of 1Hz
output clk_out; // output clock

//In your environment, define EMULATION_CLOCKS to the hierarchy of the clock generating module 
//e.g. `define EMULATION_CLOCKS top.pchclkdiv

logic clk_out;
logic clk_out_i;

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
       // Most of the frequencies generated in pchclkgen are listed here. 
       // Uncomment the ones that are needed in the model
       
       //generate  533.33 (1600/3) MHz clock  
       {1'b1, 32'h5f5e1000, 32'h3 } : clk_out_period = 1875/2;
       
       //generate  600 MHz clock
       {1'b1, 32'h23c34600, 32'h1 } : clk_out_period = 1667/2;
       
       //generate  625 MHz clock
       {1'b1, 32'h2540be40, 32'h1 } : clk_out_period = 1600/2;
       
       //generate  800 MHz clock
       {1'b1, 32'h2faf0800, 32'h1 } : clk_out_period = 1250/2;
       
       //generate  833.33 (2500/3) MHz clock
       {1'b1, 32'h9502f900, 32'h3 } : clk_out_period = 1200/2;
       
       //generate  960 MHz clock
       {1'b1, 32'h39387000, 32'h1 } : clk_out_period = 1042/2;
       
       //generate  1066.667 (3200/3) MHz clock
       {1'b1, 32'hbebc2000, 32'h3 } : clk_out_period = 937/2;
       
       //generate  1200 MHz clock
       {1'b1, 32'h47868c00, 32'h1 } : clk_out_period = 833/2;
       
       //generate  1250 MHz clock
       {1'b1, 32'h4a817c80, 32'h1 } : clk_out_period = 800/2;
       
       //generate  1600 MHz clock
       {1'b1, 32'h5f5e1000, 32'h1 } : clk_out_period = 625/2;
       
       //generate  1666.66 MHz clock, numerator doesnot fit in 32 bits so commenting out
       {1'b1, 32'h00000, 32'h1 } : clk_out_period = 600/2;
       
       //generate  1920 MHz clock
       {1'b1, 32'h7270e000, 32'h1 } : clk_out_period = 521/2;
       
       //generate  2000 MHz clock
       {1'b1, 32'h77359400, 32'h1 } : clk_out_period = 500/2;
       
       //generate  1000 MHz clock
       {1'b1, 32'h3b9aca00, 32'h1 } : clk_out_period = 1000/2;
       
       //generate  500 MHz clock
       {1'b1, 32'h1dcd6500, 32'h1 } : clk_out_period = 2000/2;
       
       //generate  250 MHz clock
       {1'b1, 32'hee6b280, 32'h1 } : clk_out_period = 4000/2;
       
       //generate  125 MHz clock
       {1'b1, 32'h7735940, 32'h1 } : clk_out_period = 8000/2;
       
       //generate  62.5 (125/2) MHz clock
       {1'b1, 32'h7735940, 32'h2 } : clk_out_period = 16000/2;
       
       //generate  31.25 (125/4) MHz clock
       {1'b1, 32'h7735940, 32'h4 } : clk_out_period = 32000/2;
       
       //generate  15.625 (125/8)  MHz clock
       {1'b1, 32'h7735940, 32'h8 } : clk_out_period = 64000/2;
       
       //generate  666.66 (2000/3) MHz clock
       {1'b1, 32'h77359400, 32'h3 } : clk_out_period = 1500/2;
       
       //generate  333.33 (1000/3) MHz clock
       {1'b1, 32'h3b9aca00, 32'h3 } : clk_out_period = 3000/2;
       
       //generate  166.66 (500/3) MHz clock
       {1'b1, 32'h1dcd6500, 32'h3 } : clk_out_period = 6000/2;
       
       //generate  83.33 (250/3) MHz clock
       {1'b1, 32'hee6b280, 32'h3 } : clk_out_period = 12000/2;
       
       //generate  41.66 (125/3) MHz clock
       {1'b1, 32'h7735940, 32'h3 } : clk_out_period = 24000/2;
       
       //generate  20.833 (125/6) MHz clock
       {1'b1, 32'h7735940, 32'h6 } : clk_out_period = 48000/2;
       
       //generate  10.417 (125/12)  MHz clock
       {1'b1, 32'h7735940, 32'hc } : clk_out_period = 96000/2;
       
       //generate  400 MHz clock
       {1'b1, 32'h17d78400, 32'h1 } : clk_out_period = 2500/2;
       
       //generate  200 MHz clock
       {1'b1, 32'hbebc200, 32'h1 } : clk_out_period = 5000/2;
       
       //generate  100 MHz clock
       {1'b1, 32'h5f5e100, 32'h1 } : clk_out_period = 10000/2;
       
       //generate  50 MHz clock
       {1'b1, 32'h2faf080, 32'h1 } : clk_out_period = 20000/2;
       
       //generate  25 MHz clock
       {1'b1, 32'h17d7840, 32'h1 } : clk_out_period = 40000/2;
       
       //generate  12.5 (25/2) MHz clock
       {1'b1, 32'h17d7840, 32'h2 } : clk_out_period = 80000/2;
       
       //generate  6.25 (25/4) MHz clock
       {1'b1, 32'h17d7840, 32'h4 } : clk_out_period = 160000/2;
       
       //generate  133.33 (400/3) MHz clock
       {1'b1, 32'h17d78400, 32'h3 } : clk_out_period = 7500/2;
       
       //generate  66.66 (200/3) MHz clock
       {1'b1, 32'hbebc200, 32'h3 } : clk_out_period = 15000/2;
       
       //generate  33.33 (100/3) MHz clock
       {1'b1, 32'h5f5e100, 32'h3 } : clk_out_period = 30000/2;
       
       //generate  16.66 (50/3) MHz clock
       {1'b1, 32'h2faf080, 32'h3 } : clk_out_period = 60000/2;
       
       //generate  8.33 (25/3) MHz clock
       {1'b1, 32'h17d7840, 32'h3 } : clk_out_period = 120000/2;
       
       //generate  4.167 (25/6) MHz clock
       {1'b1, 32'h17d7840, 32'h6 } : clk_out_period = 240000/2;
       
       //generate  2.08 (25/12) MHz clock
       {1'b1, 32'h17d7840, 32'hc } : clk_out_period = 480000/2;
       
       //generate  1.041667 (25/24) MHz clock
       {1'b1, 32'h17d7840, 32'h18 } : clk_out_period = 960000/2;
       
       //generate  0.520833 (25/48)  MHz clock
       {1'b1, 32'h17d7840, 32'h30 } : clk_out_period = 1920000/2;
       
       //generate  0.260417 (25/96) MHz clock
       {1'b1, 32'h17d7840, 32'h60 } : clk_out_period = 3840000/2;
       
       //generate  0.130208 (25/192) MHz clock
       {1'b1, 32'h17d7840, 32'hc0 } : clk_out_period = 7680000/2;
       
       //generate  0.065104 (25/384) MHz clock
       {1'b1, 32'h17d7840, 32'h180 } : clk_out_period = 15360000/2;
       
       //generate  0.032552 (25/768) MHz clock
       {1'b1, 32'h17d7840, 32'h300 } : clk_out_period = 30720000/2;
       
       //generate  266.66 (800/3) MHz clock
       {1'b1, 32'h2faf0800, 32'h3 } : clk_out_period = 3750/2;
       
       //generate  300 MHz clock
       {1'b1, 32'h11e1a300, 32'h1 } : clk_out_period = 10000/6;
       
       //generate  150 MHz clock
       {1'b1, 32'h8f0d180, 32'h1 } : clk_out_period = 20000/6;
       
       //generate  75 MHz clock
       {1'b1, 32'h47868c0, 32'h1 } : clk_out_period = 40000/6;
       
       //generate  37.5 (75/2) MHz clock
       {1'b1, 32'h47868c0, 32'h2 } : clk_out_period = 80000/6;
       
       //generate  18.75 (75/4) MHz clock
       {1'b1, 32'h47868c0, 32'h4 } : clk_out_period = 160000/6;
       
       //generate  9.375 (75/8) MHz clock
       {1'b1, 32'h47868c0, 32'h8 } : clk_out_period = 320000/6;
       
       //generate  480 MHz clock
       {1'b1, 32'h1c9c3800, 32'h1 } : clk_out_period = 6250/6;
       
       //generate  240 MHz clock
       {1'b1, 32'he4e1c00, 32'h1 } : clk_out_period = 12500/6;
       
       //generate  120 MHz clock
       {1'b1, 32'h7270e00, 32'h1 } : clk_out_period = 25000/6;
       
       //generate  60 MHz clock
       {1'b1, 32'h3938700, 32'h1 } : clk_out_period = 50000/6;
       
       //generate  30 MHz clock
       {1'b1, 32'h1c9c380, 32'h1 } : clk_out_period = 100000/6;
       
       //generate  15 MHz clock
       {1'b1, 32'he4e1c0, 32'h1 } : clk_out_period = 200000/6;
       
       //generate  7.5 (15/2) MHz clock
       {1'b1, 32'he4e1c0, 32'h2 } : clk_out_period = 400000/6;
       
       //generate  320 MHz clock
       {1'b1, 32'h1312d000, 32'h1 } : clk_out_period = 3125/2;
       
       //generate  160 MHz clock
       {1'b1, 32'h9896800, 32'h1 } : clk_out_period = 6250/2;
       
       //generate  80 MHz clock
       {1'b1, 32'h4c4b400, 32'h1 } : clk_out_period = 12500/2;
       
       //generate  40 MHz clock
       {1'b1, 32'h2625a00, 32'h1 } : clk_out_period = 25000/2;
       
       //generate  20 MHz clock
       {1'b1, 32'h1312d00, 32'h1 } : clk_out_period = 50000/2;
      
       //generate  10 MHz clock
       {1'b1, 32'h989680, 32'h1 } : clk_out_period = 100000/2;
       
       //generate  5 MHz clock
       {1'b1, 32'h4c4b40, 32'h1 } : clk_out_period = 200000/2;
       
       //generate  192 MHz clock
       {1'b1, 32'hb71b000, 32'h1 } : clk_out_period = 15625/6;
       
       //generate  96 MHz clock
       {1'b1, 32'h5b8d800, 32'h1 } : clk_out_period = 31250/6;
       
       //generate  48 MHz clock
       {1'b1, 32'h2dc6c00, 32'h1 } : clk_out_period = 62500/6;
       
       //generate  24 MHz clock
       {1'b1, 32'h16e3600, 32'h1 } : clk_out_period = 125000/6;
       
       //generate  12 MHz clock
       {1'b1, 32'hb71b00, 32'h1 } : clk_out_period = 250000/6;
       
       //generate  6 MHz clock
       {1'b1, 32'h5b8d80, 32'h1 } : clk_out_period = 500000/6;
       
       //generate  3 MHz clock
       {1'b1, 32'h2dc6c0, 32'h1 } : clk_out_period = 1000000/6;
       
       //generate  416.66 (1250/3) MHz clock
       {1'b1, 32'h4a817c80, 32'h3 } : clk_out_period = 2400/2;
       
       //generate  208.33 (625/3) MHz clock
       {1'b1, 32'h2540be40, 32'h3 } : clk_out_period = 4800/2;
       
       //generate  312.5 (625/2) MHz clock
       {1'b1, 32'h2540be40, 32'h2 } : clk_out_period = 3200/2;
       
       //generate  156.25 (625/4) MHz clock
       {1'b1, 32'h2540be40, 32'h4 } : clk_out_period = 6400/2;
       
       //generate  19.2 (96/5) MHz clock
       {1'b1, 32'h124F800, 32'h1 } : clk_out_period = 156250/6;
       
       //generate  64 MHz clock
       {1'b1, 32'h3d09000, 32'h1 } : clk_out_period = 15625/2;
       
       //generate  32 MHz clock
       {1'b1, 32'h1e84800, 32'h1 } : clk_out_period = 31250/2;
       
       //generate  16 MHz clock
       {1'b1, 32'hf42400, 32'h1 } : clk_out_period = 62500/2;
       
       //generate  8 MHz clock
       {1'b1, 32'h7a1200, 32'h1 } : clk_out_period = 125000/2;
       
       //generate  4 MHz clock
       {1'b1, 32'h3d0900, 32'h1 } : clk_out_period = 250000/2;
       
       //generate  2 MHz clock
       {1'b1, 32'h1e8480, 32'h1 } : clk_out_period = 500000/2;
       
       //generate  1 MHz clock
       {1'b1, 32'hf4240, 32'h1 } : clk_out_period = 1000000/2;
       
       //generate  360 MHz clock
       {1'b1, 32'h15752a00, 32'h1 } : clk_out_period = 25000/12;
       
       //generate  357.1429 MHz clock, select can be both 357MHz or 357.1429MHz
       {1'b1, 32'h15476340, 32'h1 } : clk_out_period = 2800/2;
       {1'b1, 32'h15499174, 32'h1 } : clk_out_period = 2800/2;
       
       //generate  38.4 (192/5) MHz clock
       {1'b1, 32'h249F000, 32'h1 } : clk_out_period = 78125/6;
       
       //generate  19.2 (192/10) MHz clock
       {1'b1, 32'h124F800, 32'h1 } : clk_out_period = 500000;
       
       // by default tie the clock output to ground for debug easiness
       default                      : clk_out_period = 500000;
       
       endcase
 

    end

// end of `ifdef EMULATION_SIM
`elsif EMULATION_CLOCKS //case for normal emulation model where EMULATION_CLOCKS points to the clock generator hierarchy

   always_comb begin
   
      case ({enable, numerator, denominator})
      
      // Most of the frequencies generated in pchclkgen are listed here. 
      // Uncomment the ones that are needed in the model
      
      //generate  533.33 (1600/3) MHz clock  
      //{1'b1, 32'h5f5e1000, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_533p333MHz;
      
      //generate  600 MHz clock
      //{1'b1, 32'h23c34600, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_600MHz;
      
      //generate  625 MHz clock
      //{1'b1, 32'h2540be40, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_625MHz;
      
      //generate  800 MHz clock
      //{1'b1, 32'h2faf0800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_800MHz;
      
      //generate  833.33 (2500/3) MHz clock
      //{1'b1, 32'h9502f900, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_833p333MHz;
      
      //generate  960 MHz clock
      //{1'b1, 32'h39387000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_960MHz;
      
      //generate  1066.667 (3200/3) MHz clock
      //{1'b1, 32'hbebc2000, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1066p667MHz;
      
      //generate  1200 MHz clock
      //{1'b1, 32'h47868c00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1200MHz;
      
      //generate  1250 MHz clock
      //{1'b1, 32'h4a817c80, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1250MHz;
      
      //generate  1600 MHz clock
      //{1'b1, 32'h5f5e1000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1600MHz;
      
      //generate  1666.66 MHz clock, numerator doesnot fit in 32 bits so commenting out
      ////{1'b1, 32'h00000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1666p667MHz;
      
      //generate  1920 MHz clock
      //{1'b1, 32'h7270e000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1920MHz;
      
      //generate  2000 MHz clock
        {1'b1, 32'h77359400, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_2000MHz;
      
      //generate  1000 MHz clock
        {1'b1, 32'h3b9aca00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1000MHz;
      
      //generate  500 MHz clock
      //{1'b1, 32'h1dcd6500, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_500MHz;
      
      //generate  250 MHz clock
      //{1'b1, 32'hee6b280, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_250MHz;
      
      //generate  125 MHz clock
      //{1'b1, 32'h7735940, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_125MHz;
      
      //generate  62.5 (125/2) MHz clock
      //{1'b1, 32'h7735940, 32'h2 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_62p5MHz;
      
      //generate  31.25 (125/4) MHz clock
      //{1'b1, 32'h7735940, 32'h4 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_31p25MHz;
      
      //generate  15.625 (125/8)  MHz clock
      //{1'b1, 32'h7735940, 32'h8 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_15p625MHz;
      
      //generate  666.66 (2000/3) MHz clock
      //{1'b1, 32'h77359400, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_666p667MHz;
      
      //generate  333.33 (1000/3) MHz clock
      //{1'b1, 32'h3b9aca00, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_333p333MHz;
      
      //generate  166.66 (500/3) MHz clock
      //{1'b1, 32'h1dcd6500, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_166p667MHz;
      
      //generate  83.33 (250/3) MHz clock
      //{1'b1, 32'hee6b280, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_83p333MHz;
      
      //generate  41.66 (125/3) MHz clock
      //{1'b1, 32'h7735940, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_41p667MHz;
      
      //generate  20.833 (125/6) MHz clock
      //{1'b1, 32'h7735940, 32'h6 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_20p833MHz;
      
      //generate  10.417 (125/12)  MHz clock
      //{1'b1, 32'h7735940, 32'hc } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_10p417MHz;
      
      //generate  400 MHz clock
      //{1'b1, 32'h17d78400, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_400MHz;
      
      //generate  200 MHz clock
      //{1'b1, 32'hbebc200, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_200MHz;
      
      //generate  100 MHz clock
      //{1'b1, 32'h5f5e100, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_100MHz;
      
      //generate  50 MHz clock
      //{1'b1, 32'h2faf080, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_50MHz;
      
      //generate  25 MHz clock
      //{1'b1, 32'h17d7840, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_25MHz;
      
      //generate  12.5 (25/2) MHz clock
      //{1'b1, 32'h17d7840, 32'h2 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_12p5MHz;
      
      //generate  6.25 (25/4) MHz clock
      //{1'b1, 32'h17d7840, 32'h4 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_6p25MHz;
      
      //generate  133.33 (400/3) MHz clock
      //{1'b1, 32'h17d78400, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_133p333MHz;
      
      //generate  66.66 (200/3) MHz clock
      //{1'b1, 32'hbebc200, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_66p667MHz;
      
      //generate  33.33 (100/3) MHz clock
      //{1'b1, 32'h5f5e100, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_33p333MHz;
      
      //generate  16.66 (50/3) MHz clock
      //{1'b1, 32'h2faf080, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_16p667MHz;
      
      //generate  8.33 (25/3) MHz clock
      //{1'b1, 32'h17d7840, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_8p333MHz;
      
      //generate  4.167 (25/6) MHz clock
      //{1'b1, 32'h17d7840, 32'h6 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_4p167MHz;
      
      //generate  2.08 (25/12) MHz clock
      //{1'b1, 32'h17d7840, 32'hc } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_2p083MHz;
      
      //generate  1.041667 (25/24) MHz clock
      //{1'b1, 32'h17d7840, 32'h18 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1p041667MHz;
      
      //generate  0.520833 (25/48)  MHz clock
      //{1'b1, 32'h17d7840, 32'h30 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_0p520833MHz;
      
      //generate  0.260417 (25/96) MHz clock
      //{1'b1, 32'h17d7840, 32'h60 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_0p260417MHz;
      
      //generate  0.130208 (25/192) MHz clock
      //{1'b1, 32'h17d7840, 32'hc0 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_0p130208MHz;
      
      //generate  0.065104 (25/384) MHz clock
      //{1'b1, 32'h17d7840, 32'h180 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_0p065104MHz;
      
      //generate  0.032552 (25/768) MHz clock
      //{1'b1, 32'h17d7840, 32'h300 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_0p032552MHz;
      
      //generate  266.66 (800/3) MHz clock
      //{1'b1, 32'h2faf0800, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_266p667MHz;
      
      //generate  300 MHz clock
      //{1'b1, 32'h11e1a300, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_300MHz;
      
      //generate  150 MHz clock
      //{1'b1, 32'h8f0d180, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_150MHz;
      
      //generate  75 MHz clock
      //{1'b1, 32'h47868c0, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_75MHz;
      
      //generate  37.5 (75/2) MHz clock
      //{1'b1, 32'h47868c0, 32'h2 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_37p5MHz;
      
      //generate  18.75 (75/4) MHz clock
      //{1'b1, 32'h47868c0, 32'h4 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_18p75MHz;
      
      //generate  9.375 (75/8) MHz clock
      //{1'b1, 32'h47868c0, 32'h8 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_9p375MHz;
      
      //generate  480 MHz clock
      //{1'b1, 32'h1c9c3800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_480MHz;
      
      //generate  240 MHz clock
      //{1'b1, 32'he4e1c00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_240MHz;
      
      //generate  120 MHz clock
      //{1'b1, 32'h7270e00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_120MHz;
      
      //generate  60 MHz clock
      //{1'b1, 32'h3938700, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_60MHz;
      
      //generate  30 MHz clock
      //{1'b1, 32'h1c9c380, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_30MHz;
      
      //generate  15 MHz clock
      //{1'b1, 32'he4e1c0, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_15MHz;
      
      //generate  7.5 (15/2) MHz clock
      //{1'b1, 32'he4e1c0, 32'h2 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_7p5MHz;
      
      //generate  320 MHz clock
      //{1'b1, 32'h1312d000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_320MHz;
      
      //generate  160 MHz clock
      //{1'b1, 32'h9896800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_160MHz;
      
      //generate  80 MHz clock
      //{1'b1, 32'h4c4b400, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_80MHz;
      
      //generate  40 MHz clock
      //{1'b1, 32'h2625a00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_40MHz;
      
      //generate  20 MHz clock
      //{1'b1, 32'h1312d00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_20MHz;
      
      //generate  10 MHz clock
      //{1'b1, 32'h989680, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_10MHz;
      
      //generate  5 MHz clock
      //{1'b1, 32'h4c4b40, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_5MHz;
      
      //generate  192 MHz clock
      //{1'b1, 32'hb71b000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_192MHz;
      
      //generate  96 MHz clock
      //{1'b1, 32'h5b8d800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_96MHz;
      
      //generate  48 MHz clock
      //{1'b1, 32'h2dc6c00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_48MHz;
      
      //generate  24 MHz clock
        {1'b1, 32'h16e3600, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_24MHz;
      
      //generate  12 MHz clock
      //{1'b1, 32'hb71b00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_12MHz;
      
      //generate  6 MHz clock
      //{1'b1, 32'h5b8d80, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_6MHz;
      
      //generate  3 MHz clock
      //{1'b1, 32'h2dc6c0, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_3MHz;
      
      //generate  416.66 (1250/3) MHz clock
      //{1'b1, 32'h4a817c80, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_416p667MHz;
      
      //generate  208.33 (625/3) MHz clock
      //{1'b1, 32'h2540be40, 32'h3 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_208p333MHz;
      
      //generate  312.5 (625/2) MHz clock
      //{1'b1, 32'h2540be40, 32'h2 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_312p5MHz;
      
      //generate  156.25 (625/4) MHz clock
      //{1'b1, 32'h2540be40, 32'h4 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_156p25MHz;
      
      //generate  19.2 (96/5) MHz clock
        {1'b1, 32'h124F800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_19p2MHz;
      
      //generate  64 MHz clock
      //{1'b1, 32'h3d09000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_64MHz;
      
      //generate  32 MHz clock
      //{1'b1, 32'h1e84800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_32MHz;
      
      //generate  16 MHz clock
      //{1'b1, 32'hf42400, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_16MHz;
      
      //generate  8 MHz clock
      //{1'b1, 32'h7a1200, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_8MHz;
      
      //generate  4 MHz clock
      //{1'b1, 32'h3d0900, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_4MHz;
      
      //generate  2 MHz clock
      //{1'b1, 32'h1e8480, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_2MHz;
      
      //generate  1 MHz clock
      //{1'b1, 32'hf4240, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_1MHz;
      
      //generate  360 MHz clock
        //{1'b1, 32'h15752a00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_360MHz;
        // ltien: temp driving a 357 clock to this selection becuse 360 is not available, need to check with DE to confirm
        {1'b1, 32'h15752a00, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_357MHz;
      
      //generate  357 MHz clock, select can be both 357MHz or 357.1429MHz
      {1'b1, 32'h15476340, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_357MHz;
      {1'b1, 32'h15499174, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_357MHz;
      
      //generate  38.4 (192/5) MHz clock
        {1'b1, 32'h249F000, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_38p4MHz;
      
      //generate  19.2 (192/10) MHz clock
        {1'b1, 32'h124F800, 32'h1 } : clk_out_i = `EMULATION_CLOCKS.fixed_clk_19p2MHz;
      
      // by default tie the clock output to ground for debug easiness
      default                      : clk_out_i = 1'b0; 
      
      endcase
   end
// end of `elsif EMULATION_CLOCK 
`else // For other cases like IP EFFM compile, FC EFFM compile etc
    assign clk_out_i = 1'b0;

`endif

//assigning the clk_out to the output port
assign clk_out = clk_out_i;

`endif //EMULATION

endmodule

`endif //__EMU_CLK_OSC_SV__
