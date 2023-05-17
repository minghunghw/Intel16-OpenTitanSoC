module hit_core (
    input        clk                  ,
    input        rst_n                ,
    input        valid                ,
    input [1:0]  address              ,
    input [15:0] data                 ,

    output logic pll_valid            ,
    output logic pll_enable           ,
    output logic [1:0]pll_ratiosel    ,
    output logic [9:0]pll_ratio       ,
    output logic [1:0]pll_vcodiv_ratio,

    output logic trng_valid           ,
    output logic [2:0]trng_sel1       ,
    output logic [2:0]trng_sel2       ,
    output logic [3:0]trng_sel1adress ,
    output logic [3:0]trng_sel2adress ,

    output logic noise_valid          ,
    output logic [15:0]noise_data     
);

    logic hit_pllwrite           ;
    logic hit_trngwrite          ;
    logic hit_noisewrite         ;
    logic hit_enable             ;

    localparam H_IDLE = 1;
    localparam H_SET  = 2;

    logic [3:0] state;
    logic [3:0] next_state;

    logic temp_pll_enable                ;
    logic [1:0]temp_pll_ratiosel         ;
    logic [9:0]temp_pll_ratio            ;
    logic [1:0]temp_pll_vcodiv_ratio     ;
    logic [2:0]temp_trng_sel1            ;
    logic [2:0]temp_trng_sel2            ;
    logic [3:0]temp_trng_sel1adress      ;
    logic [3:0]temp_trng_sel2adress      ;
    logic [15:0]temp_noise_data          ; 

    assign temp_pll_enable            = data[0]       ;
    assign temp_pll_ratiosel     = data[2:1]     ;
    assign temp_pll_ratio        = data[12:3]    ;
    assign temp_pll_vcodiv_ratio = data[14:13]   ;
    assign temp_trng_sel1             = data[2:0]     ;
    assign temp_trng_sel2             = data[9:7]     ;
    assign temp_trng_sel1adress       = data[6:3]     ;
    assign temp_trng_sel2adress       = data[13:10]   ;
    assign temp_noise_data      = data          ; 


always_ff @(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		state <= H_IDLE;
	else
		state <= next_state;
end

assign hit_pllwrite    = (address == 2'd1)                             ;
assign hit_trngwrite   = (address == 2'd2)                             ;
assign hit_noisewrite  = (address == 2'd3)                             ;
assign hit_enable      = (address==0)? 1'b0 : 1'b1                     ;


always_comb begin
    case (state)
        H_IDLE: begin
            if((hit_enable)&&valid) begin
                next_state = H_SET;
            end   
            else begin
                next_state = H_IDLE;
            end
        end
        H_SET: begin
            if((hit_enable)&&valid) begin
                next_state = H_SET;
            end   
            else begin
                next_state = H_IDLE;
            end
        end
        default: next_state = H_IDLE;
    endcase
end

always_ff @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        pll_valid       <=      'd0      ;
        pll_enable      <=      1'd1     ;
        pll_ratio       <=      'd0      ;
        pll_vcodiv_ratio<=      'd0      ;
        pll_ratiosel    <=      'd0      ;

        trng_valid      <=      'd0      ;
        trng_sel1       <=      'd0      ;
        trng_sel2       <=      'd0      ;
        trng_sel1adress <=      'd0      ;
        trng_sel2adress <=      'd0      ;

        noise_valid     <=      'd0      ;
        noise_data      <=      'd0      ;
    end
    else begin
        case (next_state)
            H_IDLE: begin
                pll_valid       <=      'd0      ;
                noise_valid     <=      'd0      ;
                trng_valid      <=      'd0      ;
            end
            H_SET : begin
                if(hit_pllwrite) begin
                    pll_valid       <=      1'b1                      ;
                    pll_enable      <=      temp_pll_enable           ;
                    pll_ratio       <=      temp_pll_ratio            ;
                    pll_vcodiv_ratio<=      temp_pll_vcodiv_ratio     ;
                    pll_ratiosel    <=      temp_pll_ratiosel         ;
                end
                else if(hit_trngwrite) begin
                    trng_valid      <=      1'b1                      ;
                    trng_sel1       <=      temp_trng_sel1            ;
                    trng_sel2       <=      temp_trng_sel2            ;
                    trng_sel1adress <=      temp_trng_sel1adress      ;
                    trng_sel2adress <=      temp_trng_sel2adress      ;
                end
                else begin
                    noise_valid     <=      1'b1                      ;
                    noise_data      <=      temp_noise_data           ;
                end  
            end     
            default: begin
                    pll_valid       <=      'd0                       ;
                    noise_valid     <=      'd0                       ;
                    trng_valid      <=      'd0                       ;    
                end
        endcase
    end
end
endmodule