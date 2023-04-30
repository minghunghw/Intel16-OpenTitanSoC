module toy_design (
    // output pad interface
    input  clk_i_PAD,
    input  rst_ni_PAD,
    input  [3:0] addr_PAD,
    input  if_read,
    output [3:0] r_data
    // input  prim_mubi_pkg::mubi4_t   en_ifetch_i_PAD, // 4 bits
    // input  tlul_pkg::tl_h2d_t       tl_i_PAD, // 109 bits = 1+3+3+2+8+32+4+32+23+1
    // output tlul_pkg::tl_d2h_t       tl_o_PAD  // 75 bits = 1+3+3+2+8+1+32+23+1+1        
);

   // core-to-gpio interface
    logic clk_i;
    logic rst_ni;
    prim_mubi_pkg::mubi4_t   en_ifetch_i; // 4 bits
    tlul_pkg::tl_h2d_t       tl_i; // 109 bits = 1+3+3+2+8+32+4+32+23+1
    tlul_pkg::tl_d2h_t       tl_o; // 75 bits = 1+3+3+2+8+1+32+23+1+1     
    // ~tl_o -> pd -> pad ->tl_o_PAD

    assign en_ifetch_i = prim_mubi_pkg::MuBi4True;
    always_comb begin
        tl_i.a_valid    = 1;
        tl_i.a_opcode   = (if_read)? tlul_pkg::Get : tlul_pkg::PutFullData;
        tl_i.a_param    = 0;
        tl_i.a_size     = 2;
        tl_i.a_source   = 0;
        tl_i.a_address  = addr_PAD;
        tl_i.a_mask     = 4'hf;
        tl_i.a_data     = (if_read)? 0: addr_PAD/4;
        tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
        tl_i.d_ready    = 1;
        tl_i = tlul_pkg::TL_H2D_DEFAULT;
    end


    mem_tlul u_mem_tlul (
        .clk_i       (clk_i             ),
        .rst_ni      (rst_ni            ),
        .en_ifetch_i (en_ifetch_i       ),
        .tl_i        (tl_i ),
        .tl_o        (tl_o )
    );


    // input data flow: 115/4=29
    // hl_4slice_west_io u_west_in [28:0] (
    //     .dq            (1'b0    ),      
    //     .drv0          (1'b0    ),      
    //     .drv1          (1'b0    ),      
    //     .drv2          (1'b0    ),      
    //     .enabq         (1'b0    ),      
    //     .enq           (1'b1    ),      
    //     .outi          ({unused_input, clk_i, rst_ni, en_ifetch_i_tmp, tl_i_tmp}),      
    //     .pad           ({1'b0, clk_i_PAD, rst_ni_PAD, en_ifetch_i_out, tl_i_out}),      
    //     .pd            (1'b0    ),      
    //     .ppen          (1'b0    ),      
    //     .prg_slew      (1'b0    ),      
    //     .puq           (1'b1    ),      
    //     .pwrup_pull_en (1'b0    ),      
    //     .pwrupzhl      (1'b0    )     
    // );


    // output data flow: 75/4=19
    // hl_4slice_west_io u_west_out [18:0] ( 
    //     .dq            (~{1'b0,tl_o_tmp} ),           
    //     .drv0          (1'b0       ),           
    //     .drv1          (1'b0       ),           
    //     .drv2          (1'b0       ),  
    //     .enabq         (1'b1       ),          
    //     .enq           (1'b0       ),           
    //     .outi          (           ),  
    //     .pad           ({unused_output, tl_o_out}     ), 
    //     .pd            (1'b0       ),   
    //     .ppen          (1'b1       ),     
    //     .prg_slew      (1'b0       ),         
    //     .puq           (1'b1       ),      
    //     .pwrup_pull_en (1'b0       ),      
    //     .pwrupzhl      (1'b0       )           
    // );


    // hl_4slice_west_io u_west (
    // input [3:0] dq,
    // input [3:0] drv0,
    // input [3:0] drv1,
    // input [3:0] drv2,
    // input [3:0] enabq,
    // input [3:0] enq,
    // output [3:0] outi,
    // inout [3:0] pad,
    // input [3:0] pd,
    // input [3:0] ppen,
    // input [3:0] prg_slew,
    // input [3:0] puq,
    // input [3:0] pwrup_pull_en,
    // input [3:0] pwrupzhl);

    // hl_8slice_south_io u_south (
    // input [7:0] dq,
    // input [7:0] drv0,
    // input [7:0] drv1,
    // input [7:0] drv2,
    // input [7:0] enabq,
    // input [7:0] enq,
    // output [7:0] outi,
    // inout [7:0] pad,
    // input [7:0] pd,
    // input [7:0] ppen,
    // input [7:0] prg_slew,
    // input [7:0] puq,
    // input [7:0] pwrup_pull_en,
    // input [7:0] pwrupzhl);

    // hl_corner_io u_corner (
    // input [9:0] dq;
    // input [9:0] drv0;
    // input [9:0] drv1;
    // input [9:0] drv2;
    // input [9:0] enabq;
    // input [9:0] enq;
    // output [9:0] outi;
    // inout [9:0] pad;
    // input [9:0] pd;
    // input [9:0] ppen;
    // input [9:0] prg_slew;
    // input [9:0] puq;
    // input [9:0] pwrup_pull_en;
    // input [9:0] pwrupzhl);

endmodule