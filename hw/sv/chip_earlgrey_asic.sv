module chip_earlgrey_asic #(
  parameter bit SecRomCtrlDisableScrambling = 1'b0
) (
  inout  [70:0] chip_io,
  output [70:0] oe
);

  import top_earlgrey_pkg::*;
  import prim_pad_wrapper_pkg::*;

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

  ////////////////////////////
  // Special Signal Indices //
  ////////////////////////////

  localparam int Tap0PadIdx = 30;
  localparam int Tap1PadIdx = 27;
  localparam int Dft0PadIdx = 25;
  localparam int Dft1PadIdx = 26;
  localparam int TckPadIdx = 38;
  localparam int TmsPadIdx = 35;
  localparam int TrstNPadIdx = 39;
  localparam int TdiPadIdx = 37;
  localparam int TdoPadIdx = 36;

  // DFT and Debug signal positions in the pinout.
  localparam pinmux_pkg::target_cfg_t PinmuxTargetCfg = '{
    tck_idx:           TckPadIdx,
    tms_idx:           TmsPadIdx,
    trst_idx:          TrstNPadIdx,
    tdi_idx:           TdiPadIdx,
    tdo_idx:           TdoPadIdx,
    tap_strap0_idx:    Tap0PadIdx,
    tap_strap1_idx:    Tap1PadIdx,
    dft_strap0_idx:    Dft0PadIdx,
    dft_strap1_idx:    Dft1PadIdx,
    // TODO: check whether there is a better way to pass these USB-specific params
    usb_dp_idx:        DioUsbdevUsbDp,
    usb_dn_idx:        DioUsbdevUsbDn,
    usb_sense_idx:     MioInUsbdevSense,
    // Pad types for attribute WARL behavior
    dio_pad_type: {
      BidirStd, // DIO spi_host0_csb
      BidirStd, // DIO spi_host0_sck
      InputStd, // DIO spi_device_csb
      InputStd, // DIO spi_device_sck
      BidirOd, // DIO sysrst_ctrl_aon_flash_wp_l
      BidirOd, // DIO sysrst_ctrl_aon_ec_rst_l
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO usbdev_usb_dn
      BidirStd  // DIO usbdev_usb_dp
    },
    mio_pad_type: {
      BidirOd, // MIO Pad 46
      BidirOd, // MIO Pad 45
      BidirOd, // MIO Pad 44
      BidirOd, // MIO Pad 43
      BidirStd, // MIO Pad 42
      BidirStd, // MIO Pad 41
      BidirStd, // MIO Pad 40
      BidirStd, // MIO Pad 39
      BidirStd, // MIO Pad 38
      BidirStd, // MIO Pad 37
      BidirStd, // MIO Pad 36
      BidirStd, // MIO Pad 35
      BidirOd, // MIO Pad 34
      BidirOd, // MIO Pad 33
      BidirOd, // MIO Pad 32
      BidirStd, // MIO Pad 31
      BidirStd, // MIO Pad 30
      BidirStd, // MIO Pad 29
      BidirStd, // MIO Pad 28
      BidirStd, // MIO Pad 27
      BidirStd, // MIO Pad 26
      BidirStd, // MIO Pad 25
      BidirStd, // MIO Pad 24
      BidirStd, // MIO Pad 23
      BidirStd, // MIO Pad 22
      BidirOd, // MIO Pad 21
      BidirOd, // MIO Pad 20
      BidirOd, // MIO Pad 19
      BidirOd, // MIO Pad 18
      BidirStd, // MIO Pad 17
      BidirStd, // MIO Pad 16
      BidirStd, // MIO Pad 15
      BidirStd, // MIO Pad 14
      BidirStd, // MIO Pad 13
      BidirStd, // MIO Pad 12
      BidirStd, // MIO Pad 11
      BidirStd, // MIO Pad 10
      BidirStd, // MIO Pad 9
      BidirOd, // MIO Pad 8
      BidirOd, // MIO Pad 7
      BidirOd, // MIO Pad 6
      BidirStd, // MIO Pad 5
      BidirStd, // MIO Pad 4
      BidirStd, // MIO Pad 3
      BidirStd, // MIO Pad 2
      BidirStd, // MIO Pad 1
      BidirStd  // MIO Pad 0
    }
  };

  ////////////////////////
  // Signal definitions //
  ////////////////////////


  pad_attr_t [pinmux_reg_pkg::NMioPads-1:0] mio_attr;
  pad_attr_t [pinmux_reg_pkg::NDioPads-1:0] dio_attr;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_out;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_oe;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in_raw;
  logic [24-1:0]                       dio_in_raw;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_out;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_oe;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_in;

  logic unused_mio_in_raw;
  logic unused_dio_in_raw;
  assign unused_mio_in_raw = ^mio_in_raw;
  assign unused_dio_in_raw = ^dio_in_raw;

  // Manual pads
  logic manual_in_por_n, manual_out_por_n, manual_oe_por_n;
  logic manual_in_usb_p, manual_out_usb_p, manual_oe_usb_p;
  logic manual_in_usb_n, manual_out_usb_n, manual_oe_usb_n;
  logic manual_in_cc1, manual_out_cc1, manual_oe_cc1;
  logic manual_in_cc2, manual_out_cc2, manual_oe_cc2;
  logic manual_in_flash_test_volt, manual_out_flash_test_volt, manual_oe_flash_test_volt;
  logic manual_in_flash_test_mode0, manual_out_flash_test_mode0, manual_oe_flash_test_mode0;
  logic manual_in_flash_test_mode1, manual_out_flash_test_mode1, manual_oe_flash_test_mode1;
  logic manual_in_otp_ext_volt, manual_out_otp_ext_volt, manual_oe_otp_ext_volt;
  logic manual_in_ast_misc, manual_out_ast_misc, manual_oe_ast_misc;

  pad_attr_t manual_attr_por_n;
  pad_attr_t manual_attr_usb_p;
  pad_attr_t manual_attr_usb_n;
  pad_attr_t manual_attr_cc1;
  pad_attr_t manual_attr_cc2;
  pad_attr_t manual_attr_flash_test_volt;
  pad_attr_t manual_attr_flash_test_mode0;
  pad_attr_t manual_attr_flash_test_mode1;
  pad_attr_t manual_attr_otp_ext_volt;
  pad_attr_t manual_attr_ast_misc;

  assign chip_io[0] = (oe[0]) ? POR_N : 1'bz;
  assign chip_io[1] = (oe[1]) ? USB_P : 1'bz;
  assign chip_io[2] = (oe[2]) ? USB_N : 1'bz;
  assign chip_io[3] = (oe[3]) ? CC1 : 1'bz;
  assign chip_io[4] = (oe[4]) ? CC2 : 1'bz;
  assign chip_io[5] = (oe[5]) ? FLASH_TEST_VOLT : 1'bz;
  assign chip_io[6] = (oe[6]) ? FLASH_TEST_MODE0 : 1'bz;
  assign chip_io[7] = (oe[7]) ? FLASH_TEST_MODE1 : 1'bz;
  assign chip_io[8] = (oe[8]) ? OTP_EXT_VOLT : 1'bz;
  assign chip_io[9] = (oe[9]) ? SPI_HOST_D0 : 1'bz;
  assign chip_io[10] = (oe[10]) ? SPI_HOST_D1 : 1'bz;
  assign chip_io[11] = (oe[11]) ? SPI_HOST_D2 : 1'bz;
  assign chip_io[12] = (oe[12]) ? SPI_HOST_D3 : 1'bz;
  assign chip_io[13] = (oe[13]) ? SPI_HOST_CLK : 1'bz;
  assign chip_io[14] = (oe[14]) ? SPI_HOST_CS_L : 1'bz;
  assign chip_io[15] = (oe[15]) ? SPI_DEV_D0 : 1'bz;
  assign chip_io[16] = (oe[16]) ? SPI_DEV_D1 : 1'bz;
  assign chip_io[17] = (oe[17]) ? SPI_DEV_D2 : 1'bz;
  assign chip_io[18] = (oe[18]) ? SPI_DEV_D3 : 1'bz;
  assign chip_io[19] = (oe[19]) ? SPI_DEV_CLK : 1'bz;
  assign chip_io[20] = (oe[20]) ? SPI_DEV_CS_L : 1'bz;
  assign chip_io[21] = (oe[21]) ? IOR8 : 1'bz;
  assign chip_io[22] = (oe[22]) ? IOR9 : 1'bz;
  assign chip_io[23] = (oe[23]) ? AST_MISC : 1'bz;
  assign chip_io[24] = (oe[24]) ? IOA0 : 1'bz;
  assign chip_io[25] = (oe[25]) ? IOA1 : 1'bz;
  assign chip_io[26] = (oe[26]) ? IOA2 : 1'bz;
  assign chip_io[27] = (oe[27]) ? IOA3 : 1'bz;
  assign chip_io[28] = (oe[28]) ? IOA4 : 1'bz;
  assign chip_io[29] = (oe[29]) ? IOA5 : 1'bz;
  assign chip_io[30] = (oe[30]) ? IOA6 : 1'bz;
  assign chip_io[31] = (oe[31]) ? IOA7 : 1'bz;
  assign chip_io[32] = (oe[32]) ? IOA8 : 1'bz;
  assign chip_io[33] = (oe[33]) ? IOB0 : 1'bz;
  assign chip_io[34] = (oe[34]) ? IOB1 : 1'bz;
  assign chip_io[35] = (oe[35]) ? IOB2 : 1'bz;
  assign chip_io[36] = (oe[36]) ? IOB3 : 1'bz;
  assign chip_io[37] = (oe[37]) ? IOB4 : 1'bz;
  assign chip_io[38] = (oe[38]) ? IOB5 : 1'bz;
  assign chip_io[39] = (oe[39]) ? IOB6 : 1'bz;
  assign chip_io[40] = (oe[40]) ? IOB7 : 1'bz;
  assign chip_io[41] = (oe[41]) ? IOB8 : 1'bz;
  assign chip_io[42] = (oe[42]) ? IOB9 : 1'bz;
  assign chip_io[43] = (oe[43]) ? IOB10 : 1'bz;
  assign chip_io[44] = (oe[44]) ? IOB11 : 1'bz;
  assign chip_io[45] = (oe[45]) ? IOB12 : 1'bz;
  assign chip_io[46] = (oe[46]) ? IOC0 : 1'bz;
  assign chip_io[47] = (oe[47]) ? IOC1 : 1'bz;
  assign chip_io[48] = (oe[48]) ? IOC2 : 1'bz;
  assign chip_io[49] = (oe[49]) ? IOC3 : 1'bz;
  assign chip_io[50] = (oe[50]) ? IOC4 : 1'bz;
  assign chip_io[51] = (oe[51]) ? IOC5 : 1'bz;
  assign chip_io[52] = (oe[52]) ? IOC6 : 1'bz;
  assign chip_io[53] = (oe[53]) ? IOC7 : 1'bz;
  assign chip_io[54] = (oe[54]) ? IOC8 : 1'bz;
  assign chip_io[55] = (oe[55]) ? IOC9 : 1'bz;
  assign chip_io[56] = (oe[56]) ? IOC10 : 1'bz;
  assign chip_io[57] = (oe[57]) ? IOC11 : 1'bz;
  assign chip_io[58] = (oe[58]) ? IOC12 : 1'bz;
  assign chip_io[59] = (oe[59]) ? IOR0 : 1'bz;
  assign chip_io[60] = (oe[60]) ? IOR1 : 1'bz;
  assign chip_io[61] = (oe[61]) ? IOR2 : 1'bz;
  assign chip_io[62] = (oe[62]) ? IOR3 : 1'bz;
  assign chip_io[63] = (oe[63]) ? IOR4 : 1'bz;
  assign chip_io[64] = (oe[64]) ? IOR5 : 1'bz;
  assign chip_io[65] = (oe[65]) ? IOR6 : 1'bz;
  assign chip_io[66] = (oe[66]) ? IOR7 : 1'bz;
  assign chip_io[67] = (oe[67]) ? IOR10 : 1'bz;
  assign chip_io[68] = (oe[68]) ? IOR11 : 1'bz;
  assign chip_io[69] = (oe[69]) ? IOR12 : 1'bz;
  assign chip_io[70] = (oe[70]) ? IOR13 : 1'bz;

  assign POR_N = (oe[0]) ? 1'bz : chip_io[0];
  assign USB_P = (oe[1]) ? 1'bz : chip_io[1];
  assign USB_N = (oe[2]) ? 1'bz : chip_io[2];
  assign CC1 = (oe[3]) ? 1'bz : chip_io[3];
  assign CC2 = (oe[4]) ? 1'bz : chip_io[4];
  assign FLASH_TEST_VOLT = (oe[5]) ? 1'bz : chip_io[5];
  assign FLASH_TEST_MODE0 = (oe[6]) ? 1'bz : chip_io[6];
  assign FLASH_TEST_MODE1 = (oe[7]) ? 1'bz : chip_io[7];
  assign OTP_EXT_VOLT = (oe[8]) ? 1'bz : chip_io[8];
  assign SPI_HOST_D0 = (oe[9]) ? 1'bz : chip_io[9];
  assign SPI_HOST_D1 = (oe[10]) ? 1'bz : chip_io[10];
  assign SPI_HOST_D2 = (oe[11]) ? 1'bz : chip_io[11];
  assign SPI_HOST_D3 = (oe[12]) ? 1'bz : chip_io[12];
  assign SPI_HOST_CLK = (oe[13]) ? 1'bz : chip_io[13];
  assign SPI_HOST_CS_L = (oe[14]) ? 1'bz : chip_io[14];
  assign SPI_DEV_D0 = (oe[15]) ? 1'bz : chip_io[15];
  assign SPI_DEV_D1 = (oe[16]) ? 1'bz : chip_io[16];
  assign SPI_DEV_D2 = (oe[17]) ? 1'bz : chip_io[17];
  assign SPI_DEV_D3 = (oe[18]) ? 1'bz : chip_io[18];
  assign SPI_DEV_CLK = (oe[19]) ? 1'bz : chip_io[19];
  assign SPI_DEV_CS_L = (oe[20]) ? 1'bz : chip_io[20];
  assign IOR8 = (oe[21]) ? 1'bz : chip_io[21];
  assign IOR9 = (oe[22]) ? 1'bz : chip_io[22];
  assign AST_MISC = (oe[23]) ? 1'bz : chip_io[23];
  assign IOA0 = (oe[24]) ? 1'bz : chip_io[24];
  assign IOA1 = (oe[25]) ? 1'bz : chip_io[25];
  assign IOA2 = (oe[26]) ? 1'bz : chip_io[26];
  assign IOA3 = (oe[27]) ? 1'bz : chip_io[27];
  assign IOA4 = (oe[28]) ? 1'bz : chip_io[28];
  assign IOA5 = (oe[29]) ? 1'bz : chip_io[29];
  assign IOA6 = (oe[30]) ? 1'bz : chip_io[30];
  assign IOA7 = (oe[31]) ? 1'bz : chip_io[31];
  assign IOA8 = (oe[32]) ? 1'bz : chip_io[32];
  assign IOB0 = (oe[33]) ? 1'bz : chip_io[33];
  assign IOB1 = (oe[34]) ? 1'bz : chip_io[34];
  assign IOB2 = (oe[35]) ? 1'bz : chip_io[35];
  assign IOB3 = (oe[36]) ? 1'bz : chip_io[36];
  assign IOB4 = (oe[37]) ? 1'bz : chip_io[37];
  assign IOB5 = (oe[38]) ? 1'bz : chip_io[38];
  assign IOB6 = (oe[39]) ? 1'bz : chip_io[39];
  assign IOB7 = (oe[40]) ? 1'bz : chip_io[40];
  assign IOB8 = (oe[41]) ? 1'bz : chip_io[41];
  assign IOB9 = (oe[42]) ? 1'bz : chip_io[42];
  assign IOB10 = (oe[43]) ? 1'bz : chip_io[43];
  assign IOB11 = (oe[44]) ? 1'bz : chip_io[44];
  assign IOB12 = (oe[45]) ? 1'bz : chip_io[45];
  assign IOC0 = (oe[46]) ? 1'bz : chip_io[46];
  assign IOC1 = (oe[47]) ? 1'bz : chip_io[47];
  assign IOC2 = (oe[48]) ? 1'bz : chip_io[48];
  assign IOC3 = (oe[49]) ? 1'bz : chip_io[49];
  assign IOC4 = (oe[50]) ? 1'bz : chip_io[50];
  assign IOC5 = (oe[51]) ? 1'bz : chip_io[51];
  assign IOC6 = (oe[52]) ? 1'bz : chip_io[52];
  assign IOC7 = (oe[53]) ? 1'bz : chip_io[53];
  assign IOC8 = (oe[54]) ? 1'bz : chip_io[54];
  assign IOC9 = (oe[55]) ? 1'bz : chip_io[55];
  assign IOC10 = (oe[56]) ? 1'bz : chip_io[56];
  assign IOC11 = (oe[57]) ? 1'bz : chip_io[57];
  assign IOC12 = (oe[58]) ? 1'bz : chip_io[58];
  assign IOR0 = (oe[59]) ? 1'bz : chip_io[59];
  assign IOR1 = (oe[60]) ? 1'bz : chip_io[60];
  assign IOR2 = (oe[61]) ? 1'bz : chip_io[61];
  assign IOR3 = (oe[62]) ? 1'bz : chip_io[62];
  assign IOR4 = (oe[63]) ? 1'bz : chip_io[63];
  assign IOR5 = (oe[64]) ? 1'bz : chip_io[64];
  assign IOR6 = (oe[65]) ? 1'bz : chip_io[65];
  assign IOR7 = (oe[66]) ? 1'bz : chip_io[66];
  assign IOR10 = (oe[67]) ? 1'bz : chip_io[67];
  assign IOR11 = (oe[68]) ? 1'bz : chip_io[68];
  assign IOR12 = (oe[69]) ? 1'bz : chip_io[69];
  assign IOR13 = (oe[70]) ? 1'bz : chip_io[70];

  assign oe[0] = manual_oe_ast_misc;
  assign oe[1] = dio_oe[DioSysrstCtrlAonFlashWpL];
  assign oe[2] = dio_oe[DioSysrstCtrlAonEcRstL];
  assign oe[3] = dio_oe[DioSpiDeviceCsb];
  assign oe[4] = dio_oe[DioSpiDeviceSck];
  assign oe[5] = dio_oe[DioSpiDeviceSd3];
  assign oe[6] = dio_oe[DioSpiDeviceSd2];
  assign oe[7] = dio_oe[DioSpiDeviceSd1];
  assign oe[8] = dio_oe[DioSpiDeviceSd0];
  assign oe[9] = dio_oe[DioSpiHost0Csb];
  assign oe[10] = dio_oe[DioSpiHost0Sck];
  assign oe[11] = dio_oe[DioSpiHost0Sd3];
  assign oe[12] = dio_oe[DioSpiHost0Sd2];
  assign oe[13] = dio_oe[DioSpiHost0Sd1];
  assign oe[14] = dio_oe[DioSpiHost0Sd0];
  assign oe[15] = manual_oe_otp_ext_volt;
  assign oe[16] = manual_oe_flash_test_mode1;
  assign oe[17] = manual_oe_flash_test_mode0;
  assign oe[18] = manual_oe_flash_test_volt;
  assign oe[19] = manual_oe_cc2;
  assign oe[20] = manual_oe_cc1;
  assign oe[21] = manual_oe_usb_n;
  assign oe[22] = manual_oe_usb_p;
  assign oe[23] = manual_oe_por_n;
  assign oe[24] = mio_oe[46];
  assign oe[25] = mio_oe[45];
  assign oe[26] = mio_oe[44];
  assign oe[27] = mio_oe[43];
  assign oe[28] = mio_oe[42];
  assign oe[29] = mio_oe[41];
  assign oe[30] = mio_oe[40];
  assign oe[31] = mio_oe[39];
  assign oe[32] = mio_oe[38];
  assign oe[33] = mio_oe[37];
  assign oe[34] = mio_oe[36];
  assign oe[35] = mio_oe[35];
  assign oe[36] = mio_oe[34];
  assign oe[37] = mio_oe[33];
  assign oe[38] = mio_oe[32];
  assign oe[39] = mio_oe[31];
  assign oe[40] = mio_oe[30];
  assign oe[41] = mio_oe[29];
  assign oe[42] = mio_oe[28];
  assign oe[43] = mio_oe[27];
  assign oe[44] = mio_oe[26];
  assign oe[45] = mio_oe[25];
  assign oe[46] = mio_oe[24];
  assign oe[47] = mio_oe[23];
  assign oe[48] = mio_oe[22];
  assign oe[49] = mio_oe[21];
  assign oe[50] = mio_oe[20];
  assign oe[51] = mio_oe[19];
  assign oe[52] = mio_oe[18];
  assign oe[53] = mio_oe[17];
  assign oe[54] = mio_oe[16];
  assign oe[55] = mio_oe[15];
  assign oe[56] = mio_oe[14];
  assign oe[57] = mio_oe[13];
  assign oe[58] = mio_oe[12];
  assign oe[59] = mio_oe[11];
  assign oe[60] = mio_oe[10];
  assign oe[61] = mio_oe[9];
  assign oe[62] = mio_oe[8];
  assign oe[63] = mio_oe[7];
  assign oe[64] = mio_oe[6];
  assign oe[65] = mio_oe[5];
  assign oe[66] = mio_oe[4];
  assign oe[67] = mio_oe[3];
  assign oe[68] = mio_oe[2];
  assign oe[69] = mio_oe[1];
  assign oe[70] = mio_oe[0];

  //////////////////////
  // Padring Instance //
  //////////////////////

  ast_pkg::ast_clks_t ast_base_clks;

  // AST signals needed in padring
  logic scan_rst_n;
   prim_mubi_pkg::mubi4_t scanmode;

  padring #(
    // Padring specific counts may differ from pinmux config due
    // to custom, stubbed or added pads.
    .NDioPads(24),
    .NMioPads(47),
    .PhysicalPads(1),
    .NIoBanks(int'(IoBankCount)),
    .DioScanRole ({
      scan_role_pkg::DioPadAstMiscScanRole,
      scan_role_pkg::DioPadIor9ScanRole,
      scan_role_pkg::DioPadIor8ScanRole,
      scan_role_pkg::DioPadSpiDevCsLScanRole,
      scan_role_pkg::DioPadSpiDevClkScanRole,
      scan_role_pkg::DioPadSpiDevD3ScanRole,
      scan_role_pkg::DioPadSpiDevD2ScanRole,
      scan_role_pkg::DioPadSpiDevD1ScanRole,
      scan_role_pkg::DioPadSpiDevD0ScanRole,
      scan_role_pkg::DioPadSpiHostCsLScanRole,
      scan_role_pkg::DioPadSpiHostClkScanRole,
      scan_role_pkg::DioPadSpiHostD3ScanRole,
      scan_role_pkg::DioPadSpiHostD2ScanRole,
      scan_role_pkg::DioPadSpiHostD1ScanRole,
      scan_role_pkg::DioPadSpiHostD0ScanRole,
      scan_role_pkg::DioPadOtpExtVoltScanRole,
      scan_role_pkg::DioPadFlashTestMode1ScanRole,
      scan_role_pkg::DioPadFlashTestMode0ScanRole,
      scan_role_pkg::DioPadFlashTestVoltScanRole,
      scan_role_pkg::DioPadCc2ScanRole,
      scan_role_pkg::DioPadCc1ScanRole,
      scan_role_pkg::DioPadUsbNScanRole,
      scan_role_pkg::DioPadUsbPScanRole,
      scan_role_pkg::DioPadPorNScanRole
    }),
    .MioScanRole ({
      scan_role_pkg::MioPadIor13ScanRole,
      scan_role_pkg::MioPadIor12ScanRole,
      scan_role_pkg::MioPadIor11ScanRole,
      scan_role_pkg::MioPadIor10ScanRole,
      scan_role_pkg::MioPadIor7ScanRole,
      scan_role_pkg::MioPadIor6ScanRole,
      scan_role_pkg::MioPadIor5ScanRole,
      scan_role_pkg::MioPadIor4ScanRole,
      scan_role_pkg::MioPadIor3ScanRole,
      scan_role_pkg::MioPadIor2ScanRole,
      scan_role_pkg::MioPadIor1ScanRole,
      scan_role_pkg::MioPadIor0ScanRole,
      scan_role_pkg::MioPadIoc12ScanRole,
      scan_role_pkg::MioPadIoc11ScanRole,
      scan_role_pkg::MioPadIoc10ScanRole,
      scan_role_pkg::MioPadIoc9ScanRole,
      scan_role_pkg::MioPadIoc8ScanRole,
      scan_role_pkg::MioPadIoc7ScanRole,
      scan_role_pkg::MioPadIoc6ScanRole,
      scan_role_pkg::MioPadIoc5ScanRole,
      scan_role_pkg::MioPadIoc4ScanRole,
      scan_role_pkg::MioPadIoc3ScanRole,
      scan_role_pkg::MioPadIoc2ScanRole,
      scan_role_pkg::MioPadIoc1ScanRole,
      scan_role_pkg::MioPadIoc0ScanRole,
      scan_role_pkg::MioPadIob12ScanRole,
      scan_role_pkg::MioPadIob11ScanRole,
      scan_role_pkg::MioPadIob10ScanRole,
      scan_role_pkg::MioPadIob9ScanRole,
      scan_role_pkg::MioPadIob8ScanRole,
      scan_role_pkg::MioPadIob7ScanRole,
      scan_role_pkg::MioPadIob6ScanRole,
      scan_role_pkg::MioPadIob5ScanRole,
      scan_role_pkg::MioPadIob4ScanRole,
      scan_role_pkg::MioPadIob3ScanRole,
      scan_role_pkg::MioPadIob2ScanRole,
      scan_role_pkg::MioPadIob1ScanRole,
      scan_role_pkg::MioPadIob0ScanRole,
      scan_role_pkg::MioPadIoa8ScanRole,
      scan_role_pkg::MioPadIoa7ScanRole,
      scan_role_pkg::MioPadIoa6ScanRole,
      scan_role_pkg::MioPadIoa5ScanRole,
      scan_role_pkg::MioPadIoa4ScanRole,
      scan_role_pkg::MioPadIoa3ScanRole,
      scan_role_pkg::MioPadIoa2ScanRole,
      scan_role_pkg::MioPadIoa1ScanRole,
      scan_role_pkg::MioPadIoa0ScanRole
    }),
    .DioPadBank ({
      IoBankVcc, // AST_MISC
      IoBankVcc, // IOR9
      IoBankVcc, // IOR8
      IoBankVioa, // SPI_DEV_CS_L
      IoBankVioa, // SPI_DEV_CLK
      IoBankVioa, // SPI_DEV_D3
      IoBankVioa, // SPI_DEV_D2
      IoBankVioa, // SPI_DEV_D1
      IoBankVioa, // SPI_DEV_D0
      IoBankVioa, // SPI_HOST_CS_L
      IoBankVioa, // SPI_HOST_CLK
      IoBankVioa, // SPI_HOST_D3
      IoBankVioa, // SPI_HOST_D2
      IoBankVioa, // SPI_HOST_D1
      IoBankVioa, // SPI_HOST_D0
      IoBankVcc, // OTP_EXT_VOLT
      IoBankVcc, // FLASH_TEST_MODE1
      IoBankVcc, // FLASH_TEST_MODE0
      IoBankVcc, // FLASH_TEST_VOLT
      IoBankAvcc, // CC2
      IoBankAvcc, // CC1
      IoBankVcc, // USB_N
      IoBankVcc, // USB_P
      IoBankVcc  // POR_N
    }),
    .MioPadBank ({
      IoBankVcc, // IOR13
      IoBankVcc, // IOR12
      IoBankVcc, // IOR11
      IoBankVcc, // IOR10
      IoBankVcc, // IOR7
      IoBankVcc, // IOR6
      IoBankVcc, // IOR5
      IoBankVcc, // IOR4
      IoBankVcc, // IOR3
      IoBankVcc, // IOR2
      IoBankVcc, // IOR1
      IoBankVcc, // IOR0
      IoBankVcc, // IOC12
      IoBankVcc, // IOC11
      IoBankVcc, // IOC10
      IoBankVcc, // IOC9
      IoBankVcc, // IOC8
      IoBankVcc, // IOC7
      IoBankVcc, // IOC6
      IoBankVcc, // IOC5
      IoBankVcc, // IOC4
      IoBankVcc, // IOC3
      IoBankVcc, // IOC2
      IoBankVcc, // IOC1
      IoBankVcc, // IOC0
      IoBankViob, // IOB12
      IoBankViob, // IOB11
      IoBankViob, // IOB10
      IoBankViob, // IOB9
      IoBankViob, // IOB8
      IoBankViob, // IOB7
      IoBankViob, // IOB6
      IoBankViob, // IOB5
      IoBankViob, // IOB4
      IoBankViob, // IOB3
      IoBankViob, // IOB2
      IoBankViob, // IOB1
      IoBankViob, // IOB0
      IoBankVioa, // IOA8
      IoBankVioa, // IOA7
      IoBankVioa, // IOA6
      IoBankVioa, // IOA5
      IoBankVioa, // IOA4
      IoBankVioa, // IOA3
      IoBankVioa, // IOA2
      IoBankVioa, // IOA1
      IoBankVioa  // IOA0
    }),
    .DioPadType ({
      InputStd, // AST_MISC
      BidirOd, // IOR9
      BidirOd, // IOR8
      InputStd, // SPI_DEV_CS_L
      InputStd, // SPI_DEV_CLK
      BidirStd, // SPI_DEV_D3
      BidirStd, // SPI_DEV_D2
      BidirStd, // SPI_DEV_D1
      BidirStd, // SPI_DEV_D0
      BidirStd, // SPI_HOST_CS_L
      BidirStd, // SPI_HOST_CLK
      BidirStd, // SPI_HOST_D3
      BidirStd, // SPI_HOST_D2
      BidirStd, // SPI_HOST_D1
      BidirStd, // SPI_HOST_D0
      AnalogIn1, // OTP_EXT_VOLT
      InputStd, // FLASH_TEST_MODE1
      InputStd, // FLASH_TEST_MODE0
      AnalogIn0, // FLASH_TEST_VOLT
      InputStd, // CC2
      InputStd, // CC1
      DualBidirTol, // USB_N
      DualBidirTol, // USB_P
      InputStd  // POR_N
    }),
    .MioPadType ({
      BidirOd, // IOR13
      BidirOd, // IOR12
      BidirOd, // IOR11
      BidirOd, // IOR10
      BidirStd, // IOR7
      BidirStd, // IOR6
      BidirStd, // IOR5
      BidirStd, // IOR4
      BidirStd, // IOR3
      BidirStd, // IOR2
      BidirStd, // IOR1
      BidirStd, // IOR0
      BidirOd, // IOC12
      BidirOd, // IOC11
      BidirOd, // IOC10
      BidirStd, // IOC9
      BidirStd, // IOC8
      BidirStd, // IOC7
      BidirStd, // IOC6
      BidirStd, // IOC5
      BidirStd, // IOC4
      BidirStd, // IOC3
      BidirStd, // IOC2
      BidirStd, // IOC1
      BidirStd, // IOC0
      BidirOd, // IOB12
      BidirOd, // IOB11
      BidirOd, // IOB10
      BidirOd, // IOB9
      BidirStd, // IOB8
      BidirStd, // IOB7
      BidirStd, // IOB6
      BidirStd, // IOB5
      BidirStd, // IOB4
      BidirStd, // IOB3
      BidirStd, // IOB2
      BidirStd, // IOB1
      BidirStd, // IOB0
      BidirOd, // IOA8
      BidirOd, // IOA7
      BidirOd, // IOA6
      BidirStd, // IOA5
      BidirStd, // IOA4
      BidirStd, // IOA3
      BidirStd, // IOA2
      BidirStd, // IOA1
      BidirStd  // IOA0
    })
  ) u_padring (
  // This is only used for scan and DFT purposes
    .clk_scan_i   ( ast_base_clks.clk_sys ),
    .scanmode_i   ( scanmode              ),
    .dio_in_raw_o ( dio_in_raw ),
    // Chip IOs
    .dio_pad_io ({
      AST_MISC,
      IOR9,
      IOR8,
      SPI_DEV_CS_L,
      SPI_DEV_CLK,
      SPI_DEV_D3,
      SPI_DEV_D2,
      SPI_DEV_D1,
      SPI_DEV_D0,
      SPI_HOST_CS_L,
      SPI_HOST_CLK,
      SPI_HOST_D3,
      SPI_HOST_D2,
      SPI_HOST_D1,
      SPI_HOST_D0,
      OTP_EXT_VOLT,
      FLASH_TEST_MODE1,
      FLASH_TEST_MODE0,
      FLASH_TEST_VOLT,
`ifdef ANALOGSIM
      '0,
`else
      CC2,
`endif
`ifdef ANALOGSIM
      '0,
`else
      CC1,
`endif
      USB_N,
      USB_P,
      POR_N
    }),

    .mio_pad_io ({
      IOR13,
      IOR12,
      IOR11,
      IOR10,
      IOR7,
      IOR6,
      IOR5,
      IOR4,
      IOR3,
      IOR2,
      IOR1,
      IOR0,
      IOC12,
      IOC11,
      IOC10,
      IOC9,
      IOC8,
      IOC7,
      IOC6,
      IOC5,
      IOC4,
      IOC3,
      IOC2,
      IOC1,
      IOC0,
      IOB12,
      IOB11,
      IOB10,
      IOB9,
      IOB8,
      IOB7,
      IOB6,
      IOB5,
      IOB4,
      IOB3,
      IOB2,
      IOB1,
      IOB0,
      IOA8,
      IOA7,
      IOA6,
      IOA5,
      IOA4,
`ifdef ANALOGSIM
      '0,
`else
      IOA3,
`endif
`ifdef ANALOGSIM
      '0,
`else
      IOA2,
`endif
      IOA1,
      IOA0
    }),

    // Core-facing
    .dio_in_o ({
        manual_in_ast_misc,
        dio_in[DioSysrstCtrlAonFlashWpL],
        dio_in[DioSysrstCtrlAonEcRstL],
        dio_in[DioSpiDeviceCsb],
        dio_in[DioSpiDeviceSck],
        dio_in[DioSpiDeviceSd3],
        dio_in[DioSpiDeviceSd2],
        dio_in[DioSpiDeviceSd1],
        dio_in[DioSpiDeviceSd0],
        dio_in[DioSpiHost0Csb],
        dio_in[DioSpiHost0Sck],
        dio_in[DioSpiHost0Sd3],
        dio_in[DioSpiHost0Sd2],
        dio_in[DioSpiHost0Sd1],
        dio_in[DioSpiHost0Sd0],
        manual_in_otp_ext_volt,
        manual_in_flash_test_mode1,
        manual_in_flash_test_mode0,
        manual_in_flash_test_volt,
        manual_in_cc2,
        manual_in_cc1,
        manual_in_usb_n,
        manual_in_usb_p,
        manual_in_por_n
      }),
    .dio_out_i ({
        manual_out_ast_misc,
        dio_out[DioSysrstCtrlAonFlashWpL],
        dio_out[DioSysrstCtrlAonEcRstL],
        dio_out[DioSpiDeviceCsb],
        dio_out[DioSpiDeviceSck],
        dio_out[DioSpiDeviceSd3],
        dio_out[DioSpiDeviceSd2],
        dio_out[DioSpiDeviceSd1],
        dio_out[DioSpiDeviceSd0],
        dio_out[DioSpiHost0Csb],
        dio_out[DioSpiHost0Sck],
        dio_out[DioSpiHost0Sd3],
        dio_out[DioSpiHost0Sd2],
        dio_out[DioSpiHost0Sd1],
        dio_out[DioSpiHost0Sd0],
        manual_out_otp_ext_volt,
        manual_out_flash_test_mode1,
        manual_out_flash_test_mode0,
        manual_out_flash_test_volt,
        manual_out_cc2,
        manual_out_cc1,
        manual_out_usb_n,
        manual_out_usb_p,
        manual_out_por_n
      }),
    .dio_oe_i ({
        manual_oe_ast_misc,
        dio_oe[DioSysrstCtrlAonFlashWpL],
        dio_oe[DioSysrstCtrlAonEcRstL],
        dio_oe[DioSpiDeviceCsb],
        dio_oe[DioSpiDeviceSck],
        dio_oe[DioSpiDeviceSd3],
        dio_oe[DioSpiDeviceSd2],
        dio_oe[DioSpiDeviceSd1],
        dio_oe[DioSpiDeviceSd0],
        dio_oe[DioSpiHost0Csb],
        dio_oe[DioSpiHost0Sck],
        dio_oe[DioSpiHost0Sd3],
        dio_oe[DioSpiHost0Sd2],
        dio_oe[DioSpiHost0Sd1],
        dio_oe[DioSpiHost0Sd0],
        manual_oe_otp_ext_volt,
        manual_oe_flash_test_mode1,
        manual_oe_flash_test_mode0,
        manual_oe_flash_test_volt,
        manual_oe_cc2,
        manual_oe_cc1,
        manual_oe_usb_n,
        manual_oe_usb_p,
        manual_oe_por_n
      }),
    .dio_attr_i ({
        manual_attr_ast_misc,
        dio_attr[DioSysrstCtrlAonFlashWpL],
        dio_attr[DioSysrstCtrlAonEcRstL],
        dio_attr[DioSpiDeviceCsb],
        dio_attr[DioSpiDeviceSck],
        dio_attr[DioSpiDeviceSd3],
        dio_attr[DioSpiDeviceSd2],
        dio_attr[DioSpiDeviceSd1],
        dio_attr[DioSpiDeviceSd0],
        dio_attr[DioSpiHost0Csb],
        dio_attr[DioSpiHost0Sck],
        dio_attr[DioSpiHost0Sd3],
        dio_attr[DioSpiHost0Sd2],
        dio_attr[DioSpiHost0Sd1],
        dio_attr[DioSpiHost0Sd0],
        manual_attr_otp_ext_volt,
        manual_attr_flash_test_mode1,
        manual_attr_flash_test_mode0,
        manual_attr_flash_test_volt,
        manual_attr_cc2,
        manual_attr_cc1,
        manual_attr_usb_n,
        manual_attr_usb_p,
        manual_attr_por_n
      }),

    .mio_in_o (mio_in[46:0]),
    .mio_out_i (mio_out[46:0]),
    .mio_oe_i (mio_oe[46:0]),
    .mio_attr_i (mio_attr[46:0]),
    .mio_in_raw_o (mio_in_raw[46:0])
  );





  //////////////////////////////////
  // AST - Common for all targets //
  //////////////////////////////////

  // pwrmgr interface
  pwrmgr_pkg::pwr_ast_req_t base_ast_pwr;
  pwrmgr_pkg::pwr_ast_rsp_t ast_base_pwr;

  // assorted ast status
  ast_pkg::ast_pwst_t ast_pwst;
  ast_pkg::ast_pwst_t ast_pwst_h;

  // TLUL interface
  tlul_pkg::tl_h2d_t base_ast_bus;
  tlul_pkg::tl_d2h_t ast_base_bus;

  // synchronization clocks / rests
  clkmgr_pkg::clkmgr_out_t clkmgr_aon_clocks;
  rstmgr_pkg::rstmgr_out_t rstmgr_aon_resets;

  // external clock
  logic ext_clk;

  // monitored clock
  logic sck_monitor;

  // observe interface
  logic [7:0] fla_obs;
  logic [7:0] otp_obs;
  ast_pkg::ast_obs_ctrl_t obs_ctrl;

  // otp power sequence
  otp_ctrl_pkg::otp_ast_req_t otp_ctrl_otp_ast_pwr_seq;
  otp_ctrl_pkg::otp_ast_rsp_t otp_ctrl_otp_ast_pwr_seq_h;

  logic usb_ref_pulse;
  logic usb_ref_val;

  // adc
  ast_pkg::adc_ast_req_t adc_req;
  ast_pkg::adc_ast_rsp_t adc_rsp;

  // entropy source interface
  // The entropy source pacakge definition should eventually be moved to es
  entropy_src_pkg::entropy_src_rng_req_t es_rng_req;
  entropy_src_pkg::entropy_src_rng_rsp_t es_rng_rsp;
  logic es_rng_fips;

  // entropy distribution network
  edn_pkg::edn_req_t ast_edn_edn_req;
  edn_pkg::edn_rsp_t ast_edn_edn_rsp;

  // alerts interface
  ast_pkg::ast_alert_rsp_t ast_alert_rsp;
  ast_pkg::ast_alert_req_t ast_alert_req;

  // Flash connections
  prim_mubi_pkg::mubi4_t flash_bist_enable;
  logic flash_power_down_h;
  logic flash_power_ready_h;

  // clock bypass req/ack
  prim_mubi_pkg::mubi4_t io_clk_byp_req;
  prim_mubi_pkg::mubi4_t io_clk_byp_ack;
  prim_mubi_pkg::mubi4_t all_clk_byp_req;
  prim_mubi_pkg::mubi4_t all_clk_byp_ack;
  prim_mubi_pkg::mubi4_t hi_speed_sel;
  prim_mubi_pkg::mubi4_t div_step_down_req;

  // DFT connections
  logic scan_en;
  lc_ctrl_pkg::lc_tx_t dft_en;
  pinmux_pkg::dft_strap_test_req_t dft_strap_test;

  // Debug connections
  logic [ast_pkg::Ast2PadOutWidth-1:0] ast2pinmux;
  logic [ast_pkg::Pad2AstInWidth-1:0] pad2ast;

  // Jitter enable
  prim_mubi_pkg::mubi4_t jen;

  // reset domain connections
  import rstmgr_pkg::PowerDomains;
  import rstmgr_pkg::DomainAonSel;
  import rstmgr_pkg::Domain0Sel;

  // Memory configuration connections
  ast_pkg::spm_rm_t ast_ram_1p_cfg;
  ast_pkg::spm_rm_t ast_rf_cfg;
  ast_pkg::spm_rm_t ast_rom_cfg;
  ast_pkg::dpm_rm_t ast_ram_2p_fcfg;
  ast_pkg::dpm_rm_t ast_ram_2p_lcfg;

  prim_ram_1p_pkg::ram_1p_cfg_t ram_1p_cfg;
  prim_ram_2p_pkg::ram_2p_cfg_t spi_ram_2p_cfg;
  prim_ram_2p_pkg::ram_2p_cfg_t usb_ram_2p_cfg;
  prim_rom_pkg::rom_cfg_t rom_cfg;

  // conversion from ast structure to memory centric structures
  assign ram_1p_cfg = '{
    ram_cfg: '{
                cfg_en: ast_ram_1p_cfg.marg_en,
                cfg:    ast_ram_1p_cfg.marg
              },
    rf_cfg:  '{
                cfg_en: ast_rf_cfg.marg_en,
                cfg:    ast_rf_cfg.marg
              }
  };

  // this maps as follows:
  // assign usb_ram_2p_cfg = {10'h000, ram_2p_cfg_i.a_ram_fcfg, ram_2p_cfg_i.b_ram_fcfg};
  assign usb_ram_2p_cfg = '{
    a_ram_lcfg: '{
                   cfg_en: ast_ram_2p_fcfg.marg_en_a,
                   cfg:    ast_ram_2p_fcfg.marg_a
                 },
    b_ram_lcfg: '{
                   cfg_en: ast_ram_2p_fcfg.marg_en_b,
                   cfg:    ast_ram_2p_fcfg.marg_b
                 },
    default: '0
  };

  // this maps as follows:
  // assign spi_ram_2p_cfg = {10'h000, ram_2p_cfg_i.a_ram_lcfg, ram_2p_cfg_i.b_ram_lcfg};
  assign spi_ram_2p_cfg = '{
    a_ram_lcfg: '{
                   cfg_en: ast_ram_2p_lcfg.marg_en_a,
                   cfg:    ast_ram_2p_lcfg.marg_a
                 },
    b_ram_lcfg: '{
                   cfg_en: ast_ram_2p_lcfg.marg_en_b,
                   cfg:    ast_ram_2p_lcfg.marg_b
                 },
    default: '0
  };

  assign rom_cfg = '{
    cfg_en: ast_rom_cfg.marg_en,
    cfg: ast_rom_cfg.marg
  };


  //////////////////////////////////
  // AST - Custom for targets     //
  //////////////////////////////////


  assign ast_base_pwr.main_pok = ast_pwst.main_pok;

  logic [rstmgr_pkg::PowerDomains-1:0] por_n;
  assign por_n = {ast_pwst.main_pok, ast_pwst.aon_pok};


  logic [ast_pkg::UsbCalibWidth-1:0] usb_io_pu_cal;

  // external clock comes in at a fixed position
  assign ext_clk = mio_in_raw[MioPadIoc6];

  assign pad2ast = `PAD2AST_WIRES ;

  // AST does not use all clocks / resets forwarded to it
  logic unused_slow_clk_en;
  assign unused_slow_clk_en = base_ast_pwr.slow_clk_en;

  logic unused_pwr_clamp;
  assign unused_pwr_clamp = base_ast_pwr.pwr_clamp;

  logic usb_diff_rx_obs;


  prim_mubi_pkg::mubi4_t ast_init_done;

  ast #(
    .EntropyStreams(ast_pkg::EntropyStreams),
    .AdcChannels(ast_pkg::AdcChannels),
    .AdcDataWidth(ast_pkg::AdcDataWidth),
    .UsbCalibWidth(ast_pkg::UsbCalibWidth),
    .Ast2PadOutWidth(ast_pkg::Ast2PadOutWidth),
    .Pad2AstInWidth(ast_pkg::Pad2AstInWidth)
  ) u_ast (
    // external POR
    .por_ni                ( manual_in_por_n ),

    // USB IO Pull-up Calibration Setting
    .usb_io_pu_cal_o       ( usb_io_pu_cal ),

    // adc
    .adc_a0_ai             ( CC1 ),
    .adc_a1_ai             ( CC2 ),

    // Direct short to PAD
    .ast2pad_t0_ao         ( IOA2 ),
    .ast2pad_t1_ao         ( IOA3 ),
    // clocks and resets supplied for detection
    .sns_clks_i            ( clkmgr_aon_clocks    ),
    .sns_rsts_i            ( rstmgr_aon_resets    ),
    .sns_spi_ext_clk_i     ( sck_monitor          ),
    // tlul
    .tl_i                  ( base_ast_bus ),
    .tl_o                  ( ast_base_bus ),
    // init done indication
    .ast_init_done_o       ( ast_init_done ),
    // buffered clocks & resets
    .clk_ast_tlul_i (clkmgr_aon_clocks.clk_io_div4_infra),
    .clk_ast_adc_i (clkmgr_aon_clocks.clk_aon_peri),
    .clk_ast_alert_i (clkmgr_aon_clocks.clk_io_div4_secure),
    .clk_ast_es_i (clkmgr_aon_clocks.clk_main_secure),
    .clk_ast_rng_i (clkmgr_aon_clocks.clk_main_secure),
    .clk_ast_usb_i (clkmgr_aon_clocks.clk_usb_peri),
    .rst_ast_tlul_ni (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_adc_ni (rstmgr_aon_resets.rst_lc_aon_n[rstmgr_pkg::DomainAonSel]),
    .rst_ast_alert_ni (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_es_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_rng_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_usb_ni (rstmgr_aon_resets.rst_usb_n[rstmgr_pkg::Domain0Sel]),
    .clk_ast_ext_i         ( ext_clk ),

    // pok test for FPGA
    .vcc_supp_i            ( 1'b1 ),
    .vcaon_supp_i          ( 1'b1 ),
    .vcmain_supp_i         ( 1'b1 ),
    .vioa_supp_i           ( 1'b1 ),
    .viob_supp_i           ( 1'b1 ),
    // pok
    .ast_pwst_o            ( ast_pwst ),
    .ast_pwst_h_o          ( ast_pwst_h ),
    // main regulator
    .main_env_iso_en_i     ( base_ast_pwr.pwr_clamp_env ),
    .main_pd_ni            ( base_ast_pwr.main_pd_n ),
    // pdm control (flash)/otp
    .flash_power_down_h_o  ( flash_power_down_h ),
    .flash_power_ready_h_o ( flash_power_ready_h ),
    .otp_power_seq_i       ( otp_ctrl_otp_ast_pwr_seq ),
    .otp_power_seq_h_o     ( otp_ctrl_otp_ast_pwr_seq_h ),
    // system source clock
    .clk_src_sys_en_i      ( base_ast_pwr.core_clk_en ),
    // need to add function in clkmgr
    .clk_src_sys_jen_i     ( jen ),
    .clk_src_sys_o         ( ast_base_clks.clk_sys  ),
    .clk_src_sys_val_o     ( ast_base_pwr.core_clk_val ),
    // aon source clock
    .clk_src_aon_o         ( ast_base_clks.clk_aon ),
    .clk_src_aon_val_o     ( ast_base_pwr.slow_clk_val ),
    // io source clock
    .clk_src_io_en_i       ( base_ast_pwr.io_clk_en ),
    .clk_src_io_o          ( ast_base_clks.clk_io ),
    .clk_src_io_val_o      ( ast_base_pwr.io_clk_val ),
    .clk_src_io_48m_o      ( div_step_down_req ),
    // usb source clock
    .usb_ref_pulse_i       ( usb_ref_pulse ),
    .usb_ref_val_i         ( usb_ref_val ),
    .clk_src_usb_en_i      ( base_ast_pwr.usb_clk_en ),
    .clk_src_usb_o         ( ast_base_clks.clk_usb ),
    .clk_src_usb_val_o     ( ast_base_pwr.usb_clk_val ),
    // adc
    .adc_pd_i              ( adc_req.pd ),
    .adc_chnsel_i          ( adc_req.channel_sel ),
    .adc_d_o               ( adc_rsp.data ),
    .adc_d_val_o           ( adc_rsp.data_valid ),
    // rng
    .rng_en_i              ( es_rng_req.rng_enable ),
    .rng_fips_i            ( es_rng_fips ),
    .rng_val_o             ( es_rng_rsp.rng_valid ),
    .rng_b_o               ( es_rng_rsp.rng_b ),
    // entropy
    .entropy_rsp_i         ( ast_edn_edn_rsp ),
    .entropy_req_o         ( ast_edn_edn_req ),
    // alerts
    .alert_rsp_i           ( ast_alert_rsp  ),
    .alert_req_o           ( ast_alert_req  ),
    // dft
    .dft_strap_test_i      ( dft_strap_test   ),
    .lc_dft_en_i           ( dft_en           ),
    .fla_obs_i             ( fla_obs ),
    .otp_obs_i             ( otp_obs ),
    .otm_obs_i             ( '0 ),
    .usb_obs_i             ( usb_diff_rx_obs ),
    .obs_ctrl_o            ( obs_ctrl ),
    // pinmux related
    .padmux2ast_i          ( pad2ast    ),
    .ast2padmux_o          ( ast2pinmux ),
    .ext_freq_is_96m_i     ( hi_speed_sel ),
    .all_clk_byp_req_i     ( all_clk_byp_req  ),
    .all_clk_byp_ack_o     ( all_clk_byp_ack  ),
    .io_clk_byp_req_i      ( io_clk_byp_req   ),
    .io_clk_byp_ack_o      ( io_clk_byp_ack   ),
    .flash_bist_en_o       ( flash_bist_enable ),
    // Memory configuration connections
    .dpram_rmf_o           ( ast_ram_2p_fcfg ),
    .dpram_rml_o           ( ast_ram_2p_lcfg ),
    .spram_rm_o            ( ast_ram_1p_cfg  ),
    .sprgf_rm_o            ( ast_rf_cfg      ),
    .sprom_rm_o            ( ast_rom_cfg     ),
    // scan
    .dft_scan_md_o         ( scanmode ),
    .scan_shift_en_o       ( scan_en ),
    .scan_reset_no         ( scan_rst_n )
  );




  //////////////////////////////////
  // Manual Pad / Signal Tie-offs //
  //////////////////////////////////

  assign manual_out_ast_misc = 1'b0;
  assign manual_oe_ast_misc = 1'b0;
  always_comb begin
    // constantly enable pull-down
    manual_attr_ast_misc = '0;
    manual_attr_ast_misc.pull_select = 1'b0;
    manual_attr_ast_misc.pull_en = 1'b1;
  end
  assign manual_out_por_n = 1'b0;
  assign manual_oe_por_n = 1'b0;

  assign manual_out_cc1 = 1'b0;
  assign manual_oe_cc1 = 1'b0;
  assign manual_out_cc2 = 1'b0;
  assign manual_oe_cc2 = 1'b0;

  assign manual_out_flash_test_mode0 = 1'b0;
  assign manual_oe_flash_test_mode0 = 1'b0;
  assign manual_out_flash_test_mode1 = 1'b0;
  assign manual_oe_flash_test_mode1 = 1'b0;
  assign manual_out_flash_test_volt = 1'b0;
  assign manual_oe_flash_test_volt = 1'b0;
  assign manual_out_otp_ext_volt = 1'b0;
  assign manual_oe_otp_ext_volt = 1'b0;

  // These pad attributes currently tied off permanently (these are all input-only pads).
  assign manual_attr_por_n = '0;
  assign manual_attr_cc1 = '0;
  assign manual_attr_cc2 = '0;
  assign manual_attr_flash_test_mode0 = '0;
  assign manual_attr_flash_test_mode1 = '0;
  assign manual_attr_flash_test_volt = '0;
  assign manual_attr_otp_ext_volt = '0;

  logic unused_manual_sigs;
  assign unused_manual_sigs = ^{
    manual_in_cc2,
    manual_in_cc1,
    manual_in_flash_test_volt,
    manual_in_flash_test_mode0,
    manual_in_flash_test_mode1,
    manual_in_otp_ext_volt
  };

  ///////////////////////////////
  // Differential USB Receiver //
  ///////////////////////////////

  // TODO: generalize this USB mux code and align with other tops.

  // Connect the D+ pad
  // Note that we use two pads in parallel for the D+ channel to meet electrical specifications.
  assign dio_in[DioUsbdevUsbDp] = manual_in_usb_p;
  assign manual_out_usb_p = dio_out[DioUsbdevUsbDp];
  assign manual_oe_usb_p = dio_oe[DioUsbdevUsbDp];
  assign manual_attr_usb_p = dio_attr[DioUsbdevUsbDp];

  // Connect the D- pads
  // Note that we use two pads in parallel for the D- channel to meet electrical specifications.
  assign dio_in[DioUsbdevUsbDn] = manual_in_usb_n;
  assign manual_out_usb_n = dio_out[DioUsbdevUsbDn];
  assign manual_oe_usb_n = dio_oe[DioUsbdevUsbDn];
  assign manual_attr_usb_n = dio_attr[DioUsbdevUsbDn];

  logic usb_rx_d;

  // Pullups and differential receiver enable
  logic usb_dp_pullup_en, usb_dn_pullup_en;
  logic usb_rx_enable;

  prim_usb_diff_rx #(
    .CalibW(ast_pkg::UsbCalibWidth)
  ) u_prim_usb_diff_rx (
    .input_pi          ( USB_P                 ),
    .input_ni          ( USB_N                 ),
    .input_en_i        ( usb_rx_enable         ),
    .core_pok_h_i      ( ast_pwst_h.aon_pok    ),
    .pullup_p_en_i     ( usb_dp_pullup_en      ),
    .pullup_n_en_i     ( usb_dn_pullup_en      ),
    .calibration_i     ( usb_io_pu_cal         ),
    .usb_diff_rx_obs_o ( usb_diff_rx_obs       ),
    .input_o           ( usb_rx_d              )
  );

  //////////////////////
  // Top-level design //
  //////////////////////
  top_earlgrey #(
    .PinmuxAonTargetCfg(PinmuxTargetCfg),
    .SecAesAllowForcingMasks(1'b1),
    .SecRomCtrlDisableScrambling(SecRomCtrlDisableScrambling)
  ) top_earlgrey (
    // ast connections
    .por_n_i                      ( por_n                      ),
    .clk_main_i                   ( ast_base_clks.clk_sys      ),
    .clk_io_i                     ( ast_base_clks.clk_sys      ),
    .clk_usb_i                    ( ast_base_clks.clk_sys      ),
    .clk_aon_i                    ( ast_base_clks.clk_sys      ),
    .clks_ast_o                   ( clkmgr_aon_clocks          ),
    .clk_main_jitter_en_o         ( jen                        ),
    .rsts_ast_o                   ( rstmgr_aon_resets          ),
    .sck_monitor_o                ( sck_monitor                ),
    .pwrmgr_ast_req_o             ( base_ast_pwr               ),
    .pwrmgr_ast_rsp_i             ( ast_base_pwr               ),
    .sensor_ctrl_ast_alert_req_i  ( ast_alert_req              ),
    .sensor_ctrl_ast_alert_rsp_o  ( ast_alert_rsp              ),
    .sensor_ctrl_ast_status_i     ( ast_pwst.io_pok            ),
    .usb_dp_pullup_en_o           ( usb_dp_pullup_en           ),
    .usb_dn_pullup_en_o           ( usb_dn_pullup_en           ),
    .usbdev_usb_rx_d_i            ( usb_rx_d                   ),
    .usbdev_usb_tx_d_o            (                            ),
    .usbdev_usb_tx_se0_o          (                            ),
    .usbdev_usb_tx_use_d_se0_o    (                            ),
    .usbdev_usb_rx_enable_o       ( usb_rx_enable              ),
    .usbdev_usb_ref_val_o         ( usb_ref_val                ),
    .usbdev_usb_ref_pulse_o       ( usb_ref_pulse              ),
    .ast_tl_req_o                 ( base_ast_bus               ),
    .ast_tl_rsp_i                 ( ast_base_bus               ),
    .adc_req_o                    ( adc_req                    ),
    .adc_rsp_i                    ( adc_rsp                    ),
    .ast_edn_req_i                ( ast_edn_edn_req            ),
    .ast_edn_rsp_o                ( ast_edn_edn_rsp            ),
    .obs_ctrl_i                   ( obs_ctrl                   ),
    .otp_ctrl_otp_ast_pwr_seq_o   ( otp_ctrl_otp_ast_pwr_seq   ),
    .otp_ctrl_otp_ast_pwr_seq_h_i ( otp_ctrl_otp_ast_pwr_seq_h ),
    .otp_obs_o                    ( otp_obs                    ),
    .flash_bist_enable_i          ( flash_bist_enable          ),
    .flash_power_down_h_i         ( flash_power_down_h         ),
    .flash_power_ready_h_i        ( flash_power_ready_h        ),
    .flash_obs_o                  ( fla_obs                    ),
    .es_rng_req_o                 ( es_rng_req                 ),
    .es_rng_rsp_i                 ( es_rng_rsp                 ),
    .es_rng_fips_o                ( es_rng_fips                ),
    .io_clk_byp_req_o             ( io_clk_byp_req             ),
    .io_clk_byp_ack_i             ( io_clk_byp_ack             ),
    .all_clk_byp_req_o            ( all_clk_byp_req            ),
    .all_clk_byp_ack_i            ( all_clk_byp_ack            ),
    .hi_speed_sel_o               ( hi_speed_sel               ),
    .div_step_down_req_i          ( div_step_down_req          ),
    .ast2pinmux_i                 ( ast2pinmux                 ),
    .calib_rdy_i                  ( ast_init_done              ),
    .ast_init_done_i              ( ast_init_done              ),

    // Flash test mode voltages
    .flash_test_mode_a_io         ( {FLASH_TEST_MODE1,
                                     FLASH_TEST_MODE0}         ),
    .flash_test_voltage_h_io      ( FLASH_TEST_VOLT            ),

    // OTP external voltage
    .otp_ext_voltage_h_io         ( OTP_EXT_VOLT               ),

    // Multiplexed I/O
    .mio_in_i                     ( mio_in                     ),
    .mio_out_o                    ( mio_out                    ),
    .mio_oe_o                     ( mio_oe                     ),

    // Dedicated I/O
    .dio_in_i                     ( dio_in                     ),
    .dio_out_o                    ( dio_out                    ),
    .dio_oe_o                     ( dio_oe                     ),

    // Pad attributes
    .mio_attr_o                   ( mio_attr                   ),
    .dio_attr_o                   ( dio_attr                   ),

    // Memory attributes
    .ram_1p_cfg_i                 ( ram_1p_cfg                 ),
    .spi_ram_2p_cfg_i             ( spi_ram_2p_cfg             ),
    .usb_ram_2p_cfg_i             ( usb_ram_2p_cfg             ),

    .rom_cfg_i                    ( rom_cfg                    ),

    // DFT signals
    .ast_lc_dft_en_o              ( dft_en                     ),
    .dft_strap_test_o             ( dft_strap_test             ),
    .dft_hold_tap_sel_i           ( '0                         ),
    .scan_rst_ni                  ( scan_rst_n                 ),
    .scan_en_i                    ( scan_en                    ),
    .scanmode_i                   ( scanmode                   ),

    // FPGA build info
    .fpga_info_i                  ( '0                         )
  );



endmodule : chip_earlgrey_asic