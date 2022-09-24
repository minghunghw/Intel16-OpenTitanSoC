///=====================================================================================================================
///
/// init_mask_alu.vs
///
/// Primary Contact   : 
/// Secondary Contact : 
/// Unit Owner        : 
///
/// Original Author   : Jina Kim
/// Original Date     : 14 September 2009
/// Last Modified     : 18 January 2010
///
/// Copyright (c) 2009 Intel Corporation
/// Intel Proprietary
///
/// This block implements the mask initialization for ALU output data Hamming code generation.
///
///=====================================================================================================================

///=====================================================================================================================
///                              init_mask_alu Module Instantiation
///=====================================================================================================================

module init_mask_alu (rstb, clk, en_init, mask);

///=====================================================================================================================
///                              Global Parameters and Functions
///=====================================================================================================================

	`include "parameters.vs"
	`include "functions.vs"
	
///=====================================================================================================================
///                              init_mask_alu IO Declarations
///=====================================================================================================================

	input  rstb;
	input  clk;
	input  en_init;
	output logic [width_data-1:0] mask [0:width_sec-1];

///=====================================================================================================================
///                              init_mask_alu Internal Signal Declarations
///=====================================================================================================================

	logic [width_seed0-1:0] seed0;
	logic [width_seed1-1:0] seed1;
	logic [width_seed2-1:0] seed2;
	logic [width_seed3-1:0] seed3;
	logic [width_seed4-1:0] seed4;
	logic [width_seed5-1:0] seed5;
	logic [width_seed6-1:0] seed6;
	logic [width_seed7-1:0] seed7;
	
///=====================================================================================================================
///                              Main init_mask_alu Logic
///=====================================================================================================================

///=====================================================================================================================
///                              Mask Initialization for Each Bit of Hamming Code
///=====================================================================================================================
		
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit0
		if (!rstb) begin
	  		seed0 <= {width_seed0{1'b0}};
	  		mask[0] <= {width_data{1'b0}};
	  	end else begin	
	  		if (en_init) begin
				seed0 <= {replicate_seed0{ 2'b01 }};
				mask[0] <= sec_decode_128(seed0[width_data_sec-1:0]);
			end
		end
	end 
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit1
		if (!rstb) begin
	  		seed1 <= {width_seed1{1'b0}};
	  		mask[1] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed1 <= {replicate_seed1{ 4'b0110 }};
				mask[1] <= sec_decode_128(seed1[width_data_sec-1:0]);
			end
		end
	end
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit2
		if (!rstb) begin
	  		seed2 <= {width_seed2{1'b0}};
	  		mask[2] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed2 <= {replicate_seed2{ ({4'b1,4'b0}>>1) }};
				mask[2] <= sec_decode_128(seed2[width_data_sec-1:0]);
			end
		end
	end
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit3
		if (!rstb) begin
	  		seed3 <= {width_seed3{1'b0}};
	  		mask[3] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed3 <= {replicate_seed3{ ({8'b1,8'b0}>>1) }};
				mask[3] <= sec_decode_128(seed3[width_data_sec-1:0]);
			end
		end
	end
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit4
		if (!rstb) begin
	  		seed4 <= {width_seed4{1'b0}};
	  		mask[4] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed4 <= {replicate_seed4{ ({16'b1,16'b0}>>1) }};
				mask[4] <= sec_decode_128(seed4[width_data_sec-1:0]);
			end
		end
	end
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit5
		if (!rstb) begin
	  		seed5 <= {width_seed5{1'b0}};
	  		mask[5] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed5 <= {replicate_seed5{ ({32'b1,32'b0}>>1) }};
				mask[5] <= sec_decode_128(seed5[width_data_sec-1:0]);
			end
		end
	end
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit6
		if (!rstb) begin
	  		seed6 <= {width_seed6{1'b0}};
	  		mask[6] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed6 <= {replicate_seed6{ ({64'b1,64'b0}>>1) }};
				mask[6] <= sec_decode_128(seed6[width_data_sec-1:0]);
			end
		end
	end
	
	always_ff @ (negedge rstb, posedge clk) begin	// data mask to generate Hamming code bit7
		if (!rstb) begin
	  		seed7 <= {width_seed7{1'b0}};
	  		mask[7] <= {width_data{1'b0}};
	  	end	else begin	
	  		if (en_init) begin
				seed7 <= {replicate_seed7{ ({128'b1,128'b0}>>1) }};
				mask[7] <= sec_decode_128(seed7[width_data_sec-1:0]);
			end
		end
	end

endmodule	// module init_mask_alu
