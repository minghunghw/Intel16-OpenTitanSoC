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
    `ifndef INTC_FUNCTIONAL
    input errorslp,
    `endif
    input  x_shutoff_array,
//    input  x_shutoff_rddata,
    input  x_array,
    input  x_array_adr,    
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
`ifdef INTC_FUNCTIONAL
                                       if(sleep_x_pos == 1) begin
                                                   DATA_ARRAY[entry] <= {BITS{1'bx}};  //lintra s-50002

                                        end     
`else    
                                       if(errorslp == 1) begin
                                                   DATA_ARRAY[entry] <=   {BITS{1'bx}};   //lintra s-50002

                                        end
`endif
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

   input ckgrid,	     		//Input Clock
   input rden,		    	//Read Enable
   input wren,		    	//Write Enable
   input [ADDR-1:0] adr,         	//Input Address

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


   input erroriso,
   input errorwa,
   input errorwpulse,
   input errorwpulseen,
    input errorrenp0,
    input errorwenp0,
    input erroradr0,
    input [BITS-1:0] errordinp,
    input errorclkw,
    input errorclkp,
    input errorslp,
    input errordeepslp,
    input errorshutoff,
    input errorclkbyp,
    //input errormce,
    //input errorrmce,
    //input errorwmce,
    input [BITS-1:0] errorsegp,
    



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

genvar bit_en;

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
//Flopping a Write Enable
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

`ifdef INTC_FUNCTIONAL
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
`endif //INTC_FUNCTIONAL


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


`ifdef INTC_FUNCTIONAL
logic wrbiten_b_x;

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
logic [31:0] idin_x;
logic [31:0] wrbiten_b_x;

assign shutoff_x = $isunknown(shutoff) || errorshutoff; // Place holder for GLS signal for timing related violations
assign iso_x = $isunknown(iso) || erroriso;
assign ckgrid_x = $isunknown(ckgrid_fw);

assign clkbyp_x = $isunknown(clkbyp_fw_1l) || errorclkbyp; 

//assign deepslp_x = $isunknown(deepslp_fw) || errordeepslp;
assign sleep_x = $isunknown(sleep_fw) || errorslp;
assign bc1_x = $isunknown(bc1);
assign bc2_x = $isunknown(bc2);

assign wa_x = $isunknown(wa) || errorwa ;
assign wpulse_x = $isunknown(wpulse) || errorwpulse ;
assign wpulseen_x = $isunknown(wpulseen) || errorwpulseen;

assign adr_x = $isunknown(adr_fw_1l) || erroradr0;

assign wren_x = $isunknown(wren_fw_1l) || errorwenp0;
assign rden_x = $isunknown(rden_fw_1l) || errorrenp0;

assign x_shutoff_array = (shutoff_x  || errorslp || (iso_x && (ckgrid !==0)) || ckgrid_x || errorclkw || errorclkp);
assign x_shutoff_rddata = (shutoff_x ||  ckgrid_x || errorclkw || errorclkp); 
assign x_array = ( (adr_x && (ckwren !==0)) || errorslp);

assign x_array_adr =  (( wren_x || (sleep_x && wren_fw_1l)) && (ckgrid_fw !== 0)) || ((write_corrupt || clkbyp_x || sleep_x) && (ckwren !==0)) || erroriso || errordeepslp || x_array_adr_clkbyp_cnt ;

assign x_rddata = ((rden_x || (sleep_x && rden_fw_1l))  && (ckgrid_fw !== 0)) || (iso_x && (ckgrid !==0)) || ((adr_x || (clkbyp_x && (rden_fw_1l !== 0)) || addr_out_of_range_error || read_corrupt || sleep_x) && (ckrden !==0)) || x_rddata_clkbyp_cnt; //lintra s-0529

for(bit_en=0;bit_en<BITS; bit_en++) begin
  assign wrbiten_b_x[bit_en] = $isunknown(wrbiten_b_fw_1l[bit_en]) || (errorsegp[bit_en]);
  assign idin_x[bit_en] = $isunknown(datain_fw_1l[bit_en]) || errordinp[bit_en] ;
end

`endif //INTC_FUNCTIONAL

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
                                                                                  .datain  (datain_fw_1l),
                                                                                  .wrbiten_b (wrbiten_b_fw_1l),
//                                                                                  .saclk (ckrden), 
                                                                                  .wrclk (ckwren),
                                                                                  .adr (adr_fw_1l),
										  .sleep_x_pos (sleep_x_pos),
`ifndef INTC_FUNCTIONAL
										  .errorslp (errorslp),
`endif
//                                                                                  .x_rddata (x_rddata),
//                                                                                  .deepslpen (deepslpen), 
                                                                                  .dataout (saout)
);


logic [BITS-1:0] odout;
logic [BITS-1:0] odout_tmp;

`ifndef INTC_EMULATION
//always_ff @(negedge supply_monitor or posedge x_shutoff_rddata or posedge deepslpen or posedge read_write_collision or posedge ckrden or posedge x_rddata) 
always_latch
begin

 if (ckrden) 
                  begin
                        `ifdef INTC_MEM_ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_fault_injection
                        odout_tmp <= saout ^ ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_array.DATA_ARRAY_f[adr_fw_1l];
                         `else
                         odout_tmp <= saout;
                         `endif                       
                     //$display("At time %t, ckrden is %d", $time,ckrden);
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

x_write_addr: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(adr_fw_1l) && ckgrid && wren && (|(~wrbiten_b_fw_1l)) && chip_enable ,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Address being an X with wrenp0 and write bit enabled will cause array to be an X",$time);

x_read_addr: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(adr_fw_1l) && ckgrid && rden && chip_enable,0)
                             `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ERR_MSG("-E- :  @ %0d :  Address being an X with rdenp0 enabled will cause array output to be an X",$time);

x_wbe: `ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_ASSERT_FORBIDDEN($isunknown(wrbiten_b_fw_1l) && ckgrid && wren && chip_enable ,0)
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
        $display (" -W- %m : @ %0t : Write assist Pulse width & Write assist bias settings are different from default. The writes may or maynot complete",$time);
     end

     if ( wa[1:0] !== `INTC_MEM_ip222uhd1p11sram_WA_DEFAULT ) begin
        $display (" -W- %m : @ %0t :  Write assist bias settings are different from default. The writes may or maynot complete",$time
);
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

   input clk,                          //Input Clock
   input ren,                          //Read Enable
   input wen,                          //Write Enable
   input [10:0] adr,         //Input Address
   input [2:0] mc,                   //Controls extending write duration
//   input [2:0] mc,                   //Controls extending write duration
   input mcen,                          //Enable read margin control 

   input clkbyp,                       //clock bypass enable  
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
`endif //INTC_MEM_LINT
//lintra pop


reg errorRENP0,errorWENP0,errorADR0,errorCLKW,errorCLKP,errorSHUTOFF,errorSLP,errorDEEPSLP,errorBC1,errorBC2,errorCLKBYP,errorMCE,errorMC;
reg errorrenp0,errorwenp0,erroradr0,errorclkw,errorclkp,errorshutoff,errorslp,errordeepslp,errorbc1,errorbc2,errorclkbyp,errormce,errormc;
reg errorFWEN, errorWA, errorWPULSE, errorWPULSEEN;
reg errorfwen, errorwa, errorwpulse, errorwpulseen;


reg errorDINP0; 
reg errorDINP1; 
reg errorDINP2; 
reg errorDINP3; 
reg errorDINP4; 
reg errorDINP5; 
reg errorDINP6; 
reg errorDINP7; 
reg errorDINP8; 
reg errorDINP9; 
reg errorDINP10; 
reg errorDINP11; 
reg errorDINP12; 
reg errorDINP13; 
reg errorDINP14; 
reg errorDINP15; 
reg errorDINP16; 
reg errorDINP17; 
reg errorDINP18; 
reg errorDINP19; 
reg errorDINP20; 
reg errorDINP21; 
reg errorDINP22; 
reg errorDINP23; 
reg errorDINP24; 
reg errorDINP25; 
reg errorDINP26; 
reg errorDINP27; 
reg errorDINP28; 
reg errorDINP29; 
reg errorDINP30; 
reg errorDINP31; 
reg [31:0] errordinp;


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
        .bc1           (1'b0),
        .deepslp            (1'b0),
        .shutoff            (1'b0),
        .errorslp (1'b0),
        .errordeepslp (1'b0),
        .errorshutoff (1'b0),
	.iso    	    (fwen),
	.datain	    (din),
	.clkbyp		    (clkbyp),		

     .wrbiten_b          ({32{1'b0}}),
      .errorsegp ({32{1'b0}}),
    .wa             (wa),
    .wpulse         (wpulse),
    .wpulseen       (wpulseen),

    .errorrenp0 (errorrenp0),
    .errorwenp0 (errorwenp0),
    .erroradr0 (erroradr0),
    .errordinp (errordinp),
    .errorclkw (errorclkw),
    .errorclkp (errorclkp),
    
    .errorclkbyp (errorclkbyp),
    //.errormce (errormce),
    //.errorrmce (errorrmce),
    //.errorwmce (errorwmce), 
    
    .erroriso (errorfwen),
    .errorwa  (errorwa),
    .errorwpulse (errorwpulse),
    .errorwpulseen (errorwpulseen),

	.dataout	    (q)
);




logic selftimed_no_mcen, selftimed_TM0, selftimed_TM1, selftimed_TM2, selftimed_TM3, selftimed_TM4, selftimed_TM5, selftimed_TM6, selftimed_TM7;
logic selftimed_rd_mce0, selftimed_rd_tm0, selftimed_rd_tm1, selftimed_rd_tm2, selftimed_rd_tm3, selftimed_rd_tm4, selftimed_rd_tm5, selftimed_rd_tm6, selftimed_rd_tm7;


 

assign selftimed_TM0 =  (mcen === 1) && (mc[2] !== 1) && (mc[1] !== 1) && (mc[0] !== 1);
assign selftimed_TM1 =  (mcen === 1) && (mc[2] !== 1) && (mc[1] !== 1) && (mc[0] === 1);
assign selftimed_TM2 =  (mcen === 1) && (mc[2] !== 1) && (mc[1] === 1) && (mc[0] !== 1);
assign selftimed_TM3 =  (mcen === 1) && (mc[2] !== 1) && (mc[1] === 1) && (mc[0] === 1);
assign selftimed_TM4 =  (mcen === 1) && (mc[2] === 1) && (mc[1] !== 1) && (mc[0] !== 1);
assign selftimed_TM5 =  (mcen === 1) && (mc[2] === 1) && (mc[1] !== 1) && (mc[0] === 1);
assign selftimed_TM6 =  (mcen === 1) && (mc[2] === 1) && (mc[1] === 1) && (mc[0] !== 1);
assign selftimed_TM7 =  (mcen === 1) && (mc[2] === 1) && (mc[1] === 1) && (mc[0] === 1);
assign selftimed_no_mcen =  (mcen !== 1);

assign selftimed_rd_mce0 = (fwen !== 1) && (ren ===1 ) && (mcen !== 1);
assign selftimed_rd_tm0 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] !== 1) && (mc[1] !== 1) && (mc[0] !== 1);
assign selftimed_rd_tm1 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] !== 1) && (mc[1] !== 1) && (mc[0] === 1);
assign selftimed_rd_tm2 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] !== 1) && (mc[1] === 1) && (mc[0] !== 1);
assign selftimed_rd_tm3 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] !== 1) && (mc[1] === 1) && (mc[0] === 1);
assign selftimed_rd_tm4 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] === 1) && (mc[1] !== 1) && (mc[0] !== 1);
assign selftimed_rd_tm5 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] === 1) && (mc[1] !== 1) && (mc[0] === 1);
assign selftimed_rd_tm6 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] === 1) && (mc[1] === 1) && (mc[0] !== 1);
assign selftimed_rd_tm7 =  (fwen !== 1) && (ren ===1 ) && (mcen === 1) && (mc[2] === 1) && (mc[1] === 1) && (mc[0] === 1);

`ifndef INTC_FUNCTIONAL
// **************************************************
// ********** Timing checks ***
// **************************************************

specify

`ifndef INTC_MEM_LINT 

specparam               taccrp0     = 0.01:0.01:0.01;//Read access time rise 
specparam               taccfp0     = 0.01:0.01:0.01;//Read access time fall
                
specparam               trdaddrp0_sr     = 0.00:0.00:0.00;//Setup time read addr to posedge CLK
specparam               trdaddrp0_sf     = 0.00:0.00:0.00;//Setup time read addr to posedge CLK
specparam               trdaddrp0_hr   = 0.00:0.00:0.00;//Hold time read addr from positive edge of the clock
specparam               trdaddrp0_hf     = 0.00:0.00:0.00;//Hold time read addr from positive edge of the clock
                
specparam               trdenp0_sr       = 0.00:0.00:0.00;//Setup time read enable to posedge CLK
specparam               trdenp0_sf       = 0.00:0.00:0.00;//Setup time read enable to posedge CLK
specparam               trdenp0_hr       = 0.00:0.00:0.00;//Hold time read enable from positive edge of the clock
specparam               trdenp0_hf       = 0.00:0.00:0.00;//Hold time read enable from positive edge of the clock
        
specparam               twrenp0_sr       = 0.00:0.00:0.00;//Setup time write enable to posedge CLK
specparam               twrenp0_sf       = 0.00:0.00:0.00;//Setup time write enable to posedge CLK
specparam               twrenp0_hr       = 0.00:0.00:0.00;//Hold time write enable from positive edge of the clock
specparam               twrenp0_hf       = 0.00:0.00:0.00;//Hold time write enable from positive edge of the clock
                                
specparam               tdatinp0_sr       = 0.00:0.00:0.00;//Setup time   datin to posedge CLK
specparam               tdatinp0_sf       = 0.00:0.00:0.00;//Setup time datin to posedge CLK
specparam               tdatinp0_hr       = 0.00:0.00:0.00;//Hold time datin from positive edge of the clock
specparam               tdatinp0_hf       = 0.00:0.00:0.00;//Hold time datin from positive edge of the clock


	        
specparam               tclkbyp_sr = 0.00:0.00:0.00;//Setup time clkbyp enable to posedge CLK
specparam               tclkbyp_hf = 0.00:0.00:0.00;//Hold time clkbyp enable to posedge CLK
        
specparam               tmc_sr = 0.00:0.00:0.00;//Setup time rmce enable to posedge CLK
specparam               tmc_hf = 0.00:0.00:0.00;//Hold time rmce enable to posedge CLK


specparam               tmce_sr = 0.00:0.00:0.00;//Setup time rmce enable to posedge CLK
specparam               tmce_hf = 0.00:0.00:0.00;//Hold time rmce enable to posedge CLK



specparam               twpulseen_sr = 0.00:0.00:0.00;//Setup time wpulseen enable to chip wrenable
specparam               twpulseen_hf = 0.00:0.00:0.00;//Hold time wpulseen enable to chip wrenable

specparam               twpulse_sr = 0.00:0.00:0.00;//Setup time wpulse enable to chip wrenable
specparam               twpulse_hf = 0.00:0.00:0.00;//Hold time wpulse enable to chip wrenable

specparam               twa_sr = 0.00:0.00:0.00;//Setup time wa enable to chip wrenable
specparam               twa_hf = 0.00:0.00:0.00;//Hold time wa enable to chip wrenable

specparam               tfwen_sr = 0.00:0.00:0.00;//Setup time fwen enable to chip enable
specparam               tfwen_hf = 0.00:0.00:0.00;//Hold time fwen enable to chip enable

specparam               tclkw_l   = 0.00:0.00:0.00;//Low phase width of clock
specparam               tclkw_h   = 0.00:0.00:0.00;//High phase width of clock
specparam               tclkp     = 0.00:0.00:0.00;//Period of clock

`endif




if(selftimed_rd_mce0)    (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[0] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[0])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[1] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[1])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[2] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[2])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[3] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[3])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[4] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[4])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[5] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[5])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[6] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[6])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[7] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[7])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[8] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[8])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[9] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[9])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[10] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[10])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[11] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[11])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[12] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[12])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[13] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[13])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[14] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[14])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[15] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[15])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[16] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[16])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[17] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[17])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[18] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[18])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[19] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[19])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[20] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[20])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[21] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[21])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[22] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[22])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[23] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[23])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[24] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[24])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[25] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[25])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[26] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[26])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[27] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[27])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[28] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[28])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[29] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[29])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[30] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[30])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;

if(selftimed_rd_mce0)    (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm0)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm1)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm2)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm3)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm4)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm5)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm6)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(selftimed_rd_tm7)     (posedge clk => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (taccrp0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;
if(fwen)                 (posedge fwen => (q[31] : ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_bmod.dataout[31])) = (0, taccfp0, 0, 0, 0, 0);//0-1 and 1-0;


$setuphold(posedge clk, posedge ren, trdenp0_sr, trdenp0_hr, errorRENP0);
$setuphold(posedge clk, negedge ren, trdenp0_sf, trdenp0_hf, errorRENP0);

$setuphold(posedge clk, posedge wen, twrenp0_sr, twrenp0_hr, errorWENP0);
$setuphold(posedge clk, negedge wen, twrenp0_sf, twrenp0_hf, errorWENP0);

$setuphold(posedge clk, posedge adr[0], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[0], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[0], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[0], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[1], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[1], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[1], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[1], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[2], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[2], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[2], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[2], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[3], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[3], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[3], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[3], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[4], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[4], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[4], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[4], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[5], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[5], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[5], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[5], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[6], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[6], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[6], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[6], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[7], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[7], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[7], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[7], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[8], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[8], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[8], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[8], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[9], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[9], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[9], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[9], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[10], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[10], trdaddrp0_sf, trdaddrp0_hf, errorADR0);
$setuphold(posedge clk, posedge adr[10], trdaddrp0_sr, trdaddrp0_hr, errorADR0);
$setuphold(posedge clk, negedge adr[10], trdaddrp0_sf, trdaddrp0_hf, errorADR0);

$setuphold(posedge clk, posedge din[0], tdatinp0_sr, tdatinp0_hr, errorDINP0);
$setuphold(posedge clk, negedge din[0], tdatinp0_sf, tdatinp0_hf, errorDINP0);
$setuphold(posedge clk, posedge din[1], tdatinp0_sr, tdatinp0_hr, errorDINP1);
$setuphold(posedge clk, negedge din[1], tdatinp0_sf, tdatinp0_hf, errorDINP1);
$setuphold(posedge clk, posedge din[2], tdatinp0_sr, tdatinp0_hr, errorDINP2);
$setuphold(posedge clk, negedge din[2], tdatinp0_sf, tdatinp0_hf, errorDINP2);
$setuphold(posedge clk, posedge din[3], tdatinp0_sr, tdatinp0_hr, errorDINP3);
$setuphold(posedge clk, negedge din[3], tdatinp0_sf, tdatinp0_hf, errorDINP3);
$setuphold(posedge clk, posedge din[4], tdatinp0_sr, tdatinp0_hr, errorDINP4);
$setuphold(posedge clk, negedge din[4], tdatinp0_sf, tdatinp0_hf, errorDINP4);
$setuphold(posedge clk, posedge din[5], tdatinp0_sr, tdatinp0_hr, errorDINP5);
$setuphold(posedge clk, negedge din[5], tdatinp0_sf, tdatinp0_hf, errorDINP5);
$setuphold(posedge clk, posedge din[6], tdatinp0_sr, tdatinp0_hr, errorDINP6);
$setuphold(posedge clk, negedge din[6], tdatinp0_sf, tdatinp0_hf, errorDINP6);
$setuphold(posedge clk, posedge din[7], tdatinp0_sr, tdatinp0_hr, errorDINP7);
$setuphold(posedge clk, negedge din[7], tdatinp0_sf, tdatinp0_hf, errorDINP7);
$setuphold(posedge clk, posedge din[8], tdatinp0_sr, tdatinp0_hr, errorDINP8);
$setuphold(posedge clk, negedge din[8], tdatinp0_sf, tdatinp0_hf, errorDINP8);
$setuphold(posedge clk, posedge din[9], tdatinp0_sr, tdatinp0_hr, errorDINP9);
$setuphold(posedge clk, negedge din[9], tdatinp0_sf, tdatinp0_hf, errorDINP9);
$setuphold(posedge clk, posedge din[10], tdatinp0_sr, tdatinp0_hr, errorDINP10);
$setuphold(posedge clk, negedge din[10], tdatinp0_sf, tdatinp0_hf, errorDINP10);
$setuphold(posedge clk, posedge din[11], tdatinp0_sr, tdatinp0_hr, errorDINP11);
$setuphold(posedge clk, negedge din[11], tdatinp0_sf, tdatinp0_hf, errorDINP11);
$setuphold(posedge clk, posedge din[12], tdatinp0_sr, tdatinp0_hr, errorDINP12);
$setuphold(posedge clk, negedge din[12], tdatinp0_sf, tdatinp0_hf, errorDINP12);
$setuphold(posedge clk, posedge din[13], tdatinp0_sr, tdatinp0_hr, errorDINP13);
$setuphold(posedge clk, negedge din[13], tdatinp0_sf, tdatinp0_hf, errorDINP13);
$setuphold(posedge clk, posedge din[14], tdatinp0_sr, tdatinp0_hr, errorDINP14);
$setuphold(posedge clk, negedge din[14], tdatinp0_sf, tdatinp0_hf, errorDINP14);
$setuphold(posedge clk, posedge din[15], tdatinp0_sr, tdatinp0_hr, errorDINP15);
$setuphold(posedge clk, negedge din[15], tdatinp0_sf, tdatinp0_hf, errorDINP15);
$setuphold(posedge clk, posedge din[16], tdatinp0_sr, tdatinp0_hr, errorDINP16);
$setuphold(posedge clk, negedge din[16], tdatinp0_sf, tdatinp0_hf, errorDINP16);
$setuphold(posedge clk, posedge din[17], tdatinp0_sr, tdatinp0_hr, errorDINP17);
$setuphold(posedge clk, negedge din[17], tdatinp0_sf, tdatinp0_hf, errorDINP17);
$setuphold(posedge clk, posedge din[18], tdatinp0_sr, tdatinp0_hr, errorDINP18);
$setuphold(posedge clk, negedge din[18], tdatinp0_sf, tdatinp0_hf, errorDINP18);
$setuphold(posedge clk, posedge din[19], tdatinp0_sr, tdatinp0_hr, errorDINP19);
$setuphold(posedge clk, negedge din[19], tdatinp0_sf, tdatinp0_hf, errorDINP19);
$setuphold(posedge clk, posedge din[20], tdatinp0_sr, tdatinp0_hr, errorDINP20);
$setuphold(posedge clk, negedge din[20], tdatinp0_sf, tdatinp0_hf, errorDINP20);
$setuphold(posedge clk, posedge din[21], tdatinp0_sr, tdatinp0_hr, errorDINP21);
$setuphold(posedge clk, negedge din[21], tdatinp0_sf, tdatinp0_hf, errorDINP21);
$setuphold(posedge clk, posedge din[22], tdatinp0_sr, tdatinp0_hr, errorDINP22);
$setuphold(posedge clk, negedge din[22], tdatinp0_sf, tdatinp0_hf, errorDINP22);
$setuphold(posedge clk, posedge din[23], tdatinp0_sr, tdatinp0_hr, errorDINP23);
$setuphold(posedge clk, negedge din[23], tdatinp0_sf, tdatinp0_hf, errorDINP23);
$setuphold(posedge clk, posedge din[24], tdatinp0_sr, tdatinp0_hr, errorDINP24);
$setuphold(posedge clk, negedge din[24], tdatinp0_sf, tdatinp0_hf, errorDINP24);
$setuphold(posedge clk, posedge din[25], tdatinp0_sr, tdatinp0_hr, errorDINP25);
$setuphold(posedge clk, negedge din[25], tdatinp0_sf, tdatinp0_hf, errorDINP25);
$setuphold(posedge clk, posedge din[26], tdatinp0_sr, tdatinp0_hr, errorDINP26);
$setuphold(posedge clk, negedge din[26], tdatinp0_sf, tdatinp0_hf, errorDINP26);
$setuphold(posedge clk, posedge din[27], tdatinp0_sr, tdatinp0_hr, errorDINP27);
$setuphold(posedge clk, negedge din[27], tdatinp0_sf, tdatinp0_hf, errorDINP27);
$setuphold(posedge clk, posedge din[28], tdatinp0_sr, tdatinp0_hr, errorDINP28);
$setuphold(posedge clk, negedge din[28], tdatinp0_sf, tdatinp0_hf, errorDINP28);
$setuphold(posedge clk, posedge din[29], tdatinp0_sr, tdatinp0_hr, errorDINP29);
$setuphold(posedge clk, negedge din[29], tdatinp0_sf, tdatinp0_hf, errorDINP29);
$setuphold(posedge clk, posedge din[30], tdatinp0_sr, tdatinp0_hr, errorDINP30);
$setuphold(posedge clk, negedge din[30], tdatinp0_sf, tdatinp0_hf, errorDINP30);
$setuphold(posedge clk, posedge din[31], tdatinp0_sr, tdatinp0_hr, errorDINP31);
$setuphold(posedge clk, negedge din[31], tdatinp0_sf, tdatinp0_hf, errorDINP31);

$setuphold(posedge clk, posedge wpulseen, twpulseen_sr, twpulseen_hf, errorWPULSEEN);
$setuphold(posedge clk, negedge wpulseen, twpulseen_sr, twpulseen_hf, errorWPULSEEN);
$setuphold(posedge clk, posedge wpulse[0], twpulse_sr, twpulse_hf, errorWPULSE);
$setuphold(posedge clk, negedge wpulse[0], twpulse_sr, twpulse_hf, errorWPULSE);
$setuphold(posedge clk, posedge wpulse[1], twpulse_sr, twpulse_hf, errorWPULSE);
$setuphold(posedge clk, negedge wpulse[1], twpulse_sr, twpulse_hf, errorWPULSE);
$setuphold(posedge clk, posedge wa[0], twa_sr, twa_hf, errorWA);
$setuphold(posedge clk, negedge wa[0], twa_sr, twa_hf, errorWA);
$setuphold(posedge clk, posedge wa[1], twa_sr, twa_hf, errorWA);
$setuphold(posedge clk, negedge wa[1], twa_sr, twa_hf, errorWA);
$setuphold(posedge clk, posedge mc[0], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, negedge mc[0], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, posedge mc[1], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, negedge mc[1], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, posedge mc[2], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, negedge mc[2], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, posedge mc[0], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, negedge mc[0], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, posedge mc[1], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, negedge mc[1], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, posedge mc[2], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, negedge mc[2], tmc_sr, tmc_hf, errorMC);
$setuphold(posedge clk, posedge clkbyp, tclkbyp_sr, tclkbyp_hf, errorCLKBYP);
$setuphold(posedge clk, negedge clkbyp, tclkbyp_sr, tclkbyp_hf, errorCLKBYP);
$setuphold(posedge clk, posedge clkbyp, tclkbyp_sr, tclkbyp_hf, errorCLKBYP);
$setuphold(posedge clk, negedge clkbyp, tclkbyp_sr, tclkbyp_hf, errorCLKBYP);
$setuphold(posedge clk, posedge mcen, tmce_sr, 0, errorMCE);
$setuphold(posedge clk, negedge mcen, 0, tmce_hf, errorMCE);
$setuphold(posedge clk, posedge mcen, tmce_sr, 0, errorMCE);
$setuphold(posedge clk, negedge mcen, 0, tmce_hf, errorMCE);
$setuphold(posedge clk, posedge fwen, tfwen_sr, tfwen_hf, errorFWEN);
$setuphold(posedge clk, negedge fwen, tfwen_sr, tfwen_hf, errorFWEN);
$width(negedge clk &&& selftimed_no_mcen, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_no_mcen, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_no_mcen,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM0, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM0, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM0,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM1, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM1, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM1,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM2, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM2, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM2,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM3, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM3, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM3,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM4, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM4, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM4,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM5, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM5, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM5,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM6, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM6, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM6,tclkp,errorCLKP);
$width(negedge clk &&& selftimed_TM7, tclkw_l,0,errorCLKW);
$width(posedge clk &&& selftimed_TM7, tclkw_h,0,errorCLKW);
$period(posedge clk &&& selftimed_TM7,tclkp,errorCLKP);



endspecify

`ifndef INTC_MEM_LINT

always @(errorRENP0)errorrenp0 = 1'b1;
always @(errorWENP0)errorwenp0 = 1'b1;
always @(errorADR0)erroradr0 = 1'b1;
always @(errorDINP0)errordinp[0] = 1'b1; 
always @(errorDINP1)errordinp[1] = 1'b1; 
always @(errorDINP2)errordinp[2] = 1'b1; 
always @(errorDINP3)errordinp[3] = 1'b1; 
always @(errorDINP4)errordinp[4] = 1'b1; 
always @(errorDINP5)errordinp[5] = 1'b1; 
always @(errorDINP6)errordinp[6] = 1'b1; 
always @(errorDINP7)errordinp[7] = 1'b1; 
always @(errorDINP8)errordinp[8] = 1'b1; 
always @(errorDINP9)errordinp[9] = 1'b1; 
always @(errorDINP10)errordinp[10] = 1'b1; 
always @(errorDINP11)errordinp[11] = 1'b1; 
always @(errorDINP12)errordinp[12] = 1'b1; 
always @(errorDINP13)errordinp[13] = 1'b1; 
always @(errorDINP14)errordinp[14] = 1'b1; 
always @(errorDINP15)errordinp[15] = 1'b1; 
always @(errorDINP16)errordinp[16] = 1'b1; 
always @(errorDINP17)errordinp[17] = 1'b1; 
always @(errorDINP18)errordinp[18] = 1'b1; 
always @(errorDINP19)errordinp[19] = 1'b1; 
always @(errorDINP20)errordinp[20] = 1'b1; 
always @(errorDINP21)errordinp[21] = 1'b1; 
always @(errorDINP22)errordinp[22] = 1'b1; 
always @(errorDINP23)errordinp[23] = 1'b1; 
always @(errorDINP24)errordinp[24] = 1'b1; 
always @(errorDINP25)errordinp[25] = 1'b1; 
always @(errorDINP26)errordinp[26] = 1'b1; 
always @(errorDINP27)errordinp[27] = 1'b1; 
always @(errorDINP28)errordinp[28] = 1'b1; 
always @(errorDINP29)errordinp[29] = 1'b1; 
always @(errorDINP30)errordinp[30] = 1'b1; 
always @(errorDINP31)errordinp[31] = 1'b1; 

always @(errorCLKW)errorclkw = 1'b1;
always @(errorCLKP)errorclkp = 1'b1;
always @(errorCLKBYP)errorclkbyp = 1'b1;
always @(errorMC)errormc = 1'b1;
always @(errorMCE)errormce = 1'b1;



always @(errorFWEN)errorfwen = 1'b1;
always @(errorWA)errorwa = 1'b1;
always @(errorWPULSE)errorwpulse = 1'b1;
always @(errorWPULSEEN)errorwpulseen = 1'b1;


always @(negedge clk) begin
errorrenp0 <= 1'b0;
errorwenp0 <= 1'b0;
erroradr0 <= 1'b0;

errordinp[0] <= 1'b0; 
errordinp[1] <= 1'b0; 
errordinp[2] <= 1'b0; 
errordinp[3] <= 1'b0; 
errordinp[4] <= 1'b0; 
errordinp[5] <= 1'b0; 
errordinp[6] <= 1'b0; 
errordinp[7] <= 1'b0; 
errordinp[8] <= 1'b0; 
errordinp[9] <= 1'b0; 
errordinp[10] <= 1'b0; 
errordinp[11] <= 1'b0; 
errordinp[12] <= 1'b0; 
errordinp[13] <= 1'b0; 
errordinp[14] <= 1'b0; 
errordinp[15] <= 1'b0; 
errordinp[16] <= 1'b0; 
errordinp[17] <= 1'b0; 
errordinp[18] <= 1'b0; 
errordinp[19] <= 1'b0; 
errordinp[20] <= 1'b0; 
errordinp[21] <= 1'b0; 
errordinp[22] <= 1'b0; 
errordinp[23] <= 1'b0; 
errordinp[24] <= 1'b0; 
errordinp[25] <= 1'b0; 
errordinp[26] <= 1'b0; 
errordinp[27] <= 1'b0; 
errordinp[28] <= 1'b0; 
errordinp[29] <= 1'b0; 
errordinp[30] <= 1'b0; 
errordinp[31] <= 1'b0; 


errorclkw <= 1'b0;
errorclkp <= 1'b0;
errorclkbyp <= 1'b0;
errormc <= 1'b0;
errormce <= 1'b0;




errorfwen      <= 1'b0;
errorwa       <= 1'b0;
errorwpulse   <= 1'b0;
errorwpulseen <= 1'b0;                        


end

`endif //INTC_MEM_LINT
`endif //INTC_FUNCTIONAL

//lintra push 2041

initial begin
errorrenp0 = 1'b0;
errorwenp0 = 1'b0;
erroradr0 = 1'b0;

errordinp[0] = 1'b0; 
errordinp[1] = 1'b0; 
errordinp[2] = 1'b0; 
errordinp[3] = 1'b0; 
errordinp[4] = 1'b0; 
errordinp[5] = 1'b0; 
errordinp[6] = 1'b0; 
errordinp[7] = 1'b0; 
errordinp[8] = 1'b0; 
errordinp[9] = 1'b0; 
errordinp[10] = 1'b0; 
errordinp[11] = 1'b0; 
errordinp[12] = 1'b0; 
errordinp[13] = 1'b0; 
errordinp[14] = 1'b0; 
errordinp[15] = 1'b0; 
errordinp[16] = 1'b0; 
errordinp[17] = 1'b0; 
errordinp[18] = 1'b0; 
errordinp[19] = 1'b0; 
errordinp[20] = 1'b0; 
errordinp[21] = 1'b0; 
errordinp[22] = 1'b0; 
errordinp[23] = 1'b0; 
errordinp[24] = 1'b0; 
errordinp[25] = 1'b0; 
errordinp[26] = 1'b0; 
errordinp[27] = 1'b0; 
errordinp[28] = 1'b0; 
errordinp[29] = 1'b0; 
errordinp[30] = 1'b0; 
errordinp[31] = 1'b0; 


errorclkw = 1'b0;
errorclkp = 1'b0;
errorclkbyp = 1'b0;
errormc = 1'b0;
errormce = 1'b0;



errorfwen      = 1'b0;
errorwa       = 1'b0;
errorwpulse   = 1'b0;
errorwpulseen = 1'b0; 



end	
//lintra pop


   endmodule // ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h
`endcelldefine

