

module dhm_sleep_logic (
        scan_mode,
        pd_state,
        sleep,
        sleep_n,
        sleep_ack,
        all_slept,
        rreg_save,
        rreg_restore,
        save,
        save_n,
        restore,
        restore_n
);

input           scan_mode;
input   [2:0]   pd_state;
output          sleep;
output          sleep_n;
input           sleep_ack;
output          all_slept;
input           rreg_save;
input           rreg_restore;
output          save;
output          save_n;
output          restore;
output          restore_n;

// Important!
// The pd_state is reset to 0 when reset_n is asserted.
// This means that the sleep signals are asserted on reset,
// which means that the cores are powered down on reset.
// During ATPG, we need to ensure that the cores are powered up.
// Therefore, use scan_mode to force the cores on during ATPG.

assign sleep         = (scan_mode) ? 1'b0 : ~pd_state[1];
assign sleep_n       = ~sleep;

assign all_slept     = sleep_ack;

assign save          =  rreg_save;
assign save_n        = ~rreg_save;
assign restore       =  rreg_restore;
assign restore_n     = ~rreg_restore;

endmodule

////////////////////////////////////////////////////////////////////////////////
// end of file
////////////////////////////////////////////////////////////////////////////////
