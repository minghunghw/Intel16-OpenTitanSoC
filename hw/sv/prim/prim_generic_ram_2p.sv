// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Synchronous dual-port SRAM register model
//   This module is for simulation and small size SRAM.
//   Implementing ECC should be done inside wrapper not this model.
`include "prim_assert.sv"
module prim_generic_ram_2p import prim_ram_2p_pkg::*; #(
  parameter  int Width           = 32, // bit
  parameter  int Depth           = 128,
  parameter  int DataBitsPerMask = 1, // Number of data bits per bit of write mask
  parameter      MemInitFile     = "", // VMEM file to initialize the memory with

  localparam int Aw              = $clog2(Depth)  // derived parameter
) (
  input clk_a_i,
  input clk_b_i,

  input                    a_req_i,
  input                    a_write_i,
  input        [Aw-1:0]    a_addr_i,
  input        [Width-1:0] a_wdata_i,
  input  logic [Width-1:0] a_wmask_i,
  output logic [Width-1:0] a_rdata_o,


  input                    b_req_i,
  input                    b_write_i,
  input        [Aw-1:0]    b_addr_i,
  input        [Width-1:0] b_wdata_i,
  input  logic [Width-1:0] b_wmask_i,
  output logic [Width-1:0] b_rdata_o,

  input ram_2p_cfg_t       cfg_i
);

$info("ram_2p size: %d, %d, %d",Width,Depth,DataBitsPerMask);

if( Depth==1024 & Width==36) begin
  rf_1024x36_be u_rf (
    .ickwp0(clk_a_i),                                   // write clock port 0
    .iwenp0(req_i & write_i),                                   // write enable port 0
    .iawp0(a_addr_i),                      // write address port 0
    .idinp0(a_wdata_i),                     // write data port 0
    .ibwep0(a_wmask_i),                // write segment enable port 0
    .ickrp0(clk_b_i),                                   // read clock port 0
    .irenp0(req_i & write_i),                                   // read enable port 0
    .iarp0(b_addr_i),                      // read address port 0
    .iclkbyp(1'b0),                                  // self-timed clock bypass select
    .imce(1'b0),                                     // self-timed clock high phase width select enable
    .irmce(2'b0),                              // self-timed clock high phase width select
    .ifuse(1'b0),
    .iwmce(4'b0),
    .odoutp0(b_rdata_o)  
  );
end else if(Depth==512 & Width==32) begin
  rf_512x32_be u_rf (
    .ickwp0(clk_a_i),                                   // write clock port 0
    .iwenp0(req_i & write_i),                                   // write enable port 0
    .iawp0(a_addr_i),                      // write address port 0
    .idinp0(a_wdata_i),                     // write data port 0
    .ibwep0(a_wmask_i),                // write segment enable port 0
    .ickrp0(clk_b_i),                                   // read clock port 0
    .irenp0(req_i & write_i),                                   // read enable port 0
    .iarp0(b_addr_i),                      // read address port 0
    .iclkbyp(1'b0),                                  // self-timed clock bypass select
    .imce(1'b0),                                     // self-timed clock high phase width select enable
    .irmce(2'b0),                              // self-timed clock high phase width select
    .ifuse(1'b0),
    .iwmce(4'b0),
    .odoutp0(b_rdata_o)  
  );
end else $error("RF doesn't exist");

endmodule