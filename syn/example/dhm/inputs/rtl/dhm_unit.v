

module dhm_unit (
        clk,
        reset_n,
        scan_mode,

        pd_req,
        pd_ack,
        pd_iso,
        pd_iso_n,
        pd_reset_n,
        rreg_stop_req,
        rreg_stop_ack,
        rreg_save,
        rreg_restore,
        mode_fastclk,

        key_de,
        enable_de,
        key_dd,
        enable_dd,

        i_rdata,
        i_rval,
        o_rrdy,

        o_tdata,
        o_tval,
        i_trdy
);

input           clk;
input           reset_n;
input           scan_mode;

input           pd_req;
output          pd_ack;
input           pd_iso;
input           pd_iso_n;
input           pd_reset_n;
input           rreg_stop_req;
output          rreg_stop_ack;
input           rreg_save;
input           rreg_restore;
input           mode_fastclk;

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

////////////////////////////////////////////////////////////////////////////////
// parameters
////////////////////////////////////////////////////////////////////////////////

parameter STAGES = 1;
parameter INCLUDE_RAM = 0;

////////////////////////////////////////////////////////////////////////////////
// resources
////////////////////////////////////////////////////////////////////////////////

// Logical connections between bypass module & core module.

wire    [7:0]   tdata_core;
wire            tval_core;
wire            trdy_core;
wire            trdy_core_tmp;
wire    [7:0]   rdata_core;
wire    [7:0]   rdata_core_tmp;
wire            rval_core;
wire            rval_core_tmp;
wire            rrdy_core;

wire            sleep;
wire            sleep_n;
wire            sleep_ack;
wire            save;
wire            save_n;
wire            restore;
wire            restore_n;

wire            core_clk;

assign trdy_core  = (pd_iso) ? 1'b0 : trdy_core_tmp;
assign rdata_core = (pd_iso) ? 1'b0 : rdata_core_tmp;
assign rval_core  = (pd_iso) ? 1'b0 : rval_core_tmp;

////////////////////////////////////////////////////////////////////////////////
// Instantiate the bypass module.
////////////////////////////////////////////////////////////////////////////////

dhm_bypass u_dhm_bypass (
        .clk                    (       clk                     ),
        .reset_n                (       reset_n                 ),
        .scan_mode              (       scan_mode               ),

        .pd_iso                 (       pd_iso                  ),
        .pd_iso_n               (       pd_iso_n                ),
        .pd_req                 (       pd_req                  ),
        .pd_ack                 (       pd_ack                  ),
        .sleep                  (       sleep                   ),
        .sleep_n                (       sleep_n                 ),
        .sleep_ack              (       sleep_ack               ),
        .rreg_stop_req          (       rreg_stop_req           ),
        .rreg_stop_ack          (       rreg_stop_ack           ),
        .rreg_save              (       rreg_save               ),
        .rreg_restore           (       rreg_restore            ),
        .save                   (       save                    ),
        .save_n                 (       save_n                  ),
        .restore                (       restore                 ),
        .restore_n              (       restore_n               ),
        .core_clk               (       core_clk                ),

        // From ports
        .i_rdata                (       i_rdata                 ),
        .i_rval                 (       i_rval                  ),
        .o_rrdy                 (       o_rrdy                  ),
        // To ports           
        .o_tdata                (       o_tdata                 ),
        .o_tval                 (       o_tval                  ),
        .i_trdy                 (       i_trdy                  ),

        // To core
        .o_tdata_core           (       tdata_core              ),
        .o_tval_core            (       tval_core               ),
        .i_trdy_core            (       trdy_core               ),
        // From core
        .i_rdata_core           (       rdata_core              ),
        .i_rval_core            (       rval_core               ),
        .o_rrdy_core            (       rrdy_core               )
);

////////////////////////////////////////////////////////////////////////////////
// Instantiate the core module.
////////////////////////////////////////////////////////////////////////////////

dhm_core #( .STAGES(STAGES), .INCLUDE_RAM(INCLUDE_RAM) ) u_dhm_core (
        .clk                    (       core_clk               ),
        .reset_n                (       reset_n                 ),
        .scan_mode              (       scan_mode               ),

        .pd_reset_n             (       pd_reset_n              ),
        .rreg_save              (       save                    ),
        .rreg_save_n            (       save_n                  ),
        .rreg_restore           (       restore                 ),
        .rreg_restore_n         (       restore_n               ),
        .sleep                  (       sleep                   ),
        .sleep_n                (       sleep_n                 ),
        .sleep_ack              (       sleep_ack               ),

        .key_de                 (       key_de                  ),
        .enable_de              (       enable_de               ),
        .key_dd                 (       key_dd                  ),
        .enable_dd              (       enable_dd               ),
        .mode_fastclk           (       mode_fastclk            ),

        // from bypass
        .i_rdata                (       tdata_core              ),
        .i_rval                 (       tval_core               ),
        .o_rrdy                 (       trdy_core_tmp           ),
        // to bypass
        .o_tdata                (       rdata_core_tmp          ),
        .o_tval                 (       rval_core_tmp           ),
        .i_trdy                 (       rrdy_core               )
);

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
