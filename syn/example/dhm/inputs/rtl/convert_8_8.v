
module convert_8_8 (
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
reg     [7:0]   local_data;

parameter
        IDLE              = 1'b0,
        TX                = 1'b1;

reg     [1:0]   state;

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
                  state <= TX;
                  o_rrdy_inv <= 1;
                  o_tval <= 1;
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
            local_data <= i_data;
          end
      end
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
