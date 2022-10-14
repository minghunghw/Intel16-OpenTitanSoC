module tb;

    localparam CLK_PERIOD   = 1000;

    logic               clk_i;
    logic               rst_ni;

    ibex_pkg::fetch_enable_t fetch_enable_i;

    tlul_pkg::tl_d2h_t tl_core_i;
    tlul_pkg::tl_h2d_t tl_core_o;

    tlul_pkg::tl_h2d_t tl_instr_i;
    tlul_pkg::tl_d2h_t tl_instr_o;
    tlul_pkg::tl_h2d_t tl_data_i;
    tlul_pkg::tl_d2h_t tl_data_o;

    host_cluster u_host_cluster (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        fetch_enable_i  = ibex_pkg::FetchEnableOff;
        tl_core_i       = tlul_pkg::TL_D2H_DEFAULT;
        tl_instr_i      = tlul_pkg::TL_H2D_DEFAULT;
        tl_data_i       = tlul_pkg::TL_H2D_DEFAULT;

        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        $readmemh("../../sw/hex/gpio.hex", u_host_cluster.u_imem_tlul.u_sram.ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array.DATA_ARRAY);
        // $readmemh("../../sw/hex/gpio.hex", u_host_cluster.u_imem_tlul.u_fake_dram.mem);
        fetch_enable_i = ibex_pkg::FetchEnableOn;

        @(negedge clk_i)
        // wait (tl_i_o.a_valid == 1);
        // if (tl_i_o.a_address != 132) begin
        //     $display("%c[1;32m",27);
        //     $display("SUCCESS\n");
        //     $display("%c[0m",27);
        // end else begin
        //     $display("%c[1;31m",27);
        //     $display("FAILED\n");
        //     $display("%c[0m",27);
        // end

	    $finish;
    end

endmodule