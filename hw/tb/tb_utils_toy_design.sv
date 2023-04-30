module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    prim_mubi_pkg::mubi4_t en_ifetch_i;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    logic [ 2:0]    opcode;
    logic [31:0]    addr;
    logic [31:0]    data;

    toy_design u_toy_design (
    .clk_i_PAD(clk_i),
    .rst_ni_PAD(rst_ni),
    .en_ifetch_i_PAD(en_ifetch_i),
    .tl_i_PAD(tl_i), 
    .tl_o_PAD(tl_o)   
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        en_ifetch_i = prim_mubi_pkg::MuBi4True;
        tl_i = tlul_pkg::TL_H2D_DEFAULT;
        
        @(negedge clk_i)
        rst_ni      = 1;

        `ifdef SYN
        for (int i=0; i<2048; i++)
            u_toy_design.u_mem_tlul.u_sram.ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array.DATA_ARRAY[i] = 0;
        `else
        u_toy_design.u_mem_tlul.u_fake_dram.mem = 0;
        `endif

        for (int i=0; i<16; i++) begin
            @(negedge clk_i) @(negedge clk_i)
            opcode  = tlul_pkg::PutFullData;
            addr    = i*4;
            data    = i;
            invoke_mem_tlul(opcode, addr, data, tl_i); //write to memory
        end

        @(negedge clk_i) @(negedge clk_i)
        opcode  = tlul_pkg::Get;
        addr    = 12*4;
        data    = 0;
        invoke_mem_tlul(opcode, addr, data, tl_i); // read from memory

        @(negedge clk_i)
        wait (tl_o.d_valid == 1);
        if (tl_o.d_data == 12) begin
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

task automatic invoke_mem_tlul;
    input [ 2:0]    opcode;
    input [31:0]    addr;
    input [31:0]    data;
    output tlul_pkg::tl_h2d_t tl_i;
begin
    tl_i.a_valid    = 1;
    tl_i.a_opcode   = tlul_pkg::tl_a_op_e'(opcode);
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