module trng_mapcore (
    input       valid,
    input       clk,
    input       rst_n,
    input [2:0]trng_sel1       ,
    input [2:0]trng_sel2       ,
    input [3:0]trng_sel1adress ,
    input [3:0]trng_sel2adress ,
    output logic [2:0] sel [31:0]
);

logic [3:0] state;
logic [3:0] next_state;

localparam T_IDLE = 1;
localparam T_SET  = 2;


always_ff @(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		state <= T_IDLE;
	else
		state <= next_state;
end

always_comb begin
    case (state)
        T_IDLE: begin
            if(valid) begin
                next_state = T_SET;
            end   
            else begin
                next_state = T_IDLE;
            end
        end
        T_SET: begin
            if(valid) begin
                next_state = T_SET;
            end   
            else begin
                next_state = T_IDLE;
            end
        end
        default: next_state = T_IDLE;
    endcase
end

always_ff @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
    sel <= 'd0;
    end
    else begin
        if(next_state == T_SET) begin
            sel [trng_sel1adress] <= trng_sel1 ;
            sel [trng_sel2adress] <= trng_sel2 ;
        end
    end
end
endmodule