module tb;

    localparam CLK_PERIOD   = 10;

    logic               clk_i;
    logic               rst_ni;

    tlul_pkg::tl_h2d_t  tl_peri_device_i;
    tlul_pkg::tl_d2h_t  tl_peri_device_o;

    logic [31:0]        gpio_o;

    logic [31:0] pattern[31:0];
    logic [31:0] addr;
    logic [31:0] data;

    peri_device u_peri_device (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_peri_device_i = tlul_pkg::TL_H2D_DEFAULT;
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        invoke_peri_device(tl_peri_device_i);

        @(negedge clk_i)
        tl_peri_device_i = tlul_pkg::TL_H2D_DEFAULT;

        wait (tl_peri_device_o.d_valid == 1);
        if (gpio_o == 32'hffff_ffff) begin
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

task automatic invoke_peri_device;
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