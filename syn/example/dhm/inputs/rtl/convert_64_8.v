
module convert_64_8 (
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

input   [63:0]  i_data;
input           i_rval;
output          o_rrdy;

output  [7:0]   o_data;
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
reg     [7:0]   local_byte_data;

parameter
        IDLE              = 3'b000,
        TX                = 3'b001;

reg     [2:0]   state;
reg     [3:0]   byte_count;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

assign  o_rrdy = ~o_rrdy_inv;

assign  i_xfer = i_rval & o_rrdy;
assign  o_xfer = o_tval & i_trdy;

assign  o_data = local_byte_data;

////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        state  <= IDLE;
        byte_count <= 0;
        o_rrdy_inv <= 0;
        o_tval <= 0;
        local_byte_data <= 0;
      end
    else
      begin
        case (state)
          IDLE:
            begin
              if (i_xfer == 1)
                begin
                  state <= TX;
                  byte_count <= byte_count + 1;
                  local_byte_data <= i_data[07:00];
                  o_rrdy_inv <= 1;
                  o_tval <= 1;
                end
            end
          TX:
            begin
              if (o_xfer == 1)
                begin
                  if (byte_count == 8)
                    begin
                      state <= IDLE;
                      byte_count <= 0;
                      o_rrdy_inv <= 0;
                      o_tval <= 0;
                    end
                  else
                    begin
                      state <= TX;
                      byte_count <= byte_count + 1;
                      if (byte_count == 1) local_byte_data <= local_data[15:08];
                      if (byte_count == 2) local_byte_data <= local_data[23:16];
                      if (byte_count == 3) local_byte_data <= local_data[31:24];
                      if (byte_count == 4) local_byte_data <= local_data[39:32];
                      if (byte_count == 5) local_byte_data <= local_data[47:40];
                      if (byte_count == 6) local_byte_data <= local_data[55:48];
                      if (byte_count == 7) local_byte_data <= local_data[63:56];
                    end
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
            local_data <= i_data;
          end
      end
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
