`define NO_COMM_PROTOCOL

module tb ();

    localparam CLK_PERIOD = 1000;

    logic clk_i;
    logic rst_ni;

    logic                      tb2iccm_we;
    logic [top_pkg::TL_DW-1:0] tb2mem_wdata;
    logic [top_pkg::TL_DW-1:0] tb2mem_wmask;
    logic [10:0]               tb2mem_waddr;
    logic                      tb2mem_finish;

    opentitan_soc opentitan_soc(
        .clk_i,
        .rst_ni,

        `ifdef NO_COMM_PROTOCOL
            .tb2iccm_we,
            .tb2mem_wdata,
            .tb2mem_wmask,
            .tb2mem_waddr,
            .tb2mem_finish
        `endif
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = {top_pkg::TL_DW{1'b0}};
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = {10{1'b0}}
        tb2mem_finish = 1'b0;

        // TODO: Determine rd instruction address space
        //       Use present sent of hex programs with loads/stores
        //       And inspect ports of DCCM on tilelink

        $finish;
    end

endmodule