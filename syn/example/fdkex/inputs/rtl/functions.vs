///=====================================================================================================================
///
/// functions.vs
///
/// Primary Contact   : 
/// Secondary Contact : 
/// Unit Owner        : 
///
/// Original Author   : Jina Kim
/// Original Date     : 14 September 2009
///
/// Copyright (c) 2009 Intel Corporation
/// Intel Proprietary
///
/// This file declares functions.
///
///=====================================================================================================================

///=====================================================================================================================
///                              Functions for Hamming Encoding
///=====================================================================================================================
// Insert '0' at each Hamming code location

// For 64-bit data.
function [63+7:0] sec_encode_64;
	input [63:0] din;
	begin
		sec_encode_64 = {din[63:57],1'b0, din[56:26],1'b0, din[25:11],1'b0, din[10:4],1'b0, din[3:1],1'b0, din[0],2'b00};
	end
endfunction	// function sec_encode_64

// For 128-bit data
function [127+8:0] sec_encode_128;	
	input [127:0] din;
	begin
		sec_encode_128 = {din[127:120],1'b0, din[119:57],1'b0, din[56:26],1'b0, din[25:11],1'b0, din[10:4],1'b0, din[3:1],1'b0, din[0],2'b00};
	end
endfunction	// function sec_encode_128

// For 256-bit data
function [255+9:0] sec_encode_256;	
	input [255:0] din;
	begin
		sec_encode_256 = { din[255:247],1'b0, din[246:128], sec_encode_128(din[127:0]) };
	end
endfunction	// function sec_encode_256

///=====================================================================================================================
///                              Functions for Hamming Decoding
///=====================================================================================================================
// Extract information bits from Hamming-encoded data

// For 64-bit data
function [63:0] sec_decode_64;	
	input [63+7:0] din;
	begin
		sec_decode_64 = {din[63+7:64], din[62:32], din[30:16], din[14:8], din[6:4], din[2]};
	end
endfunction	// function sec_decode_64

// For 128-bit data
function [127:0] sec_decode_128;	
	input [127+8:0] din;
	begin
		sec_decode_128 = {din[127+8:128], din[126:64], din[62:32], din[30:16], din[14:8], din[6:4], din[2]};
	end
endfunction	// function sec_decode_128

// For 256-bit data
function [255:0] sec_decode_256;	
	input [255+9:0] din;
	begin
		sec_decode_256 = { din[255+9:256], din[254:128+8], sec_decode_128(din[127+8:0]) };
	end
endfunction	// function sec_decode_256

///=====================================================================================================================
///                              Functions for Arithmetic Operations
///=====================================================================================================================

///=====================================================================================================================
///                              Two's Complement for Input Data
///=====================================================================================================================

// Calculates 2's complement for input data
function [width_data-1:0] complement;		
	input [width_data-1:0] din;
	reg tmp;
	reg [width_data-1:0] tmp_out;
	reg [7:0] i;
	
	begin
		tmp = 1'b0;
		tmp_out[0] = din[0];
		for (i=1; i<width_data; i=i+1) begin
			tmp = tmp | din[i-1];
			tmp_out[i] = tmp ^ din[i];
		end
		complement = tmp_out; 
	end
endfunction	// function complement

///=====================================================================================================================
///                              Two's Complement for ALU Output Data
///=====================================================================================================================

// Calculates 2's complement for ALU output data
function [width_data_alu-1:0] complement2;		
	input [width_data_alu-1:0] din;
	reg tmp;
	reg [width_data_alu-1:0] tmp_out;
	reg [8:0] i;

	begin
		tmp = 1'b0;
		tmp_out[0] = din[0];
		for (i=1; i<width_data_alu; i=i+1) begin
			tmp = tmp | din[i-1];
			tmp_out[i] = tmp ^ din[i];
		end
		complement2 = tmp_out; 
	end
endfunction	// function complement2

///=====================================================================================================================
///                              Absolute Value Calculation
///=====================================================================================================================

// Calculates absolute value.  Checks the sign bit, and perform 2's complement when din is a negative number.
function [width_data-1:0] absolute;
	input [width_data-1:0] din;

	begin
		if (din[width_data-1]) begin
			absolute = complement(din);
		end else begin
			absolute = din;
		end
	end
endfunction	// function absolute

///=====================================================================================================================
///                              Subtraction
///=====================================================================================================================

function [width_data:0] subtract;
	input [width_data-1:0] din0;
	input [width_data-1:0] din1;

	begin
		subtract = {din0[width_data-1],din0} - {din1[width_data-1],din1};
	end
endfunction	// function subtract
