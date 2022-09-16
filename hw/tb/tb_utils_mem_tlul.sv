module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_d_i;
    tlul_pkg::tl_d2h_t tl_d_o;

    logic [31:0]    addr;
    logic [31:0]    data;

    mem_tlul u_mem_tlul (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_d_i = tlul_pkg::TL_H2D_DEFAULT;
        
        @(negedge clk_i)
        rst_ni      = 1;

        u_mem_tlul.u_fake_dram.mem = 0;

        for (int i=0; i<16; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            addr = i*4;
            data = i;
            invoke_mem_tlul(0, addr, data, tl_d_i); //write to memory
        end

        @(negedge clk_i) @(negedge clk_i)
        addr = 12*4;
        data = 0;
        invoke_mem_tlul(4, addr, data, tl_d_i); // read from memory

        wait (tl_d_o.d_valid == 1);
        if (tl_d_o.d_data == 12) begin
            $display("%c[1;32m",27);
            $display("Success\n");
            $display("%c[0m",27);
        end else begin
            $display("%c[1;31m",27);
            $display("Failure\n");
            $display("%c[0m",27);
        end
	    $finish;
    end

endmodule

task automatic invoke_mem_tlul;
    input [ 2:0]    opcode;
    input [31:0]    addr;
    input [31:0]    data;
    output tlul_pkg::tl_h2d_t tl_d_i;
begin
    tl_d_i.a_valid    = 1;
    tl_d_i.a_opcode   = tlul_pkg::tl_a_op_e'(opcode);
    tl_d_i.a_param    = 0;
    tl_d_i.a_size     = 2;
    tl_d_i.a_source   = 0;
    tl_d_i.a_address  = addr;
    tl_d_i.a_mask     = 4'hf;
    tl_d_i.a_data     = data;
    tl_d_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_d_i.d_ready    = 1;
end
endtask