///=====================================================================================================================
///
/// fifo.vs
///
/// Primary Contact   : 
/// Secondary Contact : 
/// Unit Owner        : 
///
/// Original Author   : Jina Kim
/// Original Date     : 14 September 2009
/// Last modified     : 08 December 2009
/// Last Modified     : 18 January 2010
///
/// Copyright (c) 2009 Intel Corporation
/// Intel Proprietary
///
/// This block implements the FIFO logic.  This FIFO is a dual port synchronous read / write memory.
///
///=====================================================================================================================

///=====================================================================================================================
///                              fifo Module Instantiation
///=====================================================================================================================

module fifo (rstb, clk, en_wr, en_rd, data_wr, data_rd);

///=====================================================================================================================
///                              Global Parameters
///=====================================================================================================================

	`include "parameters.vs"
	
///=====================================================================================================================
///                              fifo IO Declarations
///=====================================================================================================================

	input  rstb;
	input  clk;
	input  en_wr;
	input  en_rd;
	input  [width_data-1:0] data_wr;
	output logic [width_data-1:0] data_rd;

///=====================================================================================================================
///                              fifo Internal Signal Declarations
///=====================================================================================================================

	logic flag_empty;	// Active low (0: empty, 1: not empty)
	logic flag_full;	// Active low (0: full, 1: not full)
	logic en_flag_wr;
	logic en_flag_rd;
	logic [width_data-1:0] data_mem [0:depth_ram-1];
	logic [width_addr  :0] cnt_data;
	logic [width_addr-1:0] addr_wr;
	logic [width_addr-1:0] addr_rd;
	logic [width_addr-1:0] i_mem;

///=====================================================================================================================
///                              Main fifo Logic
///=====================================================================================================================

///=====================================================================================================================
///                              Flag Generation for FIFO Empty and Full
///=====================================================================================================================

// Generate internal enable signal (en_flag_wr) for write operation based on FIFO state.
// If FIFO is full (flag_full == 0), write operation is disabled regardless of the value of 
// external write enable signal (en_wr).
	assign flag_full = ~cnt_data[width_addr];	// 0: full (cnt_data == depth_ram), 1: not full
	assign en_flag_wr = flag_full & en_wr;

// Generate internal enable signal (en_flag_rd) for read operation based on FIFO state.
// If FIFO is empty (flag_empty == 0), read operation is disabled regardless of the value of 
// external read enable signal (en_rd).
	assign flag_empty = |cnt_data;	// 0: empty (cnt_data == 0), 1: not empty
	assign en_flag_rd = flag_empty & en_rd;

///=====================================================================================================================
///                              Data Read and Write Address Counters
///=====================================================================================================================

// Read address counter.  Increment read address counter for each read operation.  
// Read address counter resets itself, when it reaches the last entry of the FIFO.
	always_ff @ (negedge rstb, posedge clk) begin : CTRL_ADDR_RD
		if (!rstb) begin
			addr_rd <= {width_addr{1'b0}};
		end else if (en_flag_rd) begin
	    	addr_rd <= addr_rd + 1;
	  	end
	end

// Write address counter.  Increment write address counter for each write operation.  
// Write address counter resets itself, when it reaches the last entry of the FIFO.
	always_ff @ (negedge rstb, posedge clk) begin : CTRL_ADDR_WR
		if (!rstb) begin
			addr_wr <= {width_addr{1'b0}};
		end else if (en_flag_wr) begin
	    	addr_wr <= addr_wr + 1;
	  	end
	end

///=====================================================================================================================
///                              Data Read and Write Operations
///=====================================================================================================================

// Read operation.  Read data from the entry specified by the read address counter.
// Read only when read enable signal (en_flag_rd) is enabled.
	always_ff @ (negedge rstb, posedge clk) begin : RD_DATA
		if (!rstb) begin
	    	data_rd <= {width_data{1'b0}};
	  	end else if (en_flag_rd) begin
	    	data_rd <= data_mem[addr_rd];
	  	end
	end

// Write operation.  Write received data into the entry specified by the write address counter.
// Write only when write enable signal (en_flag_wr) is enabled.
	always_ff @ (negedge rstb, posedge clk) begin : WR_DATA
		if (!rstb) begin
			for (i_mem = 0; i_mem < depth_ram-1; i_mem = i_mem+1) begin 
    			data_mem[i_mem] <= {width_data{1'b0}};
			end
	  	end else if (en_flag_wr) begin
	    	data_mem[addr_wr] <= data_wr;
	  	end
	end

///=====================================================================================================================
///                              Data Counter for Each Read / Write Operation
///=====================================================================================================================

// Data entry counter (cnt_data) keeps track of the number of available data entries in the FIFO.
// Decrement data entry counter when read happens, and increment data entry counter when write happens.
// When both write and read operations happen, data entry counter does not increment or decrement.
	always_ff @ (negedge rstb, posedge clk) begin : CNT_DATA
		if (!rstb) begin
	    	cnt_data <= { 1'b0, {width_addr{1'b0}} };
	  	end else if (en_flag_rd && (!en_flag_wr) && (|cnt_data)) begin 	// Read but no write (cnt_data!=0)
	    	cnt_data <= cnt_data - 1;
	  	end else if (en_flag_wr && (!en_flag_rd) && (!cnt_data[width_addr])) begin	// Write but no read (cnt_data!=depth_ram)
	    	cnt_data <= cnt_data + 1;
		end
	end 

endmodule
