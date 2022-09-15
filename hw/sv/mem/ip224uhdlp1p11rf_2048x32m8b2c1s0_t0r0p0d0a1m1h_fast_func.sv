/////////////////////////////////////////////////////////////////////////////////////////////
// Intel Confidential                                                                      //
/////////////////////////////////////////////////////////////////////////////////////////////
// Copyright 2022 Intel Corporation. The information contained herein is the proprietary   //
// and confidential information of Intel or its licensors, and is supplied subject to, and //
// may be used only in accordance with, previously executed agreements with Intel.         //
// EXCEPT AS MAY OTHERWISE BE AGREED IN WRITING: (1) ALL MATERIALS FURNISHED BY INTEL      //
// HEREUNDER ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND; (2) INTEL SPECIFICALLY     //
// DISCLAIMS ANY WARRANTY OF NONINFRINGEMENT, FITNESS FOR A PARTICULAR PURPOSE OR          //
// MERCHANTABILITY; AND (3) INTEL WILL NOT BE LIABLE FOR ANY COSTS OF PROCUREMENT OF       //
// SUBSTITUTES, LOSS OF PROFITS, INTERRUPTION OF BUSINESS, OR FOR ANY OTHER SPECIAL,       //
// CONSEQUENTIAL OR INCIDENTAL DAMAGES, HOWEVER CAUSED, WHETHER FOR BREACH OF WARRANTY,    //
// CONTRACT, TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE.                              //
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                         //
//  Vendor:                Intel Corporation                                               //
//  Product:               ip224uhdlp1p11rf                                                //
//  Version:               r1.0.1                                                          //
//  Technology:            p1222.4                                                         //
//  Celltype:              MemoryIP                                                        //
//  IP Owner:              Intel CMO                                                       //
//  Creation Time:         Wed Sep 14 2022 15:19:50                                        //
//  Memory Name:           ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h                  //
//  Memory Name Generated: ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h                  //
//                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////
//
// MOAD Begin
//     File/Block                             : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h.sv
//     Design Style [rls|rf|ssa_fuse|sdp|
//                   custom|hier|rls_hier]    :
//     Circuit Style [non_rfs|rfs|ssa|fuse|
//                    IO|ROM|none]            :
//     Common_lib (for custom blocks only)    :
//     Library (must be same as module name)  :
//     Unit [unit id or shared]               :
//     Complex [North, South, CPU]            :
//     Bizgroup [LCP|SEG|ULMD]                :
//
// Design Unit Owner : tmg_ctg_cmo_pdx_ssa@intel.com
//
// MOAD End
//
//==============================================================


//lintra push -60039

//`ifndef _ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_sv_
//`define _ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_sv_

`timescale 1ns/10ps


`ifdef INTC_SVA_OFF
    `define INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_SVA_OFF
`endif
`ifdef INTC_MEM_SVA_OFF
    `define INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_SVA_OFF
`endif

`ifdef INTC_FPGA
  `define INTC_MEM_EF_MODE
  `define INTC_EMULATION
  `define INTC_SVA_OFF
  `define INTC_NOXHANDLING
`else
  `ifdef INTC_EMULATION
    `define INTC_MEM_EF_MODE
    `define INTC_SVA_OFF
    `define INTC_NOXHANDLING
  `endif  
`endif

//---------------------------------------------------------------------------
// FI ARRAY setting
//---------------------------------------------------------------------------
`ifdef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_norepair
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_norep
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection

`elsif INTC_MEM_fault_norepair
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_norep 
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection
  
`elsif INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_repair
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_rep
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection

`elsif INTC_MEM_fault_repair
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_rep 
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection

`elsif INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_single
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_sing
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection

`elsif INTC_MEM_fault_single
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_sing 
  `define  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection
`endif



//define Control pin default value
`define INTC_MEM_ip222uhd1p11sram_WPULSE_DEFAULT  00
`define INTC_MEM_ip222uhd1p11sram_WA_DEFAULT  00


`ifndef INTC_MEM_PATH_SIZE
 `define INTC_MEM_PATH_SIZE 256
`endif // INTC_MEM_PATH_SIZE


//ASSERTION FINAL Define
  `define INTC_FINAL #0 

//------------------------------------------------------------------------  
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_RESET_FF(q,d,clock,reset)\
   always @(posedge clock or posedge reset)                     \
      begin                                                     \
         if (reset) q <=  1'b0;                                   \
         else q <= d;                                           \
      end                                                       
//------------------------------------------------------------------------  
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_SET_FF(q,d,clock,reset)\
   always @(posedge clock or posedge reset)                     \
      begin                                                     \
         if (reset) q <=  1'b1;                                  \
         else q <= d;                                           \
      end                                                       
//------------------------------------------------------------------------  

`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_FF(q,d,clock)            \
   always @(posedge clock)                                      \
      begin                                                     \
              q <= d;                                           \
      end                                                       
//------------------------------------------------------------------------  
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(q,d,clock)         \
   always_latch                                                 \
      begin                                                     \
         if(clock)                                              \
              q <= d;                                           \
      end                                                          
//------------------------------------------------------------------------                                                                                        
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG else $error
//------------------------------------------------------------------------------
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_RANGE(sig, low, high, rst) \
        assert `INTC_FINAL ( (|(rst)) | (((``sig``) >= (``low``)) & ((``sig``) <= (``high``)))) \
//--------------------------------------------------------------------------
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN(cond, rst)           \
        assert `INTC_FINAL ((|(rst))|(!(``cond``))) 
//-------------------------------------------------------------------------------------
`define ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_AT_MOST_BITS_HIGH(sig, n, rst) assert `FINAL (`ifndef INTC_MEM_FEV rst || `endif $countones(sig) < n) 
//---------------------------------------------------------------------------


// -----------------------------------------------------------------------------
// ARRAY Module Definition
//
//lintra push -68099
module ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array #(//lintra s-52000,-60039

   parameter BITS =  32,
   parameter ENTRIES = 2048,
   parameter ADDR = 11
 
)

(
    input shutoff,
    input supply_monitor,
    input sleep_x_pos,
    input x_shutoff_array,
//    input x_shutoff_rddata,
    input x_array,
    input x_array_adr,    
    input [BITS-1:0] wrbiten_b,
//    input saclk,
    input [ADDR-1:0] adr, //lintra s-60013
    input [BITS-1:0] datain,
    input wrclk,
//    input x_rddata,
//    input deepslpen,
//    input read_write_collision, 
    output [BITS-1:0] dataout
);
//lintra pop

reg [BITS-1:0] DATA_ARRAY [ENTRIES-1:0];


`ifdef  INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection

// Memory Definition

logic [BITS-1:0]  DATA_ARRAY_f [ENTRIES-1:0];

 integer k;

 initial 
 begin


  // Fault injection display
  $display("--------------------------------------------------");
  $display("-- Fault injection table for %m");
  //---------------------------

  for (k=0; k<ENTRIES; k=k+1) // initializing mem_fault_XOR array to all zeros
  begin
  DATA_ARRAY_f[k] = 0;
  end
  `ifdef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_rep
   //---------------------------
   // Fault injection display
   $display("-- Type of fault : Repairable");
   $display("-- Word 0, I/O 1");
   //$display("-- Word 1, I/O 1");
   //$display("-- Word 256, I/O 1");
   //---------------------------

   //Only for Fault Injection         
   DATA_ARRAY_f[0] = (1'b1 << 2);


   
   //end
  `endif
   
  `ifdef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_norep
   //Injecting too many faults
   //---------------------------
   // Fault injection display
   $display("-- Type of fault : Unrepairable");
   $display("-- Word 0, I/O 0");
   $display("-- Word 0, I/O 40");
   $display("-- Word 2, I/O 1");
   $display("-- Word 2, I/O 40");
   $display("-- Word ENTRIES/4, I/O 1");
   $display("-- Word ENTRIES/4, I/O 40");
   $display("-- Word ENTRIES/2, I/O 0");
   $display("-- Word ENTRIES/2, I/O 40");
   $display("-- Word ENTRIES-1, I/O 1");
   $display("-- Word ENTRIES-1, I/O 40");
   //---------------------------
   // Enable this only for the COL REDUNDANCY

   DATA_ARRAY_f[0] = (1'b1 << (BITS-1)| (1'b1 << 1));
   DATA_ARRAY_f[2] = (1'b1 << (BITS-1)| (1'b1 << 2));
   DATA_ARRAY_f[ENTRIES/4] = (1'b1 << (BITS-1)| (1'b1 << 2) );
   DATA_ARRAY_f[ENTRIES/2] = (1'b1 << (BITS-1)| (1'b1 << 1));
   DATA_ARRAY_f[ENTRIES-1] = (1'b1 << (BITS-1)| (1'b1 << 2));
   
   //end
  `endif
     
  `ifdef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_sing
   //---------------------------
   $display("-- Type of fault : Single");
   $display("-- Word 2, I/O 40");
   //---------------------------
  
    DATA_ARRAY_f[2] = (1'b1 << (BITS-1)); 
  
  `endif
      
  $display("--------------------------------------------------");
  
 end //end of initial block
`endif
// ------------------
// End of Fault injection
// ------------------

logic [BITS-1:0] saout;

//ARRAY WRITE
`ifndef INTC_MEM_LINT
`ifndef INTC_EMULATION

//always_ff @(negedge supply_monitor or posedge shutoff or posedge x_shutoff_array or posedge x_array or posedge x_array_adr or posedge wrclk)
always @(*) begin //lintra s-50000
               if( (shutoff !==0) || x_shutoff_array || x_array || x_array_adr || (supply_monitor !==1)) begin
                        if( (shutoff !==0) ||x_shutoff_array || (supply_monitor !==1)) begin
                                for(int entry = 0; entry < ENTRIES; entry++) begin
                                        DATA_ARRAY[entry] <= {BITS{1'bx}}; //lintra s-50002, s-60051, s-60118, s-81061
                                end
                        end
                        else if (x_array) begin
                                for(int entry = 0; entry < ENTRIES; entry++) begin
                                   for(int biten = 0; biten < BITS ; biten++) begin
                                       if(sleep_x_pos == 1) begin
                                                   DATA_ARRAY[entry] <= {BITS{1'bx}};  //lintra s-50002

                                        end     
                                       if(wrbiten_b[biten] !== 1) DATA_ARRAY[entry] <= {BITS{1'bx}};  //lintra s-50002, s-60051, s-60118, s-81061
                                   end
                                end
			end     
                        else if (x_array_adr) begin                     
                                for(int biten=0; biten< BITS; biten++) begin
                                        if(wrbiten_b[biten] !== 1) DATA_ARRAY[adr][biten] <= 1'bx;  //lintra s-50002, s-60051, s-60118, s-81061
                                end
                        end                   

                 end                                                
                 else begin
                             for (int biten=0; biten < BITS; biten++) begin
                                 if(wrclk) begin
                                        if(wrbiten_b[biten] == 0) DATA_ARRAY[adr][biten] <= datain[biten]; //lintra s-50002, s-60051, s-60118, s-81061, s-60041
                                        else if (wrbiten_b[biten] !== 1)  DATA_ARRAY[adr][biten] <= 1'bx; //lintra s-50002, s-60051, s-60118, s-81061
                                 end 
                             end

                 end

end // always @ (*)

`else //IN Emulation
   // Write
   always @(posedge wrclk)  begin //lintra s-50000
       DATA_ARRAY[adr] <= (~wrbiten_b & datain) | (wrbiten_b & DATA_ARRAY[adr]);
     end

`endif

//READ from the ARRAY
assign dataout = DATA_ARRAY[adr];

`endif //INTC_MEM_LINT

endmodule

// -----------------------------------------------------------------------------
// BMOD Module Definition
//
//lintra push -68099
module ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod #(//lintra s-52000,-60039
   parameter BITS = 32,
   parameter ENTRIES = 2048,
   parameter ADDR = 11
)
(
`ifndef INTC_NO_PWR_PINS
   input              vddp,
   input              vss,
`endif

   input ckgrid,                        //Input Clock
   input rden,                  //Read Enable
   input wren,                  //Write Enable
   input [ADDR-1:0] adr,                //Input Address

   input [1:0] wa,              //Write Assist bias strength
   input [1:0] wpulse,          //write assist pulse width control bus
   input wpulseen,              //Write Assist enable pin. Disabling turns off write assist.
   input sleep,                 //Light sleep enable signal
   input bc1,                     
   input bc2,                     
   input deepslp,                 
   input shutoff,                       //Enable the power for the IP
   input clkbyp,                        //Clock bypass enable
   input mce,                           //CMCE bypass enable
   input [2:0] mc,
//   input [2:0] wmce,     
   input iso,                   //Firewalling the IP. 1:IP is firewalled 0: IP is on
   input [BITS-1:0] datain,           //Input Data
   input [BITS-1:0] wrbiten_b,          //Write bit enable for the write.


   output logic [BITS-1:0]    dataout  //Data output


);
//lintra pop

wire vddp_local, vss_local;

`ifndef INTC_NO_PWR_PINS
   assign vddp_local = vddp;
   assign vss_local = vss;
`else
   assign vddp_local = 1'b1;
   assign vss_local = 1'b0;

`endif

logic shutoff_fw ;

logic ckgrid_fw;
logic rden_fw;
logic wren_fw;
logic [ADDR-1:0] adr_fw;
logic [BITS-1:0] datain_fw;
logic [BITS-1:0] wrbiten_b_fw;

logic supply_monitor;

logic clkbyp_fw;
logic clkbyp_fw_1l;
logic rden_clkbyp_1l;
logic rden_clkbyp_1h;

logic wren_fw_1l;
logic rden_fw_1l;
logic sleep_fw;
//logic deepslp_fw;   
logic wren_slp;
logic [BITS-1:0] datain_fw_1l;

logic [BITS-1:0] wrbiten_b_fw_1l;
logic [ADDR-1:0] adr_fw_1l;
logic wrdata_ff_clk;

logic [BITS-1:0]  DATA_ARRAY [ENTRIES-1:0];
logic rden_slp;
logic saclk;
logic [BITS-1:0] saout;
logic ckwren;
logic ckrden;
logic write_corrupt;
logic read_corrupt;
logic deepslpen;
logic read_write_collision;

assign supply_monitor = (vddp_local == 1'b1)  ? 1'b1 : 1'b0;


always_comb begin

     
 shutoff_fw = shutoff | iso;

 ckgrid_fw = ckgrid & ~shutoff_fw & ~deepslp & ~sleep;
 rden_fw = rden & ~shutoff_fw & ~deepslp & ~sleep;
 wren_fw = wren & ~shutoff_fw & ~deepslp & ~sleep;
 
 adr_fw = adr & {ADDR{~shutoff_fw}} & {ADDR{~deepslp}};
 clkbyp_fw = clkbyp & ~shutoff_fw & ~deepslp;

 deepslpen = deepslp | shutoff | iso;
 
 wrbiten_b_fw = wrbiten_b & {BITS{~shutoff_fw}}  & {BITS{~deepslp}};
 datain_fw = datain & {BITS{~shutoff_fw}}  & {BITS{~deepslp}};

 sleep_fw = sleep & ~deepslp & ~shutoff;

end
   
//Performing a Write

//-----------------------------------------
//Latching the Write Enable
//-----------------------------------------

//lintra push -80094

`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(wren_fw_1l,wren_fw,~ckgrid_fw)
`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(rden_fw_1l,rden_fw,~ckgrid_fw)
`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(wrbiten_b_fw_1l,wrbiten_b_fw,~ckgrid_fw)
`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(adr_fw_1l,adr_fw,~ckgrid_fw)

`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(clkbyp_fw_1l,clkbyp_fw,~ckgrid_fw)

assign rden_clkbyp_1l = clkbyp_fw_1l & rden_fw_1l;

`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(rden_clkbyp_1h,rden_clkbyp_1l,ckgrid)

assign ckwren = wren_fw_1l & ckgrid_fw ;

assign ckrden =  ckgrid_fw & rden_fw_1l ;

`ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_LATCH(datain_fw_1l,datain_fw, ~ckgrid_fw)

logic wa_x;
logic wpulse_x;
logic wpulseen_x;


logic shutoff_x;
logic shutoff_x_pos;
logic iso_x;
logic iso_x_pos;
logic ckgrid_x;
//logic deepslp_x;
logic deepslp_x_pos;
logic sleep_x;
logic sleep_x_pos;
logic bc1_x;
logic bc2_x;
logic adr_x;
logic wrbiten_b_x;
logic wren_x;
logic rden_x;
logic clkbyp_x;
logic x_shutoff_array;
logic x_shutoff_rddata;
logic addr_out_of_range_error;
logic x_array;
logic x_array_adr, x_array_adr_clkbyp_cnt;
logic x_rddata, x_rddata_clkbyp_cnt;
logic chip_enable;
logic valid_write, valid_read;

//lintra push 2041
initial begin
    shutoff_x_pos = 0;
    iso_x_pos = 0;
    deepslp_x_pos = 0;
    sleep_x_pos = 0;	
    x_array_adr_clkbyp_cnt =0;
    x_rddata_clkbyp_cnt=0;
    end
//lintra pop

`ifndef INTC_NOXHANDLING

//--------------------------------
// Set valid write and read flags
//--------------------------------
//lintra push -0564, -50002, -50000, -60062, -8212, -1308, -1309, -60029, -60018
always @(ckgrid)
  begin
    if (ckgrid === 1'b1)
    begin
      valid_write <= (wren_fw_1l & ~deepslpen);
      valid_read  <= (rden_fw_1l & ~deepslpen);
    end
    else
    begin
      valid_write <= 1'b0;
      valid_read <= 1'b0;
    end
  end // always @ (ckgrid)


always @(valid_write or valid_read or shutoff or deepslp or sleep or iso)
  begin
     if ((((valid_write != 0) || valid_read !=0))  && shutoff) begin
`ifndef INTC_MEM_LINT // Required to prevent Lintra hangup
        assign shutoff_x_pos = 1'b1;
        $display ("-W- @ %0t Asynchronous change in the shutoff at clock high during Write or Read operation",$time);
`endif
     end
     else begin
`ifndef INTC_MEM_LINT // Required to prevent Lintra hangup
    assign shutoff_x_pos = 1'b0; 
`endif
     end

     if ((((valid_write != 0) || valid_read !=0) ) && sleep) begin
`ifndef INTC_MEM_LINT  // Required to prevent Lintra hangup
        assign sleep_x_pos = 1'b1;
        $display ("-W- @ %0t Asynchronous change in the sleep at clock high during Write or Read operation",$time);
`endif
     end
     else begin
`ifndef INTC_MEM_LINT  // Required to prevent Lintra hangup
        assign sleep_x_pos = 1'b0; //lintra s-8212
`endif
        end
     if ((valid_write != 0 ) && deepslp) begin
`ifndef INTC_MEM_LINT  // Required to prevent Lintra hangup
        assign deepslp_x_pos = 1'b1;
        $display ("-W- @ %0t Asynchronous change in the deepslp at clock high during Write or Read operation",$time);
`endif
     end
     else begin
`ifndef INTC_MEM_LINT  // Required to prevent Lintra hangup
     assign deepslp_x_pos = 1'b0; //lintra s-8212
`endif
     end
     if ((valid_write != 0 ) && iso) begin
`ifndef INTC_MEM_LINT  // Required to prevent Lintra hangup
        assign iso_x_pos = 1'b1;
        $display ("-W- @ %0t Asynchronous change in the isolation at clock high during Write or Read operation",$time);
`endif
     end
     else begin
`ifndef INTC_MEM_LINT  // Required to prevent Lintra hangup
     assign iso_x_pos = 1'b0;
`endif
     end
  end
   
//lintra pop


//Corrupting output if Address is out of Range
assign addr_out_of_range_error = 1'b0;

//Propagate X's when there is a collision

assign read_write_collision = ((rden_fw_1l === 1) && (wren_fw_1l === 1) && ckgrid_fw); //lintra s-2050


`ifndef INTC_MEM_LINT
always @(*) begin //lintra s-50000
        if(read_write_collision) begin
                read_corrupt = 1;
		write_corrupt = 1;
                @(negedge ckgrid);//lintra s-1257
                read_corrupt = 0;
		write_corrupt = 0;
        end
        else begin
                read_corrupt = 0;
		write_corrupt = 0;
        end
end

`endif

assign shutoff_x = $isunknown(shutoff); // Place holder for GLS signal for timing related violations
assign iso_x = $isunknown(iso);
assign ckgrid_x = $isunknown(ckgrid_fw);

assign clkbyp_x = $isunknown(clkbyp_fw_1l); 

//assign deepslp_x = $isunknown(deepslp_fw); //lintra s-0529;
assign sleep_x = $isunknown(sleep_fw);
assign bc1_x = $isunknown(bc1);
assign bc2_x = $isunknown(bc2);

assign wa_x = $isunknown(wa);
assign wpulse_x = $isunknown(wpulse);
assign wpulseen_x = $isunknown(wpulseen);

assign adr_x = $isunknown(adr_fw_1l);
assign wrbiten_b_x = $isunknown(wrbiten_b_fw_1l);
assign wren_x = $isunknown(wren_fw_1l);
assign rden_x = $isunknown(rden_fw_1l);

assign x_shutoff_array = (shutoff_x  || shutoff_x_pos || (iso_x && (ckgrid !==0) && ~deepslp) || ckgrid_x); //lintra s-0529
assign x_shutoff_rddata = (shutoff_x ||  ckgrid_x); 
assign x_array = ( (adr_x && (ckwren !==0)) || sleep_x_pos); //lintra s-0529

assign x_array_adr =  ( wren_x || ((sleep_x && wren_fw_1l) && (ckgrid_fw !== 0)) || ((write_corrupt || clkbyp_x || sleep_x) && (ckwren !==0)) || ((iso_x_pos || deepslp_x_pos)) || x_array_adr_clkbyp_cnt ); //lintra s-0529

assign x_rddata = ((rden_x || (sleep_x && rden_fw_1l))  && (ckgrid_fw !== 0)) || (iso_x && (ckgrid !==0)&& ~deepslp) || ((adr_x || (clkbyp_x && (rden_fw_1l !== 0)) || addr_out_of_range_error || read_corrupt || sleep_x) && (ckrden!==0)) || x_rddata_clkbyp_cnt; //lintra s-0529


`else
assign x_shutoff_array = 1'b0;
assign x_shutoff_rddata = 1'b0;
assign x_array = 1'b0;
assign x_array_adr = 1'b0;
assign x_rddata = 1'b0;
assign read_write_collision = 1'b0;

`endif

ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array ( .shutoff(shutoff),
                                                                                  .supply_monitor (supply_monitor),
                                                                                  .x_shutoff_array (x_shutoff_array),
//                                                                                  .x_shutoff_rddata (x_shutoff_rddata),
                                                                                  .x_array (x_array),
                                                                                  .x_array_adr (x_array_adr),
                                                                                  .datain (datain_fw_1l),
                                                                                  .wrbiten_b (wrbiten_b_fw_1l),
//                                                                                  .saclk (ckrden), 
                                                                                  .wrclk (ckwren),
                                                                                  .adr (adr_fw_1l),
										  .sleep_x_pos (sleep_x_pos),
//                                                                                  .x_rddata (x_rddata),
//                                                                                  .deepslpen (deepslpen), 
                                                                                  .dataout (saout)
);

logic [BITS-1:0] odout;
logic [BITS-1:0] odout_tmp;

`ifndef INTC_EMULATION
//always_ff @(negedge supply_monitor or posedge x_shutoff_rddata or posedge shutoff or posedge deepslpen or posedge read_write_collision or posedge ckrden or posedge x_rddata) 
always_latch
begin
		if (ckrden) 
                  begin
                        `ifdef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection
                        odout_tmp <= saout ^ ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array.DATA_ARRAY_f[adr_fw_1l];
                         `else
                         odout_tmp <= saout;
                         `endif                       

 
                  end
        else if (deepslpen)
            begin
                odout_tmp <= {BITS{1'b0}};
            end

end

always_latch
begin
             if (x_shutoff_rddata || (supply_monitor !==1) ) odout <= {BITS{1'bx}};  //lintra s-50002
             else if (shutoff || deepslpen) odout <= {BITS{1'b0}};
             else if (x_rddata) odout <= {BITS{1'bx}}; //lintra s-50002
             else if ((~clkbyp_fw && ckgrid_fw) || (clkbyp_fw && ~ckgrid_fw))  odout <= odout_tmp; //lintra s-50002

end

`else //In EMULATION

always_latch
begin
             if (ckrden) 
                  begin
                         odout_tmp <= saout;
                  end
             else if (deepslpen)
                begin
                        odout_tmp <= {BITS{1'b0}};
                end
end
always_latch
begin
             if (shutoff || deepslpen) odout <= {BITS{1'b0}};
             else if ((~clkbyp_fw && ckgrid_fw) || (clkbyp_fw && ~ckgrid_fw))  odout <= odout_tmp; //lintra s-50002
end


`endif

assign dataout = odout;


   
`ifndef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_SVA_OFF

assign chip_enable = ((shutoff ===0) && (iso===0) && (sleep===0) && (deepslp===0));

always_comb begin
        if( (chip_enable) && ($isunknown(adr_fw_1l) === 0) && ($isunknown(rden_fw_1l)===0) && ckgrid_fw ) begin

rdaddrp0_fw_range_error: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_RANGE((adr_fw_1l[(ADDR - 1):0] & {(ADDR){(rden_fw_1l)}}),0, (ENTRIES - 1),0)
                            `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h:rdaddr out of range %t",$time);
                            
        end
        if( (chip_enable) && ($isunknown(adr_fw_1l) === 0) && ($isunknown(wren_fw_1l)===0) && ckgrid_fw ) begin

wraddrp0_fw_range_error: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_RANGE((adr_fw_1l[(ADDR - 1):0] & {(ADDR){(wren_fw_1l)}}),0, (ENTRIES - 1),0)
                            `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h:wraddr out of range %t",$time);
                            
        end     
end



x_ckgridm1n00: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(ckgrid) && chip_enable,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Clock to the IP can't be X when IP is enabled. The Array content and the read data will be corrupted",$time);

x_firewall: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(iso) && (shutoff === 0)&&(deepslp===0),0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d : Firewall signals can't be X when power is enabled. The Array content and the read data will be corrupted",$time);

x_pwrenin_b: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(shutoff) ,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Power enable to the IP can't be an X.",$time);

x_slp_modes: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN(($isunknown(sleep) && (rden_fw_1l | wren_fw_1l)),0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Asynchronous Sleep signals to the IP can't be an X when the IP is enabled.",$time);

x_write_addr: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(adr_fw_1l) && ckgrid && wren_fw_1l && (|(~wrbiten_b_fw_1l)) && chip_enable ,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Address being an X with wrenp0 and write bit enabled will cause array to be an X",$time);

x_read_addr: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(adr_fw_1l) && ckgrid && rden_fw_1l && chip_enable,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Address being an X with rdenp0 enabled will cause array output to be an X",$time);

x_wbe: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(wrbiten_b_fw_1l) && ckgrid && wren_fw_1l && chip_enable ,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Atleast one bit of wrbit enable bus is a X",$time);

x_slpbias_bitcellslp: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(bc1| bc2) && sleep && chip_enable,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  slpbias being an X with bitcellslp will cause array to leak away with time. Array content will be unknown X",$time);

x_wren: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(wren_fw_1l) && ckgrid && (|(~wrbiten_b_fw_1l)) && chip_enable ,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Write enable being X & wrbit enable 0 address will be written with an X",$time);

x_rden: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(rden_fw_1l) && ckgrid && chip_enable ,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Read enable being X & wrbit enable 0 address will be written with an X",$time);
                             
x_mce: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(mce) && ckgrid && chip_enable && (rden_fw_1l || wren_fw_1l) && (clkbyp == 0),0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  MCE is a X",$time);
                             
//x_wmce: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(wmce) && ckgrid && chip_enable && wren_fw && (clkbyp == 0) && mce ,0)
//                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  WMCE is a X",$time);
                             
x_mc: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(mc) && ckgrid && chip_enable && rden_fw && (clkbyp == 0) && mce,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  MC is a X",$time);

x_clkbyp: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(clkbyp_fw_1l) && ckgrid && chip_enable && (rden_fw_1l || wren_fw_1l),0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  CLKBYP is a X",$time);



////////Collision/////

rd_wr_collision: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN (((rden_fw_1l === 1) && (wren_fw_1l === 1) && ckgrid_fw),0)
                            `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h:Read Write collision %t",$time);                         



`endif //INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_SVA_OFF


//--------------------------------
// Default fuse checking
//--------------------------------

//lintra push -0564, -50002, -50000
initial
  begin
     `ifndef INTC_MEM_LINT //Required to prevent Lintra Hangup
     #1;
     if ( wpulse[1:0] !== `INTC_MEM_ip222uhd1p11sram_WPULSE_DEFAULT ) begin
        $display (" -W- %m : @ %0t : Write assist Pulse width & Write assist bias settings are different from default. The writes may or maynot complete",$time); //lintra s-1308, s-1309
     end

     if ( wa[1:0] !== `INTC_MEM_ip222uhd1p11sram_WA_DEFAULT ) begin 
        $display (" -W- %m : @ %0t :  Write assist bias settings are different from default. The writes may or maynot complete",$time); //lintra s-1308, s-1309
     end

    `endif
  end
//lintra pop


//==========================================================
// Power Aware Verilog (PAV)
//==========================================================
`ifndef INTC_MEM_LINT
 `ifndef INTC_MEM_EF_MODE
  `ifndef INTC_NO_PWR_PINS

event case_10;
event case_q0;
event case_qq;

   always @(vddp or vss)
  begin
    casez ({vddp,vss})
      3'b10: begin // All power ON

     -> case_10;
        release dataout;
        release wren;
        release rden;

      end

      3'b?0: begin // SOC = X, SOCGT = X, 

     -> case_q0;
         force supply_monitor = 1'b0;
        
      end

      3'b??: begin // SOC = X, SOCGT = X, 
 
    -> case_qq;
         force supply_monitor = 1'b0;

        
      end

     default: begin
        release dataout;
        release supply_monitor;


    end
    endcase
  end
   
  `endif //INTC_NO_PWR_PINS
 `endif //INTC_MEM_EF_MODE
`endif //INTC_MEM_LINT
   
   

                                                                             
endmodule // ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod



//--------------------------------------------------------------------------------------------------------------------------------------------

`celldefine
//lintra push -68099
module ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h (//lintra s-68000
   input clk,             		//Input Clock
   input ren,                    	//Read Enable
   input wen,                    	//Write Enable
   input [10:0] adr,         //Input Address
   input [2:0] mc,     		//Controls extending write duration
//   input [2:0] mc,     		//Controls extending write duration
   input mcen,     			//Enable read margin control 

   input clkbyp,                   	//clock bypass enable  
   input [31:0] din,       //Input Write Data 


   input [1:0] wa,
   input [1:0] wpulse,
   input wpulseen,
   input fwen,




`ifndef INTC_NO_PWR_PINS
   input              vddp,
   inout              vss,
`endif


   output [31:0]    q
);

localparam BITS =  32;
localparam ENTRIES = 2048;
localparam ADDR = 11;

//Array Initialization
`ifndef INTC_MEM_LINT
`ifndef INTC_MEM_EF_MODE
   task INTC_MEM_INIT; //lintra s-81061                        
      input [`INTC_MEM_PATH_SIZE*8:0] infile;


     begin
         $readmemh(infile, ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array.DATA_ARRAY);        
      end

   endtask
`endif //INTC_MEM_EF_MODE
`endif // INTC_MEM_LINT
//lintra pop





ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod (
`ifndef INTC_NO_PWR_PINS
   .vddp (vddp),
   .vss (vss),
`endif

	.ckgrid              (clk),
	.rden     	     (ren),
	.wren     	     (wen),
	.adr     	     (adr),

	.mce       	     (mcen),
//	.wmce       	     (mc),
	.mc       	     (mc),			


	.sleep         (1'b0),
	.bc2           (1'b0),
    	.bc1	       (1'b0),
	.deepslp	    (1'b0),
	.shutoff	    (1'b0),

	.iso    	    (fwen),
	.datain	    (din),
	.clkbyp		    (clkbyp),		
	.wrbiten_b	    ({32{1'b0}}),
    .wa             (wa),
    .wpulse         (wpulse),
    .wpulseen       (wpulseen),


	.dataout	    (q)
);
//lintra pop

   endmodule // ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h
`endcelldefine




