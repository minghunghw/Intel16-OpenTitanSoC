`timescale 1ps / 1ps


module emu_clk_osc_tb;

  // Inputs
  reg enable;
  reg [31:0] numerator;
  reg [31:0] denominator;

  // Outputs
  wire clk_out;

  // Instantiate the DUT
  emu_clk_osc my_clk_osc (
    .enable(enable),
    .numerator(numerator),
    .denominator(denominator),
    .clk_out(clk_out)
  );



  // Test sequence
  initial begin
    // Enable the clock with numerator = 1 and denominator = 1
    enable = 1'b1;
    numerator = 32'h23c34600;
    denominator = 32'h1;

  end
endmodule
