/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP1
// Date      : Sat Sep 24 16:11:30 2022
/////////////////////////////////////////////////////////////


module mem_tlul ( clk_i, rst_ni, tl_d_i, tl_d_o );
  input [108:0] tl_d_i;
  output [65:0] tl_d_o;
  input clk_i, rst_ni;
  wire   rvalid, wen, N1, n_0_net_, u_tlul_adapter_sram_N210,
         u_tlul_adapter_sram_reqfifo_wdata_op__0_,
         u_tlul_adapter_sram_u_reqfifo_net650,
         u_tlul_adapter_sram_u_reqfifo_net644,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst,
         u_tlul_adapter_sram_u_rspfifo_net622,
         u_tlul_adapter_sram_u_rspfifo_net616,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9, n126,
         n131, n170, n175, n188, n189, n192, n197, n211, n317, n318, n319,
         n322, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n433, n460, n461, n462,
         n463, n465, n493;
  wire   [10:0] addr;
  wire   [31:0] wdata;
  wire   [31:0] rdata;
  wire   [31:0] u_tlul_adapter_sram_rdata_tlword;
  wire   [16:0] u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata;
  wire   [4:1] u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata
;
  wire   [39:0] u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata;

  ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h u_sram ( .adr(addr), .din(
        wdata), .mc({1'b0, 1'b0, 1'b0}), .q(rdata), .wa({1'b0, 1'b0}), 
        .wpulse({1'b0, 1'b0}), .clk(clk_i), .clkbyp(1'b0), .fwen(1'b0), .mcen(
        1'b0), .ren(n_0_net_), .wen(wen), .wpulseen(1'b1) );
  b15fpy000ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__0_ ( 
        .si(1'b0), .d(n189), .ssb(1'b1), .clk(clk_i), .o(n188) );
  b15fpy000ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__8_ ( 
        .si(1'b0), .d(tl_d_i[100]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[8]) );
  b15fpy000ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__26_ ( 
        .si(1'b0), .d(u_tlul_adapter_sram_rdata_tlword[18]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net622), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[26]) );
  b15fpy000ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__39_ ( 
        .si(1'b0), .d(u_tlul_adapter_sram_rdata_tlword[31]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net622), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[39]) );
  b15nandp2ar1n05x5 U428 ( .a(n333), .b(rvalid), .o1(n414) );
  b15aob012ar1n04x5 U434 ( .b(n322), .c(n324), .a(n317), .out0(n318) );
  b15nor002ar1n03x5 U435 ( .a(n414), .b(n318), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b15nor002ar1n03x5 U438 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(n319), 
        .o1(n126) );
  b15nanb02ar1n02x5 U439 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), 
        .out0(n332) );
  b15nandp2ar1n03x5 U440 ( .a(n333), .b(n332), .o1(tl_d_o[62]) );
  b15nandp2ar1n05x5 U445 ( .a(rvalid), .b(n325), .o1(n326) );
  b15nandp2ar1n03x5 U452 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .b(
        n431), .o1(n331) );
  b15nandp2ar1n05x5 U458 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]), 
        .b(n415), .o1(n350) );
  b15nonb02ar1n02x3 U459 ( .a(rdata[29]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[29]) );
  b15aoi022ar1n02x3 U466 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[37]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[29]), .o1(n343) );
  b15nandp2ar1n03x5 U468 ( .a(n431), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .o1(
        n341) );
  b15nor002ar1n03x5 U470 ( .a(n375), .b(n374), .o1(n338) );
  b15nor003ar1n02x7 U471 ( .a(n338), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), .c(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]), .o1(
        n339) );
  b15nandp2ar1n05x5 U474 ( .a(n343), .b(n433), .o1(tl_d_o[45]) );
  b15nonb02ar1n02x3 U475 ( .a(rdata[28]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[28]) );
  b15aoi022ar1n02x3 U476 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[36]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[28]), .o1(n344) );
  b15nandp2ar1n05x5 U477 ( .a(n344), .b(n433), .o1(tl_d_o[44]) );
  b15nonb02ar1n02x3 U478 ( .a(rdata[31]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[31]) );
  b15aoi022ar1n02x3 U479 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[39]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[31]), .o1(n345) );
  b15nandp2ar1n05x5 U480 ( .a(n345), .b(n433), .o1(tl_d_o[47]) );
  b15nonb02ar1n02x3 U481 ( .a(rdata[30]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[30]) );
  b15aoi022ar1n02x3 U482 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[38]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[30]), .o1(n346) );
  b15nandp2ar1n05x5 U483 ( .a(n346), .b(n433), .o1(tl_d_o[46]) );
  b15nonb02ar1n02x3 U484 ( .a(rdata[26]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[26]) );
  b15aoi022ar1n02x3 U485 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[34]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[26]), .o1(n347) );
  b15nandp2ar1n05x5 U486 ( .a(n347), .b(n433), .o1(tl_d_o[42]) );
  b15nonb02ar1n02x3 U487 ( .a(rdata[27]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[27]) );
  b15aoi022ar1n02x3 U488 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[35]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[27]), .o1(n348) );
  b15nandp2ar1n05x5 U489 ( .a(n348), .b(n433), .o1(tl_d_o[43]) );
  b15nonb02ar1n02x3 U490 ( .a(rdata[25]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[25]) );
  b15aoi022ar1n02x3 U491 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[33]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[25]), .o1(n349) );
  b15nandp2ar1n05x5 U492 ( .a(n349), .b(n433), .o1(tl_d_o[41]) );
  b15nonb02ar1n02x3 U493 ( .a(rdata[24]), .b(n350), .out0(
        u_tlul_adapter_sram_rdata_tlword[24]) );
  b15aoi022ar1n02x3 U494 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[32]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[24]), .o1(n351) );
  b15nandp2ar1n05x5 U495 ( .a(n351), .b(n460), .o1(tl_d_o[40]) );
  b15inv000ar1n05x5 U496 ( .a(tl_d_i[61]), .o1(n355) );
  b15nor003ar1n02x7 U497 ( .a(tl_d_i[57]), .b(tl_d_i[56]), .c(n355), .o1(n373)
         );
  b15nor003ar1n02x7 U498 ( .a(tl_d_i[61]), .b(tl_d_i[58]), .c(tl_d_i[59]), 
        .o1(n372) );
  b15inv000ar1n05x5 U499 ( .a(tl_d_i[100]), .o1(n371) );
  b15inv000ar1n05x5 U500 ( .a(tl_d_i[108]), .o1(n409) );
  b15aoi112ar1n02x3 U501 ( .c(tl_d_i[105]), .d(tl_d_i[107]), .a(tl_d_i[106]), 
        .b(n409), .o1(n354) );
  b15nand03ar1n03x5 U503 ( .a(n362), .b(n371), .c(n355), .o1(n352) );
  b15aoai13ar1n02x3 U504 ( .c(tl_d_i[60]), .d(tl_d_i[100]), .b(tl_d_i[101]), 
        .a(n352), .o1(n353) );
  b15nand04ar1n04x3 U505 ( .a(tl_d_i[15]), .b(tl_d_i[18]), .c(n354), .d(n353), 
        .o1(n369) );
  b15nor002ar1n03x5 U506 ( .a(tl_d_i[59]), .b(tl_d_i[58]), .o1(n357) );
  b15aoi012ar1n02x5 U507 ( .b(tl_d_i[57]), .c(tl_d_i[60]), .a(tl_d_i[56]), 
        .o1(n356) );
  b15aoi022ar1n02x3 U508 ( .a(tl_d_i[61]), .b(n357), .c(n356), .d(n355), .o1(
        n358) );
  b15oai012ar1n03x5 U509 ( .b(tl_d_i[57]), .c(n371), .a(n358), .o1(n361) );
  b15inv000ar1n05x5 U510 ( .a(tl_d_i[58]), .o1(n418) );
  b15aoai13ar1n02x3 U512 ( .c(tl_d_i[56]), .d(tl_d_i[57]), .b(n359), .a(
        tl_d_i[59]), .o1(n360) );
  b15oai022ar1n02x5 U513 ( .a(tl_d_i[101]), .b(n361), .c(n418), .d(n360), .o1(
        n367) );
  b15oai012ar1n03x5 U515 ( .b(tl_d_i[60]), .c(n417), .a(n372), .o1(n365) );
  b15aoi022ar1n02x3 U516 ( .a(tl_d_i[60]), .b(tl_d_i[58]), .c(tl_d_i[59]), .d(
        n362), .o1(n363) );
  b15aoi112ar1n02x3 U517 ( .c(n373), .d(n363), .a(tl_d_i[100]), .b(tl_d_i[101]), .o1(n364) );
  b15aoai13ar1n02x3 U518 ( .c(tl_d_i[60]), .d(tl_d_i[56]), .b(n365), .a(n364), 
        .o1(n366) );
  b15oai013ar1n02x5 U519 ( .b(tl_d_i[107]), .c(tl_d_i[105]), .d(n367), .a(n366), .o1(n368) );
  b15nor004ar1n02x7 U520 ( .a(tl_d_i[17]), .b(tl_d_i[16]), .c(n369), .d(n368), 
        .o1(n370) );
  b15oai013ar1n02x5 U521 ( .b(n373), .c(n372), .d(n371), .a(n370), .o1(
        u_tlul_adapter_sram_N210) );
  b15nor003ar1n02x7 U522 ( .a(tl_d_i[107]), .b(tl_d_i[106]), .c(n409), .o1(wen) );
  b15inv000ar1n03x5 U523 ( .a(n374), .o1(n376) );
  b15aoi012ar1n02x5 U524 ( .b(n376), .c(n375), .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), .o1(n412) );
  b15aoi012ar1n02x5 U526 ( .b(n378), .c(n377), .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .o1(n413) );
  b15nandp2ar1n03x5 U527 ( .a(n413), .b(N1), .o1(n422) );
  b15inv000ar1n05x5 U528 ( .a(n422), .o1(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b15nandp2ar1n05x5 U529 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), 
        .b(n415), .o1(n398) );
  b15nonb02ar1n02x3 U530 ( .a(rdata[22]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[22]) );
  b15aoi022ar1n02x3 U531 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[30]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[22]), .o1(n379) );
  b15nandp2ar1n05x5 U532 ( .a(n379), .b(n460), .o1(tl_d_o[38]) );
  b15nandp2ar1n05x5 U533 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), 
        .b(n415), .o1(n404) );
  b15nonb02ar1n02x3 U534 ( .a(rdata[14]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[14]) );
  b15aoi022ar1n02x3 U535 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[22]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[14]), .o1(n380) );
  b15nandp2ar1n05x5 U536 ( .a(n380), .b(n433), .o1(tl_d_o[30]) );
  b15nandp2ar1n05x5 U537 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]), 
        .b(n415), .o1(n402) );
  b15nonb02ar1n02x3 U538 ( .a(rdata[6]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[6]) );
  b15aoi022ar1n02x3 U539 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[14]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[6]), .o1(n381) );
  b15nandp2ar1n05x5 U540 ( .a(n381), .b(n433), .o1(tl_d_o[22]) );
  b15nonb02ar1n02x3 U541 ( .a(rdata[20]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[20]) );
  b15aoi022ar1n02x3 U542 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[28]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[20]), .o1(n382) );
  b15nandp2ar1n05x5 U543 ( .a(n382), .b(n460), .o1(tl_d_o[36]) );
  b15nonb02ar1n02x3 U544 ( .a(rdata[4]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[4]) );
  b15aoi022ar1n02x3 U545 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[12]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[4]), .o1(n383) );
  b15nandp2ar1n05x5 U546 ( .a(n383), .b(n433), .o1(tl_d_o[20]) );
  b15nonb02ar1n02x3 U547 ( .a(rdata[5]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[5]) );
  b15aoi022ar1n02x3 U548 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[13]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[5]), .o1(n384) );
  b15nandp2ar1n05x5 U549 ( .a(n384), .b(n433), .o1(tl_d_o[21]) );
  b15nonb02ar1n02x3 U550 ( .a(rdata[19]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[19]) );
  b15aoi022ar1n02x3 U551 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[27]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[19]), .o1(n385) );
  b15nandp2ar1n05x5 U552 ( .a(n385), .b(n460), .o1(tl_d_o[35]) );
  b15nonb02ar1n02x3 U553 ( .a(rdata[7]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[7]) );
  b15aoi022ar1n02x3 U554 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[15]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[7]), .o1(n386) );
  b15nandp2ar1n05x5 U555 ( .a(n386), .b(n433), .o1(tl_d_o[23]) );
  b15nonb02ar1n02x3 U556 ( .a(rdata[8]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[8]) );
  b15aoi022ar1n02x3 U557 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[16]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[8]), .o1(n387) );
  b15nandp2ar1n05x5 U558 ( .a(n387), .b(n433), .o1(tl_d_o[24]) );
  b15nonb02ar1n02x3 U559 ( .a(rdata[9]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[9]) );
  b15aoi022ar1n02x3 U560 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[17]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[9]), .o1(n388) );
  b15nandp2ar1n05x5 U561 ( .a(n388), .b(n433), .o1(tl_d_o[25]) );
  b15nonb02ar1n02x3 U562 ( .a(rdata[10]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[10]) );
  b15aoi022ar1n02x3 U563 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[18]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[10]), .o1(n389) );
  b15nandp2ar1n05x5 U564 ( .a(n389), .b(n460), .o1(tl_d_o[26]) );
  b15nonb02ar1n02x3 U565 ( .a(rdata[3]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[3]) );
  b15aoi022ar1n02x3 U566 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[3]), .o1(n390) );
  b15nandp2ar1n05x5 U567 ( .a(n390), .b(n433), .o1(tl_d_o[19]) );
  b15nonb02ar1n02x3 U568 ( .a(rdata[17]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[17]) );
  b15aoi022ar1n02x3 U569 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[25]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[17]), .o1(n391) );
  b15nandp2ar1n05x5 U570 ( .a(n391), .b(n460), .o1(tl_d_o[33]) );
  b15nonb02ar1n02x3 U571 ( .a(rdata[18]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[18]) );
  b15aoi022ar1n02x3 U572 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[26]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[18]), .o1(n392) );
  b15nandp2ar1n05x5 U573 ( .a(n392), .b(n460), .o1(tl_d_o[34]) );
  b15nonb02ar1n02x3 U574 ( .a(rdata[11]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[11]) );
  b15aoi022ar1n02x3 U575 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[19]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[11]), .o1(n393) );
  b15nandp2ar1n05x5 U576 ( .a(n393), .b(n460), .o1(tl_d_o[27]) );
  b15nonb02ar1n02x3 U577 ( .a(rdata[2]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[2]) );
  b15aoi022ar1n02x3 U578 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[2]), .o1(n394) );
  b15nandp2ar1n05x5 U579 ( .a(n394), .b(n433), .o1(tl_d_o[18]) );
  b15nonb02ar1n02x3 U580 ( .a(rdata[21]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[21]) );
  b15aoi022ar1n02x3 U581 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[29]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[21]), .o1(n395) );
  b15nandp2ar1n05x5 U582 ( .a(n395), .b(n460), .o1(tl_d_o[37]) );
  b15nonb02ar1n02x3 U583 ( .a(rdata[12]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[12]) );
  b15aoi022ar1n02x3 U584 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[20]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[12]), .o1(n396) );
  b15nandp2ar1n05x5 U585 ( .a(n396), .b(n460), .o1(tl_d_o[28]) );
  b15nonb02ar1n02x3 U586 ( .a(rdata[23]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[23]) );
  b15aoi022ar1n02x3 U587 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[31]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[23]), .o1(n397) );
  b15nandp2ar1n05x5 U588 ( .a(n397), .b(n460), .o1(tl_d_o[39]) );
  b15nonb02ar1n02x3 U589 ( .a(rdata[16]), .b(n398), .out0(
        u_tlul_adapter_sram_rdata_tlword[16]) );
  b15aoi022ar1n02x3 U590 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[24]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[16]), .o1(n399) );
  b15nandp2ar1n05x5 U591 ( .a(n399), .b(n460), .o1(tl_d_o[32]) );
  b15nonb02ar1n02x3 U592 ( .a(rdata[0]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[0]) );
  b15aoi022ar1n02x3 U593 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[0]), .o1(n400) );
  b15nandp2ar1n05x5 U594 ( .a(n400), .b(n460), .o1(tl_d_o[16]) );
  b15nonb02ar1n02x3 U595 ( .a(rdata[13]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[13]) );
  b15aoi022ar1n02x3 U596 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[21]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[13]), .o1(n401) );
  b15nandp2ar1n05x5 U597 ( .a(n401), .b(n460), .o1(tl_d_o[29]) );
  b15nonb02ar1n02x3 U598 ( .a(rdata[1]), .b(n402), .out0(
        u_tlul_adapter_sram_rdata_tlword[1]) );
  b15aoi022ar1n02x3 U599 ( .a(n463), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]), .c(
        n465), .d(u_tlul_adapter_sram_rdata_tlword[1]), .o1(n403) );
  b15nandp2ar1n05x5 U600 ( .a(n403), .b(n460), .o1(tl_d_o[17]) );
  b15nonb02ar1n02x3 U601 ( .a(rdata[15]), .b(n404), .out0(
        u_tlul_adapter_sram_rdata_tlword[15]) );
  b15aoi022ar1n02x3 U602 ( .a(n462), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[23]), .c(
        n461), .d(u_tlul_adapter_sram_rdata_tlword[15]), .o1(n408) );
  b15nandp2ar1n05x5 U603 ( .a(n408), .b(n460), .o1(tl_d_o[31]) );
  b15nonb02ar1n02x5 U605 ( .a(tl_d_i[64]), .b(n409), .out0(addr[2]) );
  b15nonb02ar1n02x5 U606 ( .a(tl_d_i[63]), .b(n409), .out0(addr[1]) );
  b15nonb02ar1n02x5 U607 ( .a(tl_d_i[62]), .b(n409), .out0(addr[0]) );
  b15nonb02ar1n02x5 U608 ( .a(tl_d_i[65]), .b(n409), .out0(addr[3]) );
  b15nonb02ar1n02x5 U609 ( .a(tl_d_i[66]), .b(n409), .out0(addr[4]) );
  b15nonb02ar1n02x5 U610 ( .a(tl_d_i[68]), .b(n409), .out0(addr[6]) );
  b15nonb02ar1n02x5 U611 ( .a(tl_d_i[70]), .b(n409), .out0(addr[8]) );
  b15nonb02ar1n02x5 U612 ( .a(tl_d_i[67]), .b(n409), .out0(addr[5]) );
  b15nonb02ar1n02x5 U613 ( .a(tl_d_i[72]), .b(n409), .out0(addr[10]) );
  b15nonb02ar1n02x5 U614 ( .a(tl_d_i[71]), .b(n409), .out0(addr[9]) );
  b15nonb02ar1n02x5 U615 ( .a(tl_d_i[69]), .b(n409), .out0(addr[7]) );
  b15nandp2ar1n03x5 U616 ( .a(tl_d_i[56]), .b(wen), .o1(n410) );
  b15nonb02ar1n02x3 U617 ( .a(tl_d_i[27]), .b(n410), .out0(wdata[3]) );
  b15nonb02ar1n02x3 U618 ( .a(tl_d_i[28]), .b(n410), .out0(wdata[4]) );
  b15nonb02ar1n02x3 U619 ( .a(tl_d_i[25]), .b(n410), .out0(wdata[1]) );
  b15nonb02ar1n02x3 U620 ( .a(tl_d_i[24]), .b(n410), .out0(wdata[0]) );
  b15nonb02ar1n02x3 U621 ( .a(tl_d_i[26]), .b(n410), .out0(wdata[2]) );
  b15nonb02ar1n02x3 U622 ( .a(tl_d_i[29]), .b(n410), .out0(wdata[5]) );
  b15nonb02ar1n02x3 U623 ( .a(tl_d_i[30]), .b(n410), .out0(wdata[6]) );
  b15nonb02ar1n02x3 U624 ( .a(tl_d_i[31]), .b(n410), .out0(wdata[7]) );
  b15nandp2ar1n03x5 U625 ( .a(tl_d_i[59]), .b(wen), .o1(n411) );
  b15nonb02ar1n02x3 U626 ( .a(tl_d_i[55]), .b(n411), .out0(wdata[31]) );
  b15nonb02ar1n02x5 U627 ( .a(tl_d_i[54]), .b(n411), .out0(wdata[30]) );
  b15nonb02ar1n02x3 U628 ( .a(tl_d_i[53]), .b(n411), .out0(wdata[29]) );
  b15nonb02ar1n02x3 U629 ( .a(tl_d_i[52]), .b(n411), .out0(wdata[28]) );
  b15nonb02ar1n02x3 U630 ( .a(tl_d_i[49]), .b(n411), .out0(wdata[25]) );
  b15nonb02ar1n02x3 U631 ( .a(tl_d_i[48]), .b(n411), .out0(wdata[24]) );
  b15nonb02ar1n02x3 U632 ( .a(tl_d_i[51]), .b(n411), .out0(wdata[27]) );
  b15nonb02ar1n02x5 U633 ( .a(tl_d_i[50]), .b(n411), .out0(wdata[26]) );
  b15and002ar1n02x5 U634 ( .a(n413), .b(n412), .o(tl_d_o[0]) );
  b15nandp2ar1n03x5 U635 ( .a(tl_d_i[108]), .b(tl_d_o[0]), .o1(n421) );
  b15nor002ar1n03x5 U636 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), .b(n421), 
        .o1(u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b15nonb03ar1n03x5 U637 ( .a(n415), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .c(n414), 
        .out0(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b15nor002ar1n03x5 U639 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(
        n416), .o1(n175) );
  b15inv000ar1n03x5 U640 ( .a(wen), .o1(n_0_net_) );
  b15nor002ar1n03x5 U641 ( .a(n417), .b(n_0_net_), .o1(n419) );
  b15and002ar1n02x5 U642 ( .a(n419), .b(tl_d_i[32]), .o(wdata[8]) );
  b15and002ar1n02x5 U643 ( .a(n419), .b(tl_d_i[33]), .o(wdata[9]) );
  b15nor002ar1n03x5 U644 ( .a(n418), .b(n_0_net_), .o1(n420) );
  b15and002ar1n02x5 U645 ( .a(n420), .b(tl_d_i[47]), .o(wdata[23]) );
  b15and002ar1n02x5 U646 ( .a(n419), .b(tl_d_i[34]), .o(wdata[10]) );
  b15and002ar1n02x5 U647 ( .a(n420), .b(tl_d_i[46]), .o(wdata[22]) );
  b15and002ar1n02x5 U648 ( .a(n419), .b(tl_d_i[35]), .o(wdata[11]) );
  b15and002ar1n02x5 U649 ( .a(n420), .b(tl_d_i[45]), .o(wdata[21]) );
  b15and002ar1n02x5 U650 ( .a(n420), .b(tl_d_i[44]), .o(wdata[20]) );
  b15and002ar1n02x5 U651 ( .a(n419), .b(tl_d_i[36]), .o(wdata[12]) );
  b15and002ar1n02x5 U652 ( .a(n420), .b(tl_d_i[43]), .o(wdata[19]) );
  b15and002ar1n02x5 U653 ( .a(n419), .b(tl_d_i[37]), .o(wdata[13]) );
  b15and002ar1n02x5 U654 ( .a(n420), .b(tl_d_i[42]), .o(wdata[18]) );
  b15and002ar1n02x5 U655 ( .a(n419), .b(tl_d_i[38]), .o(wdata[14]) );
  b15and002ar1n02x5 U656 ( .a(n420), .b(tl_d_i[41]), .o(wdata[17]) );
  b15and002ar1n02x5 U657 ( .a(n419), .b(tl_d_i[39]), .o(wdata[15]) );
  b15and002ar1n02x5 U658 ( .a(n420), .b(tl_d_i[40]), .o(wdata[16]) );
  b15nonb02ar1n02x3 U660 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .out0(
        n170) );
  b15nonb02ar1n02x3 U661 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .out0(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b15nor002ar1n03x5 U662 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .b(
        n422), .o1(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b15inv000ar1n03x5 U663 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_), .o1(
        n423) );
  b15nor002ar1n03x5 U664 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(
        n423), .o1(n192) );
  b15nonb02ar1n02x3 U665 ( .a(n188), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .out0(n189) );
  b15nonb02ar1n02x3 U666 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), .out0(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b15nor002ar1n03x5 U667 ( .a(n424), .b(n426), .o1(n425) );
  b15nor002ar1n03x5 U673 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(n427), .o1(n131) );
  b15and002ar1n02x5 U675 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(n428), .o(u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b15nonb02ar1n02x3 U687 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23), .out0(
        n197) );
  b15nonb02ar1n02x3 U688 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), .out0(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b15aob012ar1n03x5 U689 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[2]), .c(
        n431), .a(n430), .out0(tl_d_o[3]) );
  b15aob012ar1n03x5 U690 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[4]), .c(
        n431), .a(n430), .out0(tl_d_o[5]) );
  b15aob012ar1n03x5 U691 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[6]), .c(
        n431), .a(n430), .out0(tl_d_o[7]) );
  b15nor002ar1n03x5 U464 ( .a(n431), .b(n426), .o1(n337) );
  b15inv040ar1n03x5 U467 ( .a(n426), .o1(n430) );
  b15inv000ar1n03x5 U638 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), .o1(
        n416) );
  b15inv000ar1n05x5 U451 ( .a(n424), .o1(n431) );
  b15inv000ar1n03x5 U430 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .o1(n427) );
  b15inv000ar1n03x5 U429 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), .o1(n319) );
  b15cilb05ah1n02x3 u_tlul_adapter_sram_u_reqfifo_clk_gate_gen_normal_fifo_storage_reg_0__0_latch ( 
        .clk(clk_i), .en(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_tlul_adapter_sram_u_reqfifo_net650) );
  b15cilb05ah1n02x3 u_tlul_adapter_sram_u_reqfifo_clk_gate_gen_normal_fifo_storage_reg_0__latch ( 
        .clk(clk_i), .en(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_tlul_adapter_sram_u_reqfifo_net644) );
  b15cilb05ah1n02x3 u_tlul_adapter_sram_u_rspfifo_clk_gate_gen_normal_fifo_storage_reg_0__0_latch ( 
        .clk(clk_i), .en(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_tlul_adapter_sram_u_rspfifo_net622) );
  b15cilb05ah1n02x3 u_tlul_adapter_sram_u_rspfifo_clk_gate_gen_normal_fifo_storage_reg_0__latch ( 
        .clk(clk_i), .en(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_tlul_adapter_sram_u_rspfifo_net616) );
  b15fqy403ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0__u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0__u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si1(1'b0), .d1(n131), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .si2(
        1'b0), .d2(n126), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), .si3(
        1'b0), .d3(n175), .o3(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), 
        .si4(1'b0), .d4(n192), .o4(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_) );
  b15inv000ar1n03x5 U436 ( .a(1'b1), .o1(tl_d_o[9]) );
  b15inv000ar1n03x5 U465 ( .a(1'b1), .o1(tl_d_o[10]) );
  b15inv000ar1n03x5 U694 ( .a(1'b1), .o1(tl_d_o[11]) );
  b15inv000ar1n03x5 U696 ( .a(1'b1), .o1(tl_d_o[12]) );
  b15inv000ar1n03x5 U698 ( .a(1'b1), .o1(tl_d_o[13]) );
  b15inv000ar1n03x5 U700 ( .a(1'b1), .o1(tl_d_o[14]) );
  b15inv000ar1n03x5 U702 ( .a(1'b1), .o1(tl_d_o[15]) );
  b15inv000ar1n03x5 U704 ( .a(1'b1), .o1(tl_d_o[48]) );
  b15inv000ar1n03x5 U706 ( .a(1'b1), .o1(tl_d_o[59]) );
  b15inv000ar1n03x5 U708 ( .a(1'b1), .o1(tl_d_o[60]) );
  b15inv000ar1n03x5 U710 ( .a(1'b1), .o1(tl_d_o[61]) );
  b15inv000ar1n03x5 U712 ( .a(1'b1), .o1(tl_d_o[63]) );
  b15inv000ar1n03x5 U714 ( .a(1'b1), .o1(tl_d_o[64]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__4__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__5__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__6__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[4]), .si2(
        1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[5]), .si3(
        1'b0), .d3(1'b0), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[6]), .si4(
        1'b0), .d4(1'b0), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[7]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__4__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__5__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__6__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(tl_d_i[96]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[4]), .si2(
        1'b0), .d2(tl_d_i[97]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[5]), .si3(
        1'b0), .d3(tl_d_i[98]), .o3(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[6]), .si4(
        1'b0), .d4(tl_d_i[99]), .o4(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[7]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__12__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__13_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[4]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[12]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[5]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[13]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__27__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__28__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__29__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__30_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[19]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[27]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[20]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[28]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[21]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[29]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[22]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[30]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__14__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__15__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__16__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__17_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[6]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[14]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[7]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[15]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[8]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[16]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[9]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[17]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__35__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__36__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__37__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__38_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[27]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[35]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[28]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[36]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[29]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[37]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[30]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[38]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__18__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__19__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__20__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__21_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[10]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[18]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[11]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[19]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[12]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[20]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[13]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[21]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__31__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__32__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__33__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__34_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[23]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[31]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[24]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[32]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[25]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[33]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[26]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[34]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__22__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__23__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__24__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__25_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[14]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[22]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[15]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[23]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[16]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[24]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[17]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[25]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__8__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__9__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__10__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__11_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[0]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .si2(
        1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[1]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]), .si3(
        1'b0), .d3(u_tlul_adapter_sram_rdata_tlword[2]), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), 
        .si4(1'b0), .d4(u_tlul_adapter_sram_rdata_tlword[3]), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__0__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__1__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__2__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .si2(
        1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[1]), .si3(
        1'b0), .d3(1'b0), .o3(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[2]), .si4(
        1'b0), .d4(1'b0), .o4(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[3]) );
  b15fqy00car1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__9__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__10__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__11__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__12_ ( 
        .si1(1'b0), .d1(tl_d_i[101]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net650), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[9]), .si2(
        1'b0), .d2(tl_d_i[15]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]), 
        .si3(1'b0), .d3(tl_d_i[16]), .o3(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), 
        .si4(1'b0), .d4(tl_d_i[17]), .o4(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]) );
  b15fqy00car1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25), 
        .den(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), 
        .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_) );
  b15inv000ar1n03x5 U502 ( .a(tl_d_i[60]), .o1(n362) );
  b15inv000ar1n03x5 U511 ( .a(tl_d_i[101]), .o1(n359) );
  b15inv000ar1n03x5 U514 ( .a(tl_d_i[57]), .o1(n417) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(
        1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(
        1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__13__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__14__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__15__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__16_ ( 
        .si1(1'b0), .d1(tl_d_i[18]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net650), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_N210), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), 
        .si3(1'b0), .d3(u_tlul_adapter_sram_reqfifo_wdata_op__0_), .o3(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), 
        .si4(1'b0), .d4(1'b0), .o4(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]) );
  b15inv000ar1n03x5 U443 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), .o1(n325) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11), 
        .den(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_) );
  b15inv000ar1n03x5 U444 ( .a(n325), .o1(n327) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__4_ ( 
        .si(1'b0), .d(tl_d_i[59]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si(1'b0), .d(tl_d_i[58]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si(1'b0), .d(tl_d_i[56]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__2_ ( 
        .si(1'b0), .d(tl_d_i[57]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]) );
  b15and002ar1n02x5 U469 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), .o(
        n340) );
  b15nonb03ar1n02x5 U525 ( .a(n412), .b(wen), .c(u_tlul_adapter_sram_N210), 
        .out0(N1) );
  b15inv000ar1n03x5 U433 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), .o1(n317) );
  b15inv000ar1n03x5 U449 ( .a(tl_d_i[0]), .o1(n329) );
  b15fpy400ar1d02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__0__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__1__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__2__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(tl_d_i[92]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[0]), .si2(
        1'b0), .d2(tl_d_i[93]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[1]), .si3(
        1'b0), .d3(tl_d_i[94]), .o3(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[2]), .si4(
        1'b0), .d4(tl_d_i[95]), .o4(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[3]) );
  b15inv000ar1n03x5 U453 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), .o1(
        n330) );
  b15inv000ar1n03x5 U674 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), .o1(n428)
         );
  b15inv000ar1n03x5 U659 ( .a(n421), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b15and002ar1n02x5 U668 ( .a(n425), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[5]), .o(
        tl_d_o[6]) );
  b15and002ar1n02x5 U669 ( .a(n425), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[1]), .o(
        tl_d_o[2]) );
  b15and002ar1n02x5 U670 ( .a(n425), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[3]), .o(
        tl_d_o[4]) );
  b15and002ar1n02x5 U671 ( .a(n425), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[7]), .o(
        tl_d_o[8]) );
  b15nonb02ar1n02x3 U686 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[9]), .b(
        n429), .out0(tl_d_o[58]) );
  b15nonb02ar1n02x3 U680 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[6]), .b(
        n429), .out0(tl_d_o[55]) );
  b15nonb02ar1n02x3 U683 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[4]), .b(
        n429), .out0(tl_d_o[53]) );
  b15nonb02ar1n02x3 U685 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[5]), .b(
        n429), .out0(tl_d_o[54]) );
  b15inv000ar1n03x5 U676 ( .a(n429), .o1(tl_d_o[65]) );
  b15nonb03ar1n02x5 U604 ( .a(tl_d_i[107]), .b(tl_d_i[105]), .c(tl_d_i[106]), 
        .out0(u_tlul_adapter_sram_reqfifo_wdata_op__0_) );
  b15fqy403hq1d02x5 rvalid_reg_u_tlul_adapter_sram_intg_error_q_reg_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si1(1'b0), .d1(N1), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(rvalid), 
        .si2(1'b0), .d2(n211), .o2(n211), .si3(1'b0), .d3(n197), .o3(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .si4(
        1'b0), .d4(n170), .o4(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_) );
  b15fqy00car1n04x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(
        1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(
        1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_) );
  b15aoi022an1n02x3 U431 ( .a(n319), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .c(n427), 
        .d(u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), .o1(
        n322) );
  b15xor002al1n02x5 U425 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), .out0(
        n375) );
  b15xor002al1n02x5 U432 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), .out0(
        n324) );
  b15xor002aq1n02x5 U426 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_), .out0(
        n374) );
  b15oab012al1n03x5 U427 ( .b(n375), .c(n374), .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), .out0(n333)
         );
  b15nonb03aq1n03x5 U460 ( .a(n333), .b(n332), .c(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), 
        .out0(n334) );
  b15xnr002ar1n02x5 U456 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_), 
        .out0(n377) );
  b15xor002ar1n02x5 U455 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(n378) );
  b15nandp2as1n05x5 U461 ( .a(n335), .b(n334), .o1(n426) );
  b15nanb02al1n02x5 U457 ( .a(n378), .b(n377), .out0(n415) );
  b15nor003aq1n02x7 U462 ( .a(n424), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .c(
        n426), .o1(n336) );
  b15inv000ar1n03x5 U447 ( .a(tl_d_o[62]), .o1(n328) );
  b15aoi022aq1n02x3 U472 ( .a(n430), .b(n341), .c(n340), .d(n339), .o1(n342)
         );
  b15bfn001ar1n06x5 U718 ( .a(n336), .o(n462) );
  b15bfn001al1n06x5 U720 ( .a(n336), .o(n463) );
  b15bfn000aq1n03x5 U717 ( .a(n337), .o(n461) );
  b15bfn001al1n06x5 U719 ( .a(n337), .o(n465) );
  b15oaoi13aq1n04x3 U448 ( .c(n335), .d(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), .b(
        n333), .a(n328), .o1(n429) );
  b15inv000an1n05x5 U463 ( .a(n342), .o1(n433) );
  b15inv000aq1n05x5 U716 ( .a(n342), .o1(n460) );
  b15nor002an1n03x5 U450 ( .a(n429), .b(n329), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b15nonb02aq1n02x3 U672 ( .a(tl_d_i[0]), .b(n426), .out0(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b15oaoi13an1n02x3 U454 ( .c(n332), .d(n331), .b(n330), .a(n429), .o1(
        tl_d_o[1]) );
  b15nonb02ar1n02x3 U679 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[8]), .b(
        n429), .out0(tl_d_o[57]) );
  b15nonb02ar1n02x3 U677 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[1]), .b(
        n429), .out0(tl_d_o[50]) );
  b15nonb02ar1n02x3 U678 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[3]), .b(
        n429), .out0(tl_d_o[52]) );
  b15nonb02ar1n02x3 U682 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[0]), .b(
        n429), .out0(tl_d_o[49]) );
  b15nonb02ar1n02x3 U684 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[7]), .b(
        n429), .out0(tl_d_o[56]) );
  b15nonb02ar1n02x3 U681 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[2]), .b(
        n429), .out0(tl_d_o[51]) );
  b15oai012al1n03x5 U446 ( .b(n424), .c(n327), .a(n326), .o1(n335) );
  b15inv000aq1n02x5 U441 ( .a(n324), .o1(n493) );
  b15and002al1n04x5 U442 ( .a(n493), .b(n322), .o(n424) );
endmodule

