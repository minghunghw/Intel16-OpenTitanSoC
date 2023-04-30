module counter (
	input clk,
	input clk_ro,
	output logic [23:0] dout
);

	logic [23:0] count;

	// counter
	always_ff @(posedge clk_ro or posedge clk) begin
		if (clk) begin
			count <= 24'd0;
		end else begin
			count <= count + 1;
		end
	end

	// count
	always_ff @(posedge clk) begin
		dout <= count;
	end

endmodule