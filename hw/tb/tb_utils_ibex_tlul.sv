module tb;

    localparam CLK_PERIOD   = 1000;

    logic clk_i;
    logic rst_ni;

    // instruction memory interface 
    tlul_pkg::tl_d2h_t  tl_i_i;
    tlul_pkg::tl_h2d_t  tl_i_o;

    // data memory interface 
    tlul_pkg::tl_d2h_t  tl_d_i;
    tlul_pkg::tl_h2d_t  tl_d_o;

    // Debug interface
    output  ibex_pkg::crash_dump_t crash_dump_o,
    output  logic               debug_fault_seen_o,

    // CPU Control Signals
    output  logic               alert_minor_o,
    output  logic               alert_major_internal_o,
    output  logic               alert_major_bus_o, 
    output  logic               core_sleep_o

    logic [31:0]    addr;
    logic [31:0]    data;

    ibex_tlul u_ibex_tlul (
        .hart_id_i(32'b0),
        .boot_addr_i(32'b0),
        .irq_software_i(1'b0),
        .irq_timer_i(1'b0),
        .irq_external_i(1'b0),
        .irq_nm_i(1'b0),
        .debug_req_i(1'b0),
        .fetch_enable_i('1),
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i_i = tlul_pkg::TL_D2H_DEFAULT;
        tl_d_i = tlul_pkg::TL_D2H_DEFAULT;
        
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i) @(negedge clk_i)
        addr = 0;
        data = 0;
        invoke_ibex_tlul(4, addr, data, tl_i_i); // read from memory

        @(negedge clk_i)
        // wait (tl_d_o.d_valid == 1);
        // if (tl_d_o.d_data == 12) begin
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

task automatic invoke_ibex_tlul;
    input [ 2:0]    opcode;
    input [31:0]    addr;
    input [31:0]    data;
    output tlul_pkg::tl_h2d_t tl_i_i;
begin
    tl_i_i.a_valid    = 1;
    tl_i_i.a_opcode   = tlul_pkg::tl_a_op_e'(opcode);
    tl_i_i.a_param    = 0;
    tl_i_i.a_size     = 2;
    tl_i_i.a_source   = 0;
    tl_i_i.a_address  = addr;
    tl_i_i.a_mask     = 4'hf;
    tl_i_i.a_data     = data;
    tl_i_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i_i.d_ready    = 1;
end
endtask