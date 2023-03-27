module tb;
    localparam CLK_PERIOD   = 10;   
    localparam JTAGPeriod = 50;
    logic clk_i;
    logic rst_ni;
    // Bus Interface (device)
    tlul_pkg::tl_h2d_t                          tl_i;
    tlul_pkg::tl_d2h_t                          tl_o;
    // JTAG TAP.
    jtag_pkg::jtag_req_t                        jtag_i;
    jtag_pkg::jtag_rsp_t                        jtag_o;
    // This bypasses the clock inverter inside the JTAG TAP for scanmmode.
    logic                                       scan_rst_ni;
    prim_mubi_pkg::mubi4_t                      scanmode_i;


    

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;
    always #(JTAGPeriod/2.0) dut_tck = ~dut_tck;


jtag_tlul #(
    .IdcodeValue(32'h00000001)
) dut (
    .clk_i,
    .rst_ni,
    .tl_i,
    .tl_o,
    .jtag_i,
    .jtag_o,
    .scan_rst_ni,
    .scanmode_i
);

initial begin
    rst_ni=0;
    clk_i=0;
    $finish;
end

endmodule


task automatic invoke_jtag_dmi;
    output tlul_pkg::tl_h2d_t tl_i;
    tl_i.a_valid    = 1;
    tl_i.a_opcode   = tlul_pkg::PutFullData;
    tl_i.a_param    = 0;
    tl_i.a_size     = 2;
    tl_i.a_source   = 0;
    tl_i.a_address  = tl_periph_pkg::ADDR_SPACE_GPIO + gpio_reg_pkg::GPIO_DIRECT_OUT_OFFSET;
    tl_i.a_mask     = 4'hf;
    tl_i.a_data     = 32'hffff_ffff;
    tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i.d_ready    = 1;
endtask

task automatic invoke_req;
    input dut_tck, dut_tms, dut_trstn, dut_tdi;
    output jtag_pkg::jtag_req_t jtag_i;
    jtag_i.tck=dut_tck;
    jtag_i.tms=dut_tms;
    jtag_i.trst_n=dut_trstn;
    jtag_i.tdi=dut_tdi;
endtask