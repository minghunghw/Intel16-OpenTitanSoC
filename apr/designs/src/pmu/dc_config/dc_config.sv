module dc_config (
    input  [ 5:0] a,
    output [11:0] s
);

always@(*)
    case (a)
        6'b000000: s = 12'b000000100000;
        6'b000001: s = 12'b100000000000;
        6'b000010: s = 12'b110000000000;
        6'b000011: s = 12'b110000010000;
        6'b000100: s = 12'b111000000000;
        6'b000101: s = 12'b101000001000;
        6'b000110: s = 12'b111000001000;
        6'b000111: s = 12'b111000011000;
        6'b001000: s = 12'b111100000000;
        6'b001001: s = 12'b100100000100;
        6'b001010: s = 12'b110100000100;
        6'b001011: s = 12'b110100010100;
        6'b001100: s = 12'b111100000100;
        6'b001101: s = 12'b101100001100;
        6'b001110: s = 12'b111100001100;
        6'b001111: s = 12'b111100011100;
        6'b010000: s = 12'b111110000000;
        6'b010001: s = 12'b100010000010;
        6'b010010: s = 12'b110010000010;
        6'b010011: s = 12'b110010010010;
        6'b010100: s = 12'b111010000010;
        6'b010101: s = 12'b101010001010;
        6'b010110: s = 12'b111010001010;
        6'b010111: s = 12'b111010011010;
        6'b011000: s = 12'b111110000010;
        6'b011001: s = 12'b100110000110;
        6'b011010: s = 12'b110110000110;
        6'b011011: s = 12'b110110010110;
        6'b011100: s = 12'b111110000110;
        6'b011101: s = 12'b101110001110;
        6'b011110: s = 12'b111110001110;
        6'b011111: s = 12'b111110011110;
        6'b100000: s = 12'b111111000000;
        6'b100001: s = 12'b100001000001;
        6'b100010: s = 12'b110001000001;
        6'b100011: s = 12'b110001010001;
        6'b100100: s = 12'b111001000001;
        6'b100101: s = 12'b101001001001;
        6'b100110: s = 12'b111001001001;
        6'b100111: s = 12'b111001011001;
        6'b101000: s = 12'b111101000001;
        6'b101001: s = 12'b100101000101;
        6'b101010: s = 12'b110101000101;
        6'b101011: s = 12'b110101010101;
        6'b101100: s = 12'b111101000101;
        6'b101101: s = 12'b101101001101;
        6'b101110: s = 12'b111101001101;
        6'b101111: s = 12'b111101011101;
        6'b110000: s = 12'b111111000001;
        6'b110001: s = 12'b100011000011;
        6'b110010: s = 12'b110011000011;
        6'b110011: s = 12'b110011010011;
        6'b110100: s = 12'b111011000011;
        6'b110101: s = 12'b101011001011;
        6'b110110: s = 12'b111011001011;
        6'b110111: s = 12'b111011011011;
        6'b111000: s = 12'b111111000011;
        6'b111001: s = 12'b100111000111;
        6'b111010: s = 12'b110111000111;
        6'b111011: s = 12'b110111010111;
        6'b111100: s = 12'b111111000111;
        6'b111101: s = 12'b101111001111;
        6'b111110: s = 12'b111111001111;
        6'b111111: s = 12'b111111011111;
    endcase

endmodule