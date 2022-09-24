module convert_8_64 (
        clk,
        reset_n,

        i_data,
        i_rval,
        o_rrdy,

        o_data,
        o_tval,
        i_trdy
);

input           clk;
input           reset_n;

input   [7:0]   i_data;
input           i_rval;
output          o_rrdy;

output  [63:0]  o_data;
output          o_tval;
input           i_trdy;

////////

reg             o_tval;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

wire            i_xfer;
wire            o_xfer;

reg             o_rrdy_inv;
reg     [63:0]  local_data;

parameter
        IDLE              = 2'b00,
        RX                = 2'b01,
        TX                = 2'b10;

reg     [1:0]   state;
reg     [3:0]   byte_count;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

assign  o_rrdy = ~o_rrdy_inv;

assign  i_xfer = i_rval & o_rrdy;
assign  o_xfer = o_tval & i_trdy;

assign  o_data = local_data;

////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        state  <= IDLE;
        byte_count <= 0;
        o_rrdy_inv <= 0;
        o_tval <= 0;
      end
    else
      begin
        case (state)
          IDLE:
            begin
              if (i_xfer == 1)
                begin
                  state <= RX;
                  byte_count <= byte_count + 1;
                end
            end
          RX:
            begin
              if (i_xfer == 1)
                begin
                  if (byte_count == 7)
                    begin
                      state <= TX;
                      byte_count <= 0;
                      o_rrdy_inv <= 1;
                      o_tval <= 1;
                    end
                  else
                    begin
                      state <= RX;
                      byte_count <= byte_count + 1;
                    end
                end
            end
          TX:
            begin
              if (o_xfer == 1)
                begin
                  state <= IDLE;
                  o_rrdy_inv <= 0;
                  o_tval <= 0;
                end
            end
        endcase
      end
  end

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        local_data <= 0;
      end
    else
      begin
        if (i_xfer == 1)
          begin
            if (byte_count == 0) begin local_data[07:00] <= i_data; end
            if (byte_count == 1) begin local_data[15:08] <= i_data; end
            if (byte_count == 2) begin local_data[23:16] <= i_data; end
            if (byte_count == 3) begin local_data[31:24] <= i_data; end
            if (byte_count == 4) begin local_data[39:32] <= i_data; end
            if (byte_count == 5) begin local_data[47:40] <= i_data; end
            if (byte_count == 6) begin local_data[55:48] <= i_data; end
            if (byte_count == 7) begin local_data[63:56] <= i_data; end
          end
      end
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
