// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_only_instr module generated by `tlgen.py` tool
// all reset signals should be generated from one reset signal to not make any deadlock
//
// Interconnect
// core_inst
//   -> s1n_4
//     -> sm1_5
//       -> instr
//     -> sm1_6
//       -> data
// core_data
//   -> s1n_7
//     -> sm1_5
//       -> instr
//     -> sm1_6
//       -> data

module xbar_only_instr (
  input clk_i,
  input rst_ni,

  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_core_inst_i,
  output tlul_pkg::tl_d2h_t tl_core_inst_o,
  input  tlul_pkg::tl_h2d_t tl_core_data_i,
  output tlul_pkg::tl_d2h_t tl_core_data_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_instr_o,
  input  tlul_pkg::tl_d2h_t tl_instr_i,
  output tlul_pkg::tl_h2d_t tl_data_o,
  input  tlul_pkg::tl_d2h_t tl_data_i,

  input prim_mubi_pkg::mubi4_t scanmode_i
);

  import tlul_pkg::*;
  import tl_only_instr_pkg::*;

  // scanmode_i is currently not used, but provisioned for future use
  // this assignment prevents lint warnings
  logic unused_scanmode;
  assign unused_scanmode = ^scanmode_i;

  tl_h2d_t tl_s1n_4_us_h2d ;
  tl_d2h_t tl_s1n_4_us_d2h ;


  tl_h2d_t tl_s1n_4_ds_h2d [2];
  tl_d2h_t tl_s1n_4_ds_d2h [2];

  // Create steering signal
  logic [1:0] dev_sel_s1n_4;


  tl_h2d_t tl_sm1_5_us_h2d [2];
  tl_d2h_t tl_sm1_5_us_d2h [2];

  tl_h2d_t tl_sm1_5_ds_h2d ;
  tl_d2h_t tl_sm1_5_ds_d2h ;


  tl_h2d_t tl_sm1_6_us_h2d [2];
  tl_d2h_t tl_sm1_6_us_d2h [2];

  tl_h2d_t tl_sm1_6_ds_h2d ;
  tl_d2h_t tl_sm1_6_ds_d2h ;

  tl_h2d_t tl_s1n_7_us_h2d ;
  tl_d2h_t tl_s1n_7_us_d2h ;


  tl_h2d_t tl_s1n_7_ds_h2d [2];
  tl_d2h_t tl_s1n_7_ds_d2h [2];

  // Create steering signal
  logic [1:0] dev_sel_s1n_7;



  assign tl_sm1_5_us_h2d[0] = tl_s1n_4_ds_h2d[0];
  assign tl_s1n_4_ds_d2h[0] = tl_sm1_5_us_d2h[0];

  assign tl_sm1_6_us_h2d[0] = tl_s1n_4_ds_h2d[1];
  assign tl_s1n_4_ds_d2h[1] = tl_sm1_6_us_d2h[0];

  assign tl_sm1_5_us_h2d[1] = tl_s1n_7_ds_h2d[0];
  assign tl_s1n_7_ds_d2h[0] = tl_sm1_5_us_d2h[1];

  assign tl_sm1_6_us_h2d[1] = tl_s1n_7_ds_h2d[1];
  assign tl_s1n_7_ds_d2h[1] = tl_sm1_6_us_d2h[1];

  assign tl_s1n_4_us_h2d = tl_core_inst_i;
  assign tl_core_inst_o = tl_s1n_4_us_d2h;

  assign tl_instr_o = tl_sm1_5_ds_h2d;
  assign tl_sm1_5_ds_d2h = tl_instr_i;

  assign tl_data_o = tl_sm1_6_ds_h2d;
  assign tl_sm1_6_ds_d2h = tl_data_i;

  assign tl_s1n_7_us_h2d = tl_core_data_i;
  assign tl_core_data_o = tl_s1n_7_us_d2h;

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_4 = 2'd2;
    if ((tl_s1n_4_us_h2d.a_address &
         ~(ADDR_MASK_INSTR)) == ADDR_SPACE_INSTR) begin
      dev_sel_s1n_4 = 2'd0;

    end else if ((tl_s1n_4_us_h2d.a_address &
                  ~(ADDR_MASK_DATA)) == ADDR_SPACE_DATA) begin
      dev_sel_s1n_4 = 2'd1;
end
  end

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_7 = 2'd2;
    if ((tl_s1n_7_us_h2d.a_address &
         ~(ADDR_MASK_INSTR)) == ADDR_SPACE_INSTR) begin
      dev_sel_s1n_7 = 2'd0;

    end else if ((tl_s1n_7_us_h2d.a_address &
                  ~(ADDR_MASK_DATA)) == ADDR_SPACE_DATA) begin
      dev_sel_s1n_7 = 2'd1;
end
  end


  // Instantiation phase
  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (8'h0),
    .DRspDepth (8'h0),
    .N         (2)
  ) u_s1n_4 (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (tl_s1n_4_us_h2d),
    .tl_h_o       (tl_s1n_4_us_d2h),
    .tl_d_o       (tl_s1n_4_ds_h2d),
    .tl_d_i       (tl_s1n_4_ds_d2h),
    .dev_select_i (dev_sel_s1n_4)
  );
  tlul_socket_m1 #(
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0),
    .M         (2)
  ) u_sm1_5 (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (tl_sm1_5_us_h2d),
    .tl_h_o       (tl_sm1_5_us_d2h),
    .tl_d_o       (tl_sm1_5_ds_h2d),
    .tl_d_i       (tl_sm1_5_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0),
    .M         (2)
  ) u_sm1_6 (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (tl_sm1_6_us_h2d),
    .tl_h_o       (tl_sm1_6_us_d2h),
    .tl_d_o       (tl_sm1_6_ds_h2d),
    .tl_d_i       (tl_sm1_6_ds_d2h)
  );
  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (8'h0),
    .DRspDepth (8'h0),
    .N         (2)
  ) u_s1n_7 (
    .clk_i        (clk_i),
    .rst_ni       (rst_ni),
    .tl_h_i       (tl_s1n_7_us_h2d),
    .tl_h_o       (tl_s1n_7_us_d2h),
    .tl_d_o       (tl_s1n_7_ds_h2d),
    .tl_d_i       (tl_s1n_7_ds_d2h),
    .dev_select_i (dev_sel_s1n_7)
  );

endmodule
