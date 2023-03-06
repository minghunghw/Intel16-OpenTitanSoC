module tb;

    localparam CLK_PERIOD       = 10;

    logic                       clk_i;
    logic                       rst_ni;

    // SPI device interface
    logic                       test_mode;
    logic                       spi_sclk;
    logic                       spi_cs;
    logic  [1:0]                spi_mode;
    logic                       spi_sdi0;
    logic                       spi_sdi1;
    logic                       spi_sdi2;
    logic                       spi_sdi3;
    logic                       spi_sdo0;
    logic                       spi_sdo1;
    logic                       spi_sdo2;
    logic                       spi_sdo3;

    // TL-UL interface
    tlul_pkg::tl_d2h_t          tl_i;
    tlul_pkg::tl_h2d_t          tl_o;

    int             correct;   
    logic [ 7:0]    cmd;
    logic [31:0]    addr;
    logic [31:0]    tlul_addr;
    logic [31:0]    wr_data;
    logic [31:0]    rd_data;
    logic [31:0]    data;
    logic           rd_data_valid;

    spi_device_tlul u_spi_device_tlul (
        .*
    );

    tb_d2h_stimuli u_tb_d2h_stimuli(
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        correct = 0;
        tlul_addr = 200;
        data = 0;
        rd_data = 0;
        test_mode = 1;
        spi_sclk = 0;
        spi_cs = 1;
        spi_sdi0 = 0;
        spi_sdi1 = 0;
        spi_sdi2 = 0;
        spi_sdi3 = 0;
        
        @(negedge clk_i)
        rst_ni      = 1;

        cmd     = 2;   // write mem
        addr    = 100;
        wr_data = 100;
        `SPI_OUTPUT(cmd, addr, wr_data)

        #1000;

        cmd     = 11;  // read mem
        addr    = 200;
        data    = 200;
        `SPI_INPUT(cmd, addr, rd_data)

        #1000;

        if (correct == 3) begin
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

    always @(posedge tl_o.a_valid) begin
        if (tl_o.a_address == 100 && tl_o.a_data == 100) begin
            correct += 1;
        end else if (tl_o.a_address == 200) begin
            correct += 1;
        end
    end

    always @(posedge rd_data_valid) begin
        if (rd_data == 200) begin
            correct += 1;
        end
    end

endmodule