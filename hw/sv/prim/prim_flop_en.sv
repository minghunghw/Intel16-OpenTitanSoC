// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

module prim_flop_en #(
  parameter int               Width      = 1,
  parameter logic [Width-1:0] ResetValue = 0
) (
  input                    clk_i,
  input                    rst_ni,
  input                    en_i,
  input        [Width-1:0] d_i,
  output logic [Width-1:0] q_o
);

if (1) begin : gen_generic
    prim_generic_flop_en #(
      .ResetValue(ResetValue),
      .Width(Width)
    ) u_impl_generic (
      .*
    );
end

endmodule