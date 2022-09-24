///=====================================================================================================================
///
/// check_ecc_alu.vs
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
/// This block implements the Check ECC for ALU output.
/// It corrects single error and detects double errors.
///
///=====================================================================================================================

///=====================================================================================================================
///                              check_ecc_alu Module Instantiation
///=====================================================================================================================

module check_ecc_alu (rstb, clk, mask, data_ecc, data_rxc, flag_ded);
	
///=====================================================================================================================
///                              Global Parameters and Functions
///=====================================================================================================================

	`include "parameters.vs"
	`include "functions.vs"
	
///=====================================================================================================================
///                              check_ecc_alu IO Declarations
///=====================================================================================================================

	input  rstb;
	input  clk;
	input  [width_data-1:0] mask [0:width_sec-1];
	input  [width_data_ecc-1:0] data_ecc;
	output logic [width_data-1:0] data_rxc;
	output logic flag_ded;

///=====================================================================================================================
///                              check_ecc_alu Internal Signal Declarations
///=====================================================================================================================

	logic [width_ecc-1:0] ecc_rx;	
	
///=====================================================================================================================
///                              Main check_ecc_alu Logic
///=====================================================================================================================

///=====================================================================================================================
///                              Received data ECC Generation
///=====================================================================================================================

	defparam	gen_ecc_alu0.width_data		= width_data_alu;
	defparam	gen_ecc_alu0.width_ecc 		= width_ecc_alu;
	defparam	gen_ecc_alu0.width_sec 		= width_sec_alu;
	gen_ecc_alu	gen_ecc_alu0	(rstb, clk, data_ecc[width_data-1:0], mask, ecc_rx);

///=====================================================================================================================
///                              SECDED on Received data
///=====================================================================================================================

	defparam	secded_alu0.width_data 		= width_data_alu;
	defparam	secded_alu0.width_ecc 		= width_ecc_alu;
	defparam	secded_alu0.width_sec 		= width_sec_alu;
	defparam	secded_alu0.width_data_sec	= width_data_sec_alu;
	secded_alu	secded_alu0		(rstb, clk, data_ecc[width_data_ecc-1:width_data_ecc-width_ecc], ecc_rx, data_ecc[width_data-1:0], data_rxc, flag_ded);
	
endmodule	// module check_ecc_alu
