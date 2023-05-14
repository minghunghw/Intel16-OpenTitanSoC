/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP4
// Date      : Sat May 13 19:25:27 2023
/////////////////////////////////////////////////////////////


module toy_design (  );
  wire   read, rst_ni, clk_i, n_27_net__8_, n_27_net__3_, n_27_net__2_,
         n_27_net__1_, n_27_net__0_, u_mem_tlul_N1, u_mem_tlul_wen,
         u_mem_tlul_rvalid, u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__0_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__1_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__2_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__3_,
         u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628,
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
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11,
         u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9,
         n113, n116, n119, n122, n125, n126, n174, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
         SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
         SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
         SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
         SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21,
         SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28;
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
        1'b0}), .enabq({1'b0, 1'b0, 1'b0, 1'b0}), .enq({1'b1, 1'b1, 1'b1, 1'b1}), .outi({clk_i, rst_ni, SYNOPSYS_UNCONNECTED_5, 
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_}), .pad({
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_1}), .pd({1'b0, 1'b0, 1'b0, 1'b0}), .ppen({1'b0, 
        1'b0, 1'b0, 1'b0}), .prg_slew({1'b0, 1'b0, 1'b0, 1'b0}), .puq({1'b1, 
        1'b1, 1'b1, 1'b1}), .pwrup_pull_en({1'b0, 1'b0, 1'b0, 1'b0}), 
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
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__0_}), .pad({
        SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_12, 
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_6}), .pd({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .ppen({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .prg_slew({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .puq({
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .pwrup_pull_en({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .pwrupzhl({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}) );
  hl_corner_io u_corner ( .dq({1'b0, n264, 1'b0, 1'b0, 1'b0, 1'b0, n266, n265, 
        n267, n263}), .drv0({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .drv1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .drv2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .enabq({1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 
        1'b1, 1'b1}), .enq({1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 
        1'b0, 1'b0}), .outi({read, SYNOPSYS_UNCONNECTED_28, raddr, 
        SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_26, 
        SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_24}), .pad({
        SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_22, 
        SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_20, 
        SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_18, 
        SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_16, 
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_14}), .pd({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .ppen({1'b0, 1'b1, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), .prg_slew({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .puq({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .pwrup_pull_en({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0}), .pwrupzhl({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}) );
  ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h u_mem_tlul_u_sram ( .adr({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, u_mem_tlul_addr}), .din({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, u_mem_tlul_wdata}), .mc({1'b0, 1'b0, 1'b0}), 
        .q(u_mem_tlul_rdata), .wa({1'b0, 1'b0}), .wpulse({1'b0, 1'b0}), .clk(
        clk_i), .clkbyp(1'b0), .fwen(1'b0), .mcen(1'b0), .ren(n246), .wen(
        u_mem_tlul_wen), .wpulseen(1'b1) );
  b0mfqy00car1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst) );
  b0mfqy00car1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst) );
  b0mfqy00car1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst_reg ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__4_ ( 
        .si(1'b0), .d(n122), .ssb(1'b1), .clk(clk_i), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]) );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__8_ ( 
        .si(1'b0), .d(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628), .o() );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__39_ ( 
        .si(1'b0), .d(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[31]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), .o() );
  b0mfpy000pr1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__26_ ( 
        .si(1'b0), .d(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[18]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), .o() );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_)
         );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_)
         );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(n247), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_0_ ( 
        .si(1'b0), .d(1'b0), .den(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_) );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_rptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25), .den(n247), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_)
         );
  b0mfqy043ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_wptr_o_reg_1_ ( 
        .si(1'b0), .d(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11), .den(u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), 
        .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_)
         );
  b0mxor002ar1n02x5 U273 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), .b(u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .out0(n225) );
  b0mxor002ar1n02x5 U274 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_rptr_value_0_), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_wptr_value_0_), .out0(n223) );
  b0mnor002ar1n03x5 U275 ( .a(n225), .b(n223), .o1(n239) );
  b0minv000ar1n03x5 U276 ( .a(n239), .o1(n233) );
  b0mxor002ar1n02x5 U279 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(n230) );
  b0mxor002ar1n02x5 U280 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_rptr_value_0_), .b(u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_wptr_value_0_), 
        .out0(n226) );
  b0mnorp02ar1n02x5 U281 ( .a(n230), .b(n226), .o1(n213) );
  b0mnorp02ar1n02x5 U282 ( .a(n213), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), 
        .o1(n209) );
  b0mxor002ar1n02x5 U283 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), 
        .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(n243) );
  b0mxor002ar1n02x5 U284 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_rptr_value_0_), .b(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_wptr_value_0_), 
        .out0(n240) );
  b0mnorp02ar1n02x5 U285 ( .a(n243), .b(n240), .o1(n211) );
  b0maoai13ar1n02x3 U288 ( .c(n211), .d(n241), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), 
        .a(n210), .o1(n208) );
  b0mnandp2ar1n03x5 U289 ( .a(n209), .b(n208), .o1(n_27_net__8_) );
  b0minv000ar1n03x5 U292 ( .a(n244), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b0mnandp2ar1n03x5 U293 ( .a(n211), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N23), .o1(n221) );
  b0mnor003ar1n02x7 U294 ( .a(n211), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .c(n244), .o1(n218) );
  b0mnanb02ar1n02x5 U295 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]), .b(n218), .out0(n215) );
  b0mnandp2ar1n03x5 U296 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), .o1(n212) );
  b0mnor004ar1n02x3 U297 ( .a(n213), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), .c(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]), .d(n212), .o1(n214) );
  b0moai112ar1n02x5 U298 ( .c(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .d(n244), .a(n214), .b(n221), .o1(n219) );
  b0mnanb02ar1n02x5 U301 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), .b(n218), .out0(n216) );
  b0mnanb02ar1n02x5 U304 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]), .b(n218), .out0(n217) );
  b0mnanb02ar1n02x5 U307 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .b(n218), .out0(n220) );
  b0minv000ar1n03x5 U309 ( .a(u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .o1(n207) );
  b0mnonb02ar1n02x3 U312 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__3_), .b(n246), .out0(
        u_mem_tlul_wdata[3]) );
  b0mnonb02ar1n02x3 U313 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__2_), .b(n246), .out0(
        u_mem_tlul_wdata[2]) );
  b0mnonb02ar1n02x3 U314 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__1_), .b(n246), .out0(
        u_mem_tlul_wdata[1]) );
  b0mnonb02ar1n02x3 U315 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_data__0_), .b(n246), .out0(
        u_mem_tlul_wdata[0]) );
  b0mnandp2ar1n03x5 U316 ( .a(u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .b(read), .o1(n228) );
  b0minv000ar1n03x5 U317 ( .a(n228), .o1(n222) );
  b0mao0022ar1n02x5 U318 ( .a(n222), .b(raddr[3]), .c(u_mem_tlul_wen), .d(
        waddr[3]), .o(u_mem_tlul_addr[3]) );
  b0mao0022ar1n02x5 U319 ( .a(n222), .b(raddr[2]), .c(u_mem_tlul_wen), .d(
        waddr[2]), .o(u_mem_tlul_addr[2]) );
  b0mao0022ar1n02x5 U320 ( .a(n222), .b(raddr[1]), .c(u_mem_tlul_wen), .d(
        waddr[1]), .o(u_mem_tlul_addr[1]) );
  b0mao0022ar1n02x5 U321 ( .a(n222), .b(raddr[0]), .c(u_mem_tlul_wen), .d(
        waddr[0]), .o(u_mem_tlul_addr[0]) );
  b0minv000ar1n03x5 U322 ( .a(n223), .o1(n224) );
  b0maoi012ar1n02x5 U323 ( .b(n225), .c(n224), .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .o1(n231) );
  b0minv000ar1n03x5 U324 ( .a(n226), .o1(n229) );
  b0maoi012ar1n02x5 U325 ( .b(n230), .c(n229), .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), 
        .o1(n227) );
  b0mnandp3ar1n03x5 U326 ( .a(n231), .b(
        u_mem_tlul_u_tlul_adapter_sram_tl_i_int_a_valid_), .c(n227), .o1(n237)
         );
  b0mnorp02ar1n02x5 U327 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_wptr_1_), 
        .b(n237), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b0mnorp02ar1n02x5 U330 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_wptr_1_), .b(n238), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b0mnonb02ar1n02x3 U332 ( .a(u_mem_tlul_rdata[9]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[9]) );
  b0mnonb02ar1n02x3 U333 ( .a(u_mem_tlul_rdata[7]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[7]) );
  b0mnonb02ar1n02x3 U334 ( .a(u_mem_tlul_rdata[6]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[6]) );
  b0mnonb02ar1n02x3 U335 ( .a(u_mem_tlul_rdata[5]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[5]) );
  b0mnonb02ar1n02x3 U336 ( .a(u_mem_tlul_rdata[4]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[4]) );
  b0mnonb02ar1n02x3 U338 ( .a(u_mem_tlul_rdata[31]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[31]) );
  b0mnonb02ar1n02x3 U339 ( .a(u_mem_tlul_rdata[30]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[30]) );
  b0mnonb02ar1n02x3 U340 ( .a(u_mem_tlul_rdata[8]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[8]) );
  b0mnonb02ar1n02x3 U341 ( .a(u_mem_tlul_rdata[28]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[28]) );
  b0mnonb02ar1n02x3 U342 ( .a(u_mem_tlul_rdata[27]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[27]) );
  b0mnonb02ar1n02x3 U343 ( .a(u_mem_tlul_rdata[26]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[26]) );
  b0mnonb02ar1n02x3 U344 ( .a(u_mem_tlul_rdata[25]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[25]) );
  b0mnonb02ar1n02x3 U345 ( .a(u_mem_tlul_rdata[24]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[24]) );
  b0mnonb02ar1n02x3 U347 ( .a(u_mem_tlul_rdata[23]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[23]) );
  b0mnonb02ar1n02x3 U348 ( .a(u_mem_tlul_rdata[29]), .b(n234), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[29]) );
  b0mnonb02ar1n02x3 U349 ( .a(u_mem_tlul_rdata[21]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[21]) );
  b0mnonb02ar1n02x3 U350 ( .a(u_mem_tlul_rdata[22]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[22]) );
  b0mnonb02ar1n02x3 U351 ( .a(u_mem_tlul_rdata[20]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[20]) );
  b0mnonb02ar1n02x3 U352 ( .a(u_mem_tlul_rdata[17]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[17]) );
  b0mnonb02ar1n02x3 U353 ( .a(u_mem_tlul_rdata[19]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[19]) );
  b0mnonb02ar1n02x3 U354 ( .a(u_mem_tlul_rdata[18]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[18]) );
  b0mnonb02ar1n02x3 U355 ( .a(u_mem_tlul_rdata[14]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[14]) );
  b0mnonb02ar1n02x3 U356 ( .a(u_mem_tlul_rdata[16]), .b(n235), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[16]) );
  b0mnonb02ar1n02x3 U357 ( .a(u_mem_tlul_rdata[15]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[15]) );
  b0mnonb02ar1n02x3 U358 ( .a(u_mem_tlul_rdata[12]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[12]) );
  b0mnonb02ar1n02x3 U359 ( .a(u_mem_tlul_rdata[13]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[13]) );
  b0mnonb02ar1n02x3 U360 ( .a(u_mem_tlul_rdata[10]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[10]) );
  b0mnonb02ar1n02x3 U361 ( .a(u_mem_tlul_rdata[11]), .b(n236), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[11]) );
  b0morn002ar1n03x5 U364 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .o(n113) );
  b0morn002ar1n03x5 U365 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .o(n116) );
  b0morn002ar1n03x5 U366 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .o(n122) );
  b0morn002ar1n03x5 U367 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .o(n119) );
  b0mnor003ar1n02x7 U369 ( .a(n239), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_under_rst), .c(n241), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23) );
  b0mnonb02ar1n02x3 U370 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N23), .b(u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_fifo_rptr_1_), .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b0minv000ar1n03x5 U371 ( .a(n240), .o1(n242) );
  b0maoi112ar1n02x3 U372 ( .c(n243), .d(n242), .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_under_rst), 
        .b(n241), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b0mnonb02ar1n02x3 U373 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .b(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_wptr_1_), 
        .out0(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N11) );
  b0mnorp02ar1n02x5 U374 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_fifo_rptr_1_), 
        .b(n_27_net__8_), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b0mnorp02ar1n02x5 U375 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_fifo_rptr_1_), 
        .b(n244), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N25) );
  b0moai112ar1n02x5 U299 ( .c(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[3]), 
        .d(n221), .a(n215), .b(n219), .o1(n_27_net__3_) );
  b0moai112ar1n02x5 U302 ( .c(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[2]), 
        .d(n221), .a(n216), .b(n219), .o1(n_27_net__2_) );
  b0mnorp02ar1n02x5 U310 ( .a(read), .b(n207), .o1(u_mem_tlul_wen) );
  b0minv000ar1n03x5 U290 ( .a(u_mem_tlul_wen), .o1(n246) );
  b0minv000ar1n03x5 U311 ( .a(n_27_net__8_), .o1(n247) );
  b0moai112ar1n02x5 U305 ( .c(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[1]), 
        .d(n221), .a(n217), .b(n219), .o1(n259) );
  b0mbfn000ar1n03x5 U380 ( .a(n_27_net__3_), .o(n250) );
  b0minv000ar1n03x5 U362 ( .a(n237), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b0moai112ar1n02x5 U308 ( .c(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[0]), 
        .d(n221), .a(n220), .b(n219), .o1(n260) );
  b0mbfn000ar1n03x5 U379 ( .a(n_27_net__2_), .o(n255) );
  b0minv000ar1n03x5 U363 ( .a(n238), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9) );
  b0mbfn000ar1n03x5 U378 ( .a(n_27_net__8_), .o(n261) );
  b0mbfn000ar1n03x5 U381 ( .a(n260), .o(n257) );
  b0minv000ar1n03x5 U387 ( .a(n_27_net__1_), .o1(n252) );
  b0minv000ar1n03x5 U388 ( .a(n250), .o1(n254) );
  b0minv000ar1n03x5 U389 ( .a(n255), .o1(n256) );
  b0minv000ar1n03x5 U390 ( .a(n257), .o1(n258) );
  b0mbfn000ar1n03x5 U391 ( .a(n259), .o(n_27_net__1_) );
  b0minv000ar1n03x5 U392 ( .a(n261), .o1(n262) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_clk_gate_gen_normal_fifo_storage_reg_0__0_latch ( 
        .clk(clk_i), .en(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_clk_gate_gen_normal_fifo_storage_reg_0__latch ( 
        .clk(clk_i), .en(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_clk_gate_gen_normal_fifo_storage_reg_0__0_latch ( 
        .clk(clk_i), .en(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606) );
  b0mcilb05ah1n02x3 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_clk_gate_gen_normal_fifo_storage_reg_0__latch ( 
        .clk(clk_i), .en(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_u_fifo_cnt_N9), .te(1'b0), .clkout(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__9__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__10_ ( 
        .si1(1'b0), .d1(1'b1), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(), .si2(1'b0), 
        .d2(1'b1), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[10]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__11__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__12_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[11]), .si2(1'b0), .d2(1'b0), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[12]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__13__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__14_ ( 
        .si1(1'b0), .d1(1'b1), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[13]), .si2(1'b0), .d2(n207), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__15__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__16_ ( 
        .si1(1'b0), .d1(read), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net634), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), .si2(1'b0), .d2(1'b0), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__0__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__2__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__4__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__5_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__6__u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_net628), .o1(), .si2(1'b0), 
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
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
        .o1(), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[28]), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__37__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__38_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[29]), 
        .ssb(1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net606), 
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
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__0__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[0]), .si2(1'b0), .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__2__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__4__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__5_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__6__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__7_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), .si2(1'b0), 
        .d2(1'b0), .o2() );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__8__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__9_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[0]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[8]), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[1]), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[9]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__10__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__11_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[2]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[10]), .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[3]), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_rdata[11]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__12__u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_gen_normal_fifo_storage_reg_0__13_ ( 
        .si1(1'b0), .d1(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[4]), .ssb(
        1'b1), .clk(u_mem_tlul_u_tlul_adapter_sram_u_rspfifo_net600), .o1(), 
        .si2(1'b0), .d2(u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[5]), .o2()
         );
  b0mfqy203ar1n02x5 u_mem_tlul_rvalid_reg_u_mem_tlul_u_tlul_adapter_sram_intg_error_q_reg ( 
        .si1(1'b0), .d1(u_mem_tlul_N1), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o1(u_mem_tlul_rvalid), .si2(1'b0), .d2(n174), .o2(n174) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__0__u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__1_ ( 
        .si1(1'b0), .d1(n126), .ssb(1'b1), .clk(clk_i), .o1(n125), .si2(1'b0), 
        .d2(n113), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]) );
  b0mfpy200ar1n02x5 u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__2__u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_reg_0__3_ ( 
        .si1(1'b0), .d1(n116), .ssb(1'b1), .clk(clk_i), .o1(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), .si2(1'b0), .d2(n119), .o2(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]) );
  b0mnandp2ar1n03x5 U286 ( .a(n209), .b(u_mem_tlul_rvalid), .o1(n241) );
  b0mnandp2ar1n03x5 U291 ( .a(n210), .b(n247), .o1(n244) );
  b0mnandp2ar1n03x5 U277 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[1]), .b(n233), .o1(n232) );
  b0mnonb02ar1n02x3 U278 ( .a(u_mem_tlul_rdata[3]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[3]) );
  b0mnonb02ar1n02x3 U306 ( .a(u_mem_tlul_rdata[0]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[0]) );
  b0mnonb02ar1n02x3 U300 ( .a(u_mem_tlul_rdata[2]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[2]) );
  b0mnonb02ar1n02x3 U303 ( .a(u_mem_tlul_rdata[1]), .b(n232), .out0(
        u_mem_tlul_u_tlul_adapter_sram_rdata_tlword[1]) );
  b0mnandp2ar1n03x5 U329 ( .a(n231), .b(u_mem_tlul_N1), .o1(n238) );
  b0minv000ar1n03x5 U386 ( .a(n254), .o1(n253) );
  b0minv000ar1n03x5 U384 ( .a(n252), .o1(n251) );
  b0minv000ar1n03x5 U385 ( .a(n256), .o1(n249) );
  b0minv000ar1n03x5 U383 ( .a(n258), .o1(n_27_net__0_) );
  b0minv000ar1n03x5 U382 ( .a(n262), .o1(n248) );
  b0mnandp2ar1n03x5 U337 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[4]), .b(n233), .o1(n234) );
  b0mnandp2ar1n03x5 U331 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[2]), .b(n233), .o1(n236) );
  b0mnandp2ar1n03x5 U346 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_storage_rdata[3]), .b(n233), .o1(n235) );
  b0mnonb02ar1n02x3 U368 ( .a(n125), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_sramreqfifo_gen_normal_fifo_u_fifo_cnt_N9), .out0(n126) );
  b0mnonb03ar1n02x3 U287 ( .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[15]), .b(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[16]), .c(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_storage_rdata[14]), .out0(n210) );
  b0maoi112ar1n02x3 U328 ( .c(n230), .d(n229), .a(
        u_mem_tlul_u_tlul_adapter_sram_u_reqfifo_gen_normal_fifo_under_rst), 
        .b(n228), .o1(u_mem_tlul_N1) );
  b0mbfn001aq1n48x5 U393 ( .a(n_27_net__0_), .o(n263) );
  b0mbfn001aq1n48x5 U394 ( .a(n248), .o(n264) );
  b0mbfn001aq1n48x5 U395 ( .a(n249), .o(n265) );
  b0mbfn001aq1n48x5 U396 ( .a(n253), .o(n266) );
  b0mbfn001aq1n48x5 U397 ( .a(n251), .o(n267) );
endmodule

