// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Clock inverter
//   Varies on the process

module prim_clock_inv #(
  parameter bit HasScanMode = 1'b1,
  parameter bit NoFpgaBufG  = 1'b0 // only used in FPGA case
) (
  input        clk_i,
  input        scanmode_i,
  output logic clk_no      // Inverted
);

if (1) begin : gen_generic
    prim_generic_clock_inv #(
      .HasScanMode(HasScanMode),
      .NoFpgaBufG(NoFpgaBufG)
    ) u_impl_generic (
      .*
    );
end

endmodule : prim_clock_inv
