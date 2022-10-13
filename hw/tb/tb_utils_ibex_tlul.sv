module tb;

    localparam CLK_PERIOD   = 1000;

    logic               clk_i;
    logic               rst_ni;

    // instruction memory interface 
    tlul_pkg::tl_d2h_t  tl_i_i;
    tlul_pkg::tl_h2d_t  tl_i_o;

    // data memory interface 
    tlul_pkg::tl_d2h_t  tl_d_i;
    tlul_pkg::tl_h2d_t  tl_d_o;

    // Debug interface
    ibex_pkg::crash_dump_t crash_dump_o;
    logic               debug_fault_seen_o;

    // CPU Control Signals
    logic               alert_minor_o;
    logic               alert_major_internal_o;
    logic               alert_major_bus_o;
    logic               core_sleep_o;

    logic [31:0]    data;

    ibex_tlul u_ibex_tlul (
        .ram_cfg_i      (prim_ram_1p_pkg::RAM_1P_CFG_DEFAULT),  
        .hart_id_i      (32'b0),
        .boot_addr_i    (32'b0),
        .irq_software_i (1'b0),
        .irq_timer_i    (1'b0),
        .irq_external_i (1'b0),
        .irq_nm_i       (1'b0),
        .debug_req_i    (1'b0),
        .fetch_enable_i (ibex_pkg::FetchEnableOn),
        .scan_rst_ni    (1'b0),
        .scanmode_i     (prim_mubi_pkg::MuBi4False),
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i_i = tlul_pkg::TL_D2H_DEFAULT;
        tl_i_i.d_opcode = tlul_pkg::AccessAckData;
        tl_d_i = tlul_pkg::TL_D2H_DEFAULT;
        
        @(negedge clk_i)
        rst_ni      = 1;

        wait (tl_i_o.a_valid == 1);
        if (tl_i_o.a_address != 128) begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end

        @(posedge clk_i)
        data = 0;
        invoke_ibex_tlul(1, data, tl_i_i);

        @(negedge clk_i)
        wait (tl_i_o.a_valid == 1);
        if (tl_i_o.a_address != 132) begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        $display("%c[1;32m",27);
        $display("SUCCESS\n");
        $display("%c[0m",27);
	    $finish;
    end

endmodule

task automatic invoke_ibex_tlul;
    input [ 2:0]    opcode;
    input [31:0]    data;
    output tlul_pkg::tl_d2h_t tl_i_i;
begin
    tl_i_i.d_valid    = 1;
    tl_i_i.d_opcode   = tlul_pkg::tl_d_op_e'(opcode);
    tl_i_i.d_param    = 0;
    tl_i_i.d_size     = 2;
    tl_i_i.d_source   = 0;
    tl_i_i.d_sink     = 0;
    tl_i_i.d_data     = data;
    tl_i_i.d_user     = tlul_pkg::TL_D_USER_DEFAULT;
    tl_i_i.a_ready    = 1;
end
endtask