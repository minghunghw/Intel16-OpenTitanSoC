module serial_gen(
  input           clk_i,
  input           rst_ni,
  output logic    seq,
  output logic    clk_div16
);
   logic [3:0]            cnt ;
   always @(posedge clk_i or negedge rst_ni) begin
      if (!rst_ni) begin
         cnt    <= 'b0 ;
      end
      else if (cnt == 7) begin
         cnt    <= 'b0 ;
      end
      else begin
         cnt    <= cnt + 1'b1 ;
      end
   end
      logic                  clk_div16_r ;
   always @(posedge clk_i or negedge rst_ni) begin
      if (!rst_ni) begin
         clk_div16_r <= 1'b0 ;
      end
      else if (cnt == 7 ) begin
         clk_div16_r <= ~clk_div16_r ;
      end
   end
   assign clk_div16 = clk_div16_r ;

   logic [10:0] serial_ini;
   always@(posedge clk_div16 or negedge rst_ni) begin
        if(!rst_ni) begin serial_ini <=11'b01111010101;
        seq <=1;end
        else begin serial_ini <= {serial_ini[9:0],serial_ini[10]};
        seq <= serial_ini[10];end
   end
endmodule



    //hengyu Ding uart test
    //typical address 
//   parameter logic [BlockAw-1:0] UART_INTR_STATE_OFFSET = 6'h 0;
//   parameter logic [BlockAw-1:0] UART_INTR_ENABLE_OFFSET = 6'h 4;
//   parameter logic [BlockAw-1:0] UART_INTR_TEST_OFFSET = 6'h 8;
//   parameter logic [BlockAw-1:0] UART_ALERT_TEST_OFFSET = 6'h c;
//   parameter logic [BlockAw-1:0] UART_CTRL_OFFSET = 6'h 10;
//   parameter logic [BlockAw-1:0] UART_STATUS_OFFSET = 6'h 14;
//   parameter logic [BlockAw-1:0] UART_RDATA_OFFSET = 6'h 18;
//   parameter logic [BlockAw-1:0] UART_WDATA_OFFSET = 6'h 1c;
//   parameter logic [BlockAw-1:0] UART_FIFO_CTRL_OFFSET = 6'h 20;
//   parameter logic [BlockAw-1:0] UART_FIFO_STATUS_OFFSET = 6'h 24;
//   parameter logic [BlockAw-1:0] UART_OVRD_OFFSET = 6'h 28;
//   parameter logic [BlockAw-1:0] UART_VAL_OFFSET = 6'h 2c;
//   parameter logic [BlockAw-1:0] UART_TIMEOUT_CTRL_OFFSET = 6'h 30;

    //easily using directiction 
    //1 write data to tx fifo 
    //2 set as host,and set baud rate
    //3 transmate
    //tips the resualt image is in pre_syn_unit/test_image


module tb;

    localparam CLK_PERIOD   = 10;

    logic clk_i;
    logic rst_ni;
    logic clk_div16;

    tlul_pkg::tl_h2d_t tl_i;
    tlul_pkg::tl_d2h_t tl_o;

    prim_alert_pkg::alert_rx_t [uart_reg_pkg::NumAlerts-1:0] alert_rx_i;
    prim_alert_pkg::alert_tx_t [uart_reg_pkg::NumAlerts-1:0] alert_tx_o;

  // Generic IO
  // Generic IO
    logic    cio_rx_i;
    logic    cio_tx_o;
    logic    cio_tx_en_o;

    // Interrupts
    logic    intr_tx_watermark_o ;
    logic    intr_rx_watermark_o ;
    logic    intr_tx_empty_o  ;
    logic    intr_rx_overflow_o  ;
    logic    intr_rx_frame_err_o ;
    logic    intr_rx_break_err_o ;
    logic    intr_rx_timeout_o   ;
    logic    intr_rx_parity_err_o ;

    tlul_pkg::tl_h2d_t tl_i_enc;

    logic [31:0] addr, data;
    logic valid;

    serial_gen serial_0111101011 (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .clk_div16(clk_div16),
        .seq(cio_rx_i)
    );

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i     ),
        .tl_o   (tl_i_enc )
    );

    uart u_uart (
        .tl_i   (tl_i_enc ),
        .*
    );


    initial clk_i = 0;
    initial rst_ni = 0;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        
        tl_i           = tlul_pkg::TL_H2D_DEFAULT;
        alert_rx_i     = {uart_reg_pkg::NumAlerts{prim_alert_pkg::ALERT_RX_DEFAULT}};
        rst_ni      = 1;

        @(posedge clk_i)
        rst_ni      = 0;
        @(posedge clk_i)
        rst_ni      = 1;


        @(negedge clk_i)
        addr = uart_reg_pkg::UART_WDATA_OFFSET;
        data = 32'h0000_00af; // 
        valid = 1;
        invoke_uart(addr, data, valid, tl_i);

        @(negedge clk_i)
        addr = uart_reg_pkg::UART_WDATA_OFFSET;
        data = 32'h0000_00af; // 
        valid = 0;
        invoke_uart(addr, data, valid, tl_i);

        @(negedge clk_i)
        addr = uart_reg_pkg::UART_WDATA_OFFSET;
        data = 32'h0000_00aa; // 
        valid = 1;
        invoke_uart(addr, data, valid, tl_i);

        @(negedge clk_i)
        addr = uart_reg_pkg::UART_WDATA_OFFSET;
        data = 32'h0000_00aa; // 
        valid = 0;
        invoke_uart(addr, data, valid, tl_i);

        @(negedge clk_i)
        addr = uart_reg_pkg::UART_CTRL_OFFSET;
        data = 32'hffff_0041; // set as host,and set baud rate
        valid = 1;
        invoke_uart(addr, data, valid, tl_i);

        #3000
      // below code test the rx function
        @(posedge clk_i)
        rst_ni      = 0;
        @(posedge clk_i)
        rst_ni      = 1;
        @(negedge clk_i)
        addr = uart_reg_pkg::UART_CTRL_OFFSET;
        data = 32'hffff_0042; // set as target,and rxenable
        valid = 1;
        invoke_uart(addr, data, valid, tl_i);

        #2000//need time for baud rate to transmate all the data

        @(negedge clk_i)
        addr = uart_reg_pkg::UART_RDATA_OFFSET;
        data = 32'hffff_0002; 
        valid = 1;
        invoke_uart(addr, data, valid, tl_i);
        #1000
	    $finish;
    end

endmodule

task automatic invoke_uart;
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


