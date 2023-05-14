module access;
fromFSDB data = *.clk;

initial begin
    $fsdbDumpvars("+fsdbfile+access.fsdb","+all");
end

real start_time;

always @(data) begin
    start_time = $time;
end

final if (start_time) begin
    $display("start_time: %d",  10000);
    $display("stop_time: %d",  70000);
end

endmodule
