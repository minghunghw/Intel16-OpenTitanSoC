module noise_mapcore (
    input       valid,
    input       clk,
    input       rst_n,
    input [15:0]noise_data,   
    output logic[15:0]noise_sel
);

logic [3:0] state;
logic [3:0] next_state;

localparam N_IDLE = 1;
localparam N_SET  = 2;


always_ff @(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		state <= N_IDLE;
	else
		state <= next_state;
end

always_comb begin
    case (state)
        N_IDLE: begin
            if(valid) begin
                next_state = N_SET;
            end   
            else begin
                next_state = N_IDLE;
            end
        end
        N_SET: begin
            if(valid) begin
                next_state = N_SET;
            end   
            else begin
                next_state = N_IDLE;
            end
        end
        default: next_state = N_IDLE;
    endcase
end

always_ff @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
    noise_sel <= 15'b111111111111111;
    end
    else begin
        if(next_state == N_SET) begin
            noise_sel <= noise_data;
        end
    end
end
endmodule