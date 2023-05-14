`include "reset_test.sv"
repeat(2) begin
   //dfx_in.tap.adc_sel_in = $dist_uniform(seed, 1, 7);
   //dfx_in.tap.adc_start_cnt = 2'b01;
   //dfx_in.tap.adc_start = 1'b1;
//   dut.tap_in.adc_sel_in = $dist_uniform(seed, 1, 7);
//   dut.tap_in.adc_start_cnt = 2'b01;
//   dut.tap_in.adc_start = 1'b1;

   repeat(4 * (100+1027) * 2) #(phase_clk_ref);

   //dfx_in.tap.adc_start = 1'b0;
//   dut.tap_in.adc_start = 1'b0;
   //dut.tap_in   = '0;

   repeat(5 * 2) #(phase_clk_ref);
   //if (dfx_out.tap.adc_start) begin
   if (dut.tap_out.adc_start) begin
      $display("[%.0f ps] [ERROR] [ADC_START_STUCK] ADC is not correctly deasserting the start signal when start deasserts\n", $realtime());
   end
end


