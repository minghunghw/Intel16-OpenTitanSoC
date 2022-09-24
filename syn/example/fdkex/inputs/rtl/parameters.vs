///=====================================================================================================================
///
/// parameters.vs
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
/// This file declares parameters.
/// Hardcoded parameters: width_data, width_sec, width_data_alu, width_sec_alu, width_addr, width_op_sel
///
///=====================================================================================================================

///=====================================================================================================================
///                              Widths of Input Data, Ouptut Data, and Their Hamming Codes
///=====================================================================================================================

// Hardcoded parameters
parameter width_data = 64;			// Input data width: [2^N] bits
parameter width_sec = 7; 			// Input data Hamming code width: [N+1] bits
parameter width_data_alu = 128;		// ALU output data width: [2^(N+1)] bits
parameter width_sec_alu = 8;		// ALU output data Hamming code width: [N+2] bits

///=====================================================================================================================
///                              Widths of Input Data Error Correction Codes
///=====================================================================================================================

parameter width_ecc = width_sec + 1;	// Error correction code + Parity width (9, 10, ...)
parameter width_data_sec = width_data + width_sec;	// Data + Error correction code width (136, 265, ...)
parameter width_data_ecc = width_data + width_ecc;	// Data + Error correction code + Parity width (137, 266, ...)

///=====================================================================================================================
///                              FIFO Address Width and Depth
///=====================================================================================================================

parameter width_addr = 5;					// FIFO address width: M bits
parameter depth_ram = (1 << width_addr);	// FIFO depth: 2^M

///=====================================================================================================================
///                              Widths of Output Data Error Correction Codes
///=====================================================================================================================

parameter width_ecc_alu = width_sec_alu + 1;
parameter width_data_sec_alu = width_data_alu + width_sec_alu;
parameter width_data_ecc_alu = width_data_alu + width_ecc_alu;

///=====================================================================================================================
///                              Widths of ALU OP Select
///=====================================================================================================================

// Hardcoded parameter
parameter width_op_sel = 3;		// Up to 8 operations

///=====================================================================================================================
///                              Seed Replication Factor for Hamming Code Generation
///=====================================================================================================================

parameter replicate_seed0 = (width_data_sec>>1)+1;	// 69, 133, ... 
parameter replicate_seed1 = (width_data_sec>>2)+1;	// 35, 67, ... 
parameter replicate_seed2 = (width_data_sec>>3)+1;	// 18, 34, ... 
parameter replicate_seed3 = (width_data_sec>>4)+1;	//  9, 17, ...
parameter replicate_seed4 = (width_data_sec>>5)+1;	//  5, 9, ...
parameter replicate_seed5 = (width_data_sec>>6)+1;	//  3, 5, ...
parameter replicate_seed6 = (width_data_sec>>7)+1;	//  2, 3, ...
parameter replicate_seed7 = (width_data_sec>>8)+1;	//  1, 2, ...	
parameter replicate_seed8 = (width_data_sec>>9)+1;	//  X, 1, ...	// for 256-bit data

///=====================================================================================================================
///                              Replicated Seed Width for Hamming Code Generation
///=====================================================================================================================

parameter width_seed0 = replicate_seed0 << 1;	// 138, 266, ...
parameter width_seed1 = replicate_seed1 << 2;	// 140, 268, ...	
parameter width_seed2 = replicate_seed2 << 3;	// 144, 272, ...
parameter width_seed3 = replicate_seed3 << 4;	// 144, 272, ...
parameter width_seed4 = replicate_seed4 << 5;	// 160, 288, ...
parameter width_seed5 = replicate_seed5 << 6;	// 192, 320, ...
parameter width_seed6 = replicate_seed6 << 7;	// 256, 384, ...
parameter width_seed7 = replicate_seed7 << 8;	// 256, 512, ...
parameter width_seed8 = replicate_seed8 << 9;	// XXX, 512, ...	// for 256-bit data

