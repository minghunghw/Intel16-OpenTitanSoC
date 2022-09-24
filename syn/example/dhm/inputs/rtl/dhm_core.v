
module dhm_core (
        clk,
        reset_n,
        scan_mode,

        pd_reset_n,
        rreg_save,
        rreg_save_n,
        rreg_restore,
        rreg_restore_n,
        sleep,
        sleep_n,
        sleep_ack,

        key_de,
        enable_de,
        key_dd,
        enable_dd,
        mode_fastclk,

        i_rdata,
        i_rval,
        o_rrdy,

        o_tdata,
        o_tval,
        i_trdy
);

input           clk;
input           reset_n;
input           scan_mode;

input           pd_reset_n;
input           rreg_save;
input           rreg_save_n;
input           rreg_restore;
input           rreg_restore_n;
input           sleep;
input           sleep_n;
output          sleep_ack;

input   [63:0]  key_de;
input           enable_de;
input   [63:0]  key_dd;
input           enable_dd;
input           mode_fastclk;

input   [7:0]   i_rdata;
input           i_rval;
output          o_rrdy;

output  [7:0]   o_tdata;
output          o_tval;
input           i_trdy;

////////////////////////////////////////////////////////////////////////////////
// parameters
////////////////////////////////////////////////////////////////////////////////

parameter STAGES = 1;
parameter INCLUDE_RAM = 0;

////////////////////////////////////////////////////////////////////////////////
// resources
////////////////////////////////////////////////////////////////////////////////

genvar i;

typedef logic [63:0] xdt;

xdt            x_data  [(2*STAGES):0];
wire           x_val   [(2*STAGES):0];
wire           x_rdy   [(2*STAGES):0];

wire   [7:0]   a_data;
wire           a_val;
wire           a_rdy;

wire   [7:0]   b_data;
wire           b_val;
wire           b_rdy;

wire   [7:0]   c_data;
wire           c_val;
wire           c_rdy;

convert_8_64 u_convert_8_64 (
  .clk(clk), .reset_n(pd_reset_n),
  .i_data(i_rdata), .i_rval(i_rval), .o_rrdy(o_rrdy),
  .o_data(x_data[0]), .o_tval(x_val[0]), .i_trdy(x_rdy[0]) );

////////////////////////////////////////

generate

  for ( i=0; i<STAGES; i++ ) begin: pair

    des_encrypt_mixed u_des_encrypt_mixed (
      .clk(clk), .reset_n(pd_reset_n), .mode_fastclk(mode_fastclk),
      .i_enable(enable_de), .i_key(key_de),
      .i_data(x_data[2*i+0]), .i_rval(x_val[2*i+0]), .o_rrdy(x_rdy[2*i+0]),
      .o_data(x_data[2*i+1]), .o_tval(x_val[2*i+1]), .i_trdy(x_rdy[2*i+1]) );

    des_decrypt_mixed u_des_decrypt_mixed (
      .clk(clk), .reset_n(pd_reset_n), .mode_fastclk(mode_fastclk),
      .i_enable(enable_dd), .i_key(key_dd),
      .i_data(x_data[2*i+1]), .i_rval(x_val[2*i+1]), .o_rrdy(x_rdy[2*i+1]),
      .o_data(x_data[2*i+2] ),.o_tval(x_val[2*i+2]), .i_trdy(x_rdy[2*i+2]) );

  end

endgenerate

////////////////////////////////////////

convert_64_8 u_convert_64_8 (
  .clk(clk), .reset_n(pd_reset_n),
  .i_data(x_data[2*STAGES]), .i_rval(x_val[2*STAGES]), .o_rrdy(x_rdy[2*STAGES]),
  .o_data(a_data), .o_tval(a_val), .i_trdy(a_rdy) );

////////////////////////////////////////

generate

  if ( INCLUDE_RAM != 0 )

    begin: with_ram

      mem_1kx8 u_mem_1kx8 (
        .clk(clk), .reset_n(pd_reset_n), .scan_mode(scan_mode),
        .i_data(a_data), .i_rval(a_val), .o_rrdy(a_rdy),
        .o_data(b_data), .o_tval(b_val), .i_trdy(b_rdy) );

      convert_8_8 u_convert_8_8 (
        .clk(clk), .reset_n(pd_reset_n),
        .i_data(b_data), .i_rval(b_val), .o_rrdy(b_rdy),
        .o_data(o_tdata), .o_tval(o_tval), .i_trdy(i_trdy) );

    end

  else

    begin: without_ram

      convert_8_8 u_convert_8_8 (
        .clk(clk), .reset_n(pd_reset_n),
        .i_data(a_data), .i_rval(a_val), .o_rrdy(a_rdy),
        .o_data(o_tdata), .o_tval(o_tval), .i_trdy(i_trdy) );

    end

endgenerate

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
