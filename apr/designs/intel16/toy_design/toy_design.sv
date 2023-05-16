/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP4
// Date      : Sat May 13 19:25:27 2023
/////////////////////////////////////////////////////////////


module toy_design ( d1, d2, o1, o2 );

input d1, d2;
output o1, o2;

wire wire1, wire2, wire3, wire4;


b0mfdw003ah1n24x5 u1 ( .si(1'b0), .d(d1), .ssb(1'b1), .clk(wire1), .rb(wire2), .o(o1) );
b0mfdw003ar1n24x5 u2 ( .si(1'b0), .d(d2), .ssb(1'b1), .clk(wire3), .rb(wire4), .o(o2) );


endmodule

