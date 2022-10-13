module top_core (
    input clk_i,
    input rst_ni

    `ifdef NO_COMM_PROTOCOL
        ,input  logic                      tb2iccm_we
        ,input  logic [top_pkg::TL_DW-1:0] tb2mem_wdata
        ,input  logic [top_pkg::TL_DW-1:0] tb2mem_wmask
        ,input  logic [10:0]               tb2mem_waddr
        ,input  logic                      tb2mem_finish
    `endif
);

/*
    Signal name synopsis for xbar modules:
    - xbar.{tl.*_i}: .*2xbar
    - xbar.{tl.*_o}: xbar2.*

    Signal name synopsis for non-xbar modules:
    - instance.{tl.*_i}: xbar2.*
    - instance.{tl.*_o}: .*2xbar
*/

/*
    Hosts:
    - wrapper
    - jtag
    - spi
*/
tlul_pkg::tl_h2d_t c_inst2xbar;
tlul_pkg::tl_h2d_t c_data2xbar;
tlul_pkg::tl_h2d_t spi2xbar;
tlul_pkg::tl_h2d_t jtag2xbar;
tlul_pkg::tl_d2h_t xbar2c_inst;
tlul_pkg::tl_d2h_t xbar2c_data;
tlul_pkg::tl_d2h_t xbar2spi;
tlul_pkg::tl_d2h_t xbar2jtag;

/*
    Devices:
    - iccm
    - dccm
    - periph
*/
tlul_pkg::tl_d2h_t iccm2xbar;
tlul_pkg::tl_d2h_t dccm2xbar;
tlul_pkg::tl_d2h_t periph2xbar;
tlul_pkg::tl_h2d_t xbar2iccm;
tlul_pkg::tl_h2d_t xbar2dccm;
tlul_pkg::tl_h2d_t xbar2periph;

prim_mubi_pkg::mubi4_t        scanmode_i;
prim_ram_1p_pkg::ram_1p_cfg_t ram_cfg;
ibex_pkg::fetch_enable_t      core_en;

assign core_en = tb2mem_finish ? ibex_pkg::FetchEnableOn : ibex_pkg::FetchEnableOff;
assign ram_cfg = prim_ram_1p_pkg::RAM_1P_CFG_DEFAULT;

// Instantiate targets:
// - Ibex wrapper
// - Fake iccm
// - Tilelink main

ibex_tlul ibex_tlul(
    .clk_i,
    .rst_ni,

    .tl_i_i(xbar2c_inst),
    .tl_i_o(c_inst2xbar),

    // FIXME:
    // Breakdown core host into Instr fetch and Load-Store
    // Regenerate xbar_main

    // Currently not fully used
    .ram_cfg_i              (ram_cfg),
    .hart_id_i              (32'b0),
    .boot_addr_i            (32'h00000000),

    .tl_d_i                 (xbar2c_data),
    .tl_d_o                 (c_data2xbar),

    .irq_software_i         (1'b0),
    .irq_timer_i            (1'b0),
    .irq_external_i         (1'b0),
    .irq_nm_i               (1'b0),

    .debug_req_i            (1'b0),
    .crash_dump_o           (),
    .debug_fault_seen_o     (),

    .fetch_enable_i         (core_en),
    .alert_minor_o          (),
    .alert_major_internal_o (),
    .alert_major_bus_o      (),
    .core_sleep_o           (),

    .scan_rst_ni            (1'b1),
    .scanmode_i             (prim_mubi_pkg::MuBi4False)
);

// xbar_top xbar_top(
//     .clk_i,
//     .rst_ni,

//     .tl_core_inst_i  (c_inst2xbar),
//     .tl_core_inst_o  (xbar2c_inst),
//     .tl_core_data_i  (c_data2xbar),
//     .tl_core_data_o  (xbar2c_data),
//     .tl_instr_i      (iccm2xbar),
//     .tl_instr_o      (xbar2iccm),

//     // Currently not used
//     .tl_spi_i         (spi2xbar),
//     .tl_spi_o         (xbar2spi),
//     .tl_jtag_i        (jtag2xbar),
//     .tl_jtag_o        (xbar2jtag),

//     .tl_data_i        (dccm2xbar),
//     .tl_data_o        (xbar2dccm),
//     .tl_peri_device_i (periph2xbar),
//     .tl_peri_device_o (xbar2periph),

//     .scanmode_i       (scanmode_i)
// );

xbar_only_instr xbar_only_instr(
    .clk_i,
    .rst_ni,

    .tl_core_inst_i  (c_inst2xbar),
    .tl_core_inst_o  (xbar2c_inst),
    .tl_core_data_i  (c_data2xbar),
    .tl_core_data_o  (xbar2c_data),
    .tl_instr_i      (iccm2xbar),
    .tl_instr_o      (xbar2iccm),

    // Currently not used
    .tl_data_i        (dccm2xbar),
    .tl_data_o        (xbar2dccm),

    .scanmode_i       (prim_mubi_pkg::MuBi4False)
);

iccm_tlul iccm_tlul(
    .clk_i,
    .rst_ni,

    `ifdef NO_COMM_PROTOCOL
        .tb2iccm_we,
        .tb2mem_wdata,
        .tb2mem_wmask,
        .tb2mem_waddr,
        .tb2mem_finish,
    `endif

    .tl_i_i(xbar2iccm),
    .tl_i_o(iccm2xbar)

);

dccm_tlul dccm_tlul(
    .clk_i,
    .rst_ni,

    .tl_d_i(xbar2dccm),
    .tl_d_o(dccm2xbar)

);

endmodule