module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    prim_alert_pkg::alert_rx_t [i2c_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [i2c_reg_pkg::NumAlerts-1:0] alert_tx_o;

    // Generic IO
    logic cio_scl_i;
    logic cio_scl_o;
    logic cio_scl_en_o;
    logic cio_sda_i;
    logic cio_sda_o;
    logic cio_sda_en_o;

    // Interrupts
    logic intr_fmt_threshold_o;
    logic intr_rx_threshold_o;
    logic intr_fmt_overflow_o;
    logic intr_rx_overflow_o;
    logic intr_nak_o;
    logic intr_scl_interference_o;
    logic intr_sda_interference_o;
    logic intr_stretch_timeout_o;
    logic intr_sda_unstable_o;
    logic intr_cmd_complete_o;
    logic intr_tx_stretch_o;
    logic intr_tx_overflow_o;
    logic intr_acq_full_o;
    logic intr_unexp_stop_o;
    logic intr_host_timeout_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    logic [31:0] addr, data;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    i2c u_i2c (
        .tl_i   (tl_i_enc ),
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i           = tlul_pkg::TL_H2D_DEFAULT;
        alert_rx_i     = {i2c_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
        cio_scl_i      = 0;
        cio_sda_i      = 0;
        
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        addr = i2c_reg_pkg::I2C_CTRL_OFFSET;
        data = 1; // set as host
        invoke_i2c(addr, data, tl_i);

        @(negedge clk_i)
        addr = i2c_reg_pkg::I2C_FDATA_OFFSET;
        data = 32'h0000_003f;
        invoke_i2c(addr, data, tl_i);

        @(negedge clk_i)
        tl_i = tlul_pkg::TL_H2D_DEFAULT;

        // wait (tl_o.d_valid == 1);
        #1000;
        // if (cio_gpio_o == 32'hffff_ffff) begin
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

task automatic invoke_i2c;
    input [31:0] addr;
    input [31:0] data;
    output tlul_pkg::tl_h2d_t tl_i;
    tl_i.a_valid    = 1;
    tl_i.a_opcode   = tlul_pkg::PutFullData;
    tl_i.a_param    = 0;
    tl_i.a_size     = 2;
    tl_i.a_source   = 0;
    tl_i.a_address  = addr;
    tl_i.a_mask     = 4'hf;
    tl_i.a_data     = data;
    tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i.d_ready    = 1;
endtask