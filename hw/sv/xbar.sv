module xbar (
  inout  [70:0] chip_io,
  input  [70:0] oe,

  output [71:0] dq,
  output [71:0] drv0,
  output [71:0] drv1,
  output [71:0] drv2,
  output [71:0] enabq,
  output [71:0] enq,
  input  [71:0] outi,
  output [71:0] pd,
  output [71:0] ppen,
  output [71:0] prg_slew,
  output [71:0] puq,
  output [71:0] pwrup_pull_en,
  output [71:0] pwrupzhl
);

  assign dq[71]           = 1'b0;
  assign drv0[71]         = 1'b0;
  assign drv1[71]         = 1'b0;
  assign drv2[71]         = 1'b0;
  assign enabq[71]        = 1'b0;
  assign enq[71]          = 1'b1;
  assign pd[71]           = 1'b0;
  assign ppen[71]         = 1'b0;
  assign prg_slew[71]     = 1'b0;
  assign puq[71]          = 1'b1;
  assign pwrup_pull_en[71]= 1'b0;
  assign pwrupzhl[71]     = 1'b0;

  for (genvar k = 0; k < 70; k++) begin
      assign chip_io[k]       = (oe[k]) ? 1'bz : outi[k];

      assign dq[k]            = (oe[k]) ? 1'b0 : ~chip_io[k];
      assign drv0[k]          = 1'b0;
      assign drv1[k]          = 1'b0;
      assign drv2[k]          = 1'b0;
      assign enabq[k]         = oe[k];
      assign enq[k]           = ~oe[k];
      assign pd[k]            = 1'b0;
      assign ppen[k]          = oe[k];
      assign prg_slew[k]      = 1'b0;
      assign puq[k]           = 1'b1;
      assign pwrup_pull_en[k] = 1'b0;
      assign pwrupzhl[k]      = 1'b0;
  end

endmodule