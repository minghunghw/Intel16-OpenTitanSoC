
module dhm_buf (
  sleep,
  sleep_n,
  local_sleep,
  local_sleep_n
);

input        sleep;
input        sleep_n;
output       local_sleep;
output       local_sleep_n;

assign local_sleep = sleep;
assign local_sleep_n = sleep_n;

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
