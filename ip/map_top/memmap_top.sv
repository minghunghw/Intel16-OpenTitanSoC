module memmap_top (
    input valid,
    input clk,
    input rst_n,

    input [5:0] addr,
    input [11:0] data,

    output logic [9:0] reg_ratio [2:0],
    output logic reg_pllen,
    output logic [1:0]reg_vcodiv,
    output logic [2:0] reg_trngsel [31:0],
    output logic [3:0] reg_noisesel [3:0],
    output logic reg_idfx_fscan_rstbypen
);

logic [3:0] next_reg_noisesel [3:0];
logic [9:0] next_reg_ratio [2:0];
logic next_reg_idfx_fscan_rstbypen;
logic [1:0] next_reg_vcodiv;
logic next_reg_pllen;   
logic [2:0] next_reg_trngsel [31:0];


always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        reg_pllen <= 1'b0;
        reg_idfx_fscan_rstbypen <= 1'b0;
        reg_ratio[0] <= 10'd0;
        reg_ratio[1] <= 10'd0;
        reg_ratio[2] <= 10'd0;
        reg_vcodiv   <= 2'd0;

        reg_noisesel[0] <= 4'd0;
        reg_noisesel[1] <= 4'd0;
        reg_noisesel[2] <= 4'd0;
        reg_noisesel[3] <= 4'd0;

        for (int i=0;i<=31;i=i+1) begin
            reg_trngsel[i] <= 3'd0; 
        end
    end
    else begin
        reg_pllen <= next_reg_pllen;
        reg_idfx_fscan_rstbypen <= next_reg_idfx_fscan_rstbypen;
        reg_ratio[0] <= next_reg_ratio[0];
        reg_ratio[1] <= next_reg_ratio[1];
        reg_ratio[2] <= next_reg_ratio[2];
        reg_vcodiv   <= next_reg_vcodiv ;

        reg_noisesel[0] <= next_reg_noisesel[0];
        reg_noisesel[1] <= next_reg_noisesel[1];
        reg_noisesel[2] <= next_reg_noisesel[2];
        reg_noisesel[3] <= next_reg_noisesel[3];

        for (int j=0;j<=31;j=j+1) begin
            reg_trngsel[j] <= next_reg_trngsel[j]; 
        end
    end

end

always_comb begin
        next_reg_pllen               = reg_pllen;
        next_reg_idfx_fscan_rstbypen = reg_idfx_fscan_rstbypen;
        next_reg_ratio[0]            = reg_ratio[0];
        next_reg_ratio[1]            = reg_ratio[1];
        next_reg_ratio[2]            = reg_ratio[2];
        next_reg_vcodiv              = reg_vcodiv ;

        next_reg_noisesel[0]         = reg_noisesel[0];
        next_reg_noisesel[1]         = reg_noisesel[1];
        next_reg_noisesel[2]         = reg_noisesel[2];
        next_reg_noisesel[3]         = reg_noisesel[3];

        for (int k=0;k<=31;k=k+1) begin
            next_reg_trngsel[k] = reg_trngsel[k]; 
        end
        
    if (valid) begin
        case (addr)
            6'd0: next_reg_pllen = data[0];
            6'd1: next_reg_vcodiv = data[1:0];
            6'd2: next_reg_idfx_fscan_rstbypen = data[0];
            6'd3: next_reg_ratio[0] = data[9:0];
            6'd4: next_reg_ratio[1] = data[9:0];
            6'd5: next_reg_ratio[2] = data[9:0];

            6'd6: {next_reg_trngsel[0],next_reg_trngsel[1],next_reg_trngsel[2],next_reg_trngsel[3]} = data[11:0];
            6'd7: {next_reg_trngsel[4],next_reg_trngsel[5],next_reg_trngsel[6],next_reg_trngsel[7]} = data[11:0];
            6'd8: {next_reg_trngsel[8],next_reg_trngsel[9],next_reg_trngsel[10],next_reg_trngsel[11]} = data[11:0];
            6'd9: {next_reg_trngsel[12],next_reg_trngsel[13],next_reg_trngsel[14],next_reg_trngsel[15]} = data[11:0];
            6'd10: {next_reg_trngsel[16],next_reg_trngsel[17],next_reg_trngsel[18],next_reg_trngsel[19]} = data[11:0];
            6'd11: {next_reg_trngsel[20],next_reg_trngsel[21],next_reg_trngsel[22],next_reg_trngsel[23]} = data[11:0];
            6'd12: {next_reg_trngsel[24],next_reg_trngsel[25],next_reg_trngsel[26],next_reg_trngsel[27]} = data[11:0];
            6'd13: {next_reg_trngsel[28],next_reg_trngsel[29],next_reg_trngsel[30],next_reg_trngsel[31]} = data[11:0];

            6'd14: next_reg_noisesel[0] = data[3:0];
            6'd15: next_reg_noisesel[1] = data[3:0];
            6'd16: next_reg_noisesel[2] = data[3:0];
            6'd17: next_reg_noisesel[3] = data[3:0];
            6'd18: next_reg_trngsel[15] = data[2:0];
            6'd19: next_reg_trngsel[16] = data[2:0];

            6'd20: next_reg_trngsel[4] = data[2:0];
            6'd21: next_reg_trngsel[0] = data[2:0];
            6'd22: next_reg_trngsel[1] = data[2:0];
            6'd23: next_reg_trngsel[2] = data[2:0];
            6'd24: next_reg_trngsel[3] = data[2:0];
            6'd25: next_reg_trngsel[4] = data[2:0];

        endcase
    end
end



endmodule