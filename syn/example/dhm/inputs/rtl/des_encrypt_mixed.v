
module des_encrypt_mixed (
        clk,
        reset_n,
        mode_fastclk,

        i_enable,
        i_key,

        i_data,
        i_rval,
        o_rrdy,

        o_data,
        o_tval,
        i_trdy
);

input           clk;
input           reset_n;
input           mode_fastclk;

input           i_enable;
input   [1:64]  i_key;

input   [1:64]  i_data;
input           i_rval;
output          o_rrdy;

output  [1:64]  o_data;
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
reg     [1:128] kdin;           // key[1:64] -> { key[1:56], 8'h00 }, data[65:128]
reg             ein;
reg     [3:0]   round;

reg     [1:128] kdin_tmp_00;
reg     [1:128] kdin_tmp_01;
reg     [1:128] kdin_tmp_02;
reg     [1:128] kdin_tmp_03;
reg     [1:128] kdin_tmp_04;
reg     [1:128] kdin_tmp_05;
reg     [1:128] kdin_tmp_06;
reg     [1:128] kdin_tmp_07;
reg     [1:128] kdin_tmp_08;
reg     [1:128] kdin_tmp_09;
reg     [1:128] kdin_tmp_10;
reg     [1:128] kdin_tmp_11;
reg     [1:128] kdin_tmp_12;
reg     [1:128] kdin_tmp_13;
reg     [1:128] kdin_tmp_14;
reg     [1:128] kdin_tmp_15;

parameter
        WAITING_ON_INPUT  = 3'b000,
        DO_IPERM          = 3'b001,
        DO_ROUNDS         = 3'b010,
        DO_OPERM          = 3'b011,
        WAITING_ON_OUTPUT = 3'b100;

reg     [2:0]   state;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

`include "des_functions.vh"

assign  o_rrdy = ~o_rrdy_inv;

assign  i_xfer = i_rval & o_rrdy;
assign  o_xfer = o_tval & i_trdy;

assign  o_data = kdin[65:128];

////////////////////////////////////////////////////////////////////////////////

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        state  <= WAITING_ON_INPUT;
        o_rrdy_inv <= 0;
        o_tval <= 0;
        round  <= 0;
      end
    else
      begin
        case (state)
          WAITING_ON_INPUT:
            begin
              if (i_xfer == 1)
                begin
                  state  <= DO_IPERM;
                  o_rrdy_inv <= 1;
                end
            end
          DO_IPERM:
            begin
              state <= DO_ROUNDS;
              round <= 0;
            end
          DO_ROUNDS:
            begin
              if (mode_fastclk)
                begin
                  //!!! EDIT LIMIT
                  if (round == 15)
                    begin
                      state <= DO_OPERM;
                    end
                  else
                    begin
                      //!!! EDIT INC
                      round <= round + 1;
                    end
                end
              else
                begin
                  //!!! EDIT LIMIT
                  if (round == 12)
                    begin
                      state <= DO_OPERM;
                    end
                  else
                    begin
                      //!!! EDIT INC
                      round <= round + 4;
                    end
                end
            end
          DO_OPERM:
            begin
              state  <= WAITING_ON_OUTPUT;
              o_tval <= 1;
            end
          WAITING_ON_OUTPUT:
            begin
              if (o_xfer == 1)
                begin
                  state <= WAITING_ON_INPUT;
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
        ein <= 0;
      end
    else
      begin
        if (i_xfer == 1)
          begin
            ein <= i_enable;
          end
      end
  end

always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      begin
        kdin <= 0;
      end
    else
      begin
        if (i_xfer == 1)
          begin
            kdin[1:128] <= { i_key[1:64], i_data[1:64] } ;
          end
        else
          begin
            if (ein == 1)
              begin
                if (state == DO_IPERM)
                  begin
                    kdin[1:128] <= { key_permutation(kdin[1:64]), initial_permutation(kdin[65:128]) };
                  end
                else if (state == DO_ROUNDS)
                  begin

                    kdin_tmp_00[1:128] = encrypt(kdin[1:64],        kdin[65:128],        (round +  0));
                    kdin_tmp_01[1:128] = encrypt(kdin_tmp_00[1:64], kdin_tmp_00[65:128], (round +  1));
                    kdin_tmp_02[1:128] = encrypt(kdin_tmp_01[1:64], kdin_tmp_01[65:128], (round +  2));
                    kdin_tmp_03[1:128] = encrypt(kdin_tmp_02[1:64], kdin_tmp_02[65:128], (round +  3));
                    kdin_tmp_04[1:128] = encrypt(kdin_tmp_03[1:64], kdin_tmp_03[65:128], (round +  4));
                    kdin_tmp_05[1:128] = encrypt(kdin_tmp_04[1:64], kdin_tmp_04[65:128], (round +  5));
                    kdin_tmp_06[1:128] = encrypt(kdin_tmp_05[1:64], kdin_tmp_05[65:128], (round +  6));
                    kdin_tmp_07[1:128] = encrypt(kdin_tmp_06[1:64], kdin_tmp_06[65:128], (round +  7));
                    kdin_tmp_08[1:128] = encrypt(kdin_tmp_07[1:64], kdin_tmp_07[65:128], (round +  8));
                    kdin_tmp_09[1:128] = encrypt(kdin_tmp_08[1:64], kdin_tmp_08[65:128], (round +  9));
                    kdin_tmp_10[1:128] = encrypt(kdin_tmp_09[1:64], kdin_tmp_09[65:128], (round + 10));
                    kdin_tmp_11[1:128] = encrypt(kdin_tmp_10[1:64], kdin_tmp_10[65:128], (round + 11));
                    kdin_tmp_12[1:128] = encrypt(kdin_tmp_11[1:64], kdin_tmp_11[65:128], (round + 12));
                    kdin_tmp_13[1:128] = encrypt(kdin_tmp_12[1:64], kdin_tmp_12[65:128], (round + 13));
                    kdin_tmp_14[1:128] = encrypt(kdin_tmp_13[1:64], kdin_tmp_13[65:128], (round + 14));
                    kdin_tmp_15[1:128] = encrypt(kdin_tmp_14[1:64], kdin_tmp_14[65:128], (round + 15));

                    if (mode_fastclk)
                      begin
                        //!!! EDIT ASSIGN
                        kdin[1:128] <= kdin_tmp_00[1:128];
                      end
                    else
                      begin
                        //!!! EDIT ASSIGN
                        kdin[1:128] <= kdin_tmp_03[1:128];
                      end

                  end
                else if (state == DO_OPERM)
                  begin
                    kdin[1:128] <= { kdin[1:64], lr_swap_and_final_permutation(kdin[65:128]) };
                  end
              end
          end
      end
  end

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
