module tb;

    wire port1;
    wire port2;

    logic port1_oe, port2_oe;
    logic port1_i, port2_i;
    logic port1_o, port2_o;

    assign port1 = (port1_oe) ? 1'bz : port1_i;
    assign port2 = (port2_oe) ? 1'bz : port2_i;
    assign port1_o = (port1_oe) ? port1 : 1'bz;
    assign port2_o = (port2_oe) ? port2 : 1'bz;

    test_io u_test_io(
        .*
    );

    initial begin
        port1_oe = 1'b0;
        port2_oe = 1'b1;
        port1_i = 1'b0;
        port2_i = 1'b0;
        
        #10
        port1_i = 1'b1;

        #10
        port1_oe = 1'b1;
        port2_oe = 1'b0;
        port1_i = 1'b0;
        port2_i = 1'b0;

        #10
        port2_i = 1'b1;

        #10

	    $finish;
    end

endmodule