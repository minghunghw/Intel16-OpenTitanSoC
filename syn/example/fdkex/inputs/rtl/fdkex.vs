///=====================================================================================================================
///
/// fdkex.vs
///
/// Primary Contact   : 
/// Secondary Contact : 
/// Unit Owner        : 
///
/// Original Author   : Jina Kim
/// Original Date     : 08 December 2009
/// Last Modified     : 18 January 2010
///
/// Copyright (c) 2009 Intel Corporation
/// Intel Proprietary
///
/// This is the TOP LEVEL DESIGN.  
///
///=====================================================================================================================

///=====================================================================================================================
///                              fdkex Module Instantiation
///=====================================================================================================================

module fdkex (rstb, clk, din0, din1, en_init, en_wr0, en_rd0, en_wr1, en_rd1, sel_op, en_wr_alu, en_rd_alu, dout, flag_ded0, flag_ded1, flag_ded_alu);

///=====================================================================================================================
///                              Global Parameters
///=====================================================================================================================

	`include "parameters.vs"		

///=====================================================================================================================
///                              fdkex IO Declarations
///=====================================================================================================================

	input  rstb;
	input  clk;
	input  [width_data-1:0] din0;
	input  [width_data-1:0] din1;
	input en_init;
	input en_wr0;
	input en_rd0;
	input en_wr1;
	input en_rd1;
	input [width_op_sel-1:0] sel_op;
	input en_wr_alu;
	input en_rd_alu;
	output logic [width_data_alu-1:0] dout;
	output logic flag_ded0;
	output logic flag_ded1;
	output logic flag_ded_alu;


///=====================================================================================================================
///                              DATA MASK INITIALIZATION for ECC GENERATION
///=====================================================================================================================

///=====================================================================================================================
///          Internal Signal Declarations and Parameter Override for init_mask_in0 and init_mask_alu0
///=====================================================================================================================

	logic [width_data-1:0] mask_in [0:width_sec-1];
	logic [width_data_alu-1:0] mask_alu [0:width_sec_alu-1];	
	defparam 		init_mask_alu0.width_data	= width_data_alu;
	defparam 		init_mask_alu0.width_sec	= width_sec_alu;
	defparam 		init_mask_alu0.width_data_sec	= width_data_sec_alu;
	
///=====================================================================================================================
///          Module Instantiations for init_mask_in and init_mask_alu
///=====================================================================================================================

	init_mask_in 	init_mask_in0	(rstb, clk, en_init, mask_in);	// ECC data mask init for input data
	init_mask_alu 	init_mask_alu0	(rstb, clk, en_init, mask_alu);	// ECC data mask init for output data
	
	
///=====================================================================================================================
///                              FIFO0 and ECC0 FOR DIN0
///=====================================================================================================================

///=====================================================================================================================
///          Internal Signal Declarations and Parameter Override for gen_ecc_in0, fifo0, and check_ecc_in0
///=====================================================================================================================

	logic [width_ecc-1:0] ecc0;
	logic [width_data_ecc-1:0] din_ecc0;
	logic [width_data-1:0] din_rxc0;
	defparam 		fifo0.width_data = width_data_ecc;
	

///=====================================================================================================================
///          Module Instantiations for gen_ecc_in0, fifo0, and check_ecc_in0
///=====================================================================================================================

	gen_ecc_in	gen_ecc_in0	(rstb, clk, din0, mask_in, ecc0);
	fifo		fifo0		(rstb, clk, en_wr0, en_rd0, {ecc0,din0}, din_ecc0);
	check_ecc_in	check_ecc_in0	(rstb, clk, mask_in, din_ecc0, din_rxc0, flag_ded0);


///=====================================================================================================================
///                              FIFO1 and ECC1 FOR DIN1
///=====================================================================================================================

///=====================================================================================================================
///          Internal Signal Declarations and Parameter Override for gen_ecc_in1, fifo1, and check_ecc_in1
///=====================================================================================================================

	logic [width_ecc-1:0] ecc1;
	logic [width_data_ecc-1:0] din_ecc1;
	logic [width_data-1:0] din_rxc1;
	defparam 		fifo1.width_data = width_data_ecc;

		
///=====================================================================================================================
///          Module Instantiation for gen_ecc_in1, fifo1, and check_ecc_in1
///=====================================================================================================================

	gen_ecc_in	gen_ecc_in1	(rstb, clk, din1, mask_in, ecc1);
	fifo		fifo1		(rstb, clk, en_wr1, en_rd1, {ecc1,din1}, din_ecc1);
	check_ecc_in	check_ecc_in1	(rstb, clk, mask_in, din_ecc1, din_rxc1, flag_ded1);


///=====================================================================================================================
///                              ALU CORE
///=====================================================================================================================

///=====================================================================================================================
///          Internal Signal Declarations for alu_core0
///=====================================================================================================================

	logic [width_data_alu-1:0] alu_out;
	
///=====================================================================================================================
///          Module Instantiation for alu_core0
///=====================================================================================================================

	alu_core	alu_core0	(rstb, clk, sel_op, din_rxc0, din_rxc1, alu_out);


///=====================================================================================================================
///                              FIFO2 and ECC2 FOR DOUT
///=====================================================================================================================

///=====================================================================================================================
///          Internal Signal Declarations and Parameter Override for gen_ecc_alu0, fifo2, and check_ecc_alu0
///=====================================================================================================================

	logic [width_ecc_alu-1:0] ecc_alu;
	logic [width_data_ecc_alu-1:0] alu_out_ecc;
	defparam 		gen_ecc_alu0.width_data	= width_data_alu;
	defparam 		gen_ecc_alu0.width_sec 	= width_sec_alu;
	defparam 		gen_ecc_alu0.width_ecc 	= width_ecc_alu;
	defparam 		fifo2.width_data = width_data_ecc_alu;
	defparam 		check_ecc_alu0.width_data	= width_data_alu;
	defparam 		check_ecc_alu0.width_sec 	= width_sec_alu;
	defparam 		check_ecc_alu0.width_ecc 	= width_ecc_alu;
	defparam 		check_ecc_alu0.width_data_ecc	= width_data_ecc_alu;
	
///=====================================================================================================================
///          Module Instantiation for gen_ecc_alu0, fifo2, and check_ecc_alu0
///=====================================================================================================================

	gen_ecc_alu	gen_ecc_alu0	(rstb, clk, alu_out, mask_alu, ecc_alu);
	fifo		fifo2		(rstb, clk, en_wr_alu, en_rd_alu, {ecc_alu,alu_out}, alu_out_ecc);
	check_ecc_alu	check_ecc_alu0	(rstb, clk, mask_alu, alu_out_ecc, dout, flag_ded_alu);

	
endmodule	// module fdkex
