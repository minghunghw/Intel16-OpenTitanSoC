/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP1
// Date      : Mon Oct 24 18:12:10 2022
/////////////////////////////////////////////////////////////


module mem_tlul ( clk_i, rst_ni, en_ifetch_i, tl_i, tl_o );
  input [3:0] en_ifetch_i;
  input [108:0] tl_i;
  output [65:0] tl_o;
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
         n131, n170, n175, n188, n189, n192, n197, n211, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n401, n402, n403, n404,
         n405, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n424, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n438, n439, n467, n468, n469, n471, n472, n473;
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
        .si(1'b0), .d(tl_i[100]), .ssb(1'b1), .clk(
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
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11), 
        .den(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25), 
        .den(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), 
        .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(
        1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_) );
  b15fqy043ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(
        1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_) );
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
  b15nonb02ar1n02x3 U431 ( .a(tl_i[64]), .b(n328), .out0(addr[2]) );
  b15nonb02ar1n02x3 U432 ( .a(tl_i[63]), .b(n328), .out0(addr[1]) );
  b15nonb02ar1n02x3 U433 ( .a(tl_i[62]), .b(n328), .out0(addr[0]) );
  b15nonb02ar1n02x3 U434 ( .a(tl_i[68]), .b(n328), .out0(addr[6]) );
  b15nonb02ar1n02x3 U435 ( .a(tl_i[66]), .b(n328), .out0(addr[4]) );
  b15nonb02ar1n02x3 U436 ( .a(tl_i[65]), .b(n328), .out0(addr[3]) );
  b15nonb02ar1n02x3 U437 ( .a(tl_i[70]), .b(n328), .out0(addr[8]) );
  b15nonb02ar1n02x3 U438 ( .a(tl_i[67]), .b(n328), .out0(addr[5]) );
  b15nonb02ar1n02x3 U439 ( .a(tl_i[72]), .b(n328), .out0(addr[10]) );
  b15nonb02ar1n02x3 U440 ( .a(tl_i[71]), .b(n328), .out0(addr[9]) );
  b15nonb02ar1n02x3 U441 ( .a(tl_i[69]), .b(n328), .out0(addr[7]) );
  b15nor003ar1n02x7 U442 ( .a(tl_i[107]), .b(tl_i[106]), .c(n328), .o1(wen) );
  b15nandp2ar1n03x5 U443 ( .a(tl_i[56]), .b(wen), .o1(n322) );
  b15nonb02ar1n02x3 U444 ( .a(tl_i[31]), .b(n322), .out0(wdata[7]) );
  b15nonb02ar1n02x3 U445 ( .a(tl_i[30]), .b(n322), .out0(wdata[6]) );
  b15nonb02ar1n02x3 U446 ( .a(tl_i[29]), .b(n322), .out0(wdata[5]) );
  b15nonb02ar1n02x3 U447 ( .a(tl_i[28]), .b(n322), .out0(wdata[4]) );
  b15nonb02ar1n02x3 U448 ( .a(tl_i[27]), .b(n322), .out0(wdata[3]) );
  b15nonb02ar1n02x3 U449 ( .a(tl_i[26]), .b(n322), .out0(wdata[2]) );
  b15nonb02ar1n02x3 U450 ( .a(tl_i[25]), .b(n322), .out0(wdata[1]) );
  b15nonb02ar1n02x3 U451 ( .a(tl_i[24]), .b(n322), .out0(wdata[0]) );
  b15nandp2ar1n03x5 U452 ( .a(tl_i[57]), .b(wen), .o1(n323) );
  b15nonb02ar1n02x3 U453 ( .a(tl_i[33]), .b(n323), .out0(wdata[9]) );
  b15nonb02ar1n02x3 U454 ( .a(tl_i[32]), .b(n323), .out0(wdata[8]) );
  b15nonb02ar1n02x3 U455 ( .a(tl_i[35]), .b(n323), .out0(wdata[11]) );
  b15nonb02ar1n02x3 U456 ( .a(tl_i[34]), .b(n323), .out0(wdata[10]) );
  b15nonb02ar1n02x3 U457 ( .a(tl_i[39]), .b(n323), .out0(wdata[15]) );
  b15nonb02ar1n02x3 U458 ( .a(tl_i[38]), .b(n323), .out0(wdata[14]) );
  b15nonb02ar1n02x3 U459 ( .a(tl_i[37]), .b(n323), .out0(wdata[13]) );
  b15nonb02ar1n02x3 U460 ( .a(tl_i[36]), .b(n323), .out0(wdata[12]) );
  b15inv000ar1n03x5 U461 ( .a(wen), .o1(n_0_net_) );
  b15inv000ar1n03x5 U462 ( .a(tl_i[59]), .o1(n347) );
  b15nor002ar1n03x5 U463 ( .a(n347), .b(n_0_net_), .o1(n324) );
  b15and002ar1n02x5 U464 ( .a(n324), .b(tl_i[55]), .o(wdata[31]) );
  b15and002ar1n02x5 U465 ( .a(n324), .b(tl_i[54]), .o(wdata[30]) );
  b15and002ar1n02x5 U466 ( .a(n324), .b(tl_i[53]), .o(wdata[29]) );
  b15and002ar1n02x5 U467 ( .a(n324), .b(tl_i[52]), .o(wdata[28]) );
  b15and002ar1n02x5 U468 ( .a(n324), .b(tl_i[51]), .o(wdata[27]) );
  b15and002ar1n02x5 U469 ( .a(n324), .b(tl_i[50]), .o(wdata[26]) );
  b15and002ar1n02x5 U470 ( .a(n324), .b(tl_i[49]), .o(wdata[25]) );
  b15and002ar1n02x5 U471 ( .a(n324), .b(tl_i[48]), .o(wdata[24]) );
  b15nor002ar1n03x5 U473 ( .a(n345), .b(n_0_net_), .o1(n325) );
  b15and002ar1n02x5 U474 ( .a(n325), .b(tl_i[47]), .o(wdata[23]) );
  b15and002ar1n02x5 U475 ( .a(n325), .b(tl_i[46]), .o(wdata[22]) );
  b15and002ar1n02x5 U476 ( .a(n325), .b(tl_i[45]), .o(wdata[21]) );
  b15and002ar1n02x5 U477 ( .a(n325), .b(tl_i[44]), .o(wdata[20]) );
  b15and002ar1n02x5 U478 ( .a(n325), .b(tl_i[43]), .o(wdata[19]) );
  b15and002ar1n02x5 U479 ( .a(n325), .b(tl_i[42]), .o(wdata[18]) );
  b15and002ar1n02x5 U480 ( .a(n325), .b(tl_i[41]), .o(wdata[17]) );
  b15and002ar1n02x5 U481 ( .a(n325), .b(tl_i[40]), .o(wdata[16]) );
  b15xor002ar1n02x5 U482 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .out0(n360) );
  b15inv000ar1n03x5 U483 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), .o1(
        n327) );
  b15inv000ar1n03x5 U484 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_), .o1(
        n365) );
  b15aoi022ar1n04x3 U485 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_), .b(
        n327), .c(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), .d(
        n365), .o1(n359) );
  b15nanb02ar1n02x5 U486 ( .a(n360), .b(n359), .out0(n418) );
  b15inv000ar1n05x5 U487 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), .o1(n356) );
  b15xor002ar1n02x5 U488 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_), .out0(
        n358) );
  b15inv000ar1n03x5 U489 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), .o1(n326)
         );
  b15aboi22ar1n02x3 U490 ( .c(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), .d(n326), 
        .a(u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), .out0(
        n357) );
  b15nanb02ar1n02x5 U491 ( .a(n358), .b(n357), .out0(n384) );
  b15nandp2ar1n03x5 U492 ( .a(n356), .b(n384), .o1(n374) );
  b15inv000ar1n03x5 U493 ( .a(n374), .o1(n373) );
  b15nandp2ar1n03x5 U494 ( .a(n373), .b(rvalid), .o1(n369) );
  b15nonb03ar1n02x5 U495 ( .a(n418), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .c(n369), 
        .out0(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b15nor002ar1n03x5 U496 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(
        n327), .o1(n175) );
  b15aoi112ar1n02x3 U497 ( .c(tl_i[15]), .d(tl_i[17]), .a(tl_i[106]), .b(n328), 
        .o1(n355) );
  b15nor002ar1n03x5 U498 ( .a(tl_i[59]), .b(tl_i[57]), .o1(n330) );
  b15nor002ar1n03x5 U499 ( .a(tl_i[58]), .b(tl_i[56]), .o1(n329) );
  b15inv000ar1n03x5 U500 ( .a(tl_i[60]), .o1(n343) );
  b15aoi022ar1n02x3 U501 ( .a(tl_i[60]), .b(n330), .c(n329), .d(n343), .o1(
        n331) );
  b15aboi22ar1n02x3 U502 ( .c(tl_i[56]), .d(tl_i[57]), .a(tl_i[100]), .b(n331), 
        .out0(n334) );
  b15aoai13ar1n02x3 U504 ( .c(tl_i[56]), .d(tl_i[57]), .b(n332), .a(tl_i[58]), 
        .o1(n333) );
  b15oai022ar1n02x5 U505 ( .a(tl_i[101]), .b(n334), .c(n333), .d(n347), .o1(
        n340) );
  b15inv000ar1n03x5 U506 ( .a(tl_i[107]), .o1(n439) );
  b15inv000ar1n03x5 U507 ( .a(tl_i[16]), .o1(n336) );
  b15nor004ar1n02x3 U508 ( .a(en_ifetch_i[3]), .b(en_ifetch_i[0]), .c(n439), 
        .d(n336), .o1(n335) );
  b15aoi013ar1n02x3 U509 ( .b(en_ifetch_i[1]), .c(en_ifetch_i[2]), .d(n335), 
        .a(tl_i[18]), .o1(n338) );
  b15obai22ar1n02x3 U510 ( .a(tl_i[18]), .b(tl_i[15]), .c(tl_i[17]), .d(n336), 
        .out0(n337) );
  b15aoi112ar1n02x3 U511 ( .c(tl_i[100]), .d(tl_i[60]), .a(n338), .b(n337), 
        .o1(n339) );
  b15oai013ar1n02x3 U512 ( .b(n340), .c(tl_i[105]), .d(tl_i[107]), .a(n339), 
        .o1(n341) );
  b15aoi012ar1n02x5 U513 ( .b(tl_i[105]), .c(tl_i[107]), .a(n341), .o1(n354)
         );
  b15aoi022ar1n02x3 U514 ( .a(tl_i[60]), .b(tl_i[56]), .c(tl_i[57]), .d(n343), 
        .o1(n344) );
  b15nor002ar1n03x5 U515 ( .a(tl_i[61]), .b(tl_i[58]), .o1(n348) );
  b15nor003ar1n02x7 U517 ( .a(tl_i[56]), .b(tl_i[57]), .c(n342), .o1(n346) );
  b15aoi022ar1n02x3 U518 ( .a(n344), .b(n348), .c(n346), .d(n343), .o1(n351)
         );
  b15aoi013ar1n02x3 U519 ( .b(tl_i[60]), .c(n346), .d(n345), .a(tl_i[101]), 
        .o1(n350) );
  b15aoai13ar1n02x3 U520 ( .c(n348), .d(n347), .b(n346), .a(tl_i[100]), .o1(
        n349) );
  b15oai112ar1n02x5 U521 ( .c(tl_i[59]), .d(n351), .a(n350), .b(n349), .o1(
        n353) );
  b15oai013ar1n02x3 U522 ( .b(tl_i[61]), .c(tl_i[60]), .d(tl_i[100]), .a(
        tl_i[101]), .o1(n352) );
  b15nand04ar1n03x5 U523 ( .a(n355), .b(n354), .c(n353), .d(n352), .o1(
        u_tlul_adapter_sram_N210) );
  b15oai012ar1n03x5 U524 ( .b(n358), .c(n357), .a(n356), .o1(n361) );
  b15nor003ar1n02x7 U525 ( .a(wen), .b(n361), .c(u_tlul_adapter_sram_N210), 
        .o1(N1) );
  b15aoi012ar1n02x5 U526 ( .b(n360), .c(n359), .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .o1(n362) );
  b15nandp2ar1n03x5 U527 ( .a(n362), .b(N1), .o1(n364) );
  b15nor002ar1n03x5 U528 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .b(
        n364), .o1(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b15nonb02ar1n02x3 U529 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .out0(u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b15nonb02ar1n02x3 U530 ( .a(n362), .b(n361), .out0(tl_o[0]) );
  b15nandp2ar1n03x5 U531 ( .a(tl_i[108]), .b(tl_o[0]), .o1(n363) );
  b15nor002ar1n03x5 U532 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), .b(n363), 
        .o1(u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b15nonb02ar1n02x3 U534 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .out0(
        n170) );
  b15inv000ar1n03x5 U535 ( .a(n364), .o1(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b15nor002ar1n03x5 U536 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(
        n365), .o1(n192) );
  b15nonb02ar1n02x3 U537 ( .a(n188), .b(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .out0(n189) );
  b15inv000ar1n03x5 U538 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), .o1(n372)
         );
  b15obai22ar1n02x5 U539 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), .c(n372), 
        .d(u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), .out0(
        n367) );
  b15inv000ar1n03x5 U540 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), .o1(n366) );
  b15inv000ar1n03x5 U541 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .o1(n370) );
  b15aoi022ar1n04x3 U542 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .b(n366), 
        .c(u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), .d(
        n370), .o1(n368) );
  b15nor002ar1n03x5 U544 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(n366), 
        .o1(n126) );
  b15inv000ar1n03x5 U546 ( .a(n380), .o1(n386) );
  b15nanb02ar1n02x5 U548 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), 
        .out0(n379) );
  b15nor004ar1n02x3 U549 ( .a(n375), .b(n379), .c(n374), .d(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), .o1(
        n385) );
  b15aob012ar1n03x5 U550 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[6]), .c(
        n386), .a(n385), .out0(tl_o[7]) );
  b15aob012ar1n03x5 U551 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[2]), .c(
        n386), .a(n385), .out0(tl_o[3]) );
  b15aob012ar1n03x5 U552 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[4]), .c(
        n386), .a(n385), .out0(tl_o[5]) );
  b15nonb02ar1n02x3 U553 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), .out0(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b15inv000ar1n03x5 U554 ( .a(n385), .o1(n382) );
  b15nonb02ar1n02x3 U555 ( .a(tl_i[0]), .b(n382), .out0(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b15nor002ar1n03x5 U556 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(n370), .o1(n131) );
  b15nor002ar1n03x5 U557 ( .a(n380), .b(n382), .o1(n371) );
  b15and002ar1n02x5 U562 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(n372), .o(u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b15nandp2ar1n03x5 U563 ( .a(n373), .b(n379), .o1(tl_o[62]) );
  b15inv000ar1n03x5 U564 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), .o1(
        n377) );
  b15inv000ar1n03x5 U566 ( .a(tl_o[65]), .o1(n376) );
  b15nonb02ar1n02x3 U578 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23), .out0(
        n197) );
  b15nonb02ar1n02x3 U579 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), .out0(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b15nandp2ar1n03x5 U580 ( .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .b(
        n386), .o1(n378) );
  b15oaoi13ar1n02x3 U581 ( .c(n379), .d(n378), .b(n377), .a(n376), .o1(tl_o[1]) );
  b15nandp2ar1n03x5 U582 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]), 
        .b(n418), .o1(n397) );
  b15nonb02ar1n02x3 U583 ( .a(rdata[26]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[26]) );
  b15aoi022ar1n02x3 U590 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[34]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[26]), .o1(n390) );
  b15nand03ar1n03x5 U591 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]), .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), .c(
        n384), .o1(n388) );
  b15aob012ar1n03x5 U592 ( .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .c(
        n386), .a(n385), .out0(n387) );
  b15nandp2ar1n03x5 U596 ( .a(n390), .b(n468), .o1(tl_o[42]) );
  b15nonb02ar1n02x3 U597 ( .a(rdata[27]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[27]) );
  b15aoi022ar1n02x3 U598 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[35]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[27]), .o1(n391) );
  b15nandp2ar1n03x5 U599 ( .a(n391), .b(n472), .o1(tl_o[43]) );
  b15nonb02ar1n02x3 U600 ( .a(rdata[24]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[24]) );
  b15aoi022ar1n02x3 U601 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[32]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[24]), .o1(n392) );
  b15nandp2ar1n03x5 U603 ( .a(n392), .b(n468), .o1(tl_o[40]) );
  b15nonb02ar1n02x3 U604 ( .a(rdata[25]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[25]) );
  b15aoi022ar1n02x3 U605 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[33]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[25]), .o1(n393) );
  b15nandp2ar1n03x5 U606 ( .a(n393), .b(n472), .o1(tl_o[41]) );
  b15nonb02ar1n02x3 U607 ( .a(rdata[30]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[30]) );
  b15aoi022ar1n02x3 U608 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[38]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[30]), .o1(n394) );
  b15nandp2ar1n03x5 U609 ( .a(n394), .b(n472), .o1(tl_o[46]) );
  b15nonb02ar1n02x3 U610 ( .a(rdata[31]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[31]) );
  b15aoi022ar1n02x3 U611 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[39]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[31]), .o1(n395) );
  b15nandp2ar1n03x5 U612 ( .a(n395), .b(n468), .o1(tl_o[47]) );
  b15nonb02ar1n02x3 U613 ( .a(rdata[28]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[28]) );
  b15aoi022ar1n02x3 U614 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[36]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[28]), .o1(n396) );
  b15nandp2ar1n03x5 U615 ( .a(n396), .b(n472), .o1(tl_o[44]) );
  b15nonb02ar1n02x3 U616 ( .a(rdata[29]), .b(n397), .out0(
        u_tlul_adapter_sram_rdata_tlword[29]) );
  b15aoi022ar1n02x3 U617 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[37]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[29]), .o1(n401) );
  b15nandp2ar1n03x5 U618 ( .a(n401), .b(n468), .o1(tl_o[45]) );
  b15nandp2ar1n03x5 U619 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), 
        .b(n418), .o1(n434) );
  b15nonb02ar1n02x3 U620 ( .a(rdata[20]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[20]) );
  b15aoi022ar1n02x3 U623 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[28]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[20]), .o1(n402) );
  b15nandp2ar1n03x5 U624 ( .a(n402), .b(n468), .o1(tl_o[36]) );
  b15nonb02ar1n02x3 U625 ( .a(rdata[21]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[21]) );
  b15aoi022ar1n02x3 U626 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[29]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[21]), .o1(n403) );
  b15nandp2ar1n03x5 U627 ( .a(n403), .b(n468), .o1(tl_o[37]) );
  b15nonb02ar1n02x3 U628 ( .a(rdata[22]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[22]) );
  b15aoi022ar1n02x3 U629 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[30]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[22]), .o1(n404) );
  b15nandp2ar1n03x5 U630 ( .a(n404), .b(n468), .o1(tl_o[38]) );
  b15nonb02ar1n02x3 U631 ( .a(rdata[23]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[23]) );
  b15aoi022ar1n02x3 U632 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[31]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[23]), .o1(n405) );
  b15nandp2ar1n03x5 U633 ( .a(n405), .b(n472), .o1(tl_o[39]) );
  b15nandp2ar1n03x5 U634 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]), 
        .b(n418), .o1(n416) );
  b15nonb02ar1n02x3 U635 ( .a(rdata[0]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[0]) );
  b15aoi022ar1n02x3 U638 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[0]), .o1(n409) );
  b15nandp2ar1n03x5 U640 ( .a(n409), .b(n468), .o1(tl_o[16]) );
  b15nonb02ar1n02x3 U641 ( .a(rdata[1]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[1]) );
  b15aoi022ar1n02x3 U642 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[1]), .o1(n410) );
  b15nandp2ar1n03x5 U643 ( .a(n410), .b(n468), .o1(tl_o[17]) );
  b15nonb02ar1n02x3 U644 ( .a(rdata[2]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[2]) );
  b15aoi022ar1n02x3 U645 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[2]), .o1(n411) );
  b15nandp2ar1n03x5 U646 ( .a(n411), .b(n472), .o1(tl_o[18]) );
  b15aoi022ar1n02x3 U648 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[3]), .o1(n412) );
  b15nandp2ar1n03x5 U649 ( .a(n412), .b(n468), .o1(tl_o[19]) );
  b15nonb02ar1n02x3 U650 ( .a(rdata[4]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[4]) );
  b15aoi022ar1n02x3 U651 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[12]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[4]), .o1(n413) );
  b15nandp2ar1n03x5 U652 ( .a(n413), .b(n472), .o1(tl_o[20]) );
  b15aoi022ar1n02x3 U654 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[13]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[5]), .o1(n414) );
  b15nandp2ar1n03x5 U655 ( .a(n414), .b(n468), .o1(tl_o[21]) );
  b15nonb02ar1n02x3 U656 ( .a(rdata[6]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[6]) );
  b15aoi022ar1n02x3 U657 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[14]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[6]), .o1(n415) );
  b15nandp2ar1n03x5 U658 ( .a(n415), .b(n472), .o1(tl_o[22]) );
  b15nonb02ar1n02x3 U659 ( .a(rdata[7]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[7]) );
  b15aoi022ar1n02x3 U660 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[15]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[7]), .o1(n417) );
  b15nandp2ar1n03x5 U661 ( .a(n417), .b(n468), .o1(tl_o[23]) );
  b15nandp2ar1n03x5 U662 ( .a(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), 
        .b(n418), .o1(n429) );
  b15nonb02ar1n02x3 U663 ( .a(rdata[8]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[8]) );
  b15aoi022ar1n02x3 U664 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[16]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[8]), .o1(n419) );
  b15nandp2ar1n03x5 U665 ( .a(n419), .b(n472), .o1(tl_o[24]) );
  b15aoi022ar1n02x3 U667 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[17]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[9]), .o1(n420) );
  b15nandp2ar1n03x5 U668 ( .a(n420), .b(n472), .o1(tl_o[25]) );
  b15nonb02ar1n02x3 U669 ( .a(rdata[10]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[10]) );
  b15aoi022ar1n02x3 U670 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[18]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[10]), .o1(n421) );
  b15nandp2ar1n03x5 U671 ( .a(n421), .b(n468), .o1(tl_o[26]) );
  b15nonb02ar1n02x3 U672 ( .a(rdata[11]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[11]) );
  b15aoi022ar1n02x3 U673 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[19]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[11]), .o1(n424) );
  b15nandp2ar1n03x5 U674 ( .a(n424), .b(n472), .o1(tl_o[27]) );
  b15nonb02ar1n02x3 U675 ( .a(rdata[12]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[12]) );
  b15aoi022ar1n02x3 U676 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[20]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[12]), .o1(n426) );
  b15nandp2ar1n03x5 U677 ( .a(n426), .b(n472), .o1(tl_o[28]) );
  b15nonb02ar1n02x3 U678 ( .a(rdata[13]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[13]) );
  b15aoi022ar1n02x3 U679 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[21]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[13]), .o1(n427) );
  b15nandp2ar1n03x5 U680 ( .a(n427), .b(n468), .o1(tl_o[29]) );
  b15nonb02ar1n02x3 U681 ( .a(rdata[14]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[14]) );
  b15aoi022ar1n02x3 U682 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[22]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[14]), .o1(n428) );
  b15nandp2ar1n03x5 U683 ( .a(n428), .b(n472), .o1(tl_o[30]) );
  b15nonb02ar1n02x3 U684 ( .a(rdata[15]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[15]) );
  b15aoi022ar1n02x3 U685 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[23]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[15]), .o1(n430) );
  b15nandp2ar1n03x5 U686 ( .a(n430), .b(n472), .o1(tl_o[31]) );
  b15nonb02ar1n02x3 U687 ( .a(rdata[16]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[16]) );
  b15aoi022ar1n02x3 U688 ( .a(n471), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[24]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[16]), .o1(n431) );
  b15nandp2ar1n03x5 U689 ( .a(n431), .b(n468), .o1(tl_o[32]) );
  b15nonb02ar1n02x3 U690 ( .a(rdata[17]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[17]) );
  b15aoi022ar1n02x3 U691 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[25]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[17]), .o1(n432) );
  b15nandp2ar1n03x5 U692 ( .a(n432), .b(n472), .o1(tl_o[33]) );
  b15aoi022ar1n02x3 U694 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[26]), .c(
        n473), .d(u_tlul_adapter_sram_rdata_tlword[18]), .o1(n433) );
  b15nandp2ar1n03x5 U695 ( .a(n433), .b(n472), .o1(tl_o[34]) );
  b15nonb02ar1n02x3 U696 ( .a(rdata[19]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[19]) );
  b15aoi022ar1n02x3 U697 ( .a(n469), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[27]), .c(
        n467), .d(u_tlul_adapter_sram_rdata_tlword[19]), .o1(n438) );
  b15nandp2ar1n03x5 U698 ( .a(n438), .b(n468), .o1(tl_o[35]) );
  b15nor003ar1n02x7 U700 ( .a(tl_i[105]), .b(tl_i[106]), .c(n439), .o1(
        u_tlul_adapter_sram_reqfifo_wdata_op__0_) );
  b15nor002ar1n03x5 U587 ( .a(n386), .b(n382), .o1(n383) );
  b15nor003ar1n02x7 U584 ( .a(n380), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .c(
        n382), .o1(n381) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__4_ ( 
        .si(1'b0), .d(tl_i[59]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si(1'b0), .d(tl_i[58]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__2_ ( 
        .si(1'b0), .d(tl_i[57]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]) );
  b15fpy040ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si(1'b0), .d(tl_i[56]), .den(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]) );
  b15fqy00car1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst) );
  b15fqy00car1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst) );
  b15fqy00car1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst) );
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
  b15fqy203ar1n02x5 rvalid_reg_u_tlul_adapter_sram_intg_error_q_reg ( .si1(
        1'b0), .d1(N1), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(rvalid), 
        .si2(1'b0), .d2(n211), .o2(n211) );
  b15fqy203ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si1(1'b0), .d1(n197), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .si2(
        1'b0), .d2(n170), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_) );
  b15fqy203ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si1(1'b0), .d1(n131), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .si2(
        1'b0), .d2(n126), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_) );
  b15fqy203ar1n02x5 u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0__u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si1(1'b0), .d1(n175), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), 
        .si2(1'b0), .d2(n192), .o2(
        u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_) );
  b15inv000ar1n03x5 U585 ( .a(1'b1), .o1(tl_o[9]) );
  b15inv000ar1n03x5 U588 ( .a(1'b1), .o1(tl_o[10]) );
  b15inv000ar1n03x5 U594 ( .a(1'b1), .o1(tl_o[11]) );
  b15inv000ar1n03x5 U602 ( .a(1'b1), .o1(tl_o[12]) );
  b15inv000ar1n03x5 U622 ( .a(1'b1), .o1(tl_o[13]) );
  b15inv000ar1n03x5 U637 ( .a(1'b1), .o1(tl_o[14]) );
  b15inv000ar1n03x5 U702 ( .a(1'b1), .o1(tl_o[15]) );
  b15inv000ar1n03x5 U704 ( .a(1'b1), .o1(tl_o[48]) );
  b15inv000ar1n03x5 U706 ( .a(1'b1), .o1(tl_o[59]) );
  b15inv000ar1n03x5 U708 ( .a(1'b1), .o1(tl_o[60]) );
  b15inv000ar1n03x5 U710 ( .a(1'b1), .o1(tl_o[61]) );
  b15inv000ar1n03x5 U712 ( .a(1'b1), .o1(tl_o[63]) );
  b15inv000ar1n03x5 U714 ( .a(1'b1), .o1(tl_o[64]) );
  b15bfn000ar1n02x5 U716 ( .a(n383), .o(n467) );
  b15bfn000ar1n02x5 U718 ( .a(n381), .o(n469) );
  b15bfn000ar1n02x5 U720 ( .a(n381), .o(n471) );
  b15bfn000ar1n02x5 U722 ( .a(n383), .o(n473) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__6__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[6]), .si2(
        1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[7]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__6__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(tl_i[98]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[6]), .si2(
        1'b0), .d2(tl_i[99]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[7]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__0__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si1(1'b0), .d1(tl_i[92]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[0]), .si2(
        1'b0), .d2(tl_i[93]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[1]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__2__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(tl_i[94]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[2]), .si2(
        1'b0), .d2(tl_i[95]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[3]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__4__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__5_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[4]), .si2(
        1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[5]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__2__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[2]), .si2(
        1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[3]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__35__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__36_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[27]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[35]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[28]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[36]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__33__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__34_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[25]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[33]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[26]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[34]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__29__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__30_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[21]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[29]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[22]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[30]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__16__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__17_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[8]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[16]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[9]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[17]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__18__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__19_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[10]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[18]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[11]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[19]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__37__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__38_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[29]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[37]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[30]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[38]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__24__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__25_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[16]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[24]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[17]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[25]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__20__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__21_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[12]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[20]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[13]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[21]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__10__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__11_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[2]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[3]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__8__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__9_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[0]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .si2(
        1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[1]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__22__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__23_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[14]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[22]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[15]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[23]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__14__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__15_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[6]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[14]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[7]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[15]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__12__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__13_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[4]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[12]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[5]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[13]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__27__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__28_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[19]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[27]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[20]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[28]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__31__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__32_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_rdata_tlword[23]), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_rspfifo_net622), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[31]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_rdata_tlword[24]), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[32]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__9__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__10_ ( 
        .si1(1'b0), .d1(tl_i[101]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net650), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[9]), .si2(
        1'b0), .d2(tl_i[15]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__11__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__12_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net650), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), 
        .si2(1'b0), .d2(tl_i[17]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__0__u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_rspfifo_net616), .o1(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .si2(
        1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[1]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__13__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__14_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net650), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), 
        .si2(1'b0), .d2(u_tlul_adapter_sram_N210), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__15__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__16_ ( 
        .si1(1'b0), .d1(u_tlul_adapter_sram_reqfifo_wdata_op__0_), .ssb(1'b1), 
        .clk(u_tlul_adapter_sram_u_reqfifo_net650), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), 
        .si2(1'b0), .d2(1'b0), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]) );
  b15inv000ar1n03x5 U503 ( .a(tl_i[101]), .o1(n332) );
  b15inv000ar1n03x5 U516 ( .a(tl_i[61]), .o1(n342) );
  b15inv000ar1n03x5 U472 ( .a(tl_i[58]), .o1(n345) );
  b15ao0012ar1n02x5 U547 ( .b(n369), .c(n380), .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), .o(n375) );
  b15nonb02ar1n02x3 U693 ( .a(rdata[18]), .b(n434), .out0(
        u_tlul_adapter_sram_rdata_tlword[18]) );
  b15nonb02ar1n02x3 U653 ( .a(rdata[5]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[5]) );
  b15nonb02ar1n02x3 U647 ( .a(rdata[3]), .b(n416), .out0(
        u_tlul_adapter_sram_rdata_tlword[3]) );
  b15nonb02ar1n02x3 U666 ( .a(rdata[9]), .b(n429), .out0(
        u_tlul_adapter_sram_rdata_tlword[9]) );
  b15fpy200ar1n02x5 u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__4__u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__5_ ( 
        .si1(1'b0), .d1(tl_i[96]), .ssb(1'b1), .clk(
        u_tlul_adapter_sram_u_reqfifo_net644), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[4]), .si2(
        1'b0), .d2(tl_i[97]), .o2(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[5]) );
  b15nonb02ar1n02x3 U577 ( .a(tl_i[0]), .b(n376), .out0(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b15inv000ar1n03x5 U533 ( .a(n363), .o1(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b15and002ar1n02x5 U558 ( .a(n371), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[1]), .o(
        tl_o[2]) );
  b15and002ar1n02x5 U559 ( .a(n371), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[5]), .o(
        tl_o[6]) );
  b15and002ar1n02x5 U560 ( .a(n371), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[7]), .o(
        tl_o[8]) );
  b15and002ar1n02x5 U561 ( .a(n371), .b(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[3]), .o(
        tl_o[4]) );
  b15nonb02ar1n02x3 U545 ( .a(n368), .b(n367), .out0(n380) );
  b15inv000ar1n03x5 U430 ( .a(tl_i[108]), .o1(n328) );
  b15aoai13ar1n02x3 U565 ( .c(n377), .d(n375), .b(n374), .a(tl_o[62]), .o1(
        tl_o[65]) );
  b15oai013ar1n02x3 U593 ( .b(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), .c(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]), .d(
        n388), .a(n387), .o1(n389) );
  b15bfn000ar1n02x5 U717 ( .a(n389), .o(n468) );
  b15bfn000ar1n02x5 U721 ( .a(n389), .o(n472) );
  b15aoi112al1n02x3 U543 ( .c(n367), .d(n368), .a(
        u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), .b(n369), 
        .o1(u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b15nonb02ar1n02x3 U567 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[8]), .b(
        n376), .out0(tl_o[57]) );
  b15nonb02ar1n02x3 U568 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[2]), .b(
        n376), .out0(tl_o[51]) );
  b15nonb02ar1n02x3 U569 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[6]), .b(
        n376), .out0(tl_o[55]) );
  b15nonb02ar1n02x3 U570 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[0]), .b(
        n376), .out0(tl_o[49]) );
  b15nonb02ar1n02x3 U571 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[4]), .b(
        n376), .out0(tl_o[53]) );
  b15nonb02ar1n02x3 U572 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[5]), .b(
        n376), .out0(tl_o[54]) );
  b15nonb02ar1n02x3 U573 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[3]), .b(
        n376), .out0(tl_o[52]) );
  b15nonb02ar1n02x3 U574 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[9]), .b(
        n376), .out0(tl_o[58]) );
  b15nonb02ar1n02x3 U575 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[7]), .b(
        n376), .out0(tl_o[56]) );
  b15nonb02ar1n02x3 U576 ( .a(
        u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[1]), .b(
        n376), .out0(tl_o[50]) );
endmodule

