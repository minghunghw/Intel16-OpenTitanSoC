
////////////////////////////////////////////////////////////////////////////////

function [1:64] key_permutation;
input   [1:64]  i;

reg     [1:64]  o;

  begin

    //
    // Table 12.2, Key Permutation (checked)
    //

    o[1:64] = {
      i[57], i[49], i[41], i[33], i[25], i[17], i[ 9], i[ 1], i[58], i[50], i[42], i[34], i[26], i[18],
      i[10], i[ 2], i[59], i[51], i[43], i[35], i[27], i[19], i[11], i[ 3], i[60], i[52], i[44], i[36],
      i[63], i[55], i[47], i[39], i[31], i[23], i[15], i[ 7], i[62], i[54], i[46], i[38], i[30], i[22],
      i[14], i[ 6], i[61], i[53], i[45], i[37], i[29], i[21], i[13], i[ 5], i[28], i[20], i[12], i[ 4],
      8'h00
      };

    key_permutation[1:64] = o[1:64];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [1:64] initial_permutation;
input   [1:64]  i;

reg     [1:64]  o;

  begin

    //
    // Table 12.1, Initial Permutation (checked)
    //

    o[1:64] = {
      i[58], i[50], i[42], i[34], i[26], i[18], i[10], i[ 2], i[60], i[52], i[44], i[36], i[28], i[20], i[12], i[ 4],
      i[62], i[54], i[46], i[38], i[30], i[22], i[14], i[ 6], i[64], i[56], i[48], i[40], i[32], i[24], i[16], i[ 8],
      i[57], i[49], i[41], i[33], i[25], i[17], i[ 9], i[ 1], i[59], i[51], i[43], i[35], i[27], i[19], i[11], i[ 3],
      i[61], i[53], i[45], i[37], i[29], i[21], i[13], i[ 5], i[63], i[55], i[47], i[39], i[31], i[23], i[15], i[ 7]
      };

    initial_permutation[1:64] = o[1:64];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [1:64] lr_swap_and_final_permutation;
input   [1:64]  i;

reg     [1:64]  o;

  begin

    //
    // Swap left and right halves of final round
    //

    o[1:64] = { i[33:64], i[1:32] };

    //
    // Table 12.8, Final Permutation (checked)
    //

    o[1:64] = {
      o[40], o[ 8], o[48], o[16], o[56], o[24], o[64], o[32], o[39], o[ 7], o[47], o[15], o[55], o[23], o[63], o[31],
      o[38], o[ 6], o[46], o[14], o[54], o[22], o[62], o[30], o[37], o[ 5], o[45], o[13], o[53], o[21], o[61], o[29],
      o[36], o[ 4], o[44], o[12], o[52], o[20], o[60], o[28], o[35], o[ 3], o[43], o[11], o[51], o[19], o[59], o[27],
      o[34], o[ 2], o[42], o[10], o[50], o[18], o[58], o[26], o[33], o[ 1], o[41], o[ 9], o[49], o[17], o[57], o[25]
      };

    lr_swap_and_final_permutation[1:64] = o[1:64];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [1:48] compression_permutation;
input   [1:56]  i;

reg     [1:48]  o;

  begin

    //
    // Table 12.4, Compression Permutation (checked)
    //

    o[1:48] = {
      i[14], i[17], i[11], i[24], i[ 1], i[ 5], i[ 3], i[28], i[15], i[ 6], i[21], i[10],
      i[23], i[19], i[12], i[ 4], i[26], i[ 8], i[16], i[ 7], i[27], i[20], i[13], i[ 2],
      i[41], i[52], i[31], i[37], i[47], i[55], i[30], i[40], i[51], i[45], i[33], i[48],
      i[44], i[49], i[39], i[56], i[34], i[53], i[46], i[42], i[50], i[36], i[29], i[32]
      };

    compression_permutation[1:48] = o[1:48];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [1:48] expansion_permutation;
input   [1:32]  i;

reg     [1:48]  o;

  begin

    //
    // Table 12.5, Expansion Permutation (checked)
    //

    o[1:48] = {
      i[32], i[ 1], i[ 2], i[ 3], i[ 4], i[ 5], i[ 4], i[ 5], i[ 6], i[ 7], i[ 8], i[ 9],
      i[ 8], i[ 9], i[10], i[11], i[12], i[13], i[12], i[13], i[14], i[15], i[16], i[17],
      i[16], i[17], i[18], i[19], i[20], i[21], i[20], i[21], i[22], i[23], i[24], i[25],
      i[24], i[25], i[26], i[27], i[28], i[29], i[28], i[29], i[30], i[31], i[32], i[ 1]
      };

    expansion_permutation[1:48] = o[1:48];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [1:32] pbox_permutation;
input   [1:32]  i;

reg     [1:32]  o;

  begin

    //
    // Table 12.7, P-Box Permutation (checked)
    //

    o[1:32] = {
      i[16], i[ 7], i[20], i[21], i[29], i[12], i[28], i[17],
      i[ 1], i[15], i[23], i[26], i[ 5], i[18], i[31], i[10],
      i[ 2], i[ 8], i[24], i[14], i[32], i[27], i[ 3], i[ 9],
      i[19], i[13], i[30], i[ 6], i[22], i[11], i[ 4], i[25]
      };

    pbox_permutation[1:32] = o[1:32];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [3:0] sbox_lookup;
input   [63:0]  r0;
input   [63:0]  r1;
input   [63:0]  r2;
input   [63:0]  r3;
input   [1:6]   addr;

reg     [1:0]   row_addr;
reg     [3:0]   col_addr;
reg     [63:0]  row;

  begin

    row_addr = { addr[1], addr[6] };
    col_addr = addr[2:5];

    case (row_addr)
      2'd0: row = r0;
      2'd1: row = r1;
      2'd2: row = r2;
      2'd3: row = r3;
    endcase

    case (col_addr)
      4'h0: sbox_lookup = row[63:60];
      4'h1: sbox_lookup = row[59:56];
      4'h2: sbox_lookup = row[55:52];
      4'h3: sbox_lookup = row[51:48];
      4'h4: sbox_lookup = row[47:44];
      4'h5: sbox_lookup = row[43:40];
      4'h6: sbox_lookup = row[39:36];
      4'h7: sbox_lookup = row[35:32];
      4'h8: sbox_lookup = row[31:28];
      4'h9: sbox_lookup = row[27:24];
      4'ha: sbox_lookup = row[23:20];
      4'hb: sbox_lookup = row[19:16];
      4'hc: sbox_lookup = row[15:12];
      4'hd: sbox_lookup = row[11:08];
      4'he: sbox_lookup = row[07:04];
      4'hf: sbox_lookup = row[03:00];
    endcase

  end
endfunction

////////////////////////////////////////////////////////////////////////////////

function [1:32] sbox_substitution;
input   [1:48]  i;

reg     [1:32]  o;

reg     [63:0]  sbox1_0, sbox1_1, sbox1_2, sbox1_3, sbox1_row;
reg     [63:0]  sbox2_0, sbox2_1, sbox2_2, sbox2_3, sbox2_row;
reg     [63:0]  sbox3_0, sbox3_1, sbox3_2, sbox3_3, sbox3_row;
reg     [63:0]  sbox4_0, sbox4_1, sbox4_2, sbox4_3, sbox4_row;
reg     [63:0]  sbox5_0, sbox5_1, sbox5_2, sbox5_3, sbox5_row;
reg     [63:0]  sbox6_0, sbox6_1, sbox6_2, sbox6_3, sbox6_row;
reg     [63:0]  sbox7_0, sbox7_1, sbox7_2, sbox7_3, sbox7_row;
reg     [63:0]  sbox8_0, sbox8_1, sbox8_2, sbox8_3, sbox8_row;

  begin

    sbox1_0 = 64'he_4_d_1_2_f_b_8_3_a_6_c_5_9_0_7;
    sbox1_1 = 64'h0_f_7_4_e_2_d_1_a_6_c_b_9_5_3_8;
    sbox1_2 = 64'h4_1_e_8_d_6_2_b_f_c_9_7_3_a_5_0;
    sbox1_3 = 64'hf_c_8_2_4_9_1_7_5_b_3_e_a_0_6_d;

    sbox2_0 = 64'hf_1_8_e_6_b_3_4_9_7_2_d_c_0_5_a;
    sbox2_1 = 64'h3_d_4_7_f_2_8_e_c_0_1_a_6_9_b_5;
    sbox2_2 = 64'h0_e_7_b_a_4_d_1_5_8_c_6_9_3_2_f;
    sbox2_3 = 64'hd_8_a_1_3_f_4_2_b_6_7_c_0_5_e_9;

    sbox3_0 = 64'ha_0_9_e_6_3_f_5_1_d_c_7_b_4_2_8;
    sbox3_1 = 64'hd_7_0_9_3_4_6_a_2_8_5_e_c_b_f_1;
    sbox3_2 = 64'hd_6_4_9_8_f_3_0_b_1_2_c_5_a_e_7;
    sbox3_3 = 64'h1_a_d_0_6_9_8_7_4_f_e_3_b_5_2_c;

    sbox4_0 = 64'h7_d_e_3_0_6_9_a_1_2_8_5_b_c_4_f;
    sbox4_1 = 64'hd_8_b_5_6_f_0_3_4_7_2_c_1_a_e_9;
    sbox4_2 = 64'ha_6_9_0_c_b_7_d_f_1_3_e_5_2_8_4;
    sbox4_3 = 64'h3_f_0_6_a_1_d_8_9_4_5_b_c_7_2_e;

    sbox5_0 = 64'h2_c_4_1_7_a_b_6_8_5_3_f_d_0_e_9;
    sbox5_1 = 64'he_b_2_c_4_7_d_1_5_0_f_a_3_9_8_6;
    sbox5_2 = 64'h4_2_1_b_a_d_7_8_f_9_c_5_6_3_0_e;
    sbox5_3 = 64'hb_8_c_7_1_e_2_d_6_f_0_9_a_4_5_3;

    sbox6_0 = 64'hc_1_a_f_9_2_6_8_0_d_3_4_e_7_5_b;
    sbox6_1 = 64'ha_f_4_2_7_c_9_5_6_1_d_e_0_b_3_8;
    sbox6_2 = 64'h9_e_f_5_2_8_c_3_7_0_4_a_1_d_b_6;
    sbox6_3 = 64'h4_3_2_c_9_5_f_a_b_e_1_7_6_0_8_d;

    sbox7_0 = 64'h4_b_2_e_f_0_8_d_3_c_9_7_5_a_6_1;
    sbox7_1 = 64'hd_0_b_7_4_9_1_a_e_3_5_c_2_f_8_6;
    sbox7_2 = 64'h1_4_b_d_c_3_7_e_a_f_6_8_0_5_9_2;
    sbox7_3 = 64'h6_b_d_8_1_4_a_7_9_5_0_f_e_2_3_c;

    sbox8_0 = 64'hd_2_8_4_6_f_b_1_a_9_3_e_5_0_c_7;
    sbox8_1 = 64'h1_f_d_8_a_3_7_4_c_5_6_b_0_e_9_2;
    sbox8_2 = 64'h7_b_4_1_9_c_e_2_0_6_a_d_f_3_5_8;
    sbox8_3 = 64'h2_1_e_7_4_a_8_d_f_c_9_0_3_5_6_b;

    // o[ 1: 4] = sbox_lookup(sbox1_0, sbox1_1, sbox1_2, sbox1_3, i[ 1: 6]);
    // o[ 5: 8] = sbox_lookup(sbox2_0, sbox2_1, sbox2_2, sbox2_3, i[ 7:12]);
    // o[ 9:12] = sbox_lookup(sbox3_0, sbox3_1, sbox3_2, sbox3_3, i[13:18]);
    // o[13:16] = sbox_lookup(sbox4_0, sbox4_1, sbox4_2, sbox4_3, i[19:24]);
    // o[17:20] = sbox_lookup(sbox5_0, sbox5_1, sbox5_2, sbox5_3, i[25:30]);
    // o[21:24] = sbox_lookup(sbox6_0, sbox6_1, sbox6_2, sbox6_3, i[31:36]);
    // o[25:28] = sbox_lookup(sbox7_0, sbox7_1, sbox7_2, sbox7_3, i[37:42]);
    // o[29:32] = sbox_lookup(sbox8_0, sbox8_1, sbox8_2, sbox8_3, i[43:48]);
    //
    // sbox_substitution[1:32] = o[1:32];

    sbox_substitution[1:32] = {
      sbox_lookup(sbox1_0, sbox1_1, sbox1_2, sbox1_3, i[ 1: 6]),
      sbox_lookup(sbox2_0, sbox2_1, sbox2_2, sbox2_3, i[ 7:12]),
      sbox_lookup(sbox3_0, sbox3_1, sbox3_2, sbox3_3, i[13:18]),
      sbox_lookup(sbox4_0, sbox4_1, sbox4_2, sbox4_3, i[19:24]),
      sbox_lookup(sbox5_0, sbox5_1, sbox5_2, sbox5_3, i[25:30]),
      sbox_lookup(sbox6_0, sbox6_1, sbox6_2, sbox6_3, i[31:36]),
      sbox_lookup(sbox7_0, sbox7_1, sbox7_2, sbox7_3, i[37:42]),
      sbox_lookup(sbox8_0, sbox8_1, sbox8_2, sbox8_3, i[43:48])
    };


  end
endfunction

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

function [1:128] encrypt;
input   [1:64]  key_in;
input   [1:64]  data_in;
input   [3:0]   round;

reg     [1:32]  l;              // left half of data_in
reg     [1:32]  r;              // right half of data_in
reg     [1:48]  e;              // expansion permutation of r
reg     [1:48]  x;              // e xor k
reg     [1:32]  s;              // s-box substitution of x
reg     [1:32]  p;              // p-box permutation of s

reg     [1:28]  kl;             // left half of key_in
reg     [1:28]  kr;             // right half of key_in
reg     [1:56]  ks;             // shifted halfs of key_in
reg     [1:48]  k;              // compression permutation of ks

reg     [1:64]  key_out;
reg     [1:64]  data_out;
reg     [1:128] key_data_out;

  begin

    ////////////////////////////////////////////////////////////////////////////////
    // process key
    ////////////////////////////////////////////////////////////////////////////////

    //
    // split into left half and right half
    //

    kl[1:28] = key_in[ 1:28];
    kr[1:28] = key_in[29:56];

    //
    // Table 12.3, Number of Key Bits Shifted per Round (checked)
    //

    if (round == 4'b0000)
      begin
        // ks[ 1:28] = { kl[2:28], kl[1]   }; // left shift 1
        // ks[29:56] = { kr[2:28], kr[1]   }; // left shift 1
        ks[ 1:56] = { kl[2:28], kl[1], kr[2:28], kr[1] };
      end
    else if ( (round == 4'b0001) || (round == 4'b1000) || (round == 4'b1111) )
      begin
        // ks[ 1:28] = { kl[2:28], kl[1]   }; // left shift 1
        // ks[29:56] = { kr[2:28], kr[1]   }; // left shift 1
        ks[ 1:56] = { kl[2:28], kl[1], kr[2:28], kr[1] };
      end
    else
      begin
        // ks[ 1:28] = { kl[3:28], kl[1:2] }; // left shift 2
        // ks[29:56] = { kr[3:28], kr[1:2] }; // left shift 2
        ks[ 1:56] = { kl[3:28], kl[1:2], kr[3:28], kr[1:2] };
      end

    //
    // Compression Permutation
    //

    k[1:48] = compression_permutation(ks[1:56]);

    //
    // create key_out
    //

    key_out[1:64] = { ks[1:56], 8'h00 };

    ////////////////////////////////////////////////////////////////////////////////
    // process data
    ////////////////////////////////////////////////////////////////////////////////

    //
    // split into left half and right half
    //

    l[1:32] = data_in[ 1:32];
    r[1:32] = data_in[33:64];

    //
    // Expansion Permutation
    //

    e[1:48] = expansion_permutation(r[1:32]);

    //
    // xor with key
    //

    x[1:48] = e[1:48] ^ k[1:48];

    //
    // S-Box Substitution
    //

    s[1:32] = sbox_substitution(x[1:48]);

    //
    // P-Box Permutation
    //

    p[1:32] = pbox_permutation(s[1:32]);

    //
    // create data_out
    //

    // data_out[ 1:32] = r[1:32];           // left half
    // data_out[33:64] = l[1:32] ^ p[1:32]; // right half
    data_out[ 1:64] = { r[1:32], ( l[1:32] ^ p[1:32] ) };

    //
    // create key_data_out
    //

    key_data_out[1:128] = { key_out[1:64], data_out[1:64] };

    encrypt[1:128] = key_data_out[1:128];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

function [1:128] decrypt;
input   [1:64]  key_in;
input   [1:64]  data_in;
input   [3:0]   round;

reg     [1:32]  l;              // left half of data_in
reg     [1:32]  r;              // right half of data_in
reg     [1:48]  e;              // expansion permutation of r
reg     [1:48]  x;              // e xor k
reg     [1:32]  s;              // s-box substitution of x
reg     [1:32]  p;              // p-box permutation of s

reg     [1:28]  kl;             // left half of key_in
reg     [1:28]  kr;             // right half of key_in
reg     [1:56]  ks;             // shifted halfs of key_in
reg     [1:48]  k;              // compression permutation of ks

reg     [1:64]  key_out;
reg     [1:64]  data_out;
reg     [1:128] key_data_out;

  begin

    ////////////////////////////////////////////////////////////////////////////////
    // process key
    ////////////////////////////////////////////////////////////////////////////////

    //
    // split into left half and right half
    //

    kl[1:28] = key_in[ 1:28];
    kr[1:28] = key_in[29:56];

    //
    // Table 12.3, Number of Key Bits Shifted per Round (checked)
    //

    if (round == 4'b0000)
      begin
        // ks[ 1:28] = { kl[1:28]            }; // right shift 0
        // ks[29:56] = { kr[1:28]            }; // right shift 0
        ks[ 1:56] = { kl[1:28], kr[1:28] };
      end
    else if ( (round == 4'b0001) || (round == 4'b1000) || (round == 4'b1111) )
      begin
        // ks[ 1:28] = { kl[28],    kl[1:27] }; // right shift 1
        // ks[29:56] = { kr[28],    kr[1:27] }; // right shift 1
        ks[ 1:56] = { kl[28], kl[1:27], kr[28], kr[1:27] };
      end
    else
      begin
        // ks[ 1:28] = { kl[27:28], kl[1:26] }; // right shift 2
        // ks[29:56] = { kr[27:28], kr[1:26] }; // right shift 2
        ks[ 1:56] = { kl[27:28], kl[1:26], kr[27:28], kr[1:26] };
      end

    //
    // Compression Permutation
    //

    k[1:48] = compression_permutation(ks[1:56]);

    //
    // create key_out
    //

    key_out[1:64] = { ks[1:56], 8'h00 };

    ////////////////////////////////////////////////////////////////////////////////
    // process data
    ////////////////////////////////////////////////////////////////////////////////

    //
    // split into left half and right half
    //

    l[1:32] = data_in[ 1:32];
    r[1:32] = data_in[33:64];

    //
    // Expansion Permutation
    //

    e[1:48] = expansion_permutation(r[1:32]);

    //
    // xor with key
    //

    x[1:48] = e[1:48] ^ k[1:48];

    //
    // S-Box Substitution
    //

    s[1:32] = sbox_substitution(x[1:48]);

    //
    // P-Box Permutation
    //

    p[1:32] = pbox_permutation(s[1:32]);

    //
    // create data_out
    //

    // data_out[ 1:32] = r[1:32];           // left half
    // data_out[33:64] = l[1:32] ^ p[1:32]; // right half
    data_out[ 1:64] = { r[1:32], ( l[1:32] ^ p[1:32] ) };

    //
    // create key_data_out
    //

    key_data_out[1:128] = { key_out[1:64], data_out[1:64] };

    decrypt[1:128] = key_data_out[1:128];

  end
endfunction

////////////////////////////////////////////////////////////////////////////////
// ror
////////////////////////////////////////////////////////////////////////////////

function [63:0] ror;
input   [63:0]  si;
input   [5:0]   i;
reg     [63:0]  o;

  begin

    case (i)
       0: o = si;
       1: o = { si[ 0]   , si[63: 1] };

       2: o = { si[ 1: 0], si[63: 2] };
       3: o = { si[ 2: 0], si[63: 3] };
       4: o = { si[ 3: 0], si[63: 4] };
       5: o = { si[ 4: 0], si[63: 5] };
       6: o = { si[ 5: 0], si[63: 6] };
       7: o = { si[ 6: 0], si[63: 7] };
       8: o = { si[ 7: 0], si[63: 8] };
       9: o = { si[ 8: 0], si[63: 9] };
      10: o = { si[ 9: 0], si[63:10] };
      11: o = { si[10: 0], si[63:11] };
      12: o = { si[11: 0], si[63:12] };
      13: o = { si[12: 0], si[63:13] };
      14: o = { si[13: 0], si[63:14] };
      15: o = { si[14: 0], si[63:15] };
      16: o = { si[15: 0], si[63:16] };
      17: o = { si[16: 0], si[63:17] };
      18: o = { si[17: 0], si[63:18] };
      19: o = { si[18: 0], si[63:19] };
      20: o = { si[19: 0], si[63:20] };
      21: o = { si[20: 0], si[63:21] };
      22: o = { si[21: 0], si[63:22] };
      23: o = { si[22: 0], si[63:23] };
      24: o = { si[23: 0], si[63:24] };
      25: o = { si[24: 0], si[63:25] };
      26: o = { si[25: 0], si[63:26] };
      27: o = { si[26: 0], si[63:27] };
      28: o = { si[27: 0], si[63:28] };
      29: o = { si[28: 0], si[63:29] };
      30: o = { si[29: 0], si[63:30] };
      31: o = { si[30: 0], si[63:31] };
      32: o = { si[31: 0], si[63:32] };
      33: o = { si[32: 0], si[63:33] };
      34: o = { si[33: 0], si[63:34] };
      35: o = { si[34: 0], si[63:35] };
      36: o = { si[35: 0], si[63:36] };
      37: o = { si[36: 0], si[63:37] };
      38: o = { si[37: 0], si[63:38] };
      39: o = { si[38: 0], si[63:39] };
      40: o = { si[39: 0], si[63:40] };
      41: o = { si[40: 0], si[63:41] };
      42: o = { si[41: 0], si[63:42] };
      43: o = { si[42: 0], si[63:43] };
      44: o = { si[43: 0], si[63:44] };
      45: o = { si[44: 0], si[63:45] };
      46: o = { si[45: 0], si[63:46] };
      47: o = { si[46: 0], si[63:47] };
      48: o = { si[47: 0], si[63:48] };
      49: o = { si[48: 0], si[63:49] };
      50: o = { si[49: 0], si[63:50] };
      51: o = { si[50: 0], si[63:51] };
      52: o = { si[51: 0], si[63:52] };
      53: o = { si[52: 0], si[63:53] };
      54: o = { si[53: 0], si[63:54] };
      55: o = { si[54: 0], si[63:55] };
      56: o = { si[55: 0], si[63:56] };
      57: o = { si[56: 0], si[63:57] };
      58: o = { si[57: 0], si[63:58] };
      59: o = { si[58: 0], si[63:59] };
      60: o = { si[59: 0], si[63:60] };
      61: o = { si[60: 0], si[63:61] };
      62: o = { si[61: 0], si[63:62] };

      63: o = { si[62: 0], si[63] };
    endcase

    ror = o;

  end
endfunction

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
