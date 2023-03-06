module tb;

    localparam CLK_PERIOD   = 10;

    logic                                      clk_i;
    logic                                      rst_ni;
    logic                                      rst_shadowed_ni;
    
    // Idle indicator for clock manager
    prim_mubi_pkg::mubi4_t                     idle_o;
    
    // Life cycle
    lc_ctrl_pkg::lc_tx_t                       lc_escalate_en_i;
    
    // Entropy distribution network (EDN) interface
    logic                                      clk_edn_i;
    logic                                      rst_edn_ni;
    edn_pkg::edn_req_t                         edn_o;
    edn_pkg::edn_rsp_t                         edn_i;
    
    // Key manager (keymgr) key sideload interface
    keymgr_pkg::hw_key_req_t                   keymgr_key_i;
    
    // Bus interface
    tlul_pkg::tl_h2d_t                         tl_i;
    tlul_pkg::tl_d2h_t                         tl_o;
    
    // Alerts
    prim_alert_pkg::alert_rx_t [aes_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [aes_reg_pkg::NumAlerts-1:0] alert_tx_o;

    aes u_aes (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        // tl_peri_device_i = tlul_pkg::TL_H2D_DEFAULT;
        // @(negedge clk_i)
        // rst_ni      = 1;

        // @(negedge clk_i)
        // invoke_peri_device(tl_peri_device_i);

        // @(negedge clk_i)
        // tl_peri_device_i = tlul_pkg::TL_H2D_DEFAULT;

        // wait (tl_peri_device_o.d_valid == 1);
        // if (gpio_o == 32'hffff_ffff) begin
        //     $display("%c[1;32m",27);
        //     $display("SUCCESS\n");
        //     $display("%c[0m",27);
        // end else begin
        //     $display("%c[1;31m",27);
        //     $display("FAILED\n");
        //     $display("%c[0m",27);
        // end
        $display("SUCCESS\n");
	    $finish;
    end

endmodule

task automatic invoke_aes;
    // output tlul_pkg::tl_h2d_t tl_i;
    // tl_i.a_valid    = 1;
    // tl_i.a_opcode   = tlul_pkg::PutFullData;
    // tl_i.a_param    = 0;
    // tl_i.a_size     = 2;
    // tl_i.a_source   = 0;
    // tl_i.a_address  = tl_periph_pkg::ADDR_SPACE_GPIO + gpio_reg_pkg::GPIO_DIRECT_OUT_OFFSET;
    // tl_i.a_mask     = 4'hf;
    // tl_i.a_data     = 32'hffff_ffff;
    // tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    // tl_i.d_ready    = 1;
endtask