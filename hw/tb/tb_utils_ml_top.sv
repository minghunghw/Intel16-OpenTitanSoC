module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t  dmem_tl_i;
    tlul_pkg::tl_d2h_t  dmem_tl_o;

    tlul_pkg::tl_h2d_t  core_tl_i;
    tlul_pkg::tl_d2h_t  core_tl_o;

    logic               isp_cvalid_i;
    logic               isp_cready_o;
    logic               isp_cwrite_i;
    logic   [ 21:0]     isp_caddr_i;
    logic   [255:0]     isp_wdata_i;
    logic   [ 31:0]     isp_wmask_i;

    logic  intr_host_req_o;
    logic  intr_finish_o;
    logic  intr_fault_o;
    logic  intr_data_fault_o;

    ml_top u_ml_top (
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        dmem_tl_i       = tlul_pkg::TL_H2D_DEFAULT;
        core_tl_i       = tlul_pkg::TL_H2D_DEFAULT;
        isp_cvalid_i    = '0;
        isp_cwrite_i    = '0;
        isp_caddr_i     = '0;
        isp_wdata_i     = '0;
        isp_wmask_i     = '0;
        
        @(negedge clk_i)
        rst_ni      = 1;

        @(negedge clk_i)
        // invoke_gpio(tl_i);

        // @(negedge clk_i)
        // tl_i = tlul_pkg::TL_H2D_DEFAULT;

        // wait (tl_o.d_valid == 1);
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

task automatic invoke_ml_top;
    output tlul_pkg::tl_h2d_t tl_i;
    tl_i.a_valid    = 1;
    tl_i.a_opcode   = tlul_pkg::PutFullData;
    tl_i.a_param    = 0;
    tl_i.a_size     = 2;
    tl_i.a_source   = 0;
    tl_i.a_address  = 0;
    tl_i.a_mask     = 4'hf;
    tl_i.a_data     = 32'hffff_ffff;
    tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i.d_ready    = 1;
endtask