module toy_design (
    // input  clk_i_PAD,
    // input  rst_ni_PAD,
    // input  en_ifetch_PAD,
    // input  tl_valid_PAD,
    // input  read_PAD,
    // input  [3:0] waddr_PAD,
    // input  [3:0] wdata_PAD,
    // input  [3:0] raddr_PAD,
    // output [3:0] rdata_PAD,
    // output rvalid_PAD     
);

    logic clk_i;
    logic rst_ni;
    logic en_ifetch;
    logic tl_valid;
    logic read;
    logic [3:0] waddr;
    logic [3:0] wdata;
    logic [3:0] raddr;
    logic [3:0] rdata;
    logic rvalid;

    prim_mubi_pkg::mubi4_t   en_ifetch_i;
    tlul_pkg::tl_h2d_t       tl_i; 
    tlul_pkg::tl_d2h_t       tl_o;  

    tlul_pkg::tl_a_op_e opcode;
    logic [31:0] addr, data;
    logic        unused_1bit;
    logic [ 3:0] unused_4bit;    

    assign en_ifetch_i = (en_ifetch) ? prim_mubi_pkg::MuBi4True : prim_mubi_pkg::MuBi4False;
    assign tl_i = '{
        a_valid:    tl_valid,
        a_opcode:   opcode,
        a_param:    3'b0,
        a_size:     2'd2,
        a_source:   8'b0,
        a_address:  addr,
        a_mask:     4'hf,
        a_data:     data,
        a_user:     tlul_pkg::TL_A_USER_DEFAULT,
        d_ready:    1'b1
    };
    assign opcode   = (read) ? tlul_pkg::Get : tlul_pkg::PutFullData;
    assign addr     = (read) ? {26'h0, raddr, 2'h0} : {26'h0, waddr, 2'h0};
    assign data     = {28'h0, wdata};
    assign rdata    = tl_o.d_data[3:0];
    assign rvalid   = tl_o.d_valid;

    mem_tlul u_mem_tlul (
        .*
    );

    hl_4slice_west_io u_west (
        // .pad           ({clk_i_PAD, rst_ni_PAD, en_ifetch_PAD, tl_valid_PAD}    ), // in from_ext, out to_ext
        .outi          ({clk_i, rst_ni, en_ifetch, tl_valid}                    ), // in to_chip
        .dq            (4'h0    ), // in 0, out from_chip
        .drv0          (4'h0    ),   
        .drv1          (4'h0    ),   
        .drv2          (4'h0    ),   
        .enq           (4'hf    ), // in 1, out 0
        .enabq         (4'h0    ), // in 0, out 1                     
        .pd            (4'h0    ), 
        .puq           (4'hf    ),  
        .pwrupzhl      (4'h0    ),          
        .pwrup_pull_en (4'h0    ), 
        .ppen          (4'h0    ), // in 0, out 1
        .prg_slew      (4'h0    )                 
    );

    hl_8slice_south_io u_south (
        // .pad           ({waddr_PAD, wdata_PAD}  ), // in from_ext, out to_ext
        .outi          ({waddr, wdata}          ), // in to_chip
        .dq            (8'h0    ), // in 0, out from_chip
        .drv0          (8'h0    ),   
        .drv1          (8'h0    ),   
        .drv2          (8'h0    ),   
        .enq           (8'hff   ), // in 1, out 0
        .enabq         (8'h0    ), // in 0, out 1                     
        .pd            (8'h0    ), 
        .puq           (8'hff   ),  
        .pwrupzhl      (8'h0    ),          
        .pwrup_pull_en (8'h0    ), 
        .ppen          (8'h0    ), // in 0, out 1
        .prg_slew      (8'h0    )                 
    );

    hl_corner_io u_corner (
        // .pad           ({read_PAD, rvalid_PAD, raddr_PAD, rdata_PAD}    ), // in from_ext, out to_ext
        .outi          ({read, unused_1bit, raddr, unused_4bit}         ), // in to_chip
        .dq            ({1'h0, ~rvalid, 4'h0, ~rdata}                   ), // in 0, out from_chip
        .drv0          (10'h0    ),   
        .drv1          (10'h0    ),   
        .drv2          (10'h0    ),   
        .enq           (10'h2f0  ), // in 1, out 0
        .enabq         (10'h10f  ), // in 0, out 1                     
        .pd            (10'h0    ), 
        .puq           (10'h3ff  ),  
        .pwrupzhl      (10'h0    ),          
        .pwrup_pull_en (10'h0    ), 
        .ppen          (10'h10f  ), // in 0, out 1
        .prg_slew      (10'h0    )                 
    );

endmodule