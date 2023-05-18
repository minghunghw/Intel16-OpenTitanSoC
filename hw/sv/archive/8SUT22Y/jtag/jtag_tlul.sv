  module jtag_tlul #(
    // Idcode value for the JTAG.
    parameter logic [31:0] IdcodeValue = 32'h00000001
) (
    input clk_i,
    input rst_ni,
    // Bus Interface (device)
    input  tlul_pkg::tl_h2d_t                          tl_i,
    output tlul_pkg::tl_d2h_t                          tl_o,
    // JTAG TAP.
    input  jtag_pkg::jtag_req_t                        jtag_i,
    output jtag_pkg::jtag_rsp_t                        jtag_o,
    // This bypasses the clock inverter inside the JTAG TAP for scanmmode.
    input                                              scan_rst_ni,
    input  prim_mubi_pkg::mubi4_t                      scanmode_i
);

    ////////////////////
    // Life Cycle TAP //
    ////////////////////

    tlul_pkg::tl_h2d_t tap_tl_h2d;
    tlul_pkg::tl_d2h_t tap_tl_d2h;
    lc_ctrl_reg_pkg::lc_ctrl_reg2hw_t tap_reg2hw; //unuse
    lc_ctrl_reg_pkg::lc_ctrl_hw2reg_t tap_hw2reg; //unuse
    logic fatal_bus_integ_error_csr_d; //unuse
    lc_ctrl_reg_top u_reg_tap (
        .clk_i,
        .rst_ni,
        .tl_i      ( tap_tl_h2d                  ),
        .tl_o      ( tap_tl_d2h                  ),
        .reg2hw    ( tap_reg2hw                  ),
        .hw2reg    ( tap_hw2reg                  ),
        // SEC_CM: BUS.INTEGRITY
        // While the TAP does not have bus integrity, it does have a WE checker
        // that feeds into intg_err_o - hence this is is wired up to the fatal_bus_integ_error.
        .intg_err_o( fatal_bus_integ_error_tap_d ),
        .devmode_i ( 1'b1                        )
    );


  // This reuses the JTAG DTM and DMI from the RISC-V external
  // debug v0.13 specification to read and write the lc_ctrl CSRs:
  // https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
  // The register addresses correspond to the byte offsets of the lc_ctrl CSRs, divided by 4.
  // Note that the DMI reset does not affect the LC controller in any way.
    dm::dmi_req_t dmi_req;
    logic dmi_req_valid;
    logic dmi_req_ready;
    dm::dmi_resp_t dmi_resp;
    logic dmi_resp_ready;
    logic dmi_resp_valid;

    logic scanmode;
    prim_mubi4_dec u_prim_mubi4_dec (
        .mubi_i(scanmode_i),
        .mubi_dec_o(scanmode)
    );

    logic tck_muxed;
    logic trst_n_muxed;
    prim_clock_mux2 #(
        .NoFpgaBufG(1'b1)
    ) u_prim_clock_mux2 (
        .clk0_i(jtag_i.tck),
        .clk1_i(clk_i),
        .sel_i (scanmode),
        .clk_o (tck_muxed)
    );

    prim_clock_mux2 #(
        .NoFpgaBufG(1'b1)
    ) u_prim_rst_n_mux2 (
        .clk0_i(jtag_i.trst_n),
        .clk1_i(scan_rst_ni),
        .sel_i (scanmode),
        .clk_o (trst_n_muxed)
    );
        
    logic req_ready;
    assign req_ready = dmi_req_ready & dmi_resp_ready;

    dmi_jtag #(
        .IdcodeValue(IdcodeValue)
    ) u_dmi_jtag (
        .clk_i,
        .rst_ni,
        .testmode_i       ( scanmode          ),
        .test_rst_ni      ( scan_rst_ni       ),
        .dmi_rst_no       (                   ), // unused
        .dmi_req_o        ( dmi_req           ),
        .dmi_req_valid_o  ( dmi_req_valid     ),
        // unless there is room for response, stall
        .dmi_req_ready_i  ( req_ready         ),
        .dmi_resp_i       ( dmi_resp          ),
        .dmi_resp_ready_o ( dmi_resp_ready    ),
        .dmi_resp_valid_i ( dmi_resp_valid    ),
        .tck_i            ( tck_muxed         ),
        .tms_i            ( jtag_i.tms        ),
        .trst_ni          ( trst_n_muxed      ),
        .td_i             ( jtag_i.tdi        ),
        .td_o             ( jtag_o.tdo        ),
        .tdo_oe_o         ( jtag_o.tdo_oe     )
    );

    // DMI to TL-UL transducing
    tlul_adapter_host #(
        .EnableDataIntgGen(1)
    ) u_tap_tlul_host (
        .clk_i,
        .rst_ni,
        // do not make a request unless there is room for the response
        .req_i        ( dmi_req_valid & dmi_resp_ready         ),
        .gnt_o        ( dmi_req_ready                          ),
        .addr_i       ( top_pkg::TL_AW'({dmi_req.addr, 2'b00}) ),
        .we_i         ( dmi_req.op == dm::DTM_WRITE            ),
        .wdata_i      ( dmi_req.data                           ),
        .wdata_intg_i ('0                                      ),
        .be_i         ( {top_pkg::TL_DBW{1'b1}}                ),
        .instr_type_i ( prim_mubi_pkg::MuBi4False              ),
        .valid_o      ( dmi_resp_valid                         ),
        .rdata_o      ( dmi_resp.data                          ),
        .rdata_intg_o (                                        ),
        .err_o        (                                        ),
        .intg_err_o   (                                        ),
        .tl_o         ( tap_tl_h2d                             ),
        .tl_i         ( tap_tl_d2h                             )
    );

    // TL-UL to DMI transducing
    assign dmi_resp.resp = '0; // unused inside dmi_jtag

    // These signals are unused
    logic unused_tap_tl_d2h;
    assign unused_tap_tl_d2h = ^{
        tap_tl_d2h.d_opcode,
        tap_tl_d2h.d_param,
        tap_tl_d2h.d_size,
        tap_tl_d2h.d_source,
        tap_tl_d2h.d_sink,
        tap_tl_d2h.d_user,
        tap_tl_d2h.d_error
    };

endmodule