///////////////////////////////////////////////////////////////////////////////
// Intel Confidential                                                        
///////////////////////////////////////////////////////////////////////////////
// Copyright 2021 Intel Corporation.                                         
// The information contained herein is the proprietary and confidential      
// information of Intel or its licensors, and is supplied subject to, and    
// may be used only in accordance with, previously executed agreements       
// with Intel ,                                                                                                   
// EXCEPT AS MAY OTHERWISE BE AGREED IN WRITING:                            
// (1) ALL MATERIALS FURNISHED BY INTEL HEREUNDER ARE PROVIDED "AS IS"      
//      WITHOUT WARRANTY OF ANY KIND;                            
// (2) INTEL SPECIFICALLY DISCLAIMS ANY WARRANTY OF NONINFRINGEMENT, FITNESS 
//      FOR A PARTICULAR PURPOSE OR MERCHANTABILITY; AND                     
// (3) INTEL WILL NOT BE LIABLE FOR ANY COSTS OF PROCUREMENT OF SUBSTITUTES, 
//      LOSS OF PROFITS, INTERRUPTION OF BUSINESS, OR                       
//      FOR ANY OTHER SPECIAL, CONSEQUENTIAL OR INCIDENTAL DAMAGES,        
//      HOWEVER CAUSED, WHETHER FOR BREACH OF WARRANTY, CONTRACT,            
//      TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE.//
//
// Description:
//   This file contains macros meant to be used in FPGA emulation 
//
//=============================================================================


///=====================================================================================================================
///
`ifndef FPGA_MACROS_VS
`define FPGA_MACROS_VS

// ROM implementations
`define MAKE_FPGA_ROM(iROM_WORD_TYPE,iNUM_ENTRIES,iADDR_WIDTH,iROM_INIT_FILE,iROM_FILE_IS_HEX,ird_clk,ird_addr,ird_en,ird_data,ins_name) \
  fpga_rom #(                               \
  .ROM_WORD_TYPE(iROM_WORD_TYPE),             \
  .NUM_ENTRIES(iNUM_ENTRIES),                 \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .ROM_INIT_FILE(iROM_INIT_FILE),             \
  .ROM_FILE_IS_HEX(iROM_FILE_IS_HEX)          \
  )                                           \
  ins_name (                  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data)                          \
  );


// ***********************************************************************************************************************************
// ********************************************* List of FPGA friendly RF implementations ******************************************** 
// RFs with Reads and Writes synchronous to the clock (posedge of port clock ) 
// By default the "BLOCK_RAM" variant of these macros can be used . In some cases (for small arrays) , we would find it more effecient to map the arrays using the "DISTR_RAM" variants : Functionality wise both are exactly the same 
// 1. MAKE_FPGA_SEG_RAM                      : Dual-Ported segmented RAM : Implementated with either Block or Distributed RAMs based on parameter (USE_BLOCK_RAMS)
// 2. MAKE_FPGA_SEG_RAM_WITH_INIT            : Dual-Ported segmented RAM implemented with Block RAMs : Contents can be initialized with readmem 
// 2. MAKE_FPGA_RAM                          : Dual-Ported RAM implemented with Block RAMs without byte enables
// 4. MAKE_FPGA_RAM_WITH_INIT                : Dual-Ported RAM implemented with Block RAMs without byte enables : Contents can be initialized with readmem
// 5. MAKE_MULT_PORT_FPGA_SEG_RAM            : Multi-Ported segmented RAM : Implementated with either Block or Distributed RAMs based on parameter (USE_BLOCK_RAMS)
// 6. MAKE_MULT_PORT_FPGA_SEG_RAM_WITH_INIT  : Multi-Ported segmented RAM implemented with Block RAMs : Contents can be initialized with readmem 
// 7. MAKE_MULT_PORT_FPGA_RAM                : Multi-Ported RAM implemented with Block RAMs without byte enables
// 8. MAKE_MULT_PORT_FPGA_RAM_WITH_INIT      : Multi-Ported RAM implemented with Block RAMs without byte enables : Contents can be initialized with readmem

// RFs with Writes synchronous to the clock and Reads asychronous to the clock (only controlled by rd_en)
// 9. MAKE_FPGA_ASYNC_RAM                    : Dual-Ported RAM implemented with Distributed RAMs without byte enables
// 10. MAKE_MULT_PORT_FPGA_ASYNC_RAM         : Multi-Ported RAM implemented with Distributed RAMs without byte enables
// ***********************************************************************************************************************************

// ***********************************************************************************************************************************
// *********************************** Description of parameters *********************************************************************
// iNUM_RD_PORTS         => Number of read ports 
// iNUM_WR_PORTS         => Number of write ports
// iSEG_SIZE             => Size of each segment (or smallest chunk that can be independantly written in an entry) 
// iNUM_SEG              => Number of segments in an entry of the RF
// iRF_WORD_TYPE         => Packed data type of each entry in the RF
// iRF_SIZE              => Size of the register file aka number of entries 
// iADDR_WIDTH           => Width of the address vector used to address into the RF 
// iUSE_BLOCK_RAMS       => Used to control FPGA mapping of the RAMs .
//                          "1" will map to block RAMs (for large RAMs). "0" will map to distributed RAMs (for small RAMs)
// iDEF_RD_DATA_IS_ZERO  => Used to force the default output data to zero (when rd_en is low , data will be driven to zero)
// iRAM_INIT_FILE        => Binay/Hex file that has the content used to initialize the contents of the RF 
// iINIT_FILE_IS_HEX     => Specifies that the RAM_INIT_FILE is in hexadecimal format (Default is Binary)
// ird_clk               => Packed vector of clocks for all read ports ie { rd_clk1 , rd_clk2 ... , rd_clkN } : Assumed to be active at +ve edge
// ird_addr              => Packed vector of addresses for all read ports ie { rd_addr1 , rd_addr2 ....., rd_addrN } 
// ird_en                => Packed vector of enables for all read ports ie { rd_en1 , rd_en2 ....., rd_enN }
// ird_data              => Packed vector of data for all read ports ie { rd_data1 , rd_data2 ....., rd_dataN }
// iwr_clk               => Packed vector of clocks for all write ports ie { wr_clk1 , wr_clk2 ... , wr_clkN } : Assumed to be active at +ve edge
// iwr_byte_en           => Packed vector of byte (segment) enables for all write ports ie { wr_byte_en1 , wr_byte_en2 ... , wr_byte_enN }
//                          Note : Individual signals should be NUM_SEG wide : A "1" on a segment enable will enable writes for that segment
// iwr_data              => Packed vector the data for all write ports ie { wr_data1 , wr_data2 ...., wr_dataN }
// ins_name              => String to uniquify instance name given to the fpga array instance
// ***********************************************************************************************************************************

// MULTI PORT IMPLEMENTATIONS 
`define MAKE_MULT_PORT_FPGA_SEG_RAM(iNUM_RD_PORTS,iNUM_WR_PORTS,iNUM_SEG,iSEG_SIZE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_byte_en,iwr_data,ins_name) \
  fpga_multi_port_seg_ram #(          \
  .NUM_RD_PORTS(iNUM_RD_PORTS),               \
  .NUM_WR_PORTS(iNUM_WR_PORTS),               \
  .SEG_SIZE(iSEG_SIZE),                       \
  .NUM_SEG(iNUM_SEG),                         \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO)  \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_byte_en(iwr_byte_en),                   \
  .wr_data(iwr_data)                          \
  );
// Template
//MAKE_MULT_PORT_FPGA_SEG_RAM( /*iNUM_RD_PORTS*/, /*iNUM_WR_PORTS*/,
//                  /*iNUM_SEG*/, /*iSEG_SIZE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                  /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//                  /*ird_clk*/,
//                  /*ird_addr*/,
//                  /*ird_en*/,
//                  /*ird_data*/,
//                  /*iwr_clk*/,
//                  /*iwr_addr*/,
//                  /*iwr_byte_en*/,
//                  /*iwr_data*/,
//                  /*ins_name*/)

`define MAKE_MULT_PORT_FPGA_SEG_RAM_WITH_INIT(iNUM_RD_PORTS,iNUM_WR_PORTS,iNUM_SEG,iSEG_SIZE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,iRAM_INIT_FILE,iINIT_FILE_IS_HEX,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_byte_en,iwr_data,ins_name) \
  fpga_multi_port_seg_ram_with_init #(          \
  .NUM_RD_PORTS(iNUM_RD_PORTS),               \
  .NUM_WR_PORTS(iNUM_WR_PORTS),               \
  .SEG_SIZE(iSEG_SIZE),                       \
  .NUM_SEG(iNUM_SEG),                         \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO), \
  .RAM_INIT_FILE(iRAM_INIT_FILE),             \
  .INIT_FILE_IS_HEX(iINIT_FILE_IS_HEX)        \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_byte_en(iwr_byte_en),                   \
  .wr_data(iwr_data)                          \
  );

// Template
//MAKE_MULT_PORT_FPGA_SEG_RAM_WITH_INIT( /*iNUM_RD_PORTS*/, /*iNUM_WR_PORTS*/,
//                              /*iNUM_SEG*/, /*iSEG_SIZE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                              /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//                              /*iRAM_INIT_FILE*/ ,/*iINIT_FILE_IS_HEX*/,
//                              /*ird_clk*/,                                                                                    
//                              /*ird_addr*/,
//                              /*ird_en*/,
//                              /*ird_data*/,
//                              /*iwr_clk*/,
//                              /*iwr_addr*/,
//                              /*iwr_byte_en*/,
//                              /*iwr_data*/,
//                              /*ins_name*/)



`define MAKE_MULT_PORT_FPGA_RAM(iNUM_RD_PORTS,iNUM_WR_PORTS,iRF_WORD_TYPE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_en,iwr_data,ins_name) \
  fpga_multi_port_ram #(          \
  .NUM_RD_PORTS(iNUM_RD_PORTS),               \
  .NUM_WR_PORTS(iNUM_WR_PORTS),               \
  .RF_WORD_TYPE(iRF_WORD_TYPE),               \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO)  \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_en(iwr_en),                   \
  .wr_data(iwr_data)                          \
  );

// Template
//MAKE_MULT_PORT_FPGA_RAM( /*iNUM_RD_PORTS*/, /*iNUM_WR_PORTS*/,
//             /*iRF_WORD_TYPE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//             /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//             /*ird_clk*/,                                                                                    
//             /*ird_addr*/,
//             /*ird_en*/,
//             /*ird_data*/,
//             /*iwr_clk*/,
//             /*iwr_addr*/,
//             /*iwr_en*/,
//             /*iwr_data*/,
//             /*ins_name*/)

`define MAKE_MULT_PORT_FPGA_RAM_WITH_INIT(iNUM_RD_PORTS,iNUM_WR_PORTS,iRF_WORD_TYPE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,iRAM_INIT_FILE,iINIT_FILE_IS_HEX,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_en,iwr_data,ins_name) \
  fpga_multi_port_ram_with_init #(          \
  .NUM_RD_PORTS(iNUM_RD_PORTS),               \
  .NUM_WR_PORTS(iNUM_WR_PORTS),               \
  .RF_WORD_TYPE(iRF_WORD_TYPE),               \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO), \
  .RAM_INIT_FILE(iRAM_INIT_FILE),             \
  .INIT_FILE_IS_HEX(iINIT_FILE_IS_HEX)        \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_en(iwr_en),                   \
  .wr_data(iwr_data)                          \
  );

// Template
//MAKE_MULT_PORT_FPGA_RAM_WITH_INIT( /*iNUM_RD_PORTS*/, /*iNUM_WR_PORTS*/,
//                         /*iRF_WORD_TYPE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                         /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//                         /*iRAM_INIT_FILE*/ ,/*iINIT_FILE_IS_HEX*/,
//                         /*ird_clk*/,                                                                                    
//                         /*ird_addr*/,
//                         /*ird_en*/,
//                         /*ird_data*/,
//                         /*iwr_clk*/,
//                         /*iwr_addr*/,
//                         /*iwr_en*/,
//                         /*iwr_data*/,
//                         /*ins_name*/)

`define MAKE_MULT_PORT_FPGA_ASYNC_RAM(iNUM_RD_PORTS,iNUM_WR_PORTS,iRF_WORD_TYPE,iRF_SIZE,iADDR_WIDTH,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_en,iwr_data,ins_name) \
  fpga_multi_port_async_ram #(          \
  .NUM_RD_PORTS(iNUM_RD_PORTS),               \
  .NUM_WR_PORTS(iNUM_WR_PORTS),               \
  .RF_WORD_TYPE(iRF_WORD_TYPE),               \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH)                   \
  )                                           \
  ins_name (  \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_en(iwr_en),                   \
  .wr_data(iwr_data)                          \
  );
// Template
//MAKE_MULT_PORT_FPGA_ASYNC_RAM( /*iNUM_RD_PORTS*/, /*iNUM_WR_PORTS*/,
//                     /*iRF_WORD_TYPE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                     /*ird_addr*/,
//                     /*ird_en*/,
//                     /*ird_data*/,
//                     /*iwr_clk*/,
//                     /*iwr_addr*/,
//                     /*iwr_data*/,
//                     /*ins_name*/)

// DUAL PORT IMPLEMENTATIONS 
`define MAKE_FPGA_SEG_RAM(iNUM_SEG,iSEG_SIZE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_byte_en,iwr_data,ins_name) \
  fpga_dual_port_seg_ram #(                   \
  .SEG_SIZE(iSEG_SIZE),                       \
  .NUM_SEG(iNUM_SEG),                         \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO)  \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_byte_en(iwr_byte_en),                   \
  .wr_data(iwr_data)                          \
  );
// Template
//MAKE_FPGA_SEG_RAM /*iNUM_SEG*/, /*iSEG_SIZE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                  /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//                  /*ird_clk*/,
//                  /*ird_addr*/,
//                  /*ird_en*/,
//                  /*ird_data*/,
//                  /*iwr_clk*/,
//                  /*iwr_addr*/,
//                  /*iwr_byte_en*/,
//                  /*iwr_data*/,
//                  /*ins_name*/)

`define MAKE_FPGA_SEG_RAM_WITH_INIT(iNUM_SEG,iSEG_SIZE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,iRAM_INIT_FILE,iINIT_FILE_IS_HEX,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_byte_en,iwr_data,ins_name) \
  fpga_dual_port_seg_ram_with_init #(         \
  .SEG_SIZE(iSEG_SIZE),                       \
  .NUM_SEG(iNUM_SEG),                         \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO), \
  .RAM_INIT_FILE(iRAM_INIT_FILE),             \
  .INIT_FILE_IS_HEX(iINIT_FILE_IS_HEX)        \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_byte_en(iwr_byte_en),                   \
  .wr_data(iwr_data)                          \
  );

// Template
//MAKE_FPGA_SEG_RAM_WITH_INIT(  /*iNUM_SEG*/, /*iSEG_SIZE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                              /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//                              /*iRAM_INIT_FILE*/ ,/*iINIT_FILE_IS_HEX*/,
//                              /*ird_clk*/,                                                                                    
//                              /*ird_addr*/,
//                              /*ird_en*/,
//                              /*ird_data*/,
//                              /*iwr_clk*/,
//                              /*iwr_addr*/,
//                              /*iwr_byte_en*/,
//                              /*iwr_data*/,
//                              /*ins_name*/)



`define MAKE_FPGA_RAM(iRF_WORD_TYPE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_en,iwr_data,ins_name) \
  fpga_dual_port_ram #(          \
  .RF_WORD_TYPE(iRF_WORD_TYPE),               \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO)  \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_en(iwr_en),                   \
  .wr_data(iwr_data)                          \
  );

// Template
//MAKE_FPGA_RAM(/*iRF_WORD_TYPE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//             /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//             /*ird_clk*/,                                                                                    
//             /*ird_addr*/,
//             /*ird_en*/,
//             /*ird_data*/,
//             /*iwr_clk*/,
//             /*iwr_addr*/,
//             /*iwr_en*/,
//             /*iwr_data*/,
//             /*ins_name*/)

`define MAKE_FPGA_RAM_WITH_INIT(iRF_WORD_TYPE,iRF_SIZE,iADDR_WIDTH,iUSE_BLOCK_RAMS,iDEF_RD_DATA_IS_ZERO,iRAM_INIT_FILE,iINIT_FILE_IS_HEX,ird_clk,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_en,iwr_data,ins_name) \
  fpga_dual_port_ram_with_init #(          \
  .RF_WORD_TYPE(iRF_WORD_TYPE),               \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH),                   \
  .USE_BLOCK_RAMS(iUSE_BLOCK_RAMS),           \
  .DEF_RD_DATA_IS_ZERO(iDEF_RD_DATA_IS_ZERO), \
  .RAM_INIT_FILE(iRAM_INIT_FILE),             \
  .INIT_FILE_IS_HEX(iINIT_FILE_IS_HEX)        \
  )                                           \
  ins_name (  \
  .rd_clk(ird_clk),                           \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_en(iwr_en),                   \
  .wr_data(iwr_data)                          \
  );

// Template
//MAKE_FPGA_RAM_WITH_INIT( /*iRF_WORD_TYPE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                         /*iUSE_BLOCK_RAMS*/,/*iDEF_RD_DATA_IS_ZERO*/,
//                         /*iRAM_INIT_FILE*/ ,/*iINIT_FILE_IS_HEX*/,
//                         /*ird_clk*/,                                                                                    
//                         /*ird_addr*/,
//                         /*ird_en*/,
//                         /*ird_data*/,
//                         /*iwr_clk*/,
//                         /*iwr_addr*/,
//                         /*iwr_en*/,
//                         /*iwr_data*/,
//                         /*ins_name*/)

`define MAKE_FPGA_ASYNC_RAM(iRF_WORD_TYPE,iRF_SIZE,iADDR_WIDTH,ird_addr,ird_en,ird_data,iwr_clk,iwr_addr,iwr_en,iwr_data,ins_name) \
  fpga_dual_port_async_ram #(          \
  .RF_WORD_TYPE(iRF_WORD_TYPE),               \
  .RF_SIZE(iRF_SIZE),                         \
  .ADDR_WIDTH(iADDR_WIDTH)                   \
  )                                           \
  ins_name (  \
  .rd_addr(ird_addr),                         \
  .rd_en(ird_en),                             \
  .rd_data(ird_data),                         \
  .wr_clk(iwr_clk),                           \
  .wr_addr(iwr_addr),                         \
  .wr_en(iwr_en),                   \
  .wr_data(iwr_data)                          \
  );
// Template
//MAKE_FPGA_ASYNC_RAM( /*iRF_WORD_TYPE*/, /*iRF_SIZE*/, /*iADDR_WIDTH*/,
//                     /*ird_addr*/,
//                     /*ird_en*/,
//                     /*ird_data*/,
//                     /*iwr_clk*/,
//                     /*iwr_addr*/,
//                     /*iwr_data*/,
//                     /*ins_name*/)
`define MAKE_FPGA_BASIC_FIFO(iDSIZE,iASIZE,iclk,irst_n,irdata,irinc,irempty,iwdata,iwinc,iwfull,ins_name) \
   fpga_basic_fifo #( \
     .DSIZE(iDSIZE), \
     .ASIZE(iASIZE) \
   ) ins_name ( \
     .clk(iclk), \
     .rst_n(irst_n), \
     .rdata(irdata), \
     .rinc(irinc), \
     .rempty(irempty),\
     .wdata(iwdata),\
     .winc(iwinc),\
     .wfull(iwfull) \
   );

// Template 
//MAKE_FPGA_BASIC_FIFO( /*iDSIZE*/ , /*iASIZE*/ ,
//                      /*iclk*/,
//                      /*irst_n*/,
//                      /*irdata*/,
//                      /*irinc*/,
//                      /*irempty*/,
//                      /*iwdata*/,
//                      /*iwinc*/,
//                      /*iwfull*/,
//                      /*ins_name*/)

// Fifo implementation  : TODO ADD DOC
module fpga_basic_fifo #(
  parameter DSIZE = 8,
  parameter ASIZE = 4)
  (
  output     [DSIZE-1:0] rdata,
  output reg wfull ,
  output reg rempty ,
  input [DSIZE-1:0] wdata,
  input             winc ,  
  input             rinc ,
  input clk, 
  input rst_n
  );


  // locally used flops
  reg [ASIZE-1:0] waddr, raddr ; // write and read pointers
  wire [ASIZE-1:0] new_waddr, new_raddr  ; // write and read pointers
  wire ram_winc ; // write enable to memory

  // synthesis translate_off
  always @(wfull)  $display("%7d fifo wfull %b", $time, wfull);
  always @(rempty) $display("%7d fifo rempty %b", $time, rempty);
  always @(posedge clk) begin
    if(rst_n) begin
      if (winc && wfull)   $display("%7d: %m basic_fifo Overflow",$time);
      if (rinc && rempty)  $display("%7d: %m basic_fifo Underflow",$time);
    end
  end // End always
  // synthesis translate_on

  // basic 2 port memory -- assume read is asynch
  fpga_fifomem #(
    .DSIZE(DSIZE),
    .ASIZE(ASIZE)
  ) i_fpga_fifomem (
    .rdata(rdata),
    .wdata(wdata),
    .waddr(waddr),
    .raddr(new_raddr),
    .wclken(winc),
    .wfull(wfull),
    .wclk(clk));

  assign ram_winc = winc & ! wfull ;
  assign new_waddr = ram_winc ? (waddr + 1) : waddr ;
  assign new_raddr = (rinc & ! rempty) ? (raddr + 1) : raddr ;
  always @ (posedge clk or negedge rst_n) begin
    if ( ! rst_n) begin // async reset
       waddr <= 0 ;
       raddr <= 0 ;
       wfull <= 0 ;
       rempty <= 1 ;
    end
    else begin
      waddr <= new_waddr ;
      raddr <= new_raddr ;
      if (ram_winc & (new_waddr == new_raddr))
        wfull <= 1 ;
      else if (rinc)
        wfull <= 0 ;
      if (rinc & (new_waddr == new_raddr))
        rempty <= 1 ;
      else if (winc)
        rempty <= 0 ;
    end
  end // End always
endmodule // fpga_basic_fifo


module fpga_fifomem #(
  parameter DSIZE = 8, // Memory data word width
  parameter ASIZE = 4) // Number of mem address bits
  (
  output [DSIZE-1:0] rdata,
  input  [DSIZE-1:0] wdata,
  input  [ASIZE-1:0] waddr, raddr,
  input  wclken, wfull, wclk
  );
  reg [ASIZE-1:0] 	 raddr_reg;   
  localparam DEPTH = 1<<ASIZE;
  reg [DSIZE-1:0]   mem [0:DEPTH-1] /* synthesis syn_ramstyle="block_ram"*/;

  always @(posedge wclk) begin
    raddr_reg <= raddr;
  end // End always
  
  assign rdata = mem[raddr_reg];
   
  always @(posedge wclk) begin
    if (wclken && !wfull) mem[waddr] <= wdata;
  end // End always
endmodule // fpga_fifomem

// Rom implementation using Block RAMs
module fpga_rom (
rd_clk,
rd_addr,
rd_en,
rd_data
);

parameter type ROM_WORD_TYPE = logic [35:0];
parameter NUM_ENTRIES = 1024;
parameter ADDR_WIDTH = 10;
parameter ROM_INIT_FILE = "rom_init_file.mem";
parameter ROM_FILE_IS_HEX = 1;

// Read Port
input rd_clk;                             // Read clock
input [ADDR_WIDTH-1:0] rd_addr;           // Read address
input rd_en;                              // Read enable
output ROM_WORD_TYPE rd_data;   // Read data out


`ifdef FPGA_PRECISION_SYN
  ROM_WORD_TYPE rom_mem [NUM_ENTRIES-1:0] ;
  // pragma attribute rom_mem use_resource "BLOCK_RAM"
`else // SYNPLIFY_PRO
  ROM_WORD_TYPE rom_mem [NUM_ENTRIES-1:0] /* synthesis syn_ramstyle="block_ram, no_rw_check, area" */;
`endif // `ifdef FPGA_PRECISION_SYN
        
initial begin
if (ROM_FILE_IS_HEX)
  $readmemh(ROM_INIT_FILE,rom_mem);
else
  $readmemb(ROM_INIT_FILE,rom_mem);
end

always @ (posedge rd_clk) begin
  if (rd_en) begin
     rd_data <= rom_mem[rd_addr];
  end // End if rd_en
end // End always
endmodule // fpga_rom


// Multi ported segmented RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
module fpga_multi_port_seg_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter NUM_RD_PORTS = 2;
parameter NUM_WR_PORTS = 2;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;

// Read Ports
input [NUM_RD_PORTS-1:0] rd_clk ;                        // Read clock
input [NUM_RD_PORTS-1:0] [ADDR_WIDTH-1:0] rd_addr;       // Read address
input [NUM_RD_PORTS-1:0] rd_en ;                         // Read enable
output reg [NUM_RD_PORTS-1:0] [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Ports
input [NUM_WR_PORTS-1:0] wr_clk;                         // Write clock
input [NUM_WR_PORTS-1:0] [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_WR_PORTS-1:0] [NUM_SEG-1:0] wr_byte_en;       // Write byte enable
input [NUM_WR_PORTS-1:0] [WORD_SIZE-1:0] wr_data;        // Write data out

logic [NUM_WR_PORTS-1:0] bank_sel_dec [NUM_RD_PORTS-1:0][NUM_SEG-1:0];  // Select line for read data out mux
logic [WORD_SIZE-1:0] rd_data_bank [NUM_RD_PORTS-1:0] [NUM_WR_PORTS-1:0]; // Read data from all banks 

// Instantiation of the banked memory structure
// For a "m" Write / "n" Read port RAM , we would have "m" banks of "n" RAMs (each bank of memory can serve "n" read ports through duplication) 
// There is a multiplexer stage to steer the correct data from a bank to the approriate read port 
// The select line for the mux is got from a table that tracks which bank has the most recent write data (lvt)
genvar g_wr_port , g_rd_port;
generate
  for (g_wr_port = 0 ; g_wr_port < NUM_WR_PORTS ; g_wr_port ++) begin : wr_port_ins
    for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_port_ins
       if(USE_BLOCK_RAMS) begin : use_block_ram
         fpga_1r_1w_seg_block_ram #(
         .NUM_SEG(NUM_SEG),
         .SEG_SIZE(SEG_SIZE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
         )
         i_fpga_1r_1w_seg_block_ram (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_byte_en(wr_byte_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end else begin : use_distributed_ram
         fpga_1r_1w_seg_distr_ram #(
         .NUM_SEG(NUM_SEG),
         .SEG_SIZE(SEG_SIZE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
         )
         i_fpga_1r_1w_seg_distr_ram (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_byte_en(wr_byte_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end // End if USE_BLOCK_RAMS
    end // End for g_rd_port
  end // End for g_wr_port
endgenerate

// Mux stage for read data 
// I pick up the most recent segment from each of the banks
genvar g_seg;
generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg++) begin : rd_data_sel_seg
    always_comb begin
      for(int unsigned rd_port = 0 ; rd_port < NUM_RD_PORTS ; rd_port ++) begin
      rd_data[rd_port][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)] = rd_data_bank[rd_port][0][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)]; // Read from bank0 by default (Just to get default zero data)
        for(int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
          if (bank_sel_dec[rd_port][g_seg] == wr_port) begin
            rd_data[rd_port][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)] = rd_data_bank[rd_port][wr_port][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)];
          end // End if bank_sel_dec
        end // End for wr_port
      end // End for rd_port
    end // End always_comb
  end // End for g_seg
endgenerate
// Structure to track which port made the most recent write to a given segment of a address
logic [NUM_WR_PORTS-1:0] lvt_array [RF_SIZE-1:0][NUM_SEG-1:0];

// Update the lvt_array at a clk for each segment generated by or'ing all of the wr_clks
logic [NUM_SEG-1:0] wr_clk_ored;

generate
  for (g_seg=0;g_seg < NUM_SEG; g_seg++) begin : wr_clk_ored_seg
    always_comb begin
      wr_clk_ored[g_seg] = 0;
      for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
        wr_clk_ored[g_seg] = wr_clk_ored[g_seg] | (wr_clk[wr_port] & wr_byte_en[wr_port][g_seg]);
      end // End for wr_port
    end // End always_comb
  end // End for g_seg
endgenerate

generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg++) begin
    always @* begin 
       if(wr_clk_ored[g_seg]) begin : lvt_array_update_seg
       // Make an entry to track which port (which corresponds to the bank) made the most recent write to a given segment for a given address
         for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port++) begin
           if (wr_byte_en[wr_port][g_seg] & wr_clk[wr_port] ) begin
             lvt_array[wr_addr[wr_port]][g_seg] <= wr_port;
           end // End if wr_byte_en
         end // End for wr_port
      end // End if wr_clk_ored[g_seg]
    end // End always
  end // End for g_seg 
endgenerate

generate
for (g_rd_port = 0 ; g_rd_port <NUM_RD_PORTS; g_rd_port++) begin : bank_sel_rd_port
  always @ (posedge rd_clk[g_rd_port]) begin
  if (rd_en[g_rd_port]) begin
    for (int unsigned seg = 0 ; seg < NUM_SEG ; seg++) begin
      bank_sel_dec[g_rd_port][seg] <= lvt_array[rd_addr[g_rd_port]][seg];
    end // End for seg
  end // End if rd_en
  end // End always
end // End for g_rd_port
endgenerate

endmodule // fpga_multi_port_seg_ram


// Multi ported segmented RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
// Memory is initialized with readmem
module fpga_multi_port_seg_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter NUM_RD_PORTS = 2;
parameter NUM_WR_PORTS = 2;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;

// Read Ports
input [NUM_RD_PORTS-1:0] rd_clk ;                        // Read clock
input [NUM_RD_PORTS-1:0] [ADDR_WIDTH-1:0] rd_addr;       // Read address
input [NUM_RD_PORTS-1:0] rd_en ;                         // Read enable
output reg [NUM_RD_PORTS-1:0] [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Ports
input [NUM_WR_PORTS-1:0] wr_clk;                         // Write clock
input [NUM_WR_PORTS-1:0] [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_WR_PORTS-1:0] [NUM_SEG-1:0] wr_byte_en;       // Write byte enable
input [NUM_WR_PORTS-1:0] [WORD_SIZE-1:0] wr_data;        // Write data out

logic [NUM_WR_PORTS-1:0] bank_sel_dec [NUM_RD_PORTS-1:0][NUM_SEG-1:0];  // Select line for read data out mux
logic [WORD_SIZE-1:0] rd_data_bank [NUM_RD_PORTS-1:0] [NUM_WR_PORTS-1:0]; // Read data from all banks 

// Instantiation of the banked memory structure
// For a "m" Write / "n" Read port RAM , we would have "m" banks of "n" RAMs (each bank of memory can serve "n" read ports through duplication) 
// There is a multiplexer stage to steer the correct data from a bank to the approriate read port 
// The select line for the mux is got from a table that tracks which bank has the most recent write data (lvt)
genvar g_wr_port , g_rd_port;
generate
  for (g_wr_port = 0 ; g_wr_port < NUM_WR_PORTS ; g_wr_port ++) begin : wr_port_ins
    for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_port_ins
       if(USE_BLOCK_RAMS) begin : use_block_ram
         fpga_1r_1w_seg_block_ram_with_init #(
         .NUM_SEG(NUM_SEG),
         .SEG_SIZE(SEG_SIZE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
         .RAM_INIT_FILE(RAM_INIT_FILE),
         .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
         )
         i_fpga_1r_1w_seg_block_ram_with_init (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_byte_en(wr_byte_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end else begin : use_distributed_ram
         fpga_1r_1w_seg_distr_ram_with_init #(
         .NUM_SEG(NUM_SEG),
         .SEG_SIZE(SEG_SIZE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
         .RAM_INIT_FILE(RAM_INIT_FILE),
         .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
         )
         i_fpga_1r_1w_seg_distr_ram_with_init (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_byte_en(wr_byte_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end // End if USE_BLOCK_RAMS
    end // End for g_rd_port
  end // End for g_wr_port
endgenerate

// Mux stage for read data 
// I pick up the most recent segment from each of the banks
genvar g_seg;
generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg++) begin : rd_data_sel_seg
    always_comb begin
      for(int unsigned rd_port = 0 ; rd_port < NUM_RD_PORTS ; rd_port ++) begin
      rd_data[rd_port][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)] = rd_data_bank[rd_port][0][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)]; // Read from bank0 by default (Just to get default zero data)
        for(int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
          if (bank_sel_dec[rd_port][g_seg] == wr_port) begin
            rd_data[rd_port][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)] = rd_data_bank[rd_port][wr_port][(SEG_SIZE*(g_seg+1))-1:(SEG_SIZE*g_seg)];
          end // End if bank_sel_dec
        end // End for wr_port
      end // End for rd_port
    end // End always_comb
  end // End for g_seg
endgenerate
// Structure to track which port made the most recent write to a given segment of a address
logic [NUM_WR_PORTS-1:0] lvt_array [RF_SIZE-1:0][NUM_SEG-1:0];

// Update the lvt_array at a clk for each segment generated by or'ing all of the wr_clks
logic [NUM_SEG-1:0] wr_clk_ored;

generate
  for (g_seg=0;g_seg < NUM_SEG; g_seg++) begin : wr_clk_ored_seg
    always_comb begin
      wr_clk_ored[g_seg] = 0;
      for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
        wr_clk_ored[g_seg] = wr_clk_ored[g_seg] | (wr_clk[wr_port] & wr_byte_en[wr_port][g_seg]);
      end // End for wr_port
    end // End always_comb
  end // End for g_seg
endgenerate

generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg++) begin
    always @* begin 
      if(wr_clk_ored[g_seg]) begin : lvt_array_update_seg
    // Make an entry to track which port (which corresponds to the bank) made the most recent write to a given segment for a given address
        for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port++) begin
          if (wr_byte_en[wr_port][g_seg] & wr_clk[wr_port]) begin
            lvt_array[wr_addr[wr_port]][g_seg] <= wr_port;
          end // End if wr_byte_en
        end // End for wr_port
      end // End if wr_clk_ored[g_seg]
    end // End always
  end // End for g_seg 
endgenerate

generate
for (g_rd_port = 0 ; g_rd_port <NUM_RD_PORTS; g_rd_port++) begin : bank_sel_rd_port
  always @ (posedge rd_clk[g_rd_port]) begin
  if (rd_en[g_rd_port]) begin
    for (int unsigned seg = 0 ; seg < NUM_SEG ; seg++) begin
      bank_sel_dec[g_rd_port][seg] <= lvt_array[rd_addr[g_rd_port]][seg];
    end // End for seg
  end // End if rd_en
  end // End always
end // End for g_rd_port
endgenerate

endmodule // fpga_multi_port_seg_ram_with_init

// NORMAL RAMS

// Multi ported RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
module fpga_multi_port_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter NUM_RD_PORTS = 2;
parameter NUM_WR_PORTS = 2;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;

// Read Ports
input [NUM_RD_PORTS-1:0] rd_clk ;                        // Read clock
input [NUM_RD_PORTS-1:0] [ADDR_WIDTH-1:0] rd_addr;       // Read address
input [NUM_RD_PORTS-1:0] rd_en ;                         // Read enable
output RF_WORD_TYPE [NUM_RD_PORTS-1:0] rd_data;          // Read data out

// Write Ports
input [NUM_WR_PORTS-1:0] wr_clk;                         // Write clock
input [NUM_WR_PORTS-1:0] [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_WR_PORTS-1:0] wr_en;                          // Write enable
input RF_WORD_TYPE [NUM_WR_PORTS-1:0] wr_data;        // Write data out

logic [NUM_WR_PORTS-1:0] bank_sel_dec [NUM_RD_PORTS-1:0];  // Select line for read data out mux
RF_WORD_TYPE rd_data_bank [NUM_RD_PORTS-1:0] [NUM_WR_PORTS-1:0]; // Read data from all banks 

// Instantiation of the banked memory structure
// For a "m" Write / "n" Read port RAM , we would have "m" banks of "n" RAMs (each bank of memory can serve "n" read ports through duplication) 
// There is a multiplexer stage to steer the correct data from a bank to the approriate read port 
// The select line for the mux is got from a table that tracks which bank has the most recent write data (lvt)
genvar g_wr_port , g_rd_port;
generate
  for (g_wr_port = 0 ; g_wr_port < NUM_WR_PORTS ; g_wr_port ++) begin : wr_port_ins
    for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_port_ins
       if(USE_BLOCK_RAMS) begin : use_block_ram
         fpga_1r_1w_block_ram #(
         .RF_WORD_TYPE(RF_WORD_TYPE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
         )
         i_fpga_1r_1w_block_ram (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_en(wr_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end else begin : use_distributed_ram
         fpga_1r_1w_distr_ram #(
         .RF_WORD_TYPE(RF_WORD_TYPE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
         )
         i_fpga_1r_1w_distr_ram (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_en(wr_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end // End if USE_BLOCK_RAMS
    end // End for g_rd_port
  end // End for g_wr_port
endgenerate

// Mux stage for read data 
// I pick up the most data from each of the banks
generate
for(g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_data_sel_rd_port
  always_comb begin
    rd_data[g_rd_port] = rd_data_bank[g_rd_port][0]; // Read from bank0 by default (Just to get default zero data)
    for(int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
      if (bank_sel_dec[g_rd_port] == wr_port) begin
        rd_data[g_rd_port] = rd_data_bank[g_rd_port][wr_port];
        //rd_data[((g_rd_port+1)*WORD_SIZE)-1:(g_rd_port*WORD_SIZE)] <= rd_data_bank[g_rd_port][wr_port];
      end // End if bank_sel_dec
    end // End for wr_port
  end // End always_comb
end // End for g_rd_port
endgenerate

// Structure to track which port made the most recent write to a given address
logic [NUM_WR_PORTS-1:0] lvt_array [RF_SIZE-1:0];
// Update the lvt_array with a clk generated by or'ing all of the wr_clks
logic wr_clk_ored;

always_comb begin
  wr_clk_ored = 0;
  for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
      wr_clk_ored = wr_clk_ored | (wr_clk[wr_port] & wr_en[wr_port]);
  end // End for wr_port
end // End always_comb

always @* begin
   if(wr_clk_ored) begin : lvt_array_update
   // Make an entry to track which port (which corresponds to the bank) made the most recent write to a given address
    for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port++) begin
      if (wr_en[wr_port] & wr_clk[wr_port]) begin
        lvt_array[wr_addr[wr_port]] <= wr_port;
      end // End if wr_en
    end // End for wr_port
  end // End if wr_clk_ored
end // End always

generate
for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS; g_rd_port++) begin : bank_sel_rd_port
  always @ (posedge rd_clk[g_rd_port]) begin
  if (rd_en[g_rd_port]) begin
    bank_sel_dec[g_rd_port] <= lvt_array[rd_addr[g_rd_port]];
  end // End if rd_en
  end // End always
end // End for g_rd_port
endgenerate

endmodule // fpga_multi_port_ram
// Multi ported RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
// Contents of memory initialized with readmem
module fpga_multi_port_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter NUM_RD_PORTS = 2;
parameter NUM_WR_PORTS = 2;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;

// Read Ports
input [NUM_RD_PORTS-1:0] rd_clk ;                        // Read clock
input [NUM_RD_PORTS-1:0] [ADDR_WIDTH-1:0] rd_addr;       // Read address
input [NUM_RD_PORTS-1:0] rd_en ;                         // Read enable
output RF_WORD_TYPE [NUM_RD_PORTS-1:0] rd_data;          // Read data out

// Write Ports
input [NUM_WR_PORTS-1:0] wr_clk;                         // Write clock
input [NUM_WR_PORTS-1:0] [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_WR_PORTS-1:0] wr_en;                          // Write enable
input RF_WORD_TYPE [NUM_WR_PORTS-1:0] wr_data;        // Write data out

logic [NUM_WR_PORTS-1:0] bank_sel_dec [NUM_RD_PORTS-1:0];  // Select line for read data out mux
RF_WORD_TYPE rd_data_bank [NUM_RD_PORTS-1:0] [NUM_WR_PORTS-1:0]; // Read data from all banks 

// Instantiation of the banked memory structure
// For a "m" Write / "n" Read port RAM , we would have "m" banks of "n" RAMs (each bank of memory can serve "n" read ports through duplication) 
// There is a multiplexer stage to steer the correct data from a bank to the approriate read port 
// The select line for the mux is got from a table that tracks which bank has the most recent write data (lvt)
genvar g_wr_port , g_rd_port;
generate
  for (g_wr_port = 0 ; g_wr_port < NUM_WR_PORTS ; g_wr_port ++) begin : wr_port_ins
    for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_port_ins
       if(USE_BLOCK_RAMS) begin : use_block_ram
         fpga_1r_1w_block_ram_with_init #(
         .RF_WORD_TYPE(RF_WORD_TYPE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
         .RAM_INIT_FILE(RAM_INIT_FILE),
         .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
         )
         i_fpga_1r_1w_block_ram_with_init (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_en(wr_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end else begin : use_distributed_ram
         fpga_1r_1w_distr_ram_with_init #(
         .RF_WORD_TYPE(RF_WORD_TYPE),
         .RF_SIZE(RF_SIZE),
         .ADDR_WIDTH(ADDR_WIDTH),
         .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
         .RAM_INIT_FILE(RAM_INIT_FILE),
         .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
         )
         i_fpga_1r_1w_distr_ram_with_init (
         .rd_clk(rd_clk[g_rd_port]),
         .rd_addr(rd_addr[g_rd_port]),
         .rd_en(rd_en[g_rd_port]),
         .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
         .wr_clk(wr_clk[g_wr_port]),
         .wr_addr(wr_addr[g_wr_port]),
         .wr_en(wr_en[g_wr_port]),
         .wr_data(wr_data[g_wr_port])
         );
       end // End if USE_BLOCK_RAMS
    end // End for g_rd_port
  end // End for g_wr_port
endgenerate

// Mux stage for read data 
// I pick up the most data from each of the banks
generate
for(g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_data_sel_rd_port
  always_comb begin
  rd_data[g_rd_port] = rd_data_bank[g_rd_port][0]; // Read from bank0 by default (Just to get default zero data)
    for(int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
      if (bank_sel_dec[g_rd_port] == wr_port) begin
        rd_data[g_rd_port] = rd_data_bank[g_rd_port][wr_port];
      end // End if bank_sel_dec
    end // End for wr_port
  end // End always_comb
end // End for g_rd_port
endgenerate

// Structure to track which port made the most recent write to a given address
logic [NUM_WR_PORTS-1:0] lvt_array [RF_SIZE-1:0];

// Update the lvt_array with a clk generated by or'ing all of the wr_clks
logic wr_clk_ored;

always_comb begin
  wr_clk_ored = 0;
  for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
      wr_clk_ored = wr_clk_ored | (wr_clk[wr_port] & wr_en[wr_port]);
  end // End for wr_port
end // End always_comb
  
always @* begin 
   if(wr_clk_ored) begin : lvt_array_update
   // Make an entry to track which port (which corresponds to the bank) made the most recent write to a given address
    for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port++) begin
      if (wr_en[wr_port] & wr_clk[wr_port] ) begin
        lvt_array[wr_addr[wr_port]] <= wr_port;
      end // End if wr_en
    end // End for wr_port
  end // End if wr_clk_ored
end // End 

generate
for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS; g_rd_port++) begin : bank_sel_rd_port
  always @ (posedge rd_clk[g_rd_port]) begin
  if (rd_en[g_rd_port]) begin
    bank_sel_dec[g_rd_port] <= lvt_array[rd_addr[g_rd_port]];
  end // End if rd_en
  end // End always
end // End for g_rd_port
endgenerate

endmodule // fpga_multi_port_ram_with_init


// Multi ported RAM with asynchronous read
module fpga_multi_port_async_ram (
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter NUM_RD_PORTS = 2;
parameter NUM_WR_PORTS = 2;

// Read Ports
input [NUM_RD_PORTS-1:0] [ADDR_WIDTH-1:0] rd_addr;       // Read address
input [NUM_RD_PORTS-1:0] rd_en ;                         // Read enable
output RF_WORD_TYPE [NUM_RD_PORTS-1:0] rd_data;          // Read data out

// Write Ports
input [NUM_WR_PORTS-1:0] wr_clk;                         // Write clock
input [NUM_WR_PORTS-1:0] [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_WR_PORTS-1:0] wr_en;                          // Write enable
input RF_WORD_TYPE [NUM_WR_PORTS-1:0] wr_data;        // Write data out

logic [NUM_WR_PORTS-1:0] bank_sel_dec [NUM_RD_PORTS-1:0];  // Select line for read data out mux
RF_WORD_TYPE rd_data_bank [NUM_RD_PORTS-1:0] [NUM_WR_PORTS-1:0]; // Read data from all banks 

// Instantiation of the banked memory structure
// For a "m" Write / "n" Read port RAM , we would have "m" banks of "n" RAMs (each bank of memory can serve "n" read ports through duplication) 
// There is a multiplexer stage to steer the correct data from a bank to the approriate read port 
// The select line for the mux is got from a table that tracks which bank has the most recent write data (lvt)
genvar g_wr_port , g_rd_port;
generate
  for (g_wr_port = 0 ; g_wr_port < NUM_WR_PORTS ; g_wr_port ++) begin : wr_port_ins
    for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_port_ins
       fpga_1r_1w_async_ram #(
       .RF_WORD_TYPE(RF_WORD_TYPE),
       .RF_SIZE(RF_SIZE),
       .ADDR_WIDTH(ADDR_WIDTH)
       )
       i_fpga_1r_1w_async_ram (
       .rd_addr(rd_addr[g_rd_port]),
       .rd_en(rd_en[g_rd_port]),
       .rd_data(rd_data_bank[g_rd_port][g_wr_port]),
       .wr_clk(wr_clk[g_wr_port]),
       .wr_addr(wr_addr[g_wr_port]),
       .wr_en(wr_en[g_wr_port]),
       .wr_data(wr_data[g_wr_port])
       );
    end // End for g_rd_port
  end // End for g_wr_port
endgenerate

// Mux stage for read data 
// I pick up the most data from each of the banks
generate
for(g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS ; g_rd_port ++) begin : rd_data_sel_rd_port
  always_comb begin
    for(int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
      if (bank_sel_dec[g_rd_port] == wr_port) begin
        rd_data[g_rd_port] = rd_data_bank[g_rd_port][wr_port];
      end // End if bank_sel_dec
    end // End for wr_port
  end // End always_comb
end // End for g_rd_port
endgenerate

// Structure to track which port made the most recent write to a given address
logic [NUM_WR_PORTS-1:0] lvt_array [RF_SIZE-1:0];

// Update the lvt_array with a clk generated by or'ing all of the wr_clks
logic wr_clk_ored;

always_comb begin
  wr_clk_ored = 0;
  for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port ++) begin
      wr_clk_ored = wr_clk_ored | (wr_clk[wr_port] & wr_en[wr_port]);
  end // End for wr_port
end // End always_comb
  
always @* begin 
   if(wr_clk_ored) begin : lvt_array_update
    // Make an entry to track which port (which corresponds to the bank) made the most recent write to a given address
     for (int unsigned wr_port = 0 ; wr_port < NUM_WR_PORTS ; wr_port++) begin
       if (wr_en[wr_port] & wr_clk[wr_port]) begin
         lvt_array[wr_addr[wr_port]] <= wr_port;
       end // End if wr_en
     end // End for wr_port
  end // End if wr_clk_ored
end // End always 

generate
for (g_rd_port = 0 ; g_rd_port < NUM_RD_PORTS; g_rd_port++) begin : bank_sel_rd_port
  assign  bank_sel_dec[g_rd_port] = lvt_array[rd_addr[g_rd_port]];
end // End for g_rd_port
endgenerate

endmodule // fpga_multi_port_async_ram

// aramji  Dual Port Implementations 

module fpga_dual_port_seg_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;

// Read Ports
input rd_clk ;                        // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en ;                         // Read enable
output reg [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Ports
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_SEG-1:0] wr_byte_en;       // Write byte enable
input [WORD_SIZE-1:0] wr_data;        // Write data out

generate
  if(USE_BLOCK_RAMS) begin : use_block_ram
    fpga_1r_1w_seg_block_ram #(
    .NUM_SEG(NUM_SEG),
    .SEG_SIZE(SEG_SIZE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
    )
    i_fpga_1r_1w_seg_block_ram (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_byte_en(wr_byte_en),
    .wr_data(wr_data)
    );
  end else begin : use_distributed_ram
    fpga_1r_1w_seg_distr_ram #(
    .NUM_SEG(NUM_SEG),
    .SEG_SIZE(SEG_SIZE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
    )
    i_fpga_1r_1w_seg_distr_ram (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_byte_en(wr_byte_en),
    .wr_data(wr_data)
    );
  end // End if USE_BLOCK_RAMS
endgenerate

endmodule // fpga_dual_port_seg_ram


// Dual ported segmented RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
// Memory is initialized with readmem
module fpga_dual_port_seg_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;

// Read Ports
input  rd_clk ;                        // Read clock
input  [ADDR_WIDTH-1:0] rd_addr;       // Read address
input  rd_en ;                         // Read enable
output reg  [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Ports
input  wr_clk;                         // Write clock
input  [ADDR_WIDTH-1:0] wr_addr;       // Write address
input  [NUM_SEG-1:0] wr_byte_en;       // Write byte enable
input  [WORD_SIZE-1:0] wr_data;        // Write data out

generate
  if(USE_BLOCK_RAMS) begin : use_block_ram
    fpga_1r_1w_seg_block_ram_with_init #(
    .NUM_SEG(NUM_SEG),
    .SEG_SIZE(SEG_SIZE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
    .RAM_INIT_FILE(RAM_INIT_FILE),
    .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
    )
    i_fpga_1r_1w_seg_block_ram_with_init (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_byte_en(wr_byte_en),
    .wr_data(wr_data)
    );
  end else begin : use_distributed_ram
    fpga_1r_1w_seg_distr_ram_with_init #(
    .NUM_SEG(NUM_SEG),
    .SEG_SIZE(SEG_SIZE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
    .RAM_INIT_FILE(RAM_INIT_FILE),
    .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
    )
    i_fpga_1r_1w_seg_distr_ram_with_init (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_byte_en(wr_byte_en),
    .wr_data(wr_data)
    );
  end // End if USE_BLOCK_RAMS
endgenerate

endmodule // fpga_dual_port_seg_ram_with_init

// NORMAL RAMS

// Dual ported RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
module fpga_dual_port_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;

// Read Ports
input rd_clk ;                        // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en ;                         // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Ports
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write enable
input RF_WORD_TYPE wr_data;        // Write data out

generate
  if(USE_BLOCK_RAMS) begin : use_block_ram
    fpga_1r_1w_block_ram #(
    .RF_WORD_TYPE(RF_WORD_TYPE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
    )
    i_fpga_1r_1w_block_ram (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .wr_data(wr_data)
    );
  end else begin : use_distributed_ram
    fpga_1r_1w_distr_ram #(
    .RF_WORD_TYPE(RF_WORD_TYPE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO)
    )
    i_fpga_1r_1w_distr_ram (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .wr_data(wr_data)
    );
  end // End if USE_BLOCK_RAMS
endgenerate

endmodule // fpga_dual_port_ram
// Dual ported RAM implemented with either Block or Distributed RAMs  (Based on USE_BLOCK_RAMS parameter)
// Contents of memory initialized with readmem
module fpga_dual_port_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter USE_BLOCK_RAMS = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;

// Read Ports
input rd_clk ;                        // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en ;                         // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Ports
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write enable
input RF_WORD_TYPE wr_data;        // Write data out

generate
  if(USE_BLOCK_RAMS) begin : use_block_ram
    fpga_1r_1w_block_ram_with_init #(
    .RF_WORD_TYPE(RF_WORD_TYPE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
    .RAM_INIT_FILE(RAM_INIT_FILE),
    .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
    )
    i_fpga_1r_1w_block_ram_with_init (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .wr_data(wr_data)
    );
  end else begin : use_distributed_ram
    fpga_1r_1w_distr_ram_with_init #(
    .RF_WORD_TYPE(RF_WORD_TYPE),
    .RF_SIZE(RF_SIZE),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEF_RD_DATA_IS_ZERO(DEF_RD_DATA_IS_ZERO),
    .RAM_INIT_FILE(RAM_INIT_FILE),
    .INIT_FILE_IS_HEX(INIT_FILE_IS_HEX)
    )
    i_fpga_1r_1w_distr_ram_with_init (
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .wr_clk(wr_clk),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .wr_data(wr_data)
    );
  end // End if USE_BLOCK_RAMS
endgenerate

endmodule // fpga_dual_port_ram_with_init


// Multi ported RAM with asynchronous read
module fpga_dual_port_async_ram (
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;

// Read Ports
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en ;                         // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Ports
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write enable
input RF_WORD_TYPE wr_data;        // Write data out

  fpga_1r_1w_async_ram #(
  .RF_WORD_TYPE(RF_WORD_TYPE),
  .RF_SIZE(RF_SIZE),
  .ADDR_WIDTH(ADDR_WIDTH)
  )
  i_fpga_1r_1w_async_ram (
  .rd_addr(rd_addr),
  .rd_en(rd_en),
  .rd_data(rd_data),
  .wr_clk(wr_clk),
  .wr_addr(wr_addr),
  .wr_en(wr_en),
  .wr_data(wr_data)
  );
endmodule // fpga_dual_port_async_ram

// Basic 1R/1W RAMs : These are the basic RAMs that are used to build the multi-port implementations
// Basic 1 Read 1 Write port , segmented RAM implemented with Block RAMs
module fpga_1r_1w_seg_block_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter DEF_RD_DATA_IS_ZERO = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;



// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output reg [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_SEG-1 :0] wr_byte_en;      // Write byte enable
input [WORD_SIZE-1:0] wr_data;        // Write data out

`ifdef FPGA_PRECISION_SYN
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] ;
  // pragma attribute rf_mem_byte use_resource "BLOCK_RAM"
`else // SYNPLIFY_PRO
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] /* synthesis syn_ramstyle="block_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

genvar g_seg;
generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg ++ ) begin : segment_rw
    always @ (posedge rd_clk) begin
      if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
        rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = '0;
      end
      if (rd_en) begin
          rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = rf_mem_byte[rd_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if rd_en
    end // End always
    always @ (posedge wr_clk) begin
      if (wr_byte_en[g_seg]) begin
          rf_mem_byte[wr_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] <= wr_data [(((g_seg + 1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if wr_byte_en[g_seg]
    end // End always
 end // End for g_seg
endgenerate


endmodule // fpga_1r_1w_seg_block_ram

// Basic 1 Read 1 Write port , segmented RAM implemented with Distributed RAMs
module fpga_1r_1w_seg_distr_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter DEF_RD_DATA_IS_ZERO = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;



// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output reg [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_SEG-1 :0] wr_byte_en;      // Write byte enable
input [WORD_SIZE-1:0] wr_data;        // Write data out


`ifdef FPGA_PRECISION_SYN
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] ;
  // pragma attribute rf_mem_byte use_resource "DISTRIBUTED_RAM"
`else // SYNPLIFY_PRO
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] /* synthesis syn_ramstyle="select_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN
genvar g_seg;
generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg ++ ) begin : segment_rw
    always @ (posedge rd_clk) begin
      if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
        rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = '0;
      end
      if (rd_en) begin
          rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = rf_mem_byte[rd_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if rd_en
    end // End always
    always @ (posedge wr_clk) begin
      if (wr_byte_en[g_seg]) begin
          rf_mem_byte[wr_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] <= wr_data [(((g_seg + 1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if wr_byte_en[g_seg]
    end // End always
 end // End for g_seg
endgenerate

endmodule // fpga_1r_1w_seg_distr_ram

// Basic 1 Read 1 Write port , segmented RAM implemented with Block RAMs with readmem initialization
module fpga_1r_1w_seg_block_ram_with_init (
rd_clk, 
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;



// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output reg [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_SEG-1 :0] wr_byte_en;      // Write byte enable
input [WORD_SIZE-1:0] wr_data;        // Write data out


`ifdef FPGA_PRECISION_SYN
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] ;
  // pragma attribute rf_mem_byte use_resource "BLOCK_RAM"
`else // SYNPLIFY_PRO
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] /* synthesis syn_ramstyle="block_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

initial begin
if (INIT_FILE_IS_HEX)
  $readmemh(RAM_INIT_FILE,rf_mem_byte);
else
  $readmemb(RAM_INIT_FILE,rf_mem_byte);
end

genvar g_seg;
generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg ++ ) begin : segment_rw
    always @ (posedge rd_clk) begin
      if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
        rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = '0;
      end
      if (rd_en) begin
          rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = rf_mem_byte[rd_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if rd_en
    end // End always
    always @ (posedge wr_clk) begin
      if (wr_byte_en[g_seg]) begin
          rf_mem_byte[wr_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] <= wr_data [(((g_seg + 1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if wr_byte_en[g_seg]
    end // End always
 end // End for g_seg
endgenerate


endmodule // fpga_1r_1w_seg_block_ram_with_init

// Basic 1 Read 1 Write port , segmented RAM implemented with Distributed RAMs with readmem initialization
module fpga_1r_1w_seg_distr_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_byte_en,
wr_data
);

parameter NUM_SEG = 4;
parameter SEG_SIZE = 9;
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;
parameter DEF_RD_DATA_IS_ZERO = 1;
localparam WORD_SIZE = SEG_SIZE * NUM_SEG;



// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output reg [WORD_SIZE-1:0] rd_data;   // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input [NUM_SEG-1 :0] wr_byte_en;      // Write byte enable
input [WORD_SIZE-1:0] wr_data;        // Write data out

`ifdef FPGA_PRECISION_SYN
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] ;
  // pragma attribute rf_mem_byte use_resource "DISTRIBUTED_RAM"
`else // SYNPLIFY_PRO
  reg [(NUM_SEG*SEG_SIZE)-1:0] rf_mem_byte [RF_SIZE-1:0] /* synthesis syn_ramstyle="select_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

initial begin
if (INIT_FILE_IS_HEX)
  $readmemh(RAM_INIT_FILE,rf_mem_byte);
else
  $readmemb(RAM_INIT_FILE,rf_mem_byte);
end

genvar g_seg;
generate
  for (g_seg = 0 ; g_seg < NUM_SEG ; g_seg ++ ) begin : segment_rw
    always @ (posedge rd_clk) begin
      if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
        rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = '0;
      end
      if (rd_en) begin
          rd_data[(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] = rf_mem_byte[rd_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if rd_en
    end // End always
    always @ (posedge wr_clk) begin
      if (wr_byte_en[g_seg]) begin
          rf_mem_byte[wr_addr][(((g_seg+1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)] <= wr_data [(((g_seg + 1)*SEG_SIZE)-1): (g_seg*SEG_SIZE)];
      end // End if wr_byte_en[g_seg]
    end // End always
 end // End for g_seg
endgenerate

endmodule // fpga_1r_1w_seg_distr_ram_with_init

// Basic 1 Read , 1 Write Block RAM (without byte enables)

module fpga_1r_1w_block_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter DEF_RD_DATA_IS_ZERO = 1;

// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write byte enable
input RF_WORD_TYPE wr_data;           // Write data out

`ifdef FPGA_PRECISION_SYN
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] ;
  // pragma attribute rf_mem use_resource "BLOCK_RAM"
`else // SYNPLIFY_PRO
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] /* synthesis syn_ramstyle="block_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

generate
  always @ (posedge rd_clk) begin
    if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
      rd_data = '0;
    end
    if (rd_en) begin
      rd_data = rf_mem[rd_addr];
    end // End if rd_en
  end // End always
endgenerate

always @ (posedge wr_clk) begin
  if (wr_en) begin
    rf_mem[wr_addr] <= wr_data;
  end // End if wr_en
end // End always

endmodule // fpga_1r_1w_block_ram
// Basic 1 Read , 1 Write Distributed RAM (without byte enables)
module fpga_1r_1w_distr_ram (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter DEF_RD_DATA_IS_ZERO = 1;

// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write byte enable
input RF_WORD_TYPE wr_data;           // Write data out


`ifdef FPGA_PRECISION_SYN
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] ;
  // pragma attribute rf_mem use_resource "DISTRIBUTED_RAM"
`else // SYNPLIFY_PRO
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] /* synthesis syn_ramstyle="select_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

generate
  always @ (posedge rd_clk) begin
    if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
      rd_data = '0;
    end
    if (rd_en) begin
      rd_data = rf_mem[rd_addr];
    end // End if rd_en
  end // End always
endgenerate

always @ (posedge wr_clk) begin
  if (wr_en) begin
    rf_mem[wr_addr] <= wr_data;
  end // End if wr_en
end // End always

endmodule // fpga_1r_1w_distr_ram


module fpga_1r_1w_block_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter DEF_RD_DATA_IS_ZERO = 1;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;

// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write byte enable
input RF_WORD_TYPE wr_data;           // Write data out

`ifdef FPGA_PRECISION_SYN
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] ;
  // pragma attribute rf_mem use_resource "BLOCK_RAM"
`else // SYNPLIFY_PRO
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] /* synthesis syn_ramstyle="block_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

initial begin
if (INIT_FILE_IS_HEX)
  $readmemh(RAM_INIT_FILE,rf_mem);
else
  $readmemb(RAM_INIT_FILE,rf_mem);
end

generate
  always @ (posedge rd_clk) begin
    if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
      rd_data <= '0;
    end
    if (rd_en) begin
      rd_data <= rf_mem[rd_addr];
    end // End if rd_en
  end // End always
endgenerate

always @ (posedge wr_clk) begin
  if (wr_en) begin
    rf_mem[wr_addr] <= wr_data;
  end // End if wr_en
end // End always

endmodule // fpga_1r_1w_block_ram_with_init

module fpga_1r_1w_distr_ram_with_init (
rd_clk,
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;
parameter DEF_RD_DATA_IS_ZERO = 1;
parameter RAM_INIT_FILE = "ram_init_file.mem";
parameter INIT_FILE_IS_HEX = 1;

// Read Port
input rd_clk;                         // Read clock
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write byte enable
input RF_WORD_TYPE wr_data;           // Write data out

`ifdef FPGA_PRECISION_SYN
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] ;
  // pragma attribute rf_mem use_resource "DISTRIBUTED_RAM"
`else // SYNPLIFY_PRO
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] /* synthesis syn_ramstyle="select_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

initial begin
if (INIT_FILE_IS_HEX)
  $readmemh(RAM_INIT_FILE,rf_mem);
else
  $readmemb(RAM_INIT_FILE,rf_mem);
end

generate
  always @ (posedge rd_clk) begin
    if (DEF_RD_DATA_IS_ZERO) begin : def_rd_data
      rd_data <= '0;
    end
    if (rd_en) begin
      rd_data <= rf_mem[rd_addr];
    end // End if rd_en
  end // End always
endgenerate

always @ (posedge wr_clk) begin
  if (wr_en) begin
    rf_mem[wr_addr] <= wr_data;
  end // End if wr_en
end // End always

endmodule // fpga_1r_1w_distr_ram_with_init

// Simple 1 Read / 1 Write Distributed RAM model : Reads are asynchronous , writes are synchronous to posedge of write clock
module fpga_1r_1w_async_ram (
rd_addr,
rd_en,
rd_data,
wr_clk,
wr_addr,
wr_en,
wr_data
);

parameter type RF_WORD_TYPE = logic [31:0];
parameter RF_SIZE = 1024;
parameter ADDR_WIDTH = 10;

// Read Port
input [ADDR_WIDTH-1:0] rd_addr;       // Read address
input rd_en;                          // Read enable
output RF_WORD_TYPE rd_data;          // Read data out

// Write Port 
input wr_clk;                         // Write clock
input [ADDR_WIDTH-1:0] wr_addr;       // Write address
input wr_en;                          // Write byte enable
input RF_WORD_TYPE wr_data;           // Write data out

`ifdef FPGA_PRECISION_SYN
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] ;
  // pragma attribute rf_mem use_resource "DISTRIBUTED_RAM"
`else // SYNPLIFY_PRO
  RF_WORD_TYPE rf_mem [RF_SIZE-1:0] /* synthesis syn_ramstyle="select_ram, no_rw_check, area" */ ;
`endif // `ifdef FPGA_PRECISION_SYN

always_comb begin
  if (rd_en) begin
    rd_data = rf_mem[rd_addr];
  end // End if rd_en
end // End always_comb

always @ (posedge wr_clk) begin
  if (wr_en) begin
    rf_mem[wr_addr] <= wr_data;
  end // End if wr_en
end // End always

endmodule // fpga_1r_1w_async_ram

//This macro is meant to be used in the SOCEMU implementation of clock dividers (and ONLY there , the unique name has implications in the flow)

`define MAKE_SOCEMU_MS_LATCH(imaster_q, islave_q, idin, iclkin)  \
  socemu_ms_latch  \``socemu_ms_latch_``imaster_q (            \
  .master_q(imaster_q),                                        \
  .slave_q(islave_q),                                          \
  .din(idin),                                                  \
  .clkin(iclkin)                                               \
  );


`define MAKE_SOCEMU_MS_LATCH_SYNC_RST(imaster_q, islave_q, idin, iclkin, isync_rst_in)  \
  socemu_ms_latch_sync_rst \``socemu_ms_latch_sync_rst_``imaster_q (                 \
  .master_q(imaster_q),                                                              \
  .slave_q(islave_q),                                                                \
  .din(idin),                                                                        \
  .clkin(iclkin),                                                                    \
  .sync_rst_in(isync_rst_in)                                                         \
  );

`define MAKE_SOCEMU_MS_LATCH_ASYNC_RST(imaster_q, islave_q, idin, iclkin, iasync_rst_in)  \
  socemu_ms_latch_async_rst \``socemu_ms_latch_async_rst_``imaster_q (                 \
  .master_q(imaster_q),                                                                \
  .slave_q(islave_q),                                                                  \
  .din(idin),                                                                          \
  .clkin(iclkin),                                                                      \
  .async_rst_in(iasync_rst_in)                                                         \
  );
`define MAKE_SOCEMU_MS_LATCH_ASYNC_RST_WITH_EN(imaster_q, islave_q, idin, iclkin, iasync_rst_in , ien)  \
  socemu_ms_latch_async_rst_with_en \``socemu_ms_latch_async_rst_with_en``imaster_q (                 \
  .master_q(imaster_q),                                                                \
  .slave_q(islave_q),                                                                  \
  .din(idin),                                                                          \
  .clkin(iclkin),                                                                      \
  .en(ien),                                                                            \
  .async_rst_in(iasync_rst_in)                                                         \
  );

`define MAKE_FPGA_INTERNAL_CLK_DIV(idiv_clkout, iclkin, iasync_rst , itog_condition)  \
  fpga_internal_div_clk  \``fpga_internal_div_clk_``idiv_clkout (                     \
  .div_clkout(idiv_clkout),                                                           \
  .async_rst(iasync_rst),                                                             \
  .tog_condition(itog_condition),                                                     \
  .clkin(iclkin)                                                                      \
  );

`define MAKE_FPGA_INTERNAL_DIV2_CLK(idiv_clkout, iclkin, iasync_rst) \
  `MAKE_FPGA_INTERNAL_CLK_DIV(idiv_clkout, iclkin, iasync_rst , 1'b1)

module fpga_internal_div_clk (div_clkout , clkin , async_rst , tog_condition);
// SCDC compliant clock divider with asynchronous reset
// The input "tog_condition" dictates when the clock is toggled (its toggled at the clkin edges) 
// First stage would be a Master Slave latch which is followed by a mux that selects the latch stage that is stable during that phase of clock : This ensures the divided output follows the input clock : THis is required for SCDC flow 
input clkin,async_rst, tog_condition;
output div_clkout ;
logic socemu_ms_latch_master_q; 
logic socemu_ms_latch_slave_q;
`MAKE_SOCEMU_MS_LATCH_ASYNC_RST_WITH_EN(socemu_ms_latch_master_q /*imaster_q*/,
                      socemu_ms_latch_slave_q /*islave_q*/,
                      ~socemu_ms_latch_slave_q /*idin*/,
                      clkin /*iclkin*/,
                      async_rst /*iclkin*/,
                      tog_condition /*ien*/)
assign div_clkout = async_rst ? '0 : clkin ? socemu_ms_latch_master_q : socemu_ms_latch_slave_q ;

endmodule

module socemu_ms_latch_async_rst_with_en (master_q, slave_q, din, clkin, async_rst_in , en);
input clkin, din, async_rst_in , en;
output logic master_q , slave_q;
  always_latch begin
    if (async_rst_in)
      master_q <= '0;
    else if ((~clkin) & en)
      master_q <= din ;
  end
  always_latch begin
    if (async_rst_in)
      slave_q <= '0;
    else if (clkin & en)
      slave_q <= master_q ;
  end
endmodule // socemu_ms_latch_async_rst_with_en

module socemu_ms_latch_async_rst (master_q, slave_q, din, clkin, async_rst_in);
input clkin, din, async_rst_in;
output logic master_q , slave_q;
  always_latch begin
    if (async_rst_in)
      master_q <= '0;
    else if (~ clkin)
      master_q <= din ;
  end
  always_latch begin
    if (async_rst_in)
      slave_q <= '0;
    else if (clkin)
      slave_q <= master_q ;
  end
endmodule // socemu_ms_latch_async_rst

module socemu_ms_latch_sync_rst (master_q, slave_q, din, clkin, sync_rst_in);
input clkin, din, sync_rst_in;
output logic master_q , slave_q;
  always_latch begin
    if (~ clkin) begin
      if (sync_rst_in)
        master_q <= '0 ;
      else
        master_q <= din ;
    end // End if ~clkin
  end // End always_latch
  always_latch begin
    if (clkin) begin
      if (sync_rst_in)
        slave_q <= '0;
      else
        slave_q <= master_q ;
    end // End if clkin
  end // End always_latch
endmodule // socemu_ms_latch_sync_rst

module socemu_ms_latch (master_q, slave_q, din, clkin);
input clkin, din;
output logic master_q , slave_q;
  always_latch begin
    if (~ clkin)
      master_q <= din ;
  end // End always_latch
  always_latch begin
    if (clkin)
      slave_q <= master_q ;
  end // End always_latch
endmodule // socemu_ms_latch

/* ------------------------------------ Macros for forcing signals for FPGA emulation ------------------------------- 
For VCS , you do a release and then a force (release to cut the original driver )
For Emulation , Auspy does the cutting of the original driver automatically 
---------------------------------------------------------------------------------------------------------------------*/
`define FPGA_FORCE_SIG(iorig_rtl_signal,iemu_signal)                                                 \
	`ifdef VCSSIM                                                                                \
		initial begin                                                                        \
			#5                                                                           \
			$display("WARNING : iorig_rtl_signal is being forced by iemu_signal\n");     \
			release iorig_rtl_signal;                                                    \
			force iorig_rtl_signal = iemu_signal ;                                       \
		end /* End initial */                                                                \
	`else                                                                                        \
		assign iorig_rtl_signal = iemu_signal;                                               \
	`endif /* `ifdef VCSIM */
			
`endif // `ifndef FPGA_MACROS_VS
