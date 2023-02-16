
module tb;    
    localparam CLK_PERIOD   = 10;

    logic                   clk_i;
    logic                   rst_ni;
    ibex_pkg::ibex_mubi_t    fetch_enable_i;
    tlul_pkg::tl_d2h_t  ibex_i_i;
    tlul_pkg::tl_d2h_t  ibex_d_i;
    tlul_pkg::tl_h2d_t  ibex_i_o;
    tlul_pkg::tl_h2d_t  ibex_d_o;


ibex_cluster u_ibex_cluster(
    .clk_i          (clk_i),
    .rst_ni         (rst_ni),
    .fetch_enable_i (fetch_enable_i),
    .ibex_i_i       (ibex_i_i),
    .ibex_d_i       (ibex_d_i),
    .ibex_i_o       (ibex_i_o),
    .ibex_d_o       (ibex_d_o)
);

    initial begin 
        clk_i       = 0;
        rst_ni      = 0;
    end 
    always #(CLK_PERIOD/2.0) begin
        clk_i = ~clk_i;
    end

    initial begin
        
        ibex_i_i        = tlul_pkg::TL_D2H_DEFAULT;
        ibex_d_i        = tlul_pkg::TL_D2H_DEFAULT;
        fetch_enable_i=1;

        @(negedge clk_i)
        rst_ni      = 1;


        wait (ibex_i_o.a_valid == 1);
        if (ibex_i_o.a_address != 128) begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        
        @(posedge clk_i)
        invoke_rv_core_ibex(ibex_i_i);

        @(negedge clk_i)
        wait (ibex_i_o.a_valid == 1);
        if (ibex_i_o.a_address != 132) begin
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

task automatic invoke_rv_core_ibex;
    output tlul_pkg::tl_d2h_t ibex_i_i;
begin
    ibex_i_i.d_valid    = 1;
    ibex_i_i.d_opcode   = tlul_pkg::AccessAckData;
    ibex_i_i.d_param    = 0;
    ibex_i_i.d_size     = 2;
    ibex_i_i.d_source   = 0;
    ibex_i_i.d_sink     = 0;
    ibex_i_i.d_data     = 0;
    ibex_i_i.d_user     = tlul_pkg::TL_D_USER_DEFAULT;
    ibex_i_i.a_ready    = 1;
end
endtask