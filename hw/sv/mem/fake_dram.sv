module fake_dram (

    input               CLK,
    input               EN,     // chip enable
    input               WEN,    // write enable  
    input  logic [15:0] WMASK,  // write mask
    input  logic [15:0] D,      // write data
    output logic [15:0] Q,      // read data
    input  logic [11:0] A       // address
);

localparam  DEPTH = 2**($bits(A));
reg [15:0] mem [0:DEPTH-1]; // 8 KBytes
  
assign Q = mem[A];

always @(posedge CLK) begin
    if (~EN && ~WE) begin
        for (int i=0; i<16; i=i+1) begin
            if (WMASK[i]) begin
                mem[A][i] <= D[i];
            end
        end
    end
end

endmodule 