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

prim_mubi_pkg::mubi4_t scanmode_i;

// Instantiate targets:
// - Ibex wrapper
// - Fake iccm
// - Tilelink main

ibex_tlul ibex_tlul(
    .clk_i,
    .rst_ni,

    .tl_i_i(xbar2wrapper),
    .tl_i_o(wrapper2xbar),

    // FIXME:
    // Breakdown core host into Instr fetch and Load-Store
    // Regenerate xbar_main

    // Currently not fully used
    .hart_id_i              (32'b0),
    .boot_addr_i            (32'h20000000),
    .tl_d_i                 (),
    .tl_d_o                 (),
    .irq_software_i         (1'b0),
    .irq_timer_i            (),
    .irq_external_i         (),
    .irq_nm_i               (1'b0),
    .debug_req_i            (),
    .crash_dump_o           (),
    .debug_fault_seen_o     (),
    .fetch_enable_i         (ibex_pkg::FetchEnableOn),
    .alert_minor_o          (),
    .alert_major_internal_o (),
    .alert_major_bus_o      (),
    .core_sleep_o           ()
);

xbar_top xbar_top(
    .clk_i,
    .rst_ni,

    .tl_core_inst_i  (c_inst2xbar),
    .tl_core_inst_o  (xbar2c_inst),
    .tl_core_data_i  (c_data2xbar),
    .tl_core_data_o  (xbar2c_data),
    .tl_instr_i      (iccm2xbar),
    .tl_instr_o      (xbar2iccm),

    // Currently not used
    .tl_spi_i         (spi2xbar),
    .tl_spi_o         (xbar2spi),
    .tl_jtag_i        (jtag2xbar),
    .tl_jtag_o        (xbar2jtag),

    .tl_data_i        (dccm2xbar),
    .tl_data_o        (xbar2dccm),
    .tl_peri_device_i (periph2xbar),
    .tl_peri_device_o (xbar2periph),

    .scanmode_i       (scanmode_i)
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

endmodule