module decoder (
    input                       clk,
    input                       rst_n,
    input                       valid,

    input [4:0]                 addr,
    input [9:0]                 data,

    // for pll
    output logic [2:0][9:0]     reg_ratio,
    output logic                reg_pllen,
    output logic [1:0]          reg_vcodiv,
    output logic                reg_idfx_fscan_rstbypen,
    output logic                reg_bypass,

    // for trng
    output logic [31:0][2:0]    reg_trngsel,

    // for noise
    output logic [15:0]         reg_noisesel
);

    // for pll
    logic [2:0][9:0]    next_reg_ratio;
    logic               next_reg_pllen;
    logic [1:0]         next_reg_vcodiv;
    logic               next_reg_idfx_fscan_rstbypen;
    logic               next_reg_bypass;
    // for trng
    logic [31:0][2:0]   next_reg_trngsel;
    // for noise
    logic [15:0]        next_reg_noisesel;

    always_comb begin
        next_reg_ratio                  = reg_ratio;
        next_reg_pllen                  = reg_pllen;
        next_reg_vcodiv                 = reg_vcodiv ;
        next_reg_idfx_fscan_rstbypen    = reg_idfx_fscan_rstbypen;
        next_reg_bypass                 = reg_bypass ;
        next_reg_noisesel               = reg_noisesel;
        next_reg_trngsel                = reg_trngsel; 

        if (valid) begin
            case (addr)
                5'd0:  next_reg_ratio[0]             = data;
                5'd1:  next_reg_ratio[1]             = data;
                5'd2:  next_reg_ratio[2]             = data;
                5'd3:  next_reg_pllen                = data[0];
                5'd4:  next_reg_vcodiv               = data[1:0];
                5'd5:  next_reg_idfx_fscan_rstbypen  = data[0];
                5'd6:  next_reg_bypass               = data[0];

                5'd7:  {next_reg_trngsel[1],next_reg_trngsel[0]}    = data[5:0];
                5'd8:  {next_reg_trngsel[3],next_reg_trngsel[2]}    = data[5:0];
                5'd9:  {next_reg_trngsel[5],next_reg_trngsel[4]}    = data[5:0];
                5'd10: {next_reg_trngsel[7],next_reg_trngsel[6]}    = data[5:0];
                5'd11: {next_reg_trngsel[9],next_reg_trngsel[8]}    = data[5:0];
                5'd12: {next_reg_trngsel[11],next_reg_trngsel[10]}  = data[5:0];
                5'd13: {next_reg_trngsel[13],next_reg_trngsel[12]}  = data[5:0];
                5'd14: {next_reg_trngsel[15],next_reg_trngsel[14]}  = data[5:0];
                5'd15: {next_reg_trngsel[17],next_reg_trngsel[16]}  = data[5:0];
                5'd16: {next_reg_trngsel[19],next_reg_trngsel[18]}  = data[5:0];
                5'd17: {next_reg_trngsel[21],next_reg_trngsel[20]}  = data[5:0];
                5'd18: {next_reg_trngsel[23],next_reg_trngsel[22]}  = data[5:0];
                5'd19: {next_reg_trngsel[25],next_reg_trngsel[24]}  = data[5:0];
                5'd20: {next_reg_trngsel[27],next_reg_trngsel[26]}  = data[5:0];
                5'd21: {next_reg_trngsel[29],next_reg_trngsel[28]}  = data[5:0];
                5'd22: {next_reg_trngsel[31],next_reg_trngsel[30]}  = data[5:0];

                5'd23: next_reg_noisesel[3:0]   = data[3:0];
                5'd24: next_reg_noisesel[7:4]   = data[3:0];
                5'd25: next_reg_noisesel[11:8]  = data[3:0];
                5'd26: next_reg_noisesel[15:12] = data[3:0];
            endcase
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            reg_ratio[0]            <= 10'hBC;;
            reg_ratio[1]            <= 10'hC7;
            reg_ratio[2]            <= 10'h19;
            reg_pllen               <= 1'b0;
            reg_vcodiv              <= 2'd0;
            reg_idfx_fscan_rstbypen <= 1'b0;
            reg_bypass              <= 1'b0;
            reg_trngsel             <= 96'd0; 
            reg_noisesel            <= 16'd0; 
        end else begin
            reg_ratio               <= next_reg_ratio;
            reg_pllen               <= next_reg_pllen;
            reg_vcodiv              <= next_reg_vcodiv ;
            reg_idfx_fscan_rstbypen <= next_reg_idfx_fscan_rstbypen;
            reg_bypass              <= next_reg_bypass;
            reg_trngsel             <= next_reg_trngsel; 
            reg_noisesel            <= next_reg_noisesel; 
        end
    end

endmodule