module tb;

    wire      [7:0]  inout_io; // bidirectional pad
    logic     [7:0]  inout_i;
    logic     [7:0]  inout_o;
    logic     [7:0]  in_o;     // input data
    logic     [7:0]  in_raw_o; // uninverted output data
    logic     [7:0]  ie_i;     // input enable
    logic     [7:0]  out_i;    // output data
    logic     [7:0]  oe_i;     // output enable
    prim_pad_wrapper_pkg::pad_attr_t [7:0]  attr_i;    // additional pad attributes

    for (genvar k = 0; k < 8; k++) begin
        assign inout_io[k] = (oe_i[k]) ? 1'bz : inout_i[k];
        assign inout_o[k]  = (oe_i[k]) ? inout_io[k] : 1'bz;
    end

    slice8_wrapper #(
        .PadType({
            {4{prim_pad_wrapper_pkg::InputStd}},
            {4{prim_pad_wrapper_pkg::BidirStd}}
        }),
        .ScanRole({8{prim_pad_wrapper_pkg::NoScan}})
    )
    u_slice8_wrapper (
        .*  
    );

    initial begin
        inout_i = 8'h0;
        ie_i    = 8'hff;
        out_i   = 8'h0;
        oe_i    = 8'h0;
        attr_i  = 'h0;
        
        #10
        inout_i[7] = 1;
        wait(in_raw_o[7] == 1);

        #10
        inout_i[3] = 1;
        wait(in_raw_o[3] == 1);

        #10
        oe_i[2]  = 1;
        out_i[2] = 1;
        wait(inout_o[2] == 1);

        #10

	    $finish;
    end

endmodule