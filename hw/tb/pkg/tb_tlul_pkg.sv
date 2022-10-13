module tb_d2h_stimuli
(
    input  logic                clk_i,
    input  logic                rst_ni,
    input  logic [31:0]         tlul_addr,
    input  logic [31:0]         data,
    input  tlul_pkg::tl_h2d_t   tl_o,
    output tlul_pkg::tl_d2h_t   tl_i
);

    tlul_pkg::tl_d2h_t TL_D2H_PULSE;
    
    assign TL_D2H_PULSE = '{
        d_valid:    1'b1,
        d_opcode:   tlul_pkg::AccessAckData,
        d_param:    3'b0,
        d_size:     2'd2,
        d_source:   8'b0,
        d_sink:     1'b0,
        d_data:     data,
        d_user:     tlul_pkg::TL_D_USER_DEFAULT,
        d_error:    1'b0,
        a_ready:    1'b1
    };

    always@(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            tl_i <= tlul_pkg::TL_D2H_DEFAULT;
        end else if (tl_o.a_valid && tl_o.a_address == tlul_addr) begin
            tl_i <= TL_D2H_PULSE;
        end else begin
            tl_i <= tlul_pkg::TL_D2H_DEFAULT;
        end
    end

endmodule