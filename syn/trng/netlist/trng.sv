/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP1
// Date      : Wed Apr 26 17:49:59 2023
/////////////////////////////////////////////////////////////


module trng ( clk, sel, dout );
  input [95:0] sel;
  output [23:0] dout;
  input clk;
  wire   clk_ro, u_counter_N24, u_counter_N23, u_counter_N22, u_counter_N21,
         u_counter_N20, u_counter_N19, u_counter_N18, u_counter_N17,
         u_counter_N16, u_counter_N15, u_counter_N14, u_counter_N13,
         u_counter_N12, u_counter_N11, u_counter_N10, u_counter_N9,
         u_counter_N8, u_counter_N7, u_counter_N6, u_counter_N5, u_counter_N4,
         u_counter_N3, u_counter_N2, u_counter_N1, n95, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131;
  wire   [23:0] u_counter_count;

  b0mnanb02ar1n02x5 U98 ( .a(clk_ro), .b(clk), .out0(clk_ro) );
  b0minv000ar1n03x5 U99 ( .a(u_counter_count[0]), .o1(u_counter_N1) );
  b0minv000ar1n03x5 U100 ( .a(u_counter_count[1]), .o1(n98) );
  b0mnorp02ar1n02x5 U101 ( .a(u_counter_N1), .b(n98), .o1(n131) );
  b0maoi012ar1n02x5 U102 ( .b(u_counter_N1), .c(n98), .a(n131), .o1(
        u_counter_N2) );
  b0mnandp2ar1n03x5 U104 ( .a(n130), .b(u_counter_count[3]), .o1(n100) );
  b0minv000ar1n03x5 U106 ( .a(u_counter_count[4]), .o1(n99) );
  b0mnorp02ar1n02x5 U107 ( .a(n99), .b(n100), .o1(n101) );
  b0maoi012ar1n02x5 U108 ( .b(n100), .c(n99), .a(n101), .o1(u_counter_N5) );
  b0mnandp2ar1n03x5 U109 ( .a(n101), .b(u_counter_count[5]), .o1(n103) );
  b0moa0012ar1n02x5 U110 ( .b(n101), .c(u_counter_count[5]), .a(n103), .o(
        u_counter_N6) );
  b0minv000ar1n03x5 U111 ( .a(u_counter_count[6]), .o1(n102) );
  b0mnorp02ar1n02x5 U112 ( .a(n102), .b(n103), .o1(n104) );
  b0maoi012ar1n02x5 U113 ( .b(n103), .c(n102), .a(n104), .o1(u_counter_N7) );
  b0mnandp2ar1n03x5 U114 ( .a(n104), .b(u_counter_count[7]), .o1(n106) );
  b0moa0012ar1n02x5 U115 ( .b(n104), .c(u_counter_count[7]), .a(n106), .o(
        u_counter_N8) );
  b0minv000ar1n03x5 U116 ( .a(u_counter_count[8]), .o1(n105) );
  b0mnorp02ar1n02x5 U117 ( .a(n105), .b(n106), .o1(n107) );
  b0maoi012ar1n02x5 U118 ( .b(n106), .c(n105), .a(n107), .o1(u_counter_N9) );
  b0mnandp2ar1n03x5 U119 ( .a(n107), .b(u_counter_count[9]), .o1(n109) );
  b0moa0012ar1n02x5 U120 ( .b(n107), .c(u_counter_count[9]), .a(n109), .o(
        u_counter_N10) );
  b0minv000ar1n03x5 U121 ( .a(u_counter_count[10]), .o1(n108) );
  b0mnorp02ar1n02x5 U122 ( .a(n108), .b(n109), .o1(n110) );
  b0maoi012ar1n02x5 U123 ( .b(n109), .c(n108), .a(n110), .o1(u_counter_N11) );
  b0mnandp2ar1n03x5 U124 ( .a(n110), .b(u_counter_count[11]), .o1(n112) );
  b0moa0012ar1n02x5 U125 ( .b(n110), .c(u_counter_count[11]), .a(n112), .o(
        u_counter_N12) );
  b0minv000ar1n03x5 U126 ( .a(u_counter_count[12]), .o1(n111) );
  b0mnorp02ar1n02x5 U127 ( .a(n111), .b(n112), .o1(n113) );
  b0maoi012ar1n02x5 U128 ( .b(n112), .c(n111), .a(n113), .o1(u_counter_N13) );
  b0mnandp2ar1n03x5 U129 ( .a(n113), .b(u_counter_count[13]), .o1(n115) );
  b0moa0012ar1n02x5 U130 ( .b(n113), .c(u_counter_count[13]), .a(n115), .o(
        u_counter_N14) );
  b0minv000ar1n03x5 U131 ( .a(u_counter_count[14]), .o1(n114) );
  b0mnorp02ar1n02x5 U132 ( .a(n114), .b(n115), .o1(n116) );
  b0maoi012ar1n02x5 U133 ( .b(n115), .c(n114), .a(n116), .o1(u_counter_N15) );
  b0mnandp2ar1n03x5 U134 ( .a(n116), .b(u_counter_count[15]), .o1(n118) );
  b0moa0012ar1n02x5 U135 ( .b(n116), .c(u_counter_count[15]), .a(n118), .o(
        u_counter_N16) );
  b0minv000ar1n03x5 U136 ( .a(u_counter_count[16]), .o1(n117) );
  b0mnorp02ar1n02x5 U137 ( .a(n117), .b(n118), .o1(n119) );
  b0maoi012ar1n02x5 U138 ( .b(n118), .c(n117), .a(n119), .o1(u_counter_N17) );
  b0mnandp2ar1n03x5 U139 ( .a(n119), .b(u_counter_count[17]), .o1(n122) );
  b0moa0012ar1n02x5 U140 ( .b(n119), .c(u_counter_count[17]), .a(n122), .o(
        u_counter_N18) );
  b0minv000ar1n03x5 U144 ( .a(u_counter_count[18]), .o1(n121) );
  b0mnorp02ar1n02x5 U145 ( .a(n121), .b(n122), .o1(n123) );
  b0maoi012ar1n02x5 U146 ( .b(n122), .c(n121), .a(n123), .o1(u_counter_N19) );
  b0mnandp2ar1n03x5 U147 ( .a(n123), .b(u_counter_count[19]), .o1(n125) );
  b0moa0012ar1n02x5 U148 ( .b(n123), .c(u_counter_count[19]), .a(n125), .o(
        u_counter_N20) );
  b0minv000ar1n03x5 U149 ( .a(u_counter_count[20]), .o1(n124) );
  b0mnorp02ar1n02x5 U150 ( .a(n124), .b(n125), .o1(n126) );
  b0maoi012ar1n02x5 U151 ( .b(n125), .c(n124), .a(n126), .o1(u_counter_N21) );
  b0mnandp2ar1n03x5 U152 ( .a(n126), .b(u_counter_count[21]), .o1(n128) );
  b0moa0012ar1n02x5 U153 ( .b(n126), .c(u_counter_count[21]), .a(n128), .o(
        u_counter_N22) );
  b0minv000ar1n03x5 U154 ( .a(u_counter_count[22]), .o1(n127) );
  b0mnorp02ar1n02x5 U155 ( .a(n127), .b(n128), .o1(n129) );
  b0maoi012ar1n02x5 U156 ( .b(n128), .c(n127), .a(n129), .o1(u_counter_N23) );
  b0mxor002ar1n02x5 U157 ( .a(u_counter_count[23]), .b(n129), .out0(
        u_counter_N24) );
  b0moab012ar1n02x5 U158 ( .b(n131), .c(u_counter_count[2]), .a(n130), .out0(
        u_counter_N3) );
  b0mfqy203ar1n02x5 u_counter_count_reg_0__u_counter_count_reg_1_ ( .si1(1'b0), 
        .d1(u_counter_N1), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[0]), .si2(1'b0), .d2(u_counter_N2), .o2(
        u_counter_count[1]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_2__u_counter_count_reg_3_ ( .si1(1'b0), 
        .d1(u_counter_N3), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[2]), .si2(1'b0), .d2(u_counter_N4), .o2(
        u_counter_count[3]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_4__u_counter_count_reg_5_ ( .si1(1'b0), 
        .d1(u_counter_N5), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[4]), .si2(1'b0), .d2(u_counter_N6), .o2(
        u_counter_count[5]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_6__u_counter_count_reg_7_ ( .si1(1'b0), 
        .d1(u_counter_N7), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[6]), .si2(1'b0), .d2(u_counter_N8), .o2(
        u_counter_count[7]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_8__u_counter_count_reg_9_ ( .si1(1'b0), 
        .d1(u_counter_N9), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[8]), .si2(1'b0), .d2(u_counter_N10), .o2(
        u_counter_count[9]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_10__u_counter_count_reg_11_ ( .si1(
        1'b0), .d1(u_counter_N11), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[10]), .si2(1'b0), .d2(u_counter_N12), .o2(
        u_counter_count[11]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_12__u_counter_count_reg_13_ ( .si1(
        1'b0), .d1(u_counter_N13), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[12]), .si2(1'b0), .d2(u_counter_N14), .o2(
        u_counter_count[13]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_14__u_counter_count_reg_15_ ( .si1(
        1'b0), .d1(u_counter_N15), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[14]), .si2(1'b0), .d2(u_counter_N16), .o2(
        u_counter_count[15]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_16__u_counter_count_reg_17_ ( .si1(
        1'b0), .d1(u_counter_N17), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[16]), .si2(1'b0), .d2(u_counter_N18), .o2(
        u_counter_count[17]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_18__u_counter_count_reg_19_ ( .si1(
        1'b0), .d1(u_counter_N19), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[18]), .si2(1'b0), .d2(u_counter_N20), .o2(
        u_counter_count[19]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_20__u_counter_count_reg_21_ ( .si1(
        1'b0), .d1(u_counter_N21), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[20]), .si2(1'b0), .d2(u_counter_N22), .o2(
        u_counter_count[21]) );
  b0mfqy203ar1n02x5 u_counter_count_reg_22__u_counter_count_reg_23_ ( .si1(
        1'b0), .d1(u_counter_N23), .ssb(1'b1), .clk(clk_ro), .rb(n95), .o1(
        u_counter_count[22]), .si2(1'b0), .d2(u_counter_N24), .o2(
        u_counter_count[23]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_0__u_counter_dout_reg_1_ ( .si1(1'b0), 
        .d1(u_counter_count[0]), .ssb(1'b1), .clk(clk), .o1(dout[0]), .si2(
        1'b0), .d2(u_counter_count[1]), .o2(dout[1]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_2__u_counter_dout_reg_3_ ( .si1(1'b0), 
        .d1(u_counter_count[2]), .ssb(1'b1), .clk(clk), .o1(dout[2]), .si2(
        1'b0), .d2(u_counter_count[3]), .o2(dout[3]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_4__u_counter_dout_reg_5_ ( .si1(1'b0), 
        .d1(u_counter_count[4]), .ssb(1'b1), .clk(clk), .o1(dout[4]), .si2(
        1'b0), .d2(u_counter_count[5]), .o2(dout[5]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_6__u_counter_dout_reg_7_ ( .si1(1'b0), 
        .d1(u_counter_count[6]), .ssb(1'b1), .clk(clk), .o1(dout[6]), .si2(
        1'b0), .d2(u_counter_count[7]), .o2(dout[7]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_8__u_counter_dout_reg_9_ ( .si1(1'b0), 
        .d1(u_counter_count[8]), .ssb(1'b1), .clk(clk), .o1(dout[8]), .si2(
        1'b0), .d2(u_counter_count[9]), .o2(dout[9]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_10__u_counter_dout_reg_11_ ( .si1(1'b0), 
        .d1(u_counter_count[10]), .ssb(1'b1), .clk(clk), .o1(dout[10]), .si2(
        1'b0), .d2(u_counter_count[11]), .o2(dout[11]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_12__u_counter_dout_reg_13_ ( .si1(1'b0), 
        .d1(u_counter_count[12]), .ssb(1'b1), .clk(clk), .o1(dout[12]), .si2(
        1'b0), .d2(u_counter_count[13]), .o2(dout[13]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_14__u_counter_dout_reg_15_ ( .si1(1'b0), 
        .d1(u_counter_count[14]), .ssb(1'b1), .clk(clk), .o1(dout[14]), .si2(
        1'b0), .d2(u_counter_count[15]), .o2(dout[15]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_16__u_counter_dout_reg_17_ ( .si1(1'b0), 
        .d1(u_counter_count[16]), .ssb(1'b1), .clk(clk), .o1(dout[16]), .si2(
        1'b0), .d2(u_counter_count[17]), .o2(dout[17]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_18__u_counter_dout_reg_19_ ( .si1(1'b0), 
        .d1(u_counter_count[18]), .ssb(1'b1), .clk(clk), .o1(dout[18]), .si2(
        1'b0), .d2(u_counter_count[19]), .o2(dout[19]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_20__u_counter_dout_reg_21_ ( .si1(1'b0), 
        .d1(u_counter_count[20]), .ssb(1'b1), .clk(clk), .o1(dout[20]), .si2(
        1'b0), .d2(u_counter_count[21]), .o2(dout[21]) );
  b0mfpy200ar1n02x5 u_counter_dout_reg_22__u_counter_dout_reg_23_ ( .si1(1'b0), 
        .d1(u_counter_count[22]), .ssb(1'b1), .clk(clk), .o1(dout[22]), .si2(
        1'b0), .d2(u_counter_count[23]), .o2(dout[23]) );
  b0moa0012ar1n02x5 U105 ( .b(n130), .c(u_counter_count[3]), .a(n100), .o(
        u_counter_N4) );
  b0mnano22ar1n02x5 U103 ( .a(u_counter_count[0]), .b(u_counter_count[2]), .c(
        n98), .out0(n130) );
  b0minv000ar1n03x5 U95 ( .a(clk), .o1(n95) );
endmodule

