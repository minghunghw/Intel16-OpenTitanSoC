module tb;

    logic [31:0] dq;
    logic [31:0] drv0;
    logic [31:0] drv1;
    logic [31:0] drv2;
    logic [31:0] enabq;
    logic [31:0] enq;
    logic [31:0] outi;
    logic [31:0] pd;
    logic [31:0] ppen;
    logic [31:0] prg_slew;
    logic [31:0] puq;
    logic [31:0] pwrup_pull_en;
    logic [31:0] pwrupzhl;

    sandbox u_sandbox(
        .*
    );

    initial begin

	    $finish;
    end

endmodule