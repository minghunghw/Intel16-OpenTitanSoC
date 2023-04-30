

module tb;

    localparam CLK_PERIOD   = 10;
    localparam Width   = 39;
    localparam Depth   = 32768;
    localparam DataBitsPerMask   = 39;
    localparam Aw   = $clog2(Depth);
    localparam Width2   = 312;
    localparam Depth2   = 128;
    localparam DataBitsPerMask2   = 1;
    localparam Aw2   = $clog2(Depth2);

    logic             clk_i;
    logic             req_i;
    logic             write_i;
    logic [Aw-1:0]    addr_i;
    logic [Width-1:0] wdata_i;
    logic [Width-1:0] wmask_i;
    logic [Width-1:0] rdata_o; // Read data. Data is returned one cycle after req_i is high.
    prim_ram_1p_pkg::ram_1p_cfg_t       cfg_i;

    logic             req_i2;
    logic             write_i2;
    logic [Aw2-1:0]    addr_i2;
    logic [Width2-1:0] wdata_i2;
    logic [Width2-1:0] wmask_i2;
    logic [Width2-1:0] rdata_o2; // Read data. Data is returned one cycle after req_i is high.
    prim_ram_1p_pkg::ram_1p_cfg_t       cfg_i2;

    initial clk_i = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;
    prim_ram_1p #(
    .Width          (Width), // bit
    .Depth          (Depth),
    .DataBitsPerMask(DataBitsPerMask), // Number of data bits per bit of write mask
    .MemInitFile    (""), // VMEM file to initialize the memory with
    .Aw             (Aw)  // derived parameter
    )  u_ram_1p (
    .clk_i(clk_i),
    .req_i(req_i),
    .write_i(write_i),
    .addr_i(addr_i),
    .wdata_i(wdata_i),
    .wmask_i(wmask_i),
    .rdata_o(rdata_o), // Read data. Data is returned one cycle after req_i is high.
    .cfg_i(cfg_i)
    );
    prim_ram_1p #(
    .Width          (Width2), // bit
    .Depth          (Depth2),
    .DataBitsPerMask(DataBitsPerMask2), // Number of data bits per bit of write mask
    .MemInitFile    (""), // VMEM file to initialize the memory with
    .Aw             (Aw2)  // derived parameter
    )  u_ram_1p_inst2 (
    .clk_i(clk_i),
    .req_i(req_i2),
    .write_i(write_i2),
    .addr_i(addr_i2),
    .wdata_i(wdata_i2),
    .wmask_i(wmask_i2),
    .rdata_o(rdata_o2), // Read data. Data is returned one cycle after req_i is high.
    .cfg_i(cfg_i2)
    );
    initial begin
        // mem1 reset
        req_i=0;
        write_i=0;
        addr_i=0;
        wdata_i=0;
        wmask_i=0;
        // mem2 reset
        req_i2=0;
        write_i2=0;
        addr_i2=0;
        wdata_i2=0;
        wmask_i2=0;
        @(negedge clk_i)
        // mem1 basic
        req_i=1;
        write_i=1;
        addr_i=1;
        wdata_i={Width{1'b1}};
        wmask_i={Width{1'b1}};
        // mem2 basic
        req_i2=1;
        write_i2=1;
        addr_i2=1;
        wdata_i2={Width2{1'b1}};
        wmask_i2={Width2{1'b1}};
        @(negedge clk_i)
        // mem1 high addr + large data
        req_i=1;
        write_i=1;
        addr_i={2'b10,{(Aw-2){1'b1}}};
        wdata_i={{(Width-5){1'b1}},5'b0};
        wmask_i={Width{1'b1}};
        // mem2 high addr + large data
        req_i2=1;
        write_i2=1;
        addr_i2={{Aw2{1'b1}}};
        wdata_i2={(Width2/2){2'b10}};
        wmask_i2={Width2{1'b1}};
        @(negedge clk_i)
        // mem1 read
        req_i=1;
        write_i=0;
        addr_i=1;
        wdata_i=0;
        wmask_i={Width{1'b1}};
        // mem2 read
        req_i2=1;
        write_i2=0;
        addr_i2=1;
        wdata_i2=0;
        wmask_i2={Width2{1'b1}};
        @(negedge clk_i)
        // mem1 basic results
        if (rdata_o == {Width{1'b1}}) begin
            $display("%c[1;32m",27);
            $display("SUCCESS\n");
            $display("%c[0m",27);
        end else begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        // mem2 basic results
        if (rdata_o2 == {Width2{1'b1}}) begin
            $display("%c[1;32m",27);
            $display("SUCCESS\n");
            $display("%c[0m",27);
        end else begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        @(negedge clk_i)
        // mem1 read
        req_i=1;
        write_i=0;
        addr_i={2'b10,{(Aw-2){1'b1}}};
        wdata_i=0;
        wmask_i={Width{1'b1}};
        // mem2 read
        req_i2=1;
        write_i2=0;
        addr_i2={{Aw2{1'b1}}};
        wdata_i2=0;
        wmask_i2={Width2{1'b1}};
        @(negedge clk_i)
        // mem1 high addr + large data results
        if (rdata_o == {{(Width-5){1'b1}},5'b0}) begin
            $display("%c[1;32m",27);
            $display("SUCCESS\n");
            $display("%c[0m",27);
        end else begin
            $display("%c[1;31m",27);
            $display("FAILED\n");
            $display("%c[0m",27);
        end
        // mem2 high addr + large data results
        if (rdata_o2 == {(Width2/2){2'b10}}) begin
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

// task automatic write_mem1;
//     input Width, Aw;
//     input [Aw-1:0] addr_i_tmp;
//     input [Width-1:0] wdata_i_tmp;
//     input [Width-1:0] wmask_i_tmp;
//     output req_i,write_i,addr_i,wdata_i,wmask_i;
//     req_i=1;
//     write_i=1;
//     addr_i=addr_i_tmp;
//     wdata_i=wdata_i_tmp;
//     wmask_i=wmask_i_tmp;
// endtask