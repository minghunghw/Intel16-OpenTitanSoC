///=====================================================================================================================
///
/// secded_alu.vs
///
/// Primary Contact   : 
/// Secondary Contact : 
/// Unit Owner        : 
///
/// Original Author   : Jina Kim
/// Original Date     : 14 September 2009
/// Last Modifed      : 18 January 2010
///
/// Copyright (c) 2009 Intel Corporation
/// Intel Proprietary
///
/// This block implements the SECDED for ALU output data.
/// It corrects single error and detects double error.
/// It is assumed that there are zero, single, or double errors in the received data.
///
///=====================================================================================================================

///=====================================================================================================================
///                              secded_alu Module Instantiation
///=====================================================================================================================

module secded_alu (rstb, clk, ecc_tx, ecc_rx,  data_rx, data_rxc, flag_ded);

///=====================================================================================================================
///                              Global Parameters and Functions
///=====================================================================================================================

	`include "parameters.vs"
	`include "functions.vs"
			
///=====================================================================================================================
///                              secded_alu IO Declarations
///=====================================================================================================================

	input  rstb;
	input  clk;
	input  [width_ecc-1:0] ecc_tx;
	input  [width_ecc-1:0] ecc_rx; 
	input  [width_data-1:0] data_rx;
	output logic [width_data-1:0] data_rxc;	// Error-corrected RX data
	output logic flag_ded;	// flag for double error detected

///=====================================================================================================================
///                              secded_alu Internal Signal Declarations
///=====================================================================================================================

	logic [width_ecc-1:0] ecc_xor;
	logic parity;
	logic [width_sec-1:0] syndrome;
	logic flag_syndrome;
	logic [width_data_sec-1:0] data_encoded;
	logic [width_data_sec-1:0] data_tmp;
		
///=====================================================================================================================
///                              Main secded_alu Logic
///=====================================================================================================================

///=====================================================================================================================
///                              Syndrome Generation
///=====================================================================================================================

// Generate parity and syndrome based on received ECC (ecc_tx) and generated ECC from the received data (ecc_rx).
// Set flag_syndrome, if at least one bit of syndrome is one.
	assign ecc_xor = ecc_tx ^ ecc_rx;
	assign parity = ecc_xor[width_ecc-1];	
	assign syndrome = ecc_xor[width_sec-1:0];
	assign flag_syndrome = |syndrome;

///=====================================================================================================================
///                              Double Error Detection
///=====================================================================================================================

// Double-error is detected, if operall parity is even but at least one bit of syndrome is one.
	always_ff @ (negedge rstb, posedge clk) begin : DED
		if (!rstb) begin
	  		flag_ded <= 1'b0;
	  	end else begin
	  		unique casex ({parity,flag_syndrome})	
				2'b01 : begin 	// Double errors
	  				flag_ded <= 1'b1;
	  			end default : begin	// No errors or single error
	  				flag_ded <= 1'b0;
	  			end
	  		endcase
		end
	end 	
				
///=====================================================================================================================
///                              Single Error Correction
///=====================================================================================================================

// If single error is detected, correct the error and output.
// For other cases, output the received data without correction.
	always_ff @ (negedge rstb, posedge clk) begin : SEC
		if (!rstb) begin
			data_rxc <= {width_data{1'b0}};
			data_encoded <= {width_data_sec{1'b0}};
			data_tmp <= {width_data_sec{1'b0}};
	  	end else begin
	  		unique casex ({parity,flag_syndrome})	
	  			2'b11 : begin 	// Single error.  Data or SEC
		  			data_encoded <= sec_encode_128(data_rx);
  					data_tmp <= data_encoded;
  					data_tmp[syndrome[width_sec-1:0]-1] <= ~data_encoded[syndrome[width_sec-1:0]-1];
					data_rxc <= sec_decode_128(data_tmp);
	  			end 2'b01 : begin 	// Double errors.  No correction
	  				data_rxc <= data_rx;
					data_encoded <= {width_data_sec{1'b0}};
					data_tmp <= {width_data_sec{1'b0}};
	  			end 2'b00 : begin	// No errors.  No correction  
					data_rxc <= data_rx;
					data_encoded <= {width_data_sec{1'b0}};
					data_tmp <= {width_data_sec{1'b0}};
				end 2'b10 : begin	// Parity error.  No correction
	  				data_rxc <= data_rx;
					data_encoded <= {width_data_sec{1'b0}};
					data_tmp <= {width_data_sec{1'b0}};
	  			end default : begin
	  				data_rxc <= {width_data{1'b0}};
					data_encoded <= {width_data_sec{1'b0}};
					data_tmp <= {width_data_sec{1'b0}};
	  			end
	  		endcase
		end
	end 

endmodule	// module secded_alu
