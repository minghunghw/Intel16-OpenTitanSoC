//  util/dvsim/dvsim.py hw/ip/lc_ctrl/dv/lc_ctrl_sim_cfg.hjson -i lc_ctrl_jtag_smoke --tool vcs --gui

parameter CLK_PERIOD   = 10;   
parameter JTAG_PERIOD = 50;
// parameter logic [31:0] IdcodeValue = 32'h00000001;
parameter int IrLength = 5;
parameter TA = JTAG_PERIOD*0.1;
parameter TT = JTAG_PERIOD*0.9;
parameter IDCode = 32'hdeadbeef | 32'b1;

module tb;
    logic clk_i, jtag_clk;
    logic rst_ni;

    jtag_pkg::jtag_req_t                        jtag_i;
    jtag_pkg::jtag_rsp_t                        jtag_o;
    logic scanmode;
    logic                                       scan_rst_ni;
    prim_mubi_pkg::mubi4_t                      scanmode_i;
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

    logic [31:0] idcode;
    dm::dtmcs_t dtmcs;
    logic [4:0] opocode;
    logic [IrLength-1:0] ir_select;
    logic IDCODE    = 'h1;
    
    int correct;
    initial correct=0;
    // initial clk_i = 0;
    // initial rst_ni = 0;
    // always #(CLK_PERIOD/2.0) clk_i = ~clk_i;
    // always #(JTAG_PERIOD/2.0) jtag_clk = ~jtag_clk;
  initial begin
    rst_ni = 0;
    repeat (3) begin
      #(CLK_PERIOD/2) clk_i = 0;
      #(CLK_PERIOD/2) clk_i = 1;
    end
    rst_ni = 1;
    forever begin
      #(CLK_PERIOD/2) clk_i = 0;
      #(CLK_PERIOD/2) clk_i = 1;
    end
  end
  initial begin
    #100ns;
    forever begin
      jtag_clk = 1;
      #(JTAG_PERIOD/2);
      jtag_clk = 0;
      #(JTAG_PERIOD/2);
    end
  end

    logic tck_muxed;
    // prim_clock_mux2 #(
    //     .NoFpgaBufG(1'b1)
    // ) u_prim_clock_mux2 (
    //     .clk0_i(jtag_i.tck),
    //     .clk1_i(clk_i),
    //     .sel_i (scanmode),
    //     .clk_o (tck_muxed)
    // );

    dmi_jtag #(
        .IdcodeValue(IDCode)
    ) u_dmi_jtag (
        .clk_i,
        .rst_ni,
        .testmode_i       ( 0          ),
        .test_rst_ni      ( scan_rst_ni       ),
        .dmi_rst_no       (                   ), // unused
        .dmi_req_o        ( dmi_req           ),
        .dmi_req_valid_o  ( dmi_req_valid     ),
        // unless there is room for response, stall
        .dmi_req_ready_i  ( req_ready         ),
        .dmi_resp_i       ( dmi_resp          ),
        .dmi_resp_ready_o ( dmi_resp_ready    ),
        .dmi_resp_valid_i ( dmi_resp_valid    ),
        .tck_i            ( jtag_clk         ),
        .tms_i            ( jtag_i.tms        ),
        .trst_ni          ( jtag_i.trst_n      ),
        .td_i             ( jtag_i.tdi        ),
        .td_o             ( jtag_o.tdo        ),
        .tdo_oe_o         ( jtag_o.tdo_oe     )
    );

initial begin
    scanmode=0;
    $display("Resetting");
    `RESET_MASTER
    // `SOFT_RESET

    /// Test ID Code.
    $display("Reading ID Code");
    // get_idcode(idcode);

    $display("Got ID Code %h", idcode);

    // Check ID Code.
    // assert(idcode == IDCode);

    /// Test DTMCs
    // riscv_dbg.read_dtmcs(dtmcs);
    // $display("DTMCS: %p", dtmcs);
    // assert(dtmcs.version == 1);
    // assert(dtmcs.abits == 7);

    // riscv_dbg.write_dtmcs(32'hdeadbeef);

    // riscv_dbg.read_dtmcs(dtmcs);
    // $display("DTMCS: %p", dtmcs);
    // assert(dtmcs.version == 1);
    // assert(dtmcs.abits == 7);

    $finish;
end

endmodule


// task automatic invoke_jtag_dmi;
//     output tlul_pkg::tl_h2d_t tl_i;
//     tl_i.a_valid    = 1;
//     tl_i.a_opcode   = tlul_pkg::PutFullData;
//     tl_i.a_param    = 0;
//     tl_i.a_size     = 2;
//     tl_i.a_source   = 0;
//     tl_i.a_address  = tl_periph_pkg::ADDR_SPACE_GPIO + gpio_reg_pkg::GPIO_DIRECT_OUT_OFFSET;
//     tl_i.a_mask     = 4'hf;
//     tl_i.a_data     = 32'hffff_ffff;
//     tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
//     tl_i.d_ready    = 1;
// endtask

// task automatic invoke_req;
//     input jtag_clk, dut_tms, dut_trstn, dut_tdi;
//     output jtag_pkg::jtag_req_t jtag_i;
//     jtag_i.tck=jtag_clk;
//     jtag_i.tms=dut_tms;
//     jtag_i.trst_n=dut_trstn;
//     jtag_i.tdi=dut_tdi;
// endtask