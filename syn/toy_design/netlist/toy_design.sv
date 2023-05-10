/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP4
// Date      : Tue May  9 17:24:50 2023
/////////////////////////////////////////////////////////////


module toy_design ( clk_i_PAD, rst_ni_PAD, en_ifetch_PAD, tl_valid_PAD, 
        read_PAD, waddr_PAD, wdata_PAD, raddr_PAD, rdata_PAD, rvalid_PAD );
  input [3:0] waddr_PAD;
  input [3:0] wdata_PAD;
  input [3:0] raddr_PAD;
  output [3:0] rdata_PAD;
  input clk_i_PAD, rst_ni_PAD, en_ifetch_PAD, tl_valid_PAD, read_PAD;
  output rvalid_PAD;
  wire   read, rst_ni, clk_i, n_30_net__3_, n_30_net__2_, n_30_net__1_,
         u_mem_tlul__0_net_, u_mem_tlul_rvalid,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__0_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__1_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__2_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__3_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11,
         n113, n116, n119, n122, n125, n126, n174, n207, n208, n213, n214,
         n215, n216, n218, n220, n221, n223, n225, n226, n227, n228, n229,
         n230, n231, n232, n234, n238, n239, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n264, n265, n266, n267, n269, n270,
         n271, n272, n275, n276, n277, n278, n279, n280, n281, n282, n284,
         n285, n286, n287, n288, n290, n292, n293, n295, n296, n298, n299,
         n300, n302, n303, n304, n305, n306, n308, n309, n310, n312, n313,
         n314, n316, n317, n318, n319, n320, n321, n322,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6;
  wire   [3:0] raddr;
  wire   [3:0] waddr;
  wire   [31:0] u_mem_tlul_rdata;
  wire   [3:0] u_mem_tlul_wdata;
  wire   [3:0] u_mem_tlul_addr;
  wire   [31:0] u_mem_tlul_u_tlul_adapter_sram_rdata_tlword;
  wire  
         [16:10] u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata
;
  wire  
         [4:1] u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata
;
  wire  
         [11:0] u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata
;

  hl_4slice_west_io u_west ( .dq({1'b0, 1'b0, 1'b0, 1'b0}), .drv0({1'b0, 1'b0, 
        1'b0, 1'b0}), .drv1({1'b0, 1'b0, 1'b0, 1'b0}), .drv2({1'b0, 1'b0, 1'b0, 
        1'b0}), .enabq({1'b0, 1'b0, 1'b0, 1'b0}), .enq({1'b1, 1'b1, 1'b1, 1'b1}), .outi({clk_i, rst_ni, SYNOPSYS_UNCONNECTED_1, 
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_}), .pad({clk_i_PAD, 
        rst_ni_PAD, en_ifetch_PAD, tl_valid_PAD}), .pd({1'b0, 1'b0, 1'b0, 1'b0}), .ppen({1'b0, 1'b0, 1'b0, 1'b0}), .prg_slew({1'b0, 1'b0, 1'b0, 1'b0}), .puq(
        {1'b1, 1'b1, 1'b1, 1'b1}), .pwrup_pull_en({1'b0, 1'b0, 1'b0, 1'b0}), 
        .pwrupzhl({1'b0, 1'b0, 1'b0, 1'b0}) );
  hl_8slice_south_io u_south ( .dq({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .drv0({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .drv1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .drv2({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .enabq({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .enq({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1}), .outi({waddr, 
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__3_, 
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__2_, 
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__1_, 
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__0_}), .pad({waddr_PAD, 
        wdata_PAD}), .pd({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .ppen({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .prg_slew({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .puq({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), .pwrup_pull_en({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .pwrupzhl({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}) );
  hl_corner_io u_corner ( .dq({1'b0, n285, 1'b0, 1'b0, 1'b0, 1'b0, 
        n_30_net__3_, n287, n_30_net__1_, n286}), .drv0({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .drv1({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .drv2({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .enabq({1'b0, 1'b1, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), .enq({1'b1, 1'b0, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), .outi({read, 
        SYNOPSYS_UNCONNECTED_6, raddr, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_2}), .pad({read_PAD, rvalid_PAD, raddr_PAD, rdata_PAD}), .pd({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .ppen({1'b0, 1'b1, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), .prg_slew({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .puq({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), .pwrup_pull_en({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .pwrupzhl({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}) );
  ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h u_mem_tlul_u_sram ( .adr({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, u_mem_tlul_addr}), .din({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, u_mem_tlul_wdata}), .mc({1'b0, 1'b0, 1'b0}), 
        .q(u_mem_tlul_rdata), .wa({1'b0, 1'b0}), .wpulse({1'b0, 1'b0}), .clk(
        clk_i), .clkbyp(1'b0), .fwen(1'b0), .mcen(1'b0), .ren(
        u_mem_tlul__0_net_), .wen(n276), .wpulseen(1'b1) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__8_ ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o() );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__9_ ( 
        .si(1'b0), .d(1'b1), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o() );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__10_ ( 
        .si(1'b0), .d(1'b1), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__11_ ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__12_ ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__13_ ( 
        .si(1'b0), .d(1'b1), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__13_ ( 
        .si(1'b0), .d(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[5]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o() );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__11_ ( 
        .si(1'b0), .d(n299), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__39_ ( 
        .si(1'b0), .d(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[31]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), .o() );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__10_ ( 
        .si(1'b0), .d(n305), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__9_ ( 
        .si(1'b0), .d(n292), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__26_ ( 
        .si(1'b0), .d(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[18]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), .o() );
  b0mfpy000as1n12x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__14_ ( 
        .si(1'b0), .d(n207), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]) );
  b0mfhw000as1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__15_ ( 
        .si(1'b0), .d(read), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]) );
  b0minv040al1n03x5 U283 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__3_), .o1(n213) );
  b0minv040al1n03x5 U285 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__0_), .o1(n214) );
  b0minv040al1n03x5 U287 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__2_), .o1(n215) );
  b0mnand04aq1n04x3 U319 ( .a(n322), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]), .c(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), .d(n228), .o1(n230) );
  b0minv000ar1n03x5 U346 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .o1(n250) );
  b0mnonb02an1n02x3 U349 ( .a(n280), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b0moai012an1n03x5 U352 ( .b(n255), .c(n254), .a(n253), .o1(n256) );
  b0mnonb02an1n02x3 U354 ( .a(n277), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b0mnonb02ar1n02x3 U360 ( .a(u_mem_tlul_rdata[16]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[16]) );
  b0mnonb02ar1n02x3 U361 ( .a(u_mem_tlul_rdata[13]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[13]) );
  b0mnonb02ar1n02x3 U362 ( .a(u_mem_tlul_rdata[17]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[17]) );
  b0mnonb02ar1n02x3 U363 ( .a(u_mem_tlul_rdata[12]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[12]) );
  b0mnonb02ar1n02x3 U364 ( .a(u_mem_tlul_rdata[18]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[18]) );
  b0mnonb02ar1n02x3 U365 ( .a(u_mem_tlul_rdata[11]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[11]) );
  b0mnonb02ar1n02x3 U366 ( .a(u_mem_tlul_rdata[19]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[19]) );
  b0mnonb02ar1n02x3 U370 ( .a(u_mem_tlul_rdata[21]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[21]) );
  b0mnonb02ar1n02x3 U372 ( .a(u_mem_tlul_rdata[22]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[22]) );
  b0mnonb02ar1n02x3 U373 ( .a(u_mem_tlul_rdata[7]), .b(n266), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[7]) );
  b0mnonb02ar1n02x3 U374 ( .a(u_mem_tlul_rdata[23]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[23]) );
  b0mnonb02an1n02x3 U375 ( .a(u_mem_tlul_rdata[6]), .b(n266), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[6]) );
  b0mnonb02ar1n02x3 U376 ( .a(u_mem_tlul_rdata[5]), .b(n266), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[5]) );
  b0mnonb02ar1n02x3 U380 ( .a(u_mem_tlul_rdata[4]), .b(n266), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[4]) );
  b0mnonb02ar1n02x3 U384 ( .a(u_mem_tlul_rdata[29]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[29]) );
  b0mnonb02ar1n02x3 U385 ( .a(u_mem_tlul_rdata[30]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[30]) );
  b0minv000aq1n02x5 U393 ( .a(u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .o1(n207) );
  b0mcorn02aq1n02x5 U396 ( .clk1(n278), .clk2(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]), .clkout(n113) );
  b0mbfn001aq1n48x5 U390 ( .a(n275), .o(n286) );
  b0mbfn001aq1n48x5 U407 ( .a(n_30_net__2_), .o(n287) );
  b0mfhw000am1n16x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__16_ ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]) );
  b0moai012as1n20x5 U402 ( .b(u_mem_tlul_rdata[0]), .c(n272), .a(n271), .o1(
        n275) );
  b0mcand02as1n08x5 U276 ( .clk1(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .clk2(read), 
        .clkout(n265) );
  b0mcand02as1n08x5 U342 ( .clk1(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .clk2(n247), 
        .clkout(n278) );
  b0mnonb02as1n03x5 U286 ( .a(n276), .b(n214), .out0(u_mem_tlul_wdata[0]) );
  b0mnonb02as1n03x5 U290 ( .a(n276), .b(n216), .out0(u_mem_tlul_wdata[1]) );
  b0mnonb02as1n03x5 U288 ( .a(n276), .b(n215), .out0(u_mem_tlul_wdata[2]) );
  b0mnonb02as1n03x5 U284 ( .a(n276), .b(n213), .out0(u_mem_tlul_wdata[3]) );
  b0mnandp2ar1n03x5 U347 ( .a(n260), .b(n250), .o1(n251) );
  b0mnonb02as1n03x5 U343 ( .a(u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .b(n248), .out0(n281) );
  b0mbfn000ar1n03x5 U345 ( .a(n249), .o(n257) );
  b0minv000ar1n04x5 U351 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), 
        .o1(n253) );
  b0mnandp2ar1n03x5 U377 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]), .b(n260), .o1(n261) );
  b0mnandp2ar1n03x5 U356 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), .b(n260), .o1(n258) );
  b0mnandp2ar1n03x5 U359 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), .b(n260), .o1(n259) );
  b0mfpy000pl1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__0_ ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]) );
  b0maoi012an1n02x5 U339 ( .b(n245), .c(n244), .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .o1(n246) );
  b0mnand02aq1n08x5 U316 ( .a(n282), .b(n227), .o1(n267) );
  b0minv000ar1n03x5 U317 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .o1(n231) );
  b0mbfn001aq1n06x5 U330 ( .a(n238), .o(n284) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_clk_gate_gen_normal_fifo_storage_reg_0__0_latch ( 
        .clk(clk_i), .en(n281), .te(1'b0), .clkout(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_clk_gate_gen_normal_fifo_storage_reg_0__0_latch ( 
        .clk(clk_i), .en(n277), .te(1'b0), .clkout(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_clk_gate_gen_normal_fifo_storage_reg_0__latch ( 
        .clk(clk_i), .en(n277), .te(1'b0), .clkout(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__0__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__2__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__4__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__5_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__6__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__27__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__28_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[19]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[20]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__29__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__30_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[21]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[22]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__31__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__32_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[23]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[24]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__33__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__34_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[25]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[26]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__35__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__36_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[27]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[28]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__37__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__38_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[29]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[30]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__14__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__15_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[6]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), .o1(), 
        .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[7]), .o2()
         );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__16__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__17_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[8]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), .o1(), 
        .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[9]), .o2()
         );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__18__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__19_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[10]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[11]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__20__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__21_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[12]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[13]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__22__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__23_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[14]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[15]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__24__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__25_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[16]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[17]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__1__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__2_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__3__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__4_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__5__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__6_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__7__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__12_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[4]), .o2() );
  b0minv040as1n12x5 U310 ( .a(n288), .o1(n276) );
  b0mnandp2as1n08x5 U309 ( .a(n295), .b(n296), .o1(u_mem_tlul_addr[0]) );
  b0mfqy043as1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n277), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_) );
  b0mbfn001as1n16x5 U424 ( .a(n316), .o(n_30_net__3_) );
  b0mbfn001as1n16x5 U425 ( .a(n317), .o(n_30_net__1_) );
  b0minv000as1n20x5 U331 ( .a(n284), .o1(n285) );
  b0mfqy043hq1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n280), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_) );
  b0mnor002ar1n03x5 U318 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), .o1(n228) );
  b0mnor002al1n02x5 U413 ( .a(n267), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]), .o1(n300) );
  b0mnor002al1n02x5 U332 ( .a(n267), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), .o1(n239) );
  b0minv000ar1n04x5 U289 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__1_), .o1(n216) );
  b0mnonb02ar1n02x3 U403 ( .a(n306), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b0mfqy043as1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n282), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_) );
  b0mnandp2as1n03x5 U388 ( .a(n276), .b(waddr[2]), .o1(n310) );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(n277), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_)
         );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(n281), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_)
         );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(n306), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_)
         );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(n282), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_)
         );
  b0mxor002aq1n02x5 U291 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .b(u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), .out0(n245) );
  b0mnanb02as1n04x5 U293 ( .a(n245), .b(n244), .out0(n260) );
  b0mnonb02aq1n02x3 U315 ( .a(n226), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .out0(n227) );
  b0maoi012aq1n02x5 U338 ( .b(n243), .c(n242), .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), 
        .o1(n264) );
  b0mbfn000aq1n03x5 U389 ( .a(n284), .o(n306) );
  b0mnonb02ar1n02x3 U348 ( .a(n257), .b(n251), .out0(n280) );
  b0mnonb02ar1n02x3 U353 ( .a(n257), .b(n256), .out0(n277) );
  b0mand002aq1n03x5 U412 ( .a(u_mem_tlul_rdata[3]), .b(n234), .o(n299) );
  b0mfqy003ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_intg_error_q_reg ( .si(1'b0), .d(n174), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(n174) );
  b0mfqy00cas1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst) );
  b0mnandp2as1n08x5 U415 ( .a(n304), .b(n303), .o1(u_mem_tlul_addr[1]) );
  b0mnonb02al1n02x3 U368 ( .a(u_mem_tlul_rdata[20]), .b(n259), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[20]) );
  b0mnonb02al1n02x3 U357 ( .a(u_mem_tlul_rdata[15]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[15]) );
  b0mnonb02al1n02x3 U382 ( .a(u_mem_tlul_rdata[27]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[27]) );
  b0mnonb02al1n02x3 U358 ( .a(u_mem_tlul_rdata[14]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[14]) );
  b0mnonb02as1n03x5 U392 ( .a(n281), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b0maoi012aq1n02x5 U320 ( .b(n282), .c(n231), .a(n230), .o1(n232) );
  b0mfqy043ah1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(n280), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_) );
  b0mfuy200hn1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__0__u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__2_ ( 
        .si1(1'b0), .d1(n126), .ssb(1'b1), .clk(clk_i), .o1(n125), .si2(1'b0), 
        .d2(n116), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]) );
  b0mnand02ah1n16x5 U314 ( .a(u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .b(n208), .o1(u_mem_tlul__0_net_) );
  b0mnandp2as1n08x5 U418 ( .a(n310), .b(n309), .o1(u_mem_tlul_addr[2]) );
  b0mnonb02ar1n06x5 U379 ( .a(u_mem_tlul_rdata[25]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[25]) );
  b0mnonb02ar1n06x5 U369 ( .a(u_mem_tlul_rdata[9]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[9]) );
  b0mnonb02ar1n06x5 U367 ( .a(u_mem_tlul_rdata[10]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[10]) );
  b0mnonb02ar1n06x5 U381 ( .a(u_mem_tlul_rdata[26]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[26]) );
  b0mcand02as1n08x5 U391 ( .clk1(n265), .clk2(n264), .clkout(n279) );
  b0mnonb02ar1n06x5 U383 ( .a(u_mem_tlul_rdata[28]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[28]) );
  b0mnonb02ar1n06x5 U371 ( .a(u_mem_tlul_rdata[8]), .b(n258), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[8]) );
  b0mnonb02as1n03x5 U404 ( .a(n278), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b0maoi012as1n02x7 U421 ( .b(n313), .c(n223), .a(n221), .o1(n238) );
  b0mxnr002ah1n03x5 U298 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), 
        .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(n255) );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n281), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_) );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(n278), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_) );
  b0mfqy043ah1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n306), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_) );
  b0mfuy200hn1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__3__u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__4_ ( 
        .si1(1'b0), .d1(n119), .ssb(1'b1), .clk(clk_i), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), .si2(1'b0), .d2(n122), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]) );
  b0mfqy043as1n08x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n278), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_) );
  b0mxnr002an1n02x5 U292 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_), .out0(n244) );
  b0minv040al1n03x5 U299 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), .o1(n314) );
  b0minv000ah1n03x5 U295 ( .a(n255), .o1(n308) );
  b0minv040al1n03x5 U308 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]), .o1(n220) );
  b0maob012as1n16x5 U307 ( .b(n276), .c(waddr[3]), .a(n241), .out0(
        u_mem_tlul_addr[3]) );
  b0mnanb02ah1n08x5 U303 ( .a(n308), .b(n252), .out0(n226) );
  b0mnand02aq1n04x5 U302 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), .b(n220), .o1(n312) );
  b0moai012as1n03x5 U275 ( .b(n290), .c(n226), .a(n253), .o1(n313) );
  b0mcorn02aq1n08x5 U394 ( .clk1(n278), .clk2(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]), .clkout(n122) );
  b0minv000aq1n02x5 U337 ( .a(n270), .o1(n302) );
  b0minv000aq1n02x5 U334 ( .a(n270), .o1(n298) );
  b0mfqy003as1n04x5 u_mem_tlul_rvalid_reg ( .si(1'b0), .d(n279), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o(u_mem_tlul_rvalid) );
  b0mfqy00chq1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst) );
  b0mfuy000hn1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si(1'b0), .d(n113), .ssb(1'b1), .clk(clk_i), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]) );
  b0mfpy000pl1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__8_ ( 
        .si(1'b0), .d(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[0]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]) );
  b0mfqy00car1n04x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst) );
  b0mnandp2as1n03x5 U329 ( .a(n265), .b(raddr[2]), .o1(n309) );
  b0mxor002aq1n04x5 U422 ( .a(n314), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .out0(n252) );
  b0mnandp2as1n04x5 U416 ( .a(n276), .b(waddr[1]), .o1(n304) );
  b0mnand02as1n06x5 U304 ( .a(n276), .b(waddr[0]), .o1(n295) );
  b0mnand02aq1n04x5 U340 ( .a(n264), .b(n246), .o1(n248) );
  b0mnonb02an1n03x5 U341 ( .a(read), .b(n248), .out0(n247) );
  b0mnonb02ar1n06x5 U386 ( .a(u_mem_tlul_rdata[31]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[31]) );
  b0mnonb02ar1n06x5 U378 ( .a(u_mem_tlul_rdata[24]), .b(n261), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[24]) );
  b0mnorp02ar1n02x5 U280 ( .a(n221), .b(n218), .o1(n249) );
  b0mnonb02an1n03x5 U387 ( .a(u_mem_tlul_rdata[0]), .b(n266), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[0]) );
  b0mand002ar1n04x5 U417 ( .a(u_mem_tlul_rdata[2]), .b(n234), .o(n305) );
  b0mand002ar1n04x5 U409 ( .a(u_mem_tlul_rdata[1]), .b(n234), .o(n292) );
  b0minv000al1n02x5 U350 ( .a(n252), .o1(n254) );
  b0mnandp2as1n03x5 U274 ( .a(u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .b(n208), .o1(n288) );
  b0minv000aq1n40x5 U273 ( .a(read), .o1(n208) );
  b0minv000aq1n02x5 U277 ( .a(n234), .o1(n266) );
  b0mnanb02as1n04x5 U282 ( .a(n243), .b(n242), .out0(n229) );
  b0mnanb02ah1n02x5 U294 ( .a(n243), .b(n242), .out0(n322) );
  b0mxor002ah1n03x5 U296 ( .a(n319), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .out0(n242) );
  b0maoai13as1n06x5 U300 ( .c(u_mem_tlul_rdata[3]), .d(n234), .b(n272), .a(
        n321), .o1(n316) );
  b0maoai13as1n06x5 U305 ( .c(u_mem_tlul_rdata[1]), .d(n234), .b(n272), .a(
        n320), .o1(n317) );
  b0mnorp02as1n04x5 U322 ( .a(n221), .b(n218), .o1(n290) );
  b0mnanb02as1n08x5 U323 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), 
        .b(n229), .out0(n221) );
  b0mxor002as1n03x5 U324 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(n243) );
  b0minv000an1n04x5 U325 ( .a(u_mem_tlul_rvalid), .o1(n218) );
  b0maoai13as1n08x5 U326 ( .c(u_mem_tlul_rdata[2]), .d(n234), .b(n272), .a(
        n318), .o1(n_30_net__2_) );
  b0mnandp2as1n32x5 U327 ( .a(n282), .b(n225), .o1(n272) );
  b0mand002as1n12x5 U328 ( .a(n260), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]), .o(n234) );
  b0mnonb02as1n03x5 U335 ( .a(n125), .b(n278), .out0(n126) );
  b0minv040ar1n03x5 U297 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_), .o1(n319) );
  b0minv040aq1n04x5 U313 ( .a(n226), .o1(n225) );
  b0morn002ar1n02x5 U410 ( .a(n267), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]), .o(n293) );
  b0mnor002aq1n06x5 U401 ( .a(n270), .b(n269), .o1(n271) );
  b0mnonb02ar1n02x3 U278 ( .a(n298), .b(n300), .out0(n321) );
  b0mnonb02ar1n02x3 U306 ( .a(n302), .b(n239), .out0(n318) );
  b0mnonb02aq1n02x3 U279 ( .a(n293), .b(n270), .out0(n320) );
  b0mnand02as1n04x5 U336 ( .a(n265), .b(raddr[3]), .o1(n241) );
  b0mnandp2aq1n04x5 U333 ( .a(n265), .b(raddr[0]), .o1(n296) );
  b0mnandp2aq1n04x5 U301 ( .a(n265), .b(raddr[1]), .o1(n303) );
  b0mnonb02an1n02x3 U355 ( .a(n282), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), 
        .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b0mnor002aq1n03x5 U281 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), .b(n312), .o1(n223) );
  b0mcand02aq1n12x5 U321 ( .clk1(n232), .clk2(n272), .clkout(n270) );
  b0moai022as1n02x5 U400 ( .a(n234), .b(n272), .c(n267), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .o1(n269) );
  b0morn002as1n02x5 U397 ( .a(n278), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), .o(n116) );
  b0morn002as1n02x5 U395 ( .a(n278), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), .o(n119) );
  b0mand002as1n12x5 U311 ( .a(n238), .b(n223), .o(n282) );
endmodule

