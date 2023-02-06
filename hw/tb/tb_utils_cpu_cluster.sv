module tb;

    localparam CLK_PERIOD   = 10;

    logic               clk_i;
    logic               rst_ni;

    ibex_pkg::ibex_mubi_t   fetch_enable_i;
    prim_mubi_pkg::mubi4_t  en_ifetch_i;

    tlul_pkg::tl_d2h_t tl_core_i;
    tlul_pkg::tl_h2d_t tl_core_o;

    tlul_pkg::tl_h2d_t tl_instr_i;
    tlul_pkg::tl_d2h_t tl_instr_o;
    tlul_pkg::tl_h2d_t tl_data_i;
    tlul_pkg::tl_d2h_t tl_data_o;


    // rv_ibex_core clk/rst
    logic                   clk_edn_i;
    logic                   rst_edn_ni;
    logic                   clk_esc_i;
    logic                   rst_esc_ni;
    logic                   clk_otp_i;
    logic                   rst_otp_ni;

    // Escalation input for NMI
    prim_esc_pkg::esc_tx_t  esc_tx_i;
    prim_esc_pkg::esc_rx_t  esc_rx_o;

    // Crash dump information
    rv_core_ibex_pkg::cpu_crash_dump_t crash_dump_o;

    // CPU Control Signals
    lc_ctrl_pkg::lc_tx_t    lc_cpu_en_i;
    lc_ctrl_pkg::lc_tx_t    pwrmgr_cpu_en_i;
    pwrmgr_pkg::pwr_cpu_t   pwrmgr_o;

    // peripheral interface access
    tlul_pkg::tl_h2d_t      cfg_tl_d_i;
    tlul_pkg::tl_d2h_t      cfg_tl_d_o;

    // connection to edn
    edn_pkg::edn_req_t      edn_o;
    edn_pkg::edn_rsp_t      edn_i;

    // connection to otp scramble interface
    otp_ctrl_pkg::sram_otp_key_req_t icache_otp_key_o;
    otp_ctrl_pkg::sram_otp_key_rsp_t icache_otp_key_i;

    // interrupts and alerts
    prim_alert_pkg::alert_rx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [rv_core_ibex_reg_pkg::NumAlerts-1:0] alert_tx_o;


    logic [31:0] pattern[31:0];
    logic [31:0] addr;
    logic [31:0] data;

    cpu_cluster u_cpu_cluster (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        fetch_enable_i  = ibex_pkg::IbexMuBiOff;
        en_ifetch_i     = prim_mubi_pkg::MuBi4False;
        tl_core_i       = tlul_pkg::TL_D2H_DEFAULT;
        tl_instr_i      = tlul_pkg::TL_H2D_DEFAULT;
        tl_data_i       = tlul_pkg::TL_H2D_DEFAULT;

        //rv_ibex_core
        clk_edn_i   = 0;
        rst_edn_ni   = 0;
        clk_esc_i   = 0;
        rst_esc_ni  = 0;
        clk_otp_i   = 0;
        rst_otp_ni  = 0;
        esc_tx_i            = prim_esc_pkg::ESC_TX_DEFAULT;
        lc_cpu_en_i         = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::Off);
        pwrmgr_cpu_en_i     = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::Off);
        cfg_tl_d_i          = tlul_pkg::TL_H2D_DEFAULT;
        edn_i               = edn_pkg::EDN_RSP_DEFAULT;
        icache_otp_key_i    = otp_ctrl_pkg::SRAM_OTP_KEY_RSP_DEFAULT;
        alert_rx_i          = prim_alert_pkg::ALERT_RX_DEFAULT;

        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        $readmemh("../../sw/hex/gpio.hex", pattern);
        

        for (int i=0; i<32; i++) begin
            // start sending pattern i from MSB
            @(negedge clk_i)
            addr = 32'h80 + 4*i;
            data = pattern[i];
            load_instruction(addr, data, tl_instr_i);

            if (pattern[i] == 32'h00000fff)
                break;
        end
        
        #100

        @(negedge clk_i)
        tl_instr_i = tlul_pkg::TL_H2D_DEFAULT;
        fetch_enable_i = ibex_pkg::IbexMuBiOn;
        lc_cpu_en_i         = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::On);
        pwrmgr_cpu_en_i     = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::On);  
        en_ifetch_i = prim_mubi_pkg::MuBi4True;
  
        #100

        @(negedge clk_i)
        fetch_enable_i = ibex_pkg::IbexMuBiOff;
        lc_cpu_en_i         = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::Off);
        pwrmgr_cpu_en_i     = lc_ctrl_pkg::lc_tx_t'(lc_ctrl_pkg::Off);   
        en_ifetch_i = prim_mubi_pkg::MuBi4False;
 
        #100
        $finish;

        wait (tl_core_o.a_valid == 1);
        if (tl_core_o.a_address == 32'h3001_0014) begin
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

task automatic load_instruction;
    input [31:0]    addr;
    input [31:0]    data;
    output tlul_pkg::tl_h2d_t tl_i;
begin
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
end

endtask