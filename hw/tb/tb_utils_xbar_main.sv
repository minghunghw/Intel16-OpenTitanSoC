module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    // Host interfaces
    tlul_pkg::tl_h2d_t tl_core_i;
    tlul_pkg::tl_d2h_t tl_core_o;
    tlul_pkg::tl_h2d_t tl_spi_i;
    tlul_pkg::tl_d2h_t tl_spi_o;
    tlul_pkg::tl_h2d_t tl_jtag_i;
    tlul_pkg::tl_d2h_t tl_jtag_o;

    // Device interfaces
    tlul_pkg::tl_h2d_t tl_instr_o;
    tlul_pkg::tl_d2h_t tl_instr_i;
    tlul_pkg::tl_h2d_t tl_data_o;
    tlul_pkg::tl_d2h_t tl_data_i;
    tlul_pkg::tl_h2d_t tl_peri_device_o;
    tlul_pkg::tl_d2h_t tl_peri_device_i;

    prim_mubi_pkg::mubi4_t scanmode_i;

    xbar_main u_xbar_main (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_core_i           = tlul_pkg::TL_H2D_DEFAULT;
        tl_spi_i            = tlul_pkg::TL_H2D_DEFAULT; 
        tl_jtag_i           = tlul_pkg::TL_H2D_DEFAULT;
        tl_instr_i          = tlul_pkg::TL_D2H_DEFAULT;
        tl_data_i           = tlul_pkg::TL_D2H_DEFAULT;
        tl_peri_device_i    = tlul_pkg::TL_D2H_DEFAULT;
        
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        invoke_peripheral(tl_core_i);

        #200;
        if (tl_peri_device_o.a_valid) begin
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

task automatic invoke_peripheral;
    output tlul_pkg::tl_h2d_t tl_core_i;
    tl_core_i.a_valid    = 1;
    tl_core_i.a_opcode   = tlul_pkg::tl_a_op_e'('0);
    tl_core_i.a_param    = 0;
    tl_core_i.a_size     = 0;
    tl_core_i.a_source   = 0;
    tl_core_i.a_address  = tl_main_pkg::ADDR_SPACE_PERI_DEVICE;
    tl_core_i.a_mask     = 4'hf;
    tl_core_i.a_data     = 32'hffff_ffff;
    tl_core_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_core_i.d_ready    = 1;
endtask