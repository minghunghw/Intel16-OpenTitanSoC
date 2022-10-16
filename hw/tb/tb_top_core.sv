module tb;
    `include "tb_spi_pkg.sv"

    localparam CLK_PERIOD       = 10;

    logic                       clk_i;
    logic                       rst_ni;

    logic                       fetch_enable_i;
    logic                       en_ifetch_i;    

    // SPI device interface
    logic                       spi_sclk;
    logic                       spi_cs;
    logic  [ 1:0]               spi_mode;
    logic                       spi_sdi0;
    logic                       spi_sdi1;
    logic                       spi_sdi2;
    logic                       spi_sdi3;
    logic                       spi_sdo0;
    logic                       spi_sdo1;
    logic                       spi_sdo2;
    logic                       spi_sdo3;

    // GPIO interface
    logic  [31:0]               gpio_o;
 
    logic  [31:0]               pattern[31:0];
    logic  [ 7:0]               cmd;
    logic  [31:0]               addr;
    logic  [31:0]               data;

    top_core u_top_core (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        fetch_enable_i  = 0;
        en_ifetch_i     = 0;
        spi_sclk        = 0;
        spi_cs          = 1;
        spi_sdi0        = 0;
        spi_sdi1        = 0;
        spi_sdi2        = 0;
        spi_sdi3        = 0;
        
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
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

        @(negedge clk_i)
        fetch_enable_i  = 1;
        en_ifetch_i     = 1;

        #100

        @(negedge clk_i)
        fetch_enable_i  = 0;
        en_ifetch_i     = 0;

        #100
        if (gpio_o == 30) begin
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