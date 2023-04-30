module tb;

    wire POR_N; // Manual Pad
    wire USB_P; // Manual Pad
    wire USB_N; // Manual Pad
    wire CC1; // Manual Pad
    wire CC2; // Manual Pad
    wire FLASH_TEST_VOLT; // Manual Pad
    wire FLASH_TEST_MODE0; // Manual Pad
    wire FLASH_TEST_MODE1; // Manual Pad
    wire OTP_EXT_VOLT; // Manual Pad
    wire SPI_HOST_D0; // Dedicated Pad for spi_host0_sd
    wire SPI_HOST_D1; // Dedicated Pad for spi_host0_sd
    wire SPI_HOST_D2; // Dedicated Pad for spi_host0_sd
    wire SPI_HOST_D3; // Dedicated Pad for spi_host0_sd
    wire SPI_HOST_CLK; // Dedicated Pad for spi_host0_sck
    wire SPI_HOST_CS_L; // Dedicated Pad for spi_host0_csb
    wire SPI_DEV_D0; // Dedicated Pad for spi_device_sd
    wire SPI_DEV_D1; // Dedicated Pad for spi_device_sd
    wire SPI_DEV_D2; // Dedicated Pad for spi_device_sd
    wire SPI_DEV_D3; // Dedicated Pad for spi_device_sd
    wire SPI_DEV_CLK; // Dedicated Pad for spi_device_sck
    wire SPI_DEV_CS_L; // Dedicated Pad for spi_device_csb
    wire IOR8; // Dedicated Pad for sysrst_ctrl_aon_ec_rst_l
    wire IOR9; // Dedicated Pad for sysrst_ctrl_aon_flash_wp_l
    wire AST_MISC; // Manual Pad
    wire IOA0; // MIO Pad 0
    wire IOA1; // MIO Pad 1
    wire IOA2; // MIO Pad 2
    wire IOA3; // MIO Pad 3
    wire IOA4; // MIO Pad 4
    wire IOA5; // MIO Pad 5
    wire IOA6; // MIO Pad 6
    wire IOA7; // MIO Pad 7
    wire IOA8; // MIO Pad 8
    wire IOB0; // MIO Pad 9
    wire IOB1; // MIO Pad 10
    wire IOB2; // MIO Pad 11
    wire IOB3; // MIO Pad 12
    wire IOB4; // MIO Pad 13
    wire IOB5; // MIO Pad 14
    wire IOB6; // MIO Pad 15
    wire IOB7; // MIO Pad 16
    wire IOB8; // MIO Pad 17
    wire IOB9; // MIO Pad 18
    wire IOB10; // MIO Pad 19
    wire IOB11; // MIO Pad 20
    wire IOB12; // MIO Pad 21
    wire IOC0; // MIO Pad 22
    wire IOC1; // MIO Pad 23
    wire IOC2; // MIO Pad 24
    wire IOC3; // MIO Pad 25
    wire IOC4; // MIO Pad 26
    wire IOC5; // MIO Pad 27
    wire IOC6; // MIO Pad 28
    wire IOC7; // MIO Pad 29
    wire IOC8; // MIO Pad 30
    wire IOC9; // MIO Pad 31
    wire IOC10; // MIO Pad 32
    wire IOC11; // MIO Pad 33
    wire IOC12; // MIO Pad 34
    wire IOR0; // MIO Pad 35
    wire IOR1; // MIO Pad 36
    wire IOR2; // MIO Pad 37
    wire IOR3; // MIO Pad 38
    wire IOR4; // MIO Pad 39
    wire IOR5; // MIO Pad 40
    wire IOR6; // MIO Pad 41
    wire IOR7; // MIO Pad 42
    wire IOR10; // MIO Pad 43
    wire IOR11; // MIO Pad 44
    wire IOR12; // MIO Pad 45
    wire IOR13; // MIO Pad 46

    chip_earlgrey_asic u_chip_earlgrey_asic (
        .*
    );

    initial begin
	    $finish;
    end

endmodule