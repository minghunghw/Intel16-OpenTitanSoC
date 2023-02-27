module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    logic [31:0] intr_gpio_o;

    prim_alert_pkg::alert_rx_t [gpio_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [gpio_reg_pkg::NumAlerts-1:0] alert_tx_o;

    logic [31:0] cio_gpio_i;
    logic [31:0] cio_gpio_o;
    logic [31:0] cio_gpio_en_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    gpio u_gpio (
        .tl_i   (tl_i_enc ),
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i           = tlul_pkg::TL_H2D_DEFAULT;
        alert_rx_i     = {gpio_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
        cio_gpio_i     = 0;
        
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        invoke_gpio(tl_i);

        @(negedge clk_i)
        tl_i = tlul_pkg::TL_H2D_DEFAULT;

        wait (tl_o.d_valid == 1);
        if (cio_gpio_o == 32'hffff_ffff) begin
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

task automatic invoke_gpio;
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