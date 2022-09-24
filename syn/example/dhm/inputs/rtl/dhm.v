
`include "config.vh"

module dhm (
        clk,
        clk_lut,
        reset_n,
        scan_mode,

        pd_req,
        pd_ack,
        pd_iso,
        pd_reset_n,
        rreg_stop_req,
        rreg_stop_ack,
        rreg_save,
        rreg_restore,
        mode_fastclk,
        mode_lut,

        key_de,
        enable_de,
        key_dd,
        enable_dd,

        i_rdata,
        i_rval,
        o_rrdy,
        o_tdata,
        o_tval,
        i_trdy,

        xor_out
);


input           clk;
input           clk_lut;
input           reset_n;
input           scan_mode;

input   [2:0]   pd_req;
output  [2:0]   pd_ack;
input   [2:0]   pd_iso;
input   [2:0]   pd_reset_n;
input   [2:0]   rreg_stop_req;
output  [2:0]   rreg_stop_ack;
input   [2:0]   rreg_save;
input   [2:0]   rreg_restore;
input   [2:0]   mode_fastclk;
input           mode_lut;

input   [63:0]  key_de;
input           enable_de;
input   [63:0]  key_dd;
input           enable_dd;

input   [7:0]   i_rdata;
input           i_rval;
output          o_rrdy;
output  [7:0]   o_tdata;
output          o_tval;
input           i_trdy;

output          xor_out;

////////////////////////////////////////////////////////////////////////////////
// parameters
////////////////////////////////////////////////////////////////////////////////

parameter STAGES_0      = `DHM_STAGES_0;
parameter INCLUDE_RAM_0 = `DHM_INCLUDE_RAM_0;
parameter STAGES_1      = `DHM_STAGES_1;
parameter INCLUDE_RAM_1 = `DHM_INCLUDE_RAM_1;
parameter STAGES_2      = `DHM_STAGES_2;
parameter INCLUDE_RAM_2 = `DHM_INCLUDE_RAM_2;
parameter LUT_WIDTH_IN  = `DHM_LUT_WIDTH_IN;
parameter LUT_WIDTH_OUT = `DHM_LUT_WIDTH_OUT;

////////////////////////////////////////////////////////////////////////////////
// resources
////////////////////////////////////////////////////////////////////////////////

// Logical connections between dhm_unit modules.

wire    [7:0]   data_1;
wire    [7:0]   data_2;

wire            val_1;
wire            val_2;

wire            rdy_1;
wire            rdy_2;

wire            clk_lut_muxed;

wire    [2:0]   pd_iso_n;

assign clk_lut_muxed = (mode_lut) ? clk_lut : clk;

assign pd_iso_n = ~pd_iso;

////////////////////////////////////////////////////////////////////////////////
// Instantiate the bypass modules.
////////////////////////////////////////////////////////////////////////////////

dhm_unit #( .STAGES(STAGES_0), .INCLUDE_RAM(INCLUDE_RAM_0) ) u_dhm_unit_0 (
        .clk                    (       clk                     ),
        .reset_n                (       reset_n                 ),
        .scan_mode              (       scan_mode               ),
        .pd_req                 (       pd_req[0]               ),
        .pd_ack                 (       pd_ack[0]               ),
        .pd_iso                 (       pd_iso[0]               ),
        .pd_reset_n             (       pd_reset_n[0]           ),
        .rreg_stop_req          (       rreg_stop_req[0]        ),
        .rreg_stop_ack          (       rreg_stop_ack[0]        ),
        .rreg_save              (       rreg_save[0]            ),
        .rreg_restore           (       rreg_restore[0]         ),
        .mode_fastclk           (       mode_fastclk[0]         ),
        .key_de                 (       key_de                  ),
        .enable_de              (       enable_de               ),
        .key_dd                 (       key_dd                  ),
        .enable_dd              (       enable_dd               ),
        .i_rdata                (       i_rdata                 ),
        .i_rval                 (       i_rval                  ),
        .o_rrdy                 (       o_rrdy                  ),
        .o_tdata                (       data_1                  ),
        .o_tval                 (       val_1                   ),
        .i_trdy                 (       rdy_1                   )
);

dhm_unit #( .STAGES(STAGES_1), .INCLUDE_RAM(INCLUDE_RAM_1) ) u_dhm_unit_1 (
        .clk                    (       clk                     ),
        .reset_n                (       reset_n                 ),
        .scan_mode              (       scan_mode               ),
        .pd_req                 (       pd_req[1]               ),
        .pd_ack                 (       pd_ack[1]               ),
        .pd_iso                 (       pd_iso[1]               ),
        .pd_reset_n             (       pd_reset_n[1]           ),
        .rreg_stop_req          (       rreg_stop_req[1]        ),
        .rreg_stop_ack          (       rreg_stop_ack[1]        ),
        .rreg_save              (       rreg_save[1]            ),
        .rreg_restore           (       rreg_restore[1]         ),
        .mode_fastclk           (       mode_fastclk[1]         ),
        .key_de                 (       key_de                  ),
        .enable_de              (       enable_de               ),
        .key_dd                 (       key_dd                  ),
        .enable_dd              (       enable_dd               ),
        .i_rdata                (       data_1                  ),
        .i_rval                 (       val_1                   ),
        .o_rrdy                 (       rdy_1                   ),
        .o_tdata                (       data_2                  ),
        .o_tval                 (       val_2                   ),
        .i_trdy                 (       rdy_2                   )
);
 
dhm_unit #( .STAGES(STAGES_2), .INCLUDE_RAM(INCLUDE_RAM_2) ) u_dhm_unit_2 (
        .clk                    (       clk                     ),
        .reset_n                (       reset_n                 ),
        .scan_mode              (       scan_mode               ),
        .pd_req                 (       pd_req[2]               ),
        .pd_ack                 (       pd_ack[2]               ),
        .pd_iso                 (       pd_iso[2]               ),
        .pd_reset_n             (       pd_reset_n[2]           ),
        .rreg_stop_req          (       rreg_stop_req[2]        ),
        .rreg_stop_ack          (       rreg_stop_ack[2]        ),
        .rreg_save              (       rreg_save[2]            ),
        .rreg_restore           (       rreg_restore[2]         ),
        .mode_fastclk           (       mode_fastclk[2]         ),
        .key_de                 (       key_de                  ),
        .enable_de              (       enable_de               ),
        .key_dd                 (       key_dd                  ),
        .enable_dd              (       enable_dd               ),
        .i_rdata                (       data_2                  ),
        .i_rval                 (       val_2                   ),
        .o_rrdy                 (       rdy_2                   ),
        .o_tdata                (       o_tdata                 ),
        .o_tval                 (       o_tval                  ),
        .i_trdy                 (       i_trdy                  )
);

dhm_lut #( .LUT_WIDTH_IN(LUT_WIDTH_IN), .LUT_WIDTH_OUT(LUT_WIDTH_OUT) ) u_dhm_lut (
        .clk                    (        clk_lut_muxed          ),
        .reset_n                (        reset_n                ),
        .d_in                   (        key_de                 ),
        .xor_out                (        xor_out                )
);

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
