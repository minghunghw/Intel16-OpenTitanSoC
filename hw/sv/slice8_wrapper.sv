`include "prim_assert.sv"

module slice8_wrapper
    import prim_pad_wrapper_pkg::*;
#(
    // These parameters are ignored in this model.
    parameter pad_type_e  [7:0] PadType = BidirStd,
    parameter scan_role_e [7:0] ScanRole = NoScan
) (
    // Main Pad signals
    inout wire       [7:0]  inout_io, // bidirectional pad
    output logic     [7:0]  in_o,     // input data
    output logic     [7:0]  in_raw_o, // uninverted output data
    input            [7:0]  ie_i,     // input enable
    input            [7:0]  out_i,    // output data
    input            [7:0]  oe_i,     // output enable
    input pad_attr_t [7:0]  attr_i    // additional pad attributes
);

    wire  [7:0] pad;
    logic [7:0] outi;
    logic [7:0] dq;
    logic [7:0] enq;
    logic [7:0] enabq;
    logic [7:0] ppen;

    for (genvar k = 0; k < 8; k++) begin : gen_slice_pads
        if (PadType[k] == InputStd) begin : gen_input_only

            assign in_o[k]      = attr_i[k].invert ^ in_raw_o[k];
            assign in_raw_o[k]  = (ie_i[k]) ? outi[k] : 1'bz;
            assign pad[k]       = inout_io[k];
            assign dq[k]        = 1'b1;
            assign enq[k]       = 1'b1;
            assign enabq[k]     = 1'b0;
            assign ppen[k]      = 1'b0;

        end else if (PadType[k] == BidirTol ||
                     PadType[k] == DualBidirTol ||
                     PadType[k] == BidirOd ||
                     PadType[k] == BidirStd) begin : gen_bidir

            assign in_o[k]      = attr_i[k].invert ^ in_raw_o[k];
            assign in_raw_o[k]  = (ie_i[k]) ? outi[k] : 1'bz;
            assign inout_io[k]  = (oe_i[k]) ? pad[k] : 1'bz;
            assign pad[k]       = (oe_i[k]) ? 1'bz : inout_io[k];
            assign dq[k]        = out_i[k];
            assign enq[k]       = ~oe_i[k];
            assign enabq[k]     = oe_i[k];
            assign ppen[k]      = oe_i[k];

        end else if (PadType[k] == AnalogIn0 || PadType[k] == AnalogIn1) begin : gen_analog

            assign in_o[k]      = outi[k];
            assign in_raw_o[k]  = outi[k];
            assign pad[k]       = inout_io[k];
            assign dq[k]        = 1'b1;
            assign enq[k]       = 1'b1;
            assign enabq[k]     = 1'b0;
            assign ppen[k]      = 1'b0;

        end else begin : gen_invalid_config
            $error("Pad wrapper %d doesn't exist", PadType[k]);
        end
    end

    hl_8slice_south_io u_south (
        .pad           (pad     ), // in from_ext, out to_ext
        .outi          (outi    ), // in to_chip
        .dq            (~dq     ), // in 0, out from_chip
        .drv0          (8'h0    ),   
        .drv1          (8'h0    ),   
        .drv2          (8'h0    ),   
        .enq           (enq     ), // in 1, out 0
        .enabq         (enabq   ), // in 0, out 1                     
        .pd            (8'h0    ), 
        .puq           (8'hff   ),  
        .pwrupzhl      (8'h0    ),          
        .pwrup_pull_en (8'h0    ), 
        .ppen          (ppen    ), // in 0, out 1
        .prg_slew      (8'h0    )                 
    );

endmodule : slice8_wrapper