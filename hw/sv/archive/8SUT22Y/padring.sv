`include "prim_assert.sv"

module padring
  import prim_pad_wrapper_pkg::*;
#(
  parameter int NDioPads = 24,
  parameter int NMioPads = 47,
  parameter pad_type_e [NDioPads-1:0] DioPadType = {NDioPads{BidirStd}},
  parameter pad_type_e [NMioPads-1:0] MioPadType = {NMioPads{BidirStd}},
  // Only used for ASIC target
  parameter bit PhysicalPads = 1,
  parameter int NIoBanks = 4,
  parameter logic [NDioPads-1:0][$clog2(NIoBanks):0] DioPadBank = '0,
  parameter logic [NMioPads-1:0][$clog2(NIoBanks):0] MioPadBank = '0,
  parameter scan_role_e [NDioPads-1:0] DioScanRole = {NDioPads{NoScan}},
  parameter scan_role_e [NMioPads-1:0] MioScanRole = {NMioPads{NoScan}}
) (
  // This is only used for scan
  input                           clk_scan_i,
  prim_mubi_pkg::mubi4_t          scanmode_i,
  // RAW outputs used for DFT and infrastructure
  // purposes (e.g. external muxed clock)
  output logic     [NDioPads-1:0] dio_in_raw_o,
  output logic     [NMioPads-1:0] mio_in_raw_o,
  // Pad wires
  inout wire       [NDioPads-1:0] dio_pad_io,
  inout wire       [NMioPads-1:0] mio_pad_io,
  // Dedicated IO signals coming from peripherals
  output logic     [NDioPads-1:0] dio_in_o,
  input            [NDioPads-1:0] dio_out_i,
  input            [NDioPads-1:0] dio_oe_i,
  // Muxed IO signals coming from pinmux
  output logic     [NMioPads-1:0] mio_in_o,
  input            [NMioPads-1:0] mio_out_i,
  input            [NMioPads-1:0] mio_oe_i,
  // Pad attributes from top level instance
  input pad_attr_t [NDioPads-1:0] dio_attr_i,
  input pad_attr_t [NMioPads-1:0] mio_attr_i
);

  logic unused_inout_io;
  logic unused_in_o;
  logic unused_in_raw_o;

  for (genvar k = 0; k < 3; k++) begin : gen_dio_pads
    slice8_wrapper #(
      .PadType  ( DioPadType[8*k+:8]  ),
      .ScanRole ( DioScanRole[8*k+:8] )
    ) u_dio_pad (
      .inout_io   ( dio_pad_io[8*k+:8]       ),
      .in_o       ( dio_in_o[8*k+:8]         ),
      .in_raw_o   ( dio_in_raw_o[8*k+:8]     ),
      .ie_i       ( 8'hff                    ),
      .out_i      ( dio_out_i[8*k+:8]        ),
      .oe_i       ( dio_oe_i[8*k+:8]         ),
      .attr_i     ( dio_attr_i[8*k+:8]       )
    );
  end

  for (genvar k = 0; k < 5; k++) begin : gen_mio_pads
    slice8_wrapper #(
      .PadType  ( MioPadType[8*k+:8]  ),
      .ScanRole ( MioScanRole[8*k+:8] )
    ) u_mio_pad (
      .inout_io   ( mio_pad_io[8*k+:8]       ),
      .in_o       ( mio_in_o[8*k+:8]         ),
      .in_raw_o   ( mio_in_raw_o[8*k+:8]     ),
      .ie_i       ( 8'hff                    ),
      .out_i      ( mio_out_i[8*k+:8]        ),
      .oe_i       ( mio_oe_i[8*k+:8]         ),
      .attr_i     ( mio_attr_i[8*k+:8]       )
    );
  end

    slice8_wrapper #(
        .PadType  ( {BidirStd, MioPadType[46:40]}   ),
        .ScanRole ( {NoScan, MioScanRole[46:40]}    )
    ) u_mio_pad (
        .inout_io   ( {unused_inout_io ,mio_pad_io[46:40]}  ),
        .in_o       ( {unused_in_o ,mio_in_o[46:40]}        ),
        .in_raw_o   ( {unused_in_raw_o ,mio_in_raw_o[46:40]}),
        .ie_i       ( 8'hff                                 ),
        .out_i      ( {1'b0 ,mio_out_i[46:40]}              ),
        .oe_i       ( {1'b0 ,mio_oe_i[46:40]}               ),
        .attr_i     ( {{AttrDw{1'b0}} ,mio_attr_i[46:40]}   )
    );

endmodule : padring