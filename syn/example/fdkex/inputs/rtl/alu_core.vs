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
/// This block implements the ALU core operations. 
/// Operations include addition, subtraction, arithmetic shift right, arithmetic shift left, AND, OR, XOR, and NOT.
/// Arithmetic operations assume 2's complement numbering.
///
///=====================================================================================================================

///=====================================================================================================================
///                              alu_core Module Instantiation
///=====================================================================================================================

module alu_core (rstb, clk, sel_op, din0, din1, dout);

///=====================================================================================================================
///                              Global Parameters and Functions
///=====================================================================================================================

	`include "parameters.vs"
	`include "functions.vs"
			
///=====================================================================================================================
///                              alu_core IO Declarations
///=====================================================================================================================

	input  rstb;
	input  clk;
	input  [width_op_sel-1:0] sel_op;
	input  [width_data-1:0] din0;
	input  [width_data-1:0] din1;
	output logic [width_data_alu-1:0] dout;

///=====================================================================================================================
///                              alu_core Internal Signal Declarations
///=====================================================================================================================

	logic [width_data:0] tmp_add;		// add result: 1-bit sign extended from the input data
	
///=====================================================================================================================
///                              Main alu_core Logic
///=====================================================================================================================

///=====================================================================================================================
///                              ALU Operations
///=====================================================================================================================
		
	always_ff @ (negedge rstb, posedge clk) begin : ALU
		if (!rstb) begin
			tmp_add <= { (width_data+1){1'b0} };
			dout <= {width_data_alu{1'b0}};
	  	end else begin
	  		unique casex (sel_op)
				// Arithmetic operations
				3'b000 : begin	// Addition: 1-bit sign extend, add, sign extend for output
					tmp_add <= {din0[width_data-1],din0} + {din1[width_data-1],din1};
					dout <= { {(width_data_alu-width_data-1){tmp_add[width_data]}}, tmp_add };
				end 
				3'b001 : begin	// Subtraction: 1-bit sign extend, sub, sign extend for output
					tmp_add <= subtract(din0, din1);
					dout <= { {(width_data_alu-width_data-1){tmp_add[width_data]}}, tmp_add };
				end 
				3'b010 : begin	// Arithmetic right shift: MSH din1, LSH din0
					dout <= {(din1>>>1), (din0>>>1)};
				end 
				3'b011 : begin	// Arithmetic left shift: MSH din1, LSH din0
					dout <= {(din1<<<1), (din0<<<1)};
				end 
				
				// Logic operations
				3'b100 : begin	// AND: and, MSH zero padding
					dout <= { {(width_data_alu-width_data){1'b0}}, (din0&din1) };
				end 
				3'b101 : begin	// OR: or, MSH zero padding
					dout <= { {(width_data_alu-width_data){1'b0}}, (din0|din1) };
				end 
				3'b110 : begin	// XOR: xor, MSH zero padding
					dout <= { {(width_data_alu-width_data){1'b0}}, (din0^din1) };
				end 
				3'b111 : begin	// NOT: MSH not din1, LSH not din0
					dout <= {~din1,~din0};
				end 
				
				default : begin
					tmp_add <= { (width_data+1){1'b0} };
					dout <= {width_data_alu{1'b0}};
				end
			endcase
		end
	end 

endmodule	// module alu_core
