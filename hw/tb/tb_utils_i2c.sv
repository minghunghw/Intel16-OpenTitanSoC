module tb;
    //hengyu Ding i2c test
    //typical address 
//   parameter logic [BlockAw-1:0] I2C_INTR_STATE_OFFSET = 7'h 0;
//   parameter logic [BlockAw-1:0] I2C_INTR_ENABLE_OFFSET = 7'h 4;
//   parameter logic [BlockAw-1:0] I2C_INTR_TEST_OFFSET = 7'h 8;
//   parameter logic [BlockAw-1:0] I2C_ALERT_TEST_OFFSET = 7'h c;
//   parameter logic [BlockAw-1:0] I2C_CTRL_OFFSET = 7'h 10;
//   parameter logic [BlockAw-1:0] I2C_STATUS_OFFSET = 7'h 14;
//   parameter logic [BlockAw-1:0] I2C_RDATA_OFFSET = 7'h 18;
//   parameter logic [BlockAw-1:0] I2C_FDATA_OFFSET = 7'h 1c;
//   parameter logic [BlockAw-1:0] I2C_FIFO_CTRL_OFFSET = 7'h 20;
//   parameter logic [BlockAw-1:0] I2C_FIFO_STATUS_OFFSET = 7'h 24;
//   parameter logic [BlockAw-1:0] I2C_OVRD_OFFSET = 7'h 28;
//   parameter logic [BlockAw-1:0] I2C_VAL_OFFSET = 7'h 2c;
//   parameter logic [BlockAw-1:0] I2C_TIMING0_OFFSET = 7'h 30;
//   parameter logic [BlockAw-1:0] I2C_TIMING1_OFFSET = 7'h 34;
//   parameter logic [BlockAw-1:0] I2C_TIMING2_OFFSET = 7'h 38;
//   parameter logic [BlockAw-1:0] I2C_TIMING3_OFFSET = 7'h 3c;
//   parameter logic [BlockAw-1:0] I2C_TIMING4_OFFSET = 7'h 40;
//   parameter logic [BlockAw-1:0] I2C_TIMEOUT_CTRL_OFFSET = 7'h 44;
//   parameter logic [BlockAw-1:0] I2C_TARGET_ID_OFFSET = 7'h 48;
//   parameter logic [BlockAw-1:0] I2C_ACQDATA_OFFSET = 7'h 4c;
//   parameter logic [BlockAw-1:0] I2C_TXDATA_OFFSET = 7'h 50;
//   parameter logic [BlockAw-1:0] I2C_HOST_TIMEOUT_CTRL_OFFSET = 7'h 54;

    //easily using directiction 
    //1 set host
    //2 time control:I2C_TIMING4_OFFSET,I2C_TIMING3_OFFSET,I2C_TIMING2_OFFSET,I2C_TIMING1_OFFSET,I2C_TIMING0_OFFSET
    //3 time out control  I2C_TIMEOUT_CTRL_OFFSET
    //4 formate tx I2C_FDATA_OFFSET (in this test use 01111101) (send reserved data so the resualt should be 10000010)
    //tips the resualt image is in pre_syn_unit/test_image






    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    prim_alert_pkg::alert_rx_t [i2c_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [i2c_reg_pkg::NumAlerts-1:0] alert_tx_o;

    // Generic IO
    logic cio_scl_i;
    logic cio_scl_o;
    logic cio_scl_en_o;
    logic cio_sda_i;
    logic cio_sda_o;
    logic cio_sda_en_o;

    // Interrupts
    logic intr_fmt_threshold_o;
    logic intr_rx_threshold_o;
    logic intr_fmt_overflow_o;
    logic intr_rx_overflow_o;
    logic intr_nak_o;
    logic intr_scl_interference_o;
    logic intr_sda_interference_o;
    logic intr_stretch_timeout_o;
    logic intr_sda_unstable_o;
    logic intr_cmd_complete_o;
    logic intr_tx_stretch_o;
    logic intr_tx_overflow_o;
    logic intr_acq_full_o;
    logic intr_unexp_stop_o;
    logic intr_host_timeout_o;

    tlul_pkg::tl_h2d_t tl_i_enc;

    logic [31:0] addr, data;
    logic valid;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    i2c u_i2c (
        .tl_i   (tl_i_enc ),
        .*
    );

    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i           = tlul_pkg::TL_H2D_DEFAULT;
        alert_rx_i     = {i2c_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
        cio_scl_i      = 1;
        cio_sda_i      = 1;
        rst_ni         = 0;
        tl_i.d_ready   = 0;

        @(posedge clk_i)
        rst_ni      = 0;
        @(posedge clk_i)
        rst_ni      = 1;

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_CTRL_OFFSET;
        data = 1; // set as host
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_FIFO_CTRL_OFFSET;//reset fifo data (rx tx fmt acq)
        data = 32'd387; // 
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_TIMING0_OFFSET;//interrupt enable 
        data = 32'd655363;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd4233780501;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_TIMING1_OFFSET;//interrupt enable 
        data = 32'd196609;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//state control 
        data = 32'd3372437412;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_TIMING2_OFFSET;//time control 
        data = 32'd65537;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd648608330;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);  

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_TIMING3_OFFSET;//interrupt enable 
        data = 32'd131076;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);    
        

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd1666185812;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);  

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_TIMING4_OFFSET;//interrupt enable 
        data = 32'd262147;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);   

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd244565957;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);  

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_TIMEOUT_CTRL_OFFSET;//interrupt enable 
        data = 32'd1;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);   

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd2704488055;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_FIFO_CTRL_OFFSET;//interrupt enable 
        data = 32'd68;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd3052697416;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd1029077803;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);
        

        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 



        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd1963911587;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);


        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 

        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_FDATA_OFFSET;//interrupt enable 
        data = 32'd381;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);


        @(posedge clk_i)
        addr = 7'h58;//invalid signal
        data = 32'h0000_010e; // target address & mask
        valid = 0;// set invalid signal
        invoke_i2c(addr, data, valid, tl_i); 


        @(posedge clk_i)
        addr = i2c_reg_pkg::I2C_STATUS_OFFSET;//interrupt enable 
        data = 32'd3035734049;//all the interrupt
        valid = 1;
        invoke_i2c(addr, data, valid, tl_i);

        #3000;
	    $finish;
    end

endmodule



task automatic invoke_i2c;
    input [31:0] addr;
    input [31:0] data;
    input valid;
    output tlul_pkg::tl_h2d_t tl_i;
    tl_i.a_valid    = valid;
    tl_i.a_opcode   = tlul_pkg::PutFullData;
    tl_i.a_param    = 0;
    tl_i.a_size     = 2;
    tl_i.a_source   = 0;
    tl_i.a_address  = addr;
    tl_i.a_mask     = 4'hf;
    tl_i.a_data     = data;
    tl_i.a_user     = tlul_pkg::TL_A_USER_DEFAULT;
    tl_i.d_ready    = 1;
endtask

