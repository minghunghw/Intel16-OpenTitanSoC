module gpio_tlul (
    input clk_i,
    input rst_ni,

    // Bus interface
    input  tlul_pkg::tl_h2d_t tl_i,
    output tlul_pkg::tl_d2h_t tl_o,

    // Interrupts
    output logic [31:0] intr_gpio_o,

    // Alerts
    input  prim_alert_pkg::alert_rx_t [gpio_reg_pkg::NumAlerts-1:0] alert_rx_i,
    output prim_alert_pkg::alert_tx_t [gpio_reg_pkg::NumAlerts-1:0] alert_tx_o,

    // GPIOs
    input        [31:0] cio_gpio_i,
    output logic [31:0] cio_gpio_o,
    output logic [31:0] cio_gpio_en_o
);

    tlul_pkg::tl_h2d_t tl_i_encode;

    tlul_cmd_intg_gen u_tlul_cmd_intg_gen (
        .tl_i   (tl_i        ),
        .tl_o   (tl_i_encode )
    );

    gpio u_gpio (
        .clk_i          (clk_i         ),
        .rst_ni         (rst_ni        ),
        .tl_i           (tl_i_encode   ),
        .tl_o           (tl_o          ),
        .intr_gpio_o    (intr_gpio_o   ),
        .alert_rx_i     (alert_rx_i    ),
        .alert_tx_o     (alert_tx_o    ),
        .cio_gpio_i     (cio_gpio_i    ),
        .cio_gpio_o     (cio_gpio_o    ),
        .cio_gpio_en_o  (cio_gpio_en_o )
    );

endmodule