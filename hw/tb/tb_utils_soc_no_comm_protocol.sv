module tb ();

    localparam CLK_PERIOD = 10;

    logic clk_i;
    logic rst_ni;

    logic                      tb2iccm_we;
    logic [top_pkg::TL_DW-1:0] tb2mem_wdata;
    logic [top_pkg::TL_DW-1:0] tb2mem_wmask;
    logic [10:0]               tb2mem_waddr;
    logic                      tb2mem_finish;

    top_core top_core(
        .clk_i,
        .rst_ni

        `ifdef NO_COMM_PROTOCOL
            ,.tb2iccm_we
            ,.tb2mem_wdata
            ,.tb2mem_wmask
            ,.tb2mem_waddr
            ,.tb2mem_finish
        `endif
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        @(negedge clk_i)
        rst_ni        = 1;              
        tb2iccm_we    = 1'b1;
        tb2mem_wdata  = {top_pkg::TL_DW{1'b0}};
        tb2mem_wmask  = {top_pkg::TL_DW{1'b0}};
        tb2mem_waddr  = 11'h0;
        tb2mem_finish = 1'b0;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h40000437;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h0;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h00a00e13;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h1;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h01400e93;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h2;
        
        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h01de0f33;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h3;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h01e42423;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h4;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h00f00e13;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h5;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h01900e93;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h6;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h01de0f33;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h7;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h01e42823;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h8;

        @(negedge clk_i)
        tb2iccm_we    = 1'b0;
        tb2mem_wdata  = 32'h00000fff;
        tb2mem_wmask  = {top_pkg::TL_DW{1'b1}};
        tb2mem_waddr  = 11'h9;

        #100;

        @(posedge clk_i)
        tb2mem_finish = 1'b1;
        // TODO: Determine rd instruction address space
        //       Use present sent of hex programs with loads/stores
        //       And inspect ports of DCCM on tilelink

        #300;

        $vcdpluson();
        $finish;
    end

endmodule