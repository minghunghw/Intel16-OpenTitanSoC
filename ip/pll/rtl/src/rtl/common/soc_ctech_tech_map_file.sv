module soc_ctech_lib_nand2 (
   input logic a,
   input logic b,
   output logic o
  );
  
ctech_lib_nand2 soc_ctech_nand2_dcszo(
   .a        (a),
   .b        (b),
   .o        (o)
);
endmodule

module soc_ctech_lib_xor2 (
   input logic a,
   input logic b,
   output logic o
  );
  
ctech_lib_xor2 soc_ctech_lib_xor2_dcszo(
   .a        (a),
   .b        (b),
   .o        (o)
);
endmodule

module soc_ctech_lib_or2 (
   input logic a,
   input logic b,
   output logic o
  );
  
ctech_lib_or soc_ctech_lib_or2_dcszo(
   .a        (a),
   .b        (b),
   .o        (o)
);
endmodule


module soc_ctech_lib_doublesync_rstb  #(
  parameter WIDTH        = 1  
) (
  input  logic clk,
  input  logic [WIDTH-1:0] d,
  input  logic rstb,
  output logic [WIDTH-1:0] o
);

ctech_lib_doublesync_rstb # (  
            .WIDTH                              (WIDTH),
            .MIN_PERIOD                         (0),
            .SINGLE_BUS_META                    (0),
            .METASTABILITY_EN                   (1),
            .PULSE_WIDTH_CHECK                  (0),
            .ENABLE_3TO1                        (1),
            .PLUS1_ONLY                         (0),
            .MINUS1_ONLY                        (0),
            .TX_MODE                            (0)
     ) doublesync_rstb (
            .rstb                               (rstb),
            .clk                                (clk),
            .d                                  (d),
            .o                                  (o)
 );

endmodule

module soc_ctech_lib_doublesync_setb  #(
  parameter WIDTH        = 1  
) (
  input  logic clk,
  input  logic [WIDTH-1:0] d,
  input  logic setb,
  output logic [WIDTH-1:0] o
);

ctech_lib_doublesync_setb # (  
            .WIDTH                              (WIDTH),
            .MIN_PERIOD                         (0),
            .SINGLE_BUS_META                    (0),
            .METASTABILITY_EN                   (1),
            .PULSE_WIDTH_CHECK                  (0),
            .ENABLE_3TO1                        (1),
            .PLUS1_ONLY                         (0),
            .MINUS1_ONLY                        (0),
            .TX_MODE                            (0)
     ) doublesync_setb (
            .setb                               (setb),
            .clk                                (clk),
            .d                                  (d),
            .o                                  (o)
 );

endmodule

module soc_ctech_lib_clk_gate_te (
  input logic clk,
  input logic en,
  input logic te,
  output logic clkout);
  
  ctech_lib_clk_gate_te clkgate (.clk(clk), .en(en), .te(te), .clkout(clkout));
endmodule

module soc_ctech_clk_div2_rstb (
  input logic clk,
  input logic rstb,
  output logic clkout
);

  ctech_lib_clk_divider2_rstb divider(.clk(clk), .rstb(rstb), .clkout(clkout));
endmodule


module soc_ctech_clk2to1mux (
   input wire ckin1,
   input wire ckin2,
   input wire muxselect,
   output wire ckmuxout 
);
  ctech_lib_clk_mux_2to1 soc_ctech_clk2to1mux_dcszo (.clkout(ckmuxout), .s(muxselect), .clk1(ckin2), .clk2(ckin1)); // note that clocks are intentionally switched due to mux polarity
endmodule // soc_ctech_clkmux2to1

module soc_ctech_clkmux2to1 (
   input wire ckin1,
   input wire ckin2,
   input wire muxselect,
   output wire ckmuxout 
);
  ctech_lib_clk_mux_2to1 soc_ctech_clkmux2to1_dcszo (.clkout(ckmuxout), .s(muxselect), .clk1(ckin2), .clk2(ckin1)); // note that clocks are intentionally switched due to mux polarity
endmodule // soc_ctech_clkmux2to1

module soc_ctech_make_clk_2to1mux (
   input wire clkmuxin1,
   input wire clkmuxin2,
   input wire clkmuxselect,
   output wire clkmuxout 
);
  ctech_lib_clk_mux_2to1 soc_ctech_clkmux2to1_dcszo (.clkout(clkmuxout), .s(clkmuxselect), .clk1(clkmuxin2), .clk2(clkmuxin1)); // note that clocks are intentionally switched due to mux polarity
endmodule 


module soc_ctech_clk_gate_kin (
  output logic ckrcbxpn1,
  input  logic ckgridxpn1,
  input  logic latrcben1,
  input  logic testen1
);
  ctech_lib_clk_gate_and soc_ctech_clk_gate_kin_and_dcszo (.clkout(ckrcbxpn1), .clk(ckgridxpn1), .en(latrcben1|testen1));
endmodule

module soc_ctech_clk_gate_w_override (
  output logic o,
  input  logic clk,
  input  logic pwrgate,
  input  logic override
);
  ctech_lib_clk_gate_and soc_ctech_clk_gate_kin_and_dcszo (.clkout(o), .clk(clk), .en(pwrgate|override));
endmodule


module soc_ctech_clk_nand (
  output logic o,
  input  logic ck1,
  input  logic ck2
);
  ctech_lib_clk_nand soc_ctech_clk_nand_dcszo (.clkout(o), .clk1(ck1), .clk2(ck2));
endmodule


module soc_ctech_clkbf (
  input wire clkbufin,
  output wire clkbufout
);
  ctech_lib_clk_buf soc_ctech_clkbf_dcszo (.clk(clkbufin), .clkout(clkbufout));
endmodule


module soc_ctech_clkinv (
  output logic ckinvout,
  input  logic ckinvin
);
  ctech_lib_clk_inv soc_ctech_clkinv_dcszo (.clk(ckinvin), .clkout(ckinvout));
endmodule

module soc_ctech_make_clk_inv (
  output logic ckinvout,
  input  logic ckinvin
);
  ctech_lib_clk_inv soc_ctech_make_clk_inv_dcszo (.clk(ckinvin), .clkout(ckinvout));
endmodule

module soc_ctech_make_clknor (
  output logic clkout,
  input  logic clkin1,
  input  logic clkin2
);
  ctech_lib_clk_nor soc_ctech_clknor_dcszo (.clkout(clkout), .clk1(clkin1), .clk2(clkin2));
endmodule

module soc_ctech_clknor (
  output logic o,
  input  logic ck1,
  input  logic ck2
);
  ctech_lib_clk_nor soc_ctech_clknor_dcszo (.clkout(o), .clk1(ck1), .clk2(ck2));
endmodule


module soc_ctech_data2to1mux (
  input  wire in1,
  input  wire in2,
  input  wire muxselect,
  output wire muxout 
);
  ctech_lib_mux_2to1 soc_ctech_data2to1mux_dcszo (.d1(in2), .d2(in1), .s(muxselect), .o(muxout));
endmodule

module soc_ctech_datamux2to1 (
  input  wire in1,
  input  wire in2,
  input  wire muxselect,
  output wire muxout 
);
  ctech_lib_mux_2to1 soc_ctech_datamux2to1_dcszo (.d1(in2), .d2(in1), .s(muxselect), .o(muxout));
endmodule


module soc_ctech_soc_rbe_clk (
  output logic ckrcbxpn,
  input  logic ckgridxpn,
  input  logic latrcben
);
  ctech_lib_clk_gate_and soc_ctech_soc_rbe_clk_latch_dcszo (.clkout(latrcben), .clk(ckgridxpn), .en(latrcben));
endmodule

module soc_ctech_clk_gate (
   input wire  ckgridxpn,
   input wire  latrcben,
   output wire ckrcbxpn
);

  ctech_lib_clk_gate_and soc_ctech_clk_gate_kin_and_dcszo (.clkout(ckrcbxpn), .clk(ckgridxpn), .en(latrcben));
endmodule

module scs_clk_gate (
  output logic clkout,
  input logic clk,
  input logic en,
  input logic te);

  ctech_lib_clk_gate_te scs_clk_gate_inst (.clk(clk), .en(en), .te(te), .clkout(clkout));
endmodule

module soc_ctech_or (
   input wire a,
   input wire b,
   output wire o
);
   ctech_lib_or soc_ctech_or_dcszo (.a(a), .b(b), .o(o));
endmodule

module soc_ctech_clk_en (
   output wire clkout,
   input  wire clk,
   input  wire en
);
   ctech_lib_clk_nand_en soc_ctech_clk_en_dcszo (.clkout(clkout), .clk(clk), .en(en));
endmodule

//module soc_ctech_async_rst_2msff_meta #(parameter width=1) (
//  input  wire  clk,
//  input  wire  [width-1:0] i, 
//  input  wire  rstb,
//  output reg [width-1:0] q
//);
//
//  ctech_lib_msff_async_rst_meta soc_ctech_async_rst_2msff_meta_dcszo [width-1:0] (.o(q), .d(i), .clk(clk), .rb(rstb), .ssb({width{1'b0}}));
//endmodule // soc_ctech_async_rst_2msff_meta


//module soc_ctech_async_rst_msff #(parameter width=1) (
//  output logic [width-1:0] q,
//  input  logic [width-1:0] i,
//  input  logic clock,
//  input  logic rst
//);
//
//  ctech_lib_msff_async_rst soc_ctech_async_rst_msff_dcszo [width-1:0]  (.o(q), .d(i), .clk(clock), .rb(~rst));
//endmodule


//module soc_ctech_async_rstd_msff #(parameter width=1) (
//  output logic [width-1:0] q,
//  input  logic [width-1:0] i,
//  input  logic clock,
//  input  logic rst,
//  input  logic [width-1:0] rstd
//);
//  logic [width-1:0] rbi,psi;
////  assign rbi=rst ?  rstd : {width {1'b1}};
////  assign psi=rst ? ~rstd : {width {1'b1}};
//  assign rbi = {width {!rst}} & rstd;
//  assign psi = {width {!rst}} & ~rstd;
//
//  ctech_lib_msff_async_rst_set soc_ctech_async_rstd_msff_dcszo [width-1:0]  (.o(q), .d(i), .clk(clock), .rb(rbi), .psb(psi));
//endmodule


//module soc_ctech_async_set_2msff_meta #(parameter width=1) (
//  output logic [width-1:0] q,
//  input  logic [width-1:0] i,
//  input  logic clk,
//  input  logic psb
//); 
//  ctech_lib_msff_async_set_meta soc_ctech_async_set_2msff_meta_dcszo [width-1:0]  (.o(q), .d(i), .clk(clk), .psb(psb));
//endmodule
//
//
//module soc_ctech_async_set_msff #(parameter width=1) (
//  output logic [width-1:0] q,
//  input  logic [width-1:0] i,
//  input  logic clock,
//  input  logic set
//);
//  ctech_lib_msff_async_set soc_ctech_async_set_msff_dcszo [width-1:0]  (.o(q), .d(i), .clk(clock), .psb(~set));
//endmodule


//module soc_ctech_clkand (
//  input  wire inclk,
//  input  wire enable,
//  output wire outclk
//);
//  ctech_lib_clk_and soc_ctech_clkand_dcszo (.clkout(outclk), .clk(inclk), .en(enable));
//endmodule

//module soc_ctech_clkor (
//  output logic clkorout,
//  input  logic clkorin1,
//  input  logic clkorin2
//);
//  ctech_lib_clk_or soc_ctech_clknor_dcszo (.clkout(clkorout), .clk1(clkorin1), .clk2(clkorin2));
//endmodule
//
//module soc_ctech_make_clkor (
//  output logic clkorout,
//  input  logic clkorin1,
//  input  logic clkorin2
//);
//  ctech_lib_clk_or soc_ctech_clknor_dcszo (.clkout(clkorout), .clk1(clkorin1), .clk2(clkorin2));
//endmodule

//module soc_ctech_latch_p #(parameter width=1) (
//  output logic [width-1:0] q,
//  input  logic [width-1:0] i,
//  input  logic clock
//);
//  ctech_lib_latch_p soc_ctech_latch_p_dcszo [width-1:0]  (.o(q), .clkb(clock), .d(i));
//endmodule


//module soc_ctech_dataand (
//   input wire ind1,
//   input wire ind2,
//   output logic outd
//   );
//   ctech_lib_and2 soc_ctech_dataand_dcszo (.a(ind1), .b(ind2), .o(outd));
//   endmodule   


//module soc_ctech_clk_and_en (
//  output logic  o,
//  input wire  ck,
//  input wire en
//  );
//  ctech_lib_clk_and_en soc_ctech_clk_gate_kin_and_dcszo (.clkout(o), .clk(ck), .en(en));
//endmodule   

//module soc_ctech_make_clk_div2_reset  (
//  output logic ckdiv2rout,
//  input wire ckdiv2rin,
//  input wire ckdiv2clkin,
//  input wire ckdiv2resetin
//  );
//  ctech_lib_clk_div2_reset soc_ctech_make_clk_div2_reset_dcszo (.clkout(ckdiv2rout), .in(ckdiv2rin), .clk(ckdiv2clkin), .rst(ckdiv2resetin));
//endmodule
