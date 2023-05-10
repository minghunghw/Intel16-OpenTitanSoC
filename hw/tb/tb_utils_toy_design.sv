module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i_PAD;
    logic rst_ni_PAD;
    logic en_ifetch_PAD;
    logic tl_valid_PAD;
    logic read_PAD;
    logic [3:0] waddr_PAD;
    logic [3:0] wdata_PAD;
    logic [3:0] raddr_PAD;
    logic [3:0] rdata_PAD;
    logic rvalid_PAD;

    toy_design u_toy_design (
        .*  
    );

    initial clk_i_PAD = 0;
    initial rst_ni_PAD = 0;
    always #(CLK_PERIOD/2.0) clk_i_PAD = ~clk_i_PAD;

    initial begin
        
        en_ifetch_PAD   = 1;
        tl_valid_PAD    = 0;
        read_PAD        = 0;
        waddr_PAD       = 0;
        wdata_PAD       = 0;
        raddr_PAD       = 0;
        
        @(negedge clk_i_PAD)
        rst_ni_PAD  = 1;

        for (int i=0; i<16; i++) begin
            repeat (2) @(negedge clk_i_PAD)
            tl_valid_PAD = 1;
            read_PAD     = 0;
            waddr_PAD    = i;
            wdata_PAD    = i;
        end

        repeat (2) @(negedge clk_i_PAD)
        read_PAD = 1;
        raddr_PAD = 12;

        repeat (2) @(negedge clk_i_PAD)
        wait (rvalid_PAD == 1);
        if (rdata_PAD == 12) begin
            $display("%c[1;32m",27);
            $display("SUCCESS\n");
            $display("%c[0m",27);
        end else begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
	    $finish;
    end

endmodule