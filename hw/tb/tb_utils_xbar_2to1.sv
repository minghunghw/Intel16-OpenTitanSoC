module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    // Host interfaces
    tlul_pkg::tl_h2d_t tl_core_i;
    tlul_pkg::tl_d2h_t tl_core_o;
    tlul_pkg::tl_h2d_t tl_main_i;
    tlul_pkg::tl_d2h_t tl_main_o;

    // Device interfaces
    tlul_pkg::tl_h2d_t tl_sram_o;
    tlul_pkg::tl_d2h_t tl_sram_i;

    prim_mubi_pkg::mubi4_t scanmode_i;

    int correct;

    xbar_2to1 u_xbar_2to1 (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        correct     = 0;
        tl_core_i   = tlul_pkg::TL_H2D_DEFAULT;
        tl_main_i   = tlul_pkg::TL_H2D_DEFAULT; 
        tl_sram_i   = tlul_pkg::TL_D2H_DEFAULT;
        scanmode_i  = prim_mubi_pkg::MuBi4False;

        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        invoke_host(100, 100, tl_core_i);

        @(negedge clk_i)
        tl_core_i.a_valid = 0;

        @(negedge clk_i)
        invoke_host(200, 200, tl_main_i);

        @(negedge clk_i)
        tl_main_i.a_valid = 0;

        #100;
        if (correct == 2) begin
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

    always@(posedge clk_i) begin
        if (tl_sram_o.a_valid) begin
            if (tl_sram_o.a_address == 100 && tl_sram_o.a_data == 100) begin
                correct += 1;
            end else if (tl_sram_o.a_address == 200 && tl_sram_o.a_data == 200) begin
                correct += 1;
            end
        end
    end

endmodule

task automatic invoke_host;
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