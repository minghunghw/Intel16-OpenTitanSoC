
module dhm_bypass (
        clk,
        reset_n,
        scan_mode,

        pd_iso,
        pd_iso_n,
        pd_req,
        pd_ack,
        sleep,
        sleep_n,
        sleep_ack,
        rreg_stop_req,
        rreg_stop_ack,
        rreg_save,
        rreg_restore,
        save,
        save_n,
        restore,
        restore_n,

        core_clk,

        i_rdata,
        i_rval,
        o_rrdy,
        o_tdata,
        o_tval,
        i_trdy,

        o_tdata_core,
        o_tval_core,
        i_trdy_core,
        i_rdata_core,
        i_rval_core,
        o_rrdy_core
);


input           clk;
input           reset_n;
input           scan_mode;

input           pd_iso;
input           pd_iso_n;
input           pd_req;
output          pd_ack;
output          sleep;
output          sleep_n;
input           sleep_ack;
input           rreg_stop_req;
output          rreg_stop_ack;
input           rreg_save;
input           rreg_restore;
output          save;
output          save_n;
output          restore;
output          restore_n;
output          core_clk;

input   [7:0]   i_rdata;
input           i_rval;
output          o_rrdy;
output  [7:0]   o_tdata;
output          o_tval;
input           i_trdy;

output  [7:0]   o_tdata_core;
output          o_tval_core;
input           i_trdy_core;
input   [7:0]   i_rdata_core;
input           i_rval_core;
output          o_rrdy_core;

//

reg             o_tval;
reg             o_tval_core;
reg             o_rrdy_core;
reg     [7:0]   o_tdata;
reg     [7:0]   o_tdata_core;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

wire            i_xfer;
wire            o_xfer;
wire            i_xfer_core;
wire            o_xfer_core;

reg     [1:0]   pd_req_sync;
wire            pd_req_sync_assert;
wire            pd_req_sync_negate;
reg     [2:0]   pd_state;

reg     [1:0]   rreg_stop_req_sync;
wire            rreg_stop_req_sync_assert;
wire            rreg_stop_req_sync_negate;
reg     [3:0]   rreg_state;

wire            core_clk_en;

reg             o_rrdy_inv;
reg     [63:0]  local_data;

parameter
        RX                = 3'b00,
        TX_CORE           = 3'b01,
        RX_CORE           = 3'b10,
        TX                = 3'b11;

reg     [1:0]   state;
reg     [2:0]   byte_count;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

assign  o_rrdy = ~o_rrdy_inv;
assign  i_xfer = i_rval & o_rrdy;
assign  o_xfer = o_tval & i_trdy;
assign  i_xfer_core = i_rval_core & o_rrdy_core;
assign  o_xfer_core = o_tval_core & i_trdy_core;

////////////////////////////////////////////////////////////////////////////////
// Power domain control
////////////////////////////////////////////////////////////////////////////////

// At the chip level, pd_req & rreg_stop_req are async to clk,
// so sync them before using them.

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        pd_req_sync <= 0;
        pd_state <= 0;

        rreg_stop_req_sync <= 0;
        rreg_state <= 0;
      end
    else
      begin
        pd_req_sync[0] <= pd_req;
        pd_req_sync[1] <= pd_req_sync[0];

        rreg_stop_req_sync[0] <= rreg_stop_req;
        rreg_stop_req_sync[1] <= rreg_stop_req_sync[0];

        case ({pd_req_sync_assert,pd_req_sync_negate})
          2'b10:
            begin
              pd_state[0] <= 1'b1;
            end
          2'b01:
            begin
              pd_state[0] <= 1'b0;
            end
          2'b11, 2'b00:
            begin
              pd_state[0] <= pd_state[0];
            end
        endcase

        case ({rreg_stop_req_sync_assert,rreg_stop_req_sync_negate})
          2'b10:
            begin
              rreg_state[0] <= 1'b1;
            end 
          2'b01:
            begin
              rreg_state[0] <= 1'b0;
            end 
          2'b11, 2'b00:
            begin
              rreg_state[0] <= rreg_state[0];
            end 
        endcase

        pd_state[1] <= pd_state[0];
        pd_state[2] <= pd_state[1];
        
        rreg_state[1] <= rreg_state[0];
        rreg_state[2] <= rreg_state[1];
        rreg_state[3] <= rreg_state[2];

      end
  end

assign pd_req_sync_assert = (pd_req_sync == 2'b11);
assign pd_req_sync_negate = (pd_req_sync == 2'b00);

assign rreg_stop_req_sync_assert = (rreg_stop_req_sync == 2'b11);
assign rreg_stop_req_sync_negate = (rreg_stop_req_sync == 2'b00);

assign pd_ack        = pd_state[2];

assign core_clk_en   = ~rreg_state[1];
assign rreg_stop_ack = rreg_state[3];

// The following combinational clock gate is
// converted to an ICGC via replace_clock_gates.

assign core_clk      = core_clk_en & clk;

// This logic implemented in a level of hierarchy so it
// can be associated with a power domain if needed.

dhm_sleep_logic u_dhm_sleep_logic (
  .scan_mode    ( scan_mode    ),
  .pd_state     ( pd_state     ),
  .sleep        ( sleep        ),
  .sleep_n      ( sleep_n      ),
  .sleep_ack    ( sleep_ack    ),
  .rreg_save    ( rreg_save    ),
  .rreg_restore ( rreg_restore ),
  .save         ( save         ),
  .save_n       ( save_n       ),
  .restore      ( restore      ),
  .restore_n    ( restore_n    )

);

////////////////////////////////////////////////////////////////////////////////
//    TX_CORE RX_CORE
// RX ############### TX
////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        state        <= RX;
        byte_count   <= 0;
        o_rrdy_inv   <= 0;
        o_tval       <= 0;
        o_rrdy_core  <= 0;
        o_tval_core  <= 0;
        o_tdata      <= 0;
        o_tdata_core <= 0;
      end
    else
      begin
        case (state)
          RX:
            begin
              // $display("RX");
              if (i_xfer == 1)
                begin
                  if (byte_count == 7)
                    begin
                      o_rrdy_inv <= 1;
                      byte_count <= 0;
                      if (pd_iso == 1)
                        begin
                          state <= TX;
                          o_tval <= 1;
                          o_tdata <= local_data[7:0];
                        end
                      else
                        begin
                          state <= TX_CORE;
                          o_tval_core <= 1;
                          o_tdata_core <= local_data[7:0];
                        end
                    end
                  else
                    begin
                      byte_count <= byte_count + 1;
                    end
                end
            end
          RX_CORE:
            begin
              // $display("RX_CORE");
              if (i_xfer_core == 1)
                begin
                  if (byte_count == 7)
                    begin
                      o_rrdy_core <= 0;
                      byte_count <= 0;
                      state <= TX;
                      o_tval <= 1;
                      o_tdata <= local_data[7:0];
                    end
                  else
                    begin
                      byte_count <= byte_count + 1;
                    end
                end
            end
          TX_CORE:
            begin
              // $display("TX_CORE");
              if (o_xfer_core == 1)
                if (byte_count == 7)
                  begin
                    o_tval_core <= 0;
                    byte_count <= 0;
                    state <= RX_CORE;
                    o_rrdy_core <= 1;
                  end
                else
                  begin
                    byte_count <= byte_count + 1;
                    if (byte_count == 0) o_tdata_core <= local_data[15:08];
                    if (byte_count == 1) o_tdata_core <= local_data[23:16];
                    if (byte_count == 2) o_tdata_core <= local_data[31:24];
                    if (byte_count == 3) o_tdata_core <= local_data[39:32];
                    if (byte_count == 4) o_tdata_core <= local_data[47:40];
                    if (byte_count == 5) o_tdata_core <= local_data[55:48];
                    if (byte_count == 6) o_tdata_core <= local_data[63:56];
                  end
            end
          TX:
            begin
              // $display("TX");
              if (o_xfer == 1)
                if (byte_count == 7)
                  begin
                    o_tval <= 0;
                    byte_count <= 0;
                    state <= RX;
                    o_rrdy_inv <= 0;
                  end
                else
                  begin
                    byte_count <= byte_count + 1;
                    if (byte_count == 0) o_tdata <= local_data[15:08];
                    if (byte_count == 1) o_tdata <= local_data[23:16];
                    if (byte_count == 2) o_tdata <= local_data[31:24];
                    if (byte_count == 3) o_tdata <= local_data[39:32];
                    if (byte_count == 4) o_tdata <= local_data[47:40];
                    if (byte_count == 5) o_tdata <= local_data[55:48];
                    if (byte_count == 6) o_tdata <= local_data[63:56];
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
            if (byte_count == 0) local_data[07:00] <= i_rdata;
            if (byte_count == 1) local_data[15:08] <= i_rdata;
            if (byte_count == 2) local_data[23:16] <= i_rdata;
            if (byte_count == 3) local_data[31:24] <= i_rdata;
            if (byte_count == 4) local_data[39:32] <= i_rdata;
            if (byte_count == 5) local_data[47:40] <= i_rdata;
            if (byte_count == 6) local_data[55:48] <= i_rdata;
            if (byte_count == 7) local_data[63:56] <= i_rdata;
          end
        if (i_xfer_core == 1)
          begin
            if (byte_count == 0) local_data[07:00] <= i_rdata_core;
            if (byte_count == 1) local_data[15:08] <= i_rdata_core;
            if (byte_count == 2) local_data[23:16] <= i_rdata_core;
            if (byte_count == 3) local_data[31:24] <= i_rdata_core;
            if (byte_count == 4) local_data[39:32] <= i_rdata_core;
            if (byte_count == 5) local_data[47:40] <= i_rdata_core;
            if (byte_count == 6) local_data[55:48] <= i_rdata_core;
            if (byte_count == 7) local_data[63:56] <= i_rdata_core;
          end
      end
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
