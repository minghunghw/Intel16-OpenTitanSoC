module tb;
    `include "tb_pad_pkg.sv"

    localparam CLK_PERIOD       = 10;

    logic                       clk_i_PAD;
    logic                       rst_ni_PAD;

    logic                       fetch_enable_i_PAD;
    logic                       en_ifetch_i_PAD;    

    // SPI device interface
    logic                       spi_sclk_PAD;
    logic                       spi_cs_PAD;
    logic  [ 1:0]               spi_mode_PAD;
    logic                       spi_sdi0_PAD;
    logic                       spi_sdi1_PAD;
    logic                       spi_sdi2_PAD;
    logic                       spi_sdi3_PAD;
    logic                       spi_sdo0_PAD;
    logic                       spi_sdo1_PAD;
    logic                       spi_sdo2_PAD;
    logic                       spi_sdo3_PAD;

    // GPIO interface
    logic  [31:0]               gpio_o_PAD;
 
    logic  [31:0]               pattern[31:0];
    logic  [ 7:0]               cmd;
    logic  [31:0]               addr;
    logic  [31:0]               data;

    top_chip u_top_chip (
        .*
    );

    initial clk_i_PAD = 0;
    initial rst_ni_PAD = 0;
    always #(CLK_PERIOD/2.0) clk_i_PAD = ~clk_i_PAD;

    initial begin
        
        fetch_enable_i_PAD  = 0;
        en_ifetch_i_PAD     = 0;
        spi_sclk_PAD        = 0;
        spi_cs_PAD          = 1;
        spi_sdi0_PAD        = 0;
        spi_sdi1_PAD        = 0;
        spi_sdi2_PAD        = 0;
        spi_sdi3_PAD        = 0;
        
        @(negedge clk_i_PAD)
        rst_ni_PAD      = 1;

        @(negedge clk_i_PAD)
        $readmemh("../../sw/hex/gpio.hex", pattern);

        for (int i=0; i<32; i++) begin
            cmd  = 2;
            addr = 32'h80 + 4*i;
            data = pattern[i];
            `SPI_OUTPUT(cmd, addr, data)
            #1000

            if (pattern[i] == 32'h00000fff)
                break;
        end

        @(negedge clk_i_PAD)
        fetch_enable_i_PAD  = 1;
        en_ifetch_i_PAD     = 1;

        #100

        @(negedge clk_i_PAD)
        fetch_enable_i_PAD  = 0;
        en_ifetch_i_PAD     = 0;

        #100
        if (gpio_o_PAD == 30) begin
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