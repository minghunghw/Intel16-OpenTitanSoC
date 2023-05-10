set rtl_packages [ concat \
    $EARLGREY/rtl/top_pkg.sv \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_pkg.sv \
    $OPENTITAN/prim/rtl/prim_alert_pkg.sv \
    $OPENTITAN/prim/rtl/prim_cipher_pkg.sv \
    $OPENTITAN/prim/rtl/prim_esc_pkg.sv \
    $OPENTITAN/prim/rtl/prim_mubi_pkg.sv \
    $OPENTITAN/prim/rtl/prim_secded_pkg.sv \
    $OPENTITAN/prim/rtl/prim_otp_pkg.sv \
    $OPENTITAN/prim/rtl/prim_pad_wrapper_pkg.sv \
    $OPENTITAN/prim/rtl/prim_ram_1p_pkg.sv \
    $OPENTITAN/prim/rtl/prim_ram_2p_pkg.sv \
    $OPENTITAN/prim/rtl/prim_rom_pkg.sv \
    $OPENTITAN/prim/rtl/prim_subreg_pkg.sv \
    $OPENTITAN/prim/rtl/prim_util_pkg.sv \
    $OPENTITAN/tlul/rtl/tlul_pkg.sv \
    $OPENTITAN/rv_dm/rtl/jtag_pkg.sv \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl_reg_pkg.sv \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl_pkg.sv \
    $OPENTITAN/aes/rtl/aes_reg_pkg.sv \
    $OPENTITAN/aes/rtl/aes_pkg.sv \
    $OPENTITAN/aes/rtl/aes_sbox_canright_pkg.sv \
    $EARLGREY/ip/ast/rtl/ast_pkg.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_reg_pkg.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_pkg.sv \
    $OPENTITAN/aon_timer/rtl/aon_timer_reg_pkg.sv \
    $EARLGREY/ip/clkmgr/rtl/autogen/clkmgr_reg_pkg.sv \
    $EARLGREY/ip/clkmgr/rtl/autogen/clkmgr_pkg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_reg_pkg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_pkg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_ack_sm_pkg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_main_sm_pkg.sv \
    $OPENTITAN/csrng/rtl/csrng_reg_pkg.sv \
    $OPENTITAN/csrng/rtl/csrng_pkg.sv \
    $OPENTITAN/edn/rtl/edn_reg_pkg.sv \
    $OPENTITAN/edn/rtl/edn_pkg.sv \
    $EARLGREY/ip/flash_ctrl/rtl/autogen/flash_ctrl_reg_pkg.sv \
    $EARLGREY/ip/flash_ctrl/rtl/autogen/flash_ctrl_pkg.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_pkg.sv \
    $OPENTITAN/gpio/rtl/gpio_reg_pkg.sv \
    $OPENTITAN/hmac/rtl/hmac_reg_pkg.sv \
    $OPENTITAN/hmac/rtl/hmac_pkg.sv \
    $OPENTITAN/i2c/rtl/i2c_reg_pkg.sv \
    $OPENTITAN/i2c/rtl/i2c_pkg.sv \
    $OPENTITAN/keymgr/rtl/keymgr_reg_pkg.sv \
    $OPENTITAN/keymgr/rtl/keymgr_pkg.sv \
    $OPENTITAN/kmac/rtl/sha3_pkg.sv \
    $OPENTITAN/kmac/rtl/kmac_reg_pkg.sv \
    $OPENTITAN/kmac/rtl/kmac_pkg.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_state_pkg.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_reg_pkg.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_pkg.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_reg_pkg.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_pkg.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_part_pkg.sv \
    $OPENTITAN/otbn/rtl/otbn_reg_pkg.sv \
    $OPENTITAN/otbn/rtl/otbn_pkg.sv \
    $OPENTITAN/pattgen/rtl/pattgen_reg_pkg.sv \
    $OPENTITAN/pattgen/rtl/pattgen_ctrl_pkg.sv \
    $EARLGREY/ip/pinmux/rtl/autogen/pinmux_reg_pkg.sv \
    $OPENTITAN/pinmux/rtl/pinmux_pkg.sv \
    $OPENTITAN/pwm/rtl/pwm_reg_pkg.sv \
    $EARLGREY/ip/rstmgr/rtl/autogen/rstmgr_reg_pkg.sv \
    $EARLGREY/ip/rstmgr/rtl/autogen/rstmgr_pkg.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_reg_pkg.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_pkg.sv \
    $IBEX/rtl/ibex_pkg.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex_reg_pkg.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex_pkg.sv \
    $OPENTITAN/rv_dm/rtl/rv_dm_reg_pkg.sv \
    $EARLGREY/ip_autogen/rv_plic/rtl/rv_plic_reg_pkg.sv \
    $OPENTITAN/rv_timer/rtl/rv_timer_reg_pkg.sv \
    $OPENTITAN/spi_device/rtl/spi_device_reg_pkg.sv \
    $OPENTITAN/spi_device/rtl/spi_device_pkg.sv \
    $OPENTITAN/spi_host/rtl/spi_host_reg_pkg.sv \
    $OPENTITAN/spi_host/rtl/spi_host_cmd_pkg.sv \
    $EARLGREY/ip/sensor_ctrl/rtl/sensor_ctrl_reg_pkg.sv \
    $EARLGREY/ip/sensor_ctrl/rtl/sensor_ctrl_pkg.sv \
    $OPENTITAN/sram_ctrl/rtl/sram_ctrl_reg_pkg.sv \
    $OPENTITAN/sram_ctrl/rtl/sram_ctrl_pkg.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_reg_pkg.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_pkg.sv \
    $EARLGREY/ip/pwrmgr/rtl/autogen/pwrmgr_reg_pkg.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_pkg.sv \
    $OPENTITAN/uart/rtl/uart_reg_pkg.sv \
    $OPENTITAN/usbdev/rtl/usbdev_reg_pkg.sv \
    $OPENTITAN/usbdev/rtl/usbdev_pkg.sv \
    $OPENTITAN/usbdev/rtl/usb_consts_pkg.sv \
    $PULP/src/dm_pkg.sv \
    $EARLGREY/ip/xbar_main/rtl/autogen/tl_main_pkg.sv \
    $EARLGREY/ip/xbar_peri/rtl/autogen/tl_peri_pkg.sv \
    $EARLGREY/rtl/jtag_id_pkg.sv \
    $EARLGREY/rtl/scan_role_pkg.sv \
    $EARLGREY/ip/ast/rtl/ast_bhv_pkg.sv \
    $EARLGREY/ip/ast/rtl/ast_reg_pkg.sv \
    $EARLGREY/ip/ast/rtl/ast_pkg.sv \
    $EARLGREY/rtl/autogen/top_earlgrey_pkg.sv \
    $EARLGREY/rtl/autogen/top_earlgrey_rnd_cnst_pkg.sv \
]

set rtl_adc_ctrl [ concat \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl.sv \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl_core.sv \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl_fsm.sv \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl_intr.sv \
    $OPENTITAN/adc_ctrl/rtl/adc_ctrl_reg_top.sv \
]

set rtl_aes [ concat \
    $OPENTITAN/aes/rtl/aes.sv \
    $OPENTITAN/aes/rtl/aes_cipher_control.sv \
    $OPENTITAN/aes/rtl/aes_cipher_control_fsm.sv \
    $OPENTITAN/aes/rtl/aes_cipher_control_fsm_n.sv \
    $OPENTITAN/aes/rtl/aes_cipher_control_fsm_p.sv \
    $OPENTITAN/aes/rtl/aes_cipher_core.sv \
    $OPENTITAN/aes/rtl/aes_control.sv \
    $OPENTITAN/aes/rtl/aes_control_fsm.sv \
    $OPENTITAN/aes/rtl/aes_control_fsm_n.sv \
    $OPENTITAN/aes/rtl/aes_control_fsm_p.sv \
    $OPENTITAN/aes/rtl/aes_core.sv \
    $OPENTITAN/aes/rtl/aes_ctr.sv \
    $OPENTITAN/aes/rtl/aes_ctr_fsm.sv \
    $OPENTITAN/aes/rtl/aes_ctr_fsm_n.sv \
    $OPENTITAN/aes/rtl/aes_ctr_fsm_p.sv \
    $OPENTITAN/aes/rtl/aes_ctrl_reg_shadowed.sv \
    $OPENTITAN/aes/rtl/aes_key_expand.sv \
    $OPENTITAN/aes/rtl/aes_mix_columns.sv \
    $OPENTITAN/aes/rtl/aes_mix_single_column.sv \
    $OPENTITAN/aes/rtl/aes_prng_clearing.sv \
    $OPENTITAN/aes/rtl/aes_prng_masking.sv \
    $OPENTITAN/aes/rtl/aes_reduced_round.sv \
    $OPENTITAN/aes/rtl/aes_reg_status.sv \
    $OPENTITAN/aes/rtl/aes_reg_top.sv \
    $OPENTITAN/aes/rtl/aes_sbox.sv \
    $OPENTITAN/aes/rtl/aes_sbox_canright.sv \
    $OPENTITAN/aes/rtl/aes_sbox_canright_masked.sv \
    $OPENTITAN/aes/rtl/aes_sbox_canright_masked_noreuse.sv \
    $OPENTITAN/aes/rtl/aes_sbox_dom.sv \
    $OPENTITAN/aes/rtl/aes_sbox_lut.sv \
    $OPENTITAN/aes/rtl/aes_sel_buf_chk.sv \
    $OPENTITAN/aes/rtl/aes_shift_rows.sv \
    $OPENTITAN/aes/rtl/aes_sub_bytes.sv \
    $OPENTITAN/aes/rtl/aes_wrap.sv \
]

set rtl_alert_handler [ concat \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_accu.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_class.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_esc_timer.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_lpg_ctrl.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_ping_timer.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_reg_top.sv \
    $EARLGREY/ip_autogen/alert_handler/rtl/alert_handler_reg_wrap.sv \
]

set rtl_aon_timer [ concat \
    $OPENTITAN/aon_timer/rtl/aon_timer.sv \
    $OPENTITAN/aon_timer/rtl/aon_timer_core.sv \
    $OPENTITAN/aon_timer/rtl/aon_timer_reg_top.sv \
]

set rtl_ast [ concat \
    $OPENTITAN/prim/rtl/prim_assert_standard_macros.svh \
    $OPENTITAN/prim/rtl/prim_assert.sv \
    $EARLGREY/ip/ast/rtl/adc.sv \
    $EARLGREY/ip/ast/rtl/adc_ana.sv \
    $EARLGREY/ip/ast/rtl/aon_clk.sv \
    $EARLGREY/ip/ast/rtl/aon_osc.sv \
    $EARLGREY/ip/ast/rtl/ast.sv \
    $EARLGREY/ip/ast/rtl/ast_alert.sv \
    $EARLGREY/ip/ast/rtl/ast_clks_byp.sv \
    $EARLGREY/ip/ast/rtl/ast_dft.sv \
    $EARLGREY/ip/ast/rtl/ast_entropy.sv \
    $EARLGREY/ip/ast/rtl/ast_pulse_sync.sv \
    $EARLGREY/ip/ast/rtl/ast_reg_top.sv \
    $EARLGREY/ip/ast/rtl/dev_entropy.sv \
    $EARLGREY/ip/ast/rtl/gfr_clk_mux2.sv \
    $EARLGREY/ip/ast/rtl/io_clk.sv \
    $EARLGREY/ip/ast/rtl/io_osc.sv \
    $EARLGREY/ip/ast/rtl/rglts_pdm_3p3v.sv \
    $EARLGREY/ip/ast/rtl/rng.sv \
    $EARLGREY/ip/ast/rtl/sys_clk.sv \
    $EARLGREY/ip/ast/rtl/sys_osc.sv \
    $EARLGREY/ip/ast/rtl/usb_clk.sv \
    $EARLGREY/ip/ast/rtl/usb_osc.sv \
    $EARLGREY/ip/ast/rtl/vcaon_pgd.sv \
    $EARLGREY/ip/ast/rtl/vcc_pgd.sv \
    $EARLGREY/ip/ast/rtl/vcmain_pgd.sv \
    $EARLGREY/ip/ast/rtl/vio_pgd.sv \
]

set rtl_clkmgr [ concat \
    $EARLGREY/ip/clkmgr/rtl/autogen/clkmgr.sv \
    $OPENTITAN/clkmgr/rtl/clkmgr_byp.sv \
    $OPENTITAN/clkmgr/rtl/clkmgr_clk_status.sv \
    $OPENTITAN/clkmgr/rtl/clkmgr_meas_chk.sv \
    $EARLGREY/ip/clkmgr/rtl/autogen/clkmgr_reg_top.sv \
    $OPENTITAN/clkmgr/rtl/clkmgr_root_ctrl.sv \
    $OPENTITAN/clkmgr/rtl/clkmgr_trans.sv \
]

set rtl_csrng [ concat \
    $OPENTITAN/csrng/rtl/csrng.sv \
    $OPENTITAN/csrng/rtl/csrng_block_encrypt.sv \
    $OPENTITAN/csrng/rtl/csrng_cmd_stage.sv \
    $OPENTITAN/csrng/rtl/csrng_core.sv \
    $OPENTITAN/csrng/rtl/csrng_ctr_drbg_cmd.sv \
    $OPENTITAN/csrng/rtl/csrng_ctr_drbg_gen.sv \
    $OPENTITAN/csrng/rtl/csrng_ctr_drbg_upd.sv \
    $OPENTITAN/csrng/rtl/csrng_main_sm.sv \
    $OPENTITAN/csrng/rtl/csrng_reg_top.sv \
    $OPENTITAN/csrng/rtl/csrng_state_db.sv \
]

set rtl_dm [ concat \
    $PULP/src/dm_csrs.sv \
    $PULP/src/dm_mem.sv \
    $PULP/src/dm_sba.sv \
    $PULP/src/dm_top.sv \
    $PULP/src/dmi_bscane_tap.sv \
    $PULP/src/dmi_cdc.sv \
    $PULP/src/dmi_intf.sv \
    $PULP/src/dmi_jtag.sv \
    $PULP/src/dmi_jtag_tap.sv \
    $PULP/debug_rom/debug_rom.sv \
    $PULP/debug_rom/debug_rom_one_scratch.sv \
]

set rtl_edn [ concat \
    $OPENTITAN/edn/rtl/edn.sv \
    $OPENTITAN/edn/rtl/edn_ack_sm.sv \
    $OPENTITAN/edn/rtl/edn_core.sv \
    $OPENTITAN/edn/rtl/edn_field_en.sv \
    $OPENTITAN/edn/rtl/edn_main_sm.sv \
    $OPENTITAN/edn/rtl/edn_reg_top.sv \
]

set rtl_entropy_src [ concat \
    $OPENTITAN/entropy_src/rtl/entropy_src.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_ack_sm.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_adaptp_ht.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_bucket_ht.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_cntr_reg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_core.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_enable_delay.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_field_en.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_main_sm.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_markov_ht.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_reg_top.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_repcnt_ht.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_repcnts_ht.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_watermark_reg.sv \
]

set rtl_flash_ctrl [ concat \
    $EARLGREY/ip/flash_ctrl/rtl/autogen/flash_ctrl.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_ctrl_arb.sv \
    $EARLGREY/ip/flash_ctrl/rtl/autogen/flash_ctrl_core_reg_top.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_ctrl_erase.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_ctrl_info_cfg.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_ctrl_lcmgr.sv \
    $EARLGREY/ip/flash_ctrl/rtl/autogen/flash_ctrl_prim_reg_top.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_ctrl_prog.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_ctrl_rd.sv \
    $EARLGREY/ip/flash_ctrl/rtl/autogen/flash_ctrl_region_cfg.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_mp.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_mp_data_region_sel.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_core.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_erase.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_prog.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_rd.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_rd_buf_dep.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_rd_buffers.sv \
    $OPENTITAN/flash_ctrl/rtl/flash_phy_scramble.sv \
]

set rtl_gpio [ concat \
    $OPENTITAN/gpio/rtl/gpio.sv \
    $OPENTITAN/gpio/rtl/gpio_reg_top.sv \
]

set rtl_hmac [ concat \
    $OPENTITAN/hmac/rtl/hmac.sv \
    $OPENTITAN/hmac/rtl/hmac_core.sv \
    $OPENTITAN/hmac/rtl/hmac_reg_top.sv \
    $OPENTITAN/hmac/rtl/sha2.sv \
    $OPENTITAN/hmac/rtl/sha2_pad.sv \
]

set rtl_i2c [ concat \
    $OPENTITAN/i2c/rtl/i2c.sv \
    $OPENTITAN/i2c/rtl/i2c_core.sv \
    $OPENTITAN/i2c/rtl/i2c_fsm.sv \
    $OPENTITAN/i2c/rtl/i2c_reg_top.sv \
]

set rtl_ibex [ concat \
    $IBEX/rtl/ibex_lockstep.sv \
    $IBEX/rtl/ibex_pmp.sv \
    $IBEX/rtl/ibex_icache.sv \
    $IBEX/rtl/ibex_dummy_instr.sv \
    $IBEX/rtl/ibex_top.sv \
    $IBEX/rtl/ibex_core.sv \
    $IBEX/rtl/ibex_if_stage.sv \
    $IBEX/rtl/ibex_id_stage.sv \
    $IBEX/rtl/ibex_ex_block.sv \
    $IBEX/rtl/ibex_wb_stage.sv \
    $IBEX/rtl/ibex_controller.sv \
    $IBEX/rtl/ibex_decoder.sv \
    $IBEX/rtl/ibex_compressed_decoder.sv \
    $IBEX/rtl/ibex_cs_registers.sv \
    $IBEX/rtl/ibex_load_store_unit.sv \
    $IBEX/rtl/ibex_counter.sv \
    $IBEX/rtl/ibex_csr.sv \
    $IBEX/rtl/ibex_multdiv_fast.sv \
    $IBEX/rtl/ibex_alu.sv \
    $IBEX/rtl/ibex_prefetch_buffer.sv \
    $IBEX/rtl/ibex_fetch_fifo.sv \
    $IBEX/rtl/ibex_register_file_ff.sv \
]

set rtl_keymgr [ concat \
    $OPENTITAN/keymgr/rtl/keymgr.sv \
    $OPENTITAN/keymgr/rtl/keymgr_cfg_en.sv \
    $OPENTITAN/keymgr/rtl/keymgr_ctrl.sv \
    $OPENTITAN/keymgr/rtl/keymgr_data_en_state.sv \
    $OPENTITAN/keymgr/rtl/keymgr_err.sv \
    $OPENTITAN/keymgr/rtl/keymgr_input_checks.sv \
    $OPENTITAN/keymgr/rtl/keymgr_kmac_if.sv \
    $OPENTITAN/keymgr/rtl/keymgr_op_state_ctrl.sv \
    $OPENTITAN/keymgr/rtl/keymgr_reg_top.sv \
    $OPENTITAN/keymgr/rtl/keymgr_reseed_ctrl.sv \
    $OPENTITAN/keymgr/rtl/keymgr_sideload_key.sv \
    $OPENTITAN/keymgr/rtl/keymgr_sideload_key_ctrl.sv \
]

set rtl_kmac [ concat \
    $OPENTITAN/kmac/rtl/keccak_2share.sv \
    $OPENTITAN/kmac/rtl/keccak_round.sv \
    $OPENTITAN/kmac/rtl/kmac.sv \
    $OPENTITAN/kmac/rtl/kmac_app.sv \
    $OPENTITAN/kmac/rtl/kmac_core.sv \
    $OPENTITAN/kmac/rtl/kmac_entropy.sv \
    $OPENTITAN/kmac/rtl/kmac_errchk.sv \
    $OPENTITAN/kmac/rtl/kmac_msgfifo.sv \
    $OPENTITAN/kmac/rtl/kmac_reg_top.sv \
    $OPENTITAN/kmac/rtl/kmac_staterd.sv \
    $OPENTITAN/kmac/rtl/sha3.sv \
    $OPENTITAN/kmac/rtl/sha3pad.sv \
]

set rtl_lc_ctrl [ concat \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_fsm.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_kmac_if.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_reg_top.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_signal_decode.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_state_decode.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_state_transition.sv \
]

set rtl_otbn [ concat \
    $OPENTITAN/otbn/rtl/otbn.sv \
    $OPENTITAN/otbn/rtl/otbn_alu_base.sv \
    $OPENTITAN/otbn/rtl/otbn_alu_bignum.sv \
    $OPENTITAN/otbn/rtl/otbn_controller.sv \
    $OPENTITAN/otbn/rtl/otbn_core.sv \
    $OPENTITAN/otbn/rtl/otbn_decoder.sv \
    $OPENTITAN/otbn/rtl/otbn_instruction_fetch.sv \
    $OPENTITAN/otbn/rtl/otbn_loop_controller.sv \
    $OPENTITAN/otbn/rtl/otbn_lsu.sv \
    $OPENTITAN/otbn/rtl/otbn_mac_bignum.sv \
    $OPENTITAN/otbn/rtl/otbn_predecode.sv \
    $OPENTITAN/otbn/rtl/otbn_reg_top.sv \
    $OPENTITAN/otbn/rtl/otbn_rf_base.sv \
    $OPENTITAN/otbn/rtl/otbn_rf_base_ff.sv \
    $OPENTITAN/otbn/rtl/otbn_rf_base_fpga.sv \
    $OPENTITAN/otbn/rtl/otbn_rf_bignum.sv \
    $OPENTITAN/otbn/rtl/otbn_rf_bignum_ff.sv \
    $OPENTITAN/otbn/rtl/otbn_rf_bignum_fpga.sv \
    $OPENTITAN/otbn/rtl/otbn_rnd.sv \
    $OPENTITAN/otbn/rtl/otbn_scramble_ctrl.sv \
    $OPENTITAN/otbn/rtl/otbn_stack.sv \
    $OPENTITAN/otbn/rtl/otbn_start_stop_control.sv \
]

set rtl_otp_ctrl [ concat \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_core_reg_top.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_dai.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_ecc_reg.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_kdi.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_lci.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_lfsr_timer.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_part_buf.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_part_unbuf.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_prim_reg_top.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_scrmbl.sv \
]

set rtl_pattgen [ concat \
    $OPENTITAN/pattgen/rtl/pattgen.sv \
    $OPENTITAN/pattgen/rtl/pattgen_chan.sv \
    $OPENTITAN/pattgen/rtl/pattgen_core.sv \
    $OPENTITAN/pattgen/rtl/pattgen_reg_top.sv \
]

set rtl_pinmux [ concat \
    $OPENTITAN/pinmux/rtl/pinmux.sv \
    $OPENTITAN/pinmux/rtl/pinmux_jtag_breakout.sv \
    $OPENTITAN/pinmux/rtl/pinmux_jtag_buf.sv \
    $EARLGREY/ip/pinmux/rtl/autogen/pinmux_reg_top.sv \
    $OPENTITAN/pinmux/rtl/pinmux_strap_sampling.sv \
    $OPENTITAN/pinmux/rtl/pinmux_wkup.sv \
]

set rtl_prim [ concat \
    $PRIM/prim_and2.sv \
    $PRIM/prim_buf.sv \
    $PRIM/prim_clock_buf.sv \
    $PRIM/prim_clock_gating.sv \
    $PRIM/prim_clock_inv.sv \
    $PRIM/prim_clock_mux2.sv \
    $PRIM/prim_flash.sv \
    $PRIM/prim_flop_en.sv \
    $PRIM/prim_flop.sv \
    $PRIM/prim_otp.sv \
    $PRIM/prim_pad_attr.sv \
    $PRIM/prim_pad_wrapper.sv \
    $PRIM/prim_ram_1p.sv \
    $PRIM/prim_ram_2p.sv \
    $PRIM/prim_rom.sv \
    $PRIM/prim_usb_diff_rx.sv \
    $PRIM/prim_xor2.sv \
    $OPENTITAN/prim/rtl/prim_alert_receiver.sv \
    $OPENTITAN/prim/rtl/prim_alert_sender.sv \
    $OPENTITAN/prim/rtl/prim_arbiter_fixed.sv \
    $OPENTITAN/prim/rtl/prim_arbiter_ppc.sv \
    $OPENTITAN/prim/rtl/prim_arbiter_tree.sv \
    $OPENTITAN/prim/rtl/prim_arbiter_tree_dup.sv \
    $OPENTITAN/prim/rtl/prim_blanker.sv \
    $OPENTITAN/prim/rtl/prim_cdc_rand_delay.sv \
    $OPENTITAN/prim/rtl/prim_clock_div.sv \
    $OPENTITAN/prim/rtl/prim_clock_gating_sync.sv \
    $OPENTITAN/prim/rtl/prim_clock_meas.sv \
    $OPENTITAN/prim/rtl/prim_clock_timeout.sv \
    $OPENTITAN/prim/rtl/prim_count.sv \
    $OPENTITAN/prim/rtl/prim_crc32.sv \
    $OPENTITAN/prim/rtl/prim_diff_decode.sv \
    $OPENTITAN/prim/rtl/prim_dom_and_2share.sv \
    $OPENTITAN/prim/rtl/prim_double_lfsr.sv \
    $OPENTITAN/prim/rtl/prim_edge_detector.sv \
    $OPENTITAN/prim/rtl/prim_edn_req.sv \
    $OPENTITAN/prim/rtl/prim_esc_receiver.sv \
    $OPENTITAN/prim/rtl/prim_esc_sender.sv \
    $OPENTITAN/prim/rtl/prim_fifo_async.sv \
    $OPENTITAN/prim/rtl/prim_fifo_async_simple.sv \
    $OPENTITAN/prim/rtl/prim_fifo_async_sram_adapter.sv \
    $OPENTITAN/prim/rtl/prim_fifo_sync.sv \
    $OPENTITAN/prim/rtl/prim_fifo_sync_cnt.sv \
    $OPENTITAN/prim/rtl/prim_filter.sv \
    $OPENTITAN/prim/rtl/prim_filter_ctr.sv \
    $OPENTITAN/prim/rtl/prim_flop_2sync.sv \
    $OPENTITAN/prim/rtl/prim_gate_gen.sv \
    $OPENTITAN/prim/rtl/prim_gf_mult.sv \
    $OPENTITAN/prim/rtl/prim_intr_hw.sv \
    $OPENTITAN/prim/rtl/prim_keccak.sv \
    $OPENTITAN/prim/rtl/prim_lc_and_hardened.sv \
    $OPENTITAN/prim/rtl/prim_lc_combine.sv \
    $OPENTITAN/prim/rtl/prim_lc_dec.sv \
    $OPENTITAN/prim/rtl/prim_lc_or_hardened.sv \
    $OPENTITAN/prim/rtl/prim_lc_sender.sv \
    $OPENTITAN/prim/rtl/prim_lc_sync.sv \
    $OPENTITAN/prim/rtl/prim_lfsr.sv \
    $OPENTITAN/prim/rtl/prim_max_tree.sv \
    $OPENTITAN/prim/rtl/prim_msb_extend.sv \
    $OPENTITAN/prim/rtl/prim_mubi12_dec.sv \
    $OPENTITAN/prim/rtl/prim_mubi12_sender.sv \
    $OPENTITAN/prim/rtl/prim_mubi12_sync.sv \
    $OPENTITAN/prim/rtl/prim_mubi16_dec.sv \
    $OPENTITAN/prim/rtl/prim_mubi16_sender.sv \
    $OPENTITAN/prim/rtl/prim_mubi16_sync.sv \
    $OPENTITAN/prim/rtl/prim_mubi4_dec.sv \
    $OPENTITAN/prim/rtl/prim_mubi4_sender.sv \
    $OPENTITAN/prim/rtl/prim_mubi4_sync.sv \
    $OPENTITAN/prim/rtl/prim_mubi8_dec.sv \
    $OPENTITAN/prim/rtl/prim_mubi8_sender.sv \
    $OPENTITAN/prim/rtl/prim_mubi8_sync.sv \
    $OPENTITAN/prim/rtl/prim_multibit_sync.sv \
    $OPENTITAN/prim/rtl/prim_onehot_check.sv \
    $OPENTITAN/prim/rtl/prim_onehot_enc.sv \
    $OPENTITAN/prim/rtl/prim_onehot_mux.sv \
    $OPENTITAN/prim/rtl/prim_packer.sv \
    $OPENTITAN/prim/rtl/prim_packer_fifo.sv \
    $OPENTITAN/prim/rtl/prim_present.sv \
    $OPENTITAN/prim/rtl/prim_prince.sv \
    $OPENTITAN/prim/rtl/prim_pulse_sync.sv \
    $OPENTITAN/prim/rtl/prim_ram_1p_adv.sv \
    $OPENTITAN/prim/rtl/prim_ram_1p_scr.sv \
    $OPENTITAN/prim/rtl/prim_ram_2p_adv.sv \
    $OPENTITAN/prim/rtl/prim_ram_2p_async_adv.sv \
    $OPENTITAN/prim/rtl/prim_reg_cdc.sv \
    $OPENTITAN/prim/rtl/prim_reg_cdc_arb.sv \
    $OPENTITAN/prim/rtl/prim_reg_we_check.sv \
    $OPENTITAN/prim/rtl/prim_rom_adv.sv \
    $OPENTITAN/prim/rtl/prim_rst_sync.sv \
    $OPENTITAN/prim/rtl/prim_sec_anchor_buf.sv \
    $OPENTITAN/prim/rtl/prim_sec_anchor_flop.sv \
    $OPENTITAN/prim/rtl/prim_secded_22_16_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_22_16_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_28_22_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_28_22_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_39_32_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_39_32_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_64_57_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_64_57_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_72_64_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_72_64_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_22_16_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_22_16_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_39_32_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_39_32_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_72_64_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_72_64_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_76_68_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_hamming_76_68_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_22_16_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_22_16_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_28_22_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_28_22_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_39_32_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_39_32_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_64_57_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_64_57_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_72_64_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_72_64_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_22_16_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_22_16_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_39_32_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_39_32_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_72_64_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_72_64_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_76_68_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_hamming_76_68_enc.sv \
    $OPENTITAN/prim/rtl/prim_slicer.sv \
    $OPENTITAN/prim/rtl/prim_sparse_fsm_flop.sv \
    $OPENTITAN/prim/rtl/prim_sram_arbiter.sv \
    $OPENTITAN/prim/rtl/prim_subreg.sv \
    $OPENTITAN/prim/rtl/prim_subreg_arb.sv \
    $OPENTITAN/prim/rtl/prim_subreg_ext.sv \
    $OPENTITAN/prim/rtl/prim_subreg_shadow.sv \
    $OPENTITAN/prim/rtl/prim_subst_perm.sv \
    $OPENTITAN/prim/rtl/prim_sum_tree.sv \
    $OPENTITAN/prim/rtl/prim_sync_reqack.sv \
    $OPENTITAN/prim/rtl/prim_sync_reqack_data.sv \
    $OPENTITAN/prim/rtl/prim_sync_slow_fast.sv \
    $OPENTITAN/prim/rtl/prim_xoshiro256pp.sv \
]

set rtl_prim_generic [ concat \
    $OPENTITAN/prim_generic/rtl/prim_generic_and2.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_buf.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_clock_buf.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_clock_gating.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_clock_inv.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_clock_mux2.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_flash.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_flash_bank.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_flop_en.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_flop.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_otp.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_pad_attr.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_pad_wrapper.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_rom.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_usb_diff_rx.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_xor2.sv \
]

set rtl_pwm [ concat \
    $OPENTITAN/pwm/rtl/pwm.sv \
    $OPENTITAN/pwm/rtl/pwm_chan.sv \
    $OPENTITAN/pwm/rtl/pwm_core.sv \
    $OPENTITAN/pwm/rtl/pwm_reg_top.sv \
]

set rtl_pwrmgr [ concat \
    $OPENTITAN/pwrmgr/rtl/pwrmgr.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_cdc.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_cdc_pulse.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_fsm.sv \
    $EARLGREY/ip/pwrmgr/rtl/autogen/pwrmgr_reg_top.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_slow_fsm.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_wake_info.sv \
]

set rtl_rom_ctrl [ concat \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_compare.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_counter.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_fsm.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_mux.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_regs_reg_top.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_rom_reg_top.sv \
    $OPENTITAN/rom_ctrl/rtl/rom_ctrl_scrambled_rom.sv \
]

set rtl_rstmgr [ concat \
    $EARLGREY/ip/rstmgr/rtl/autogen/rstmgr.sv \
    $OPENTITAN/rstmgr/rtl/rstmgr_cnsty_chk.sv \
    $OPENTITAN/rstmgr/rtl/rstmgr_crash_info.sv \
    $OPENTITAN/rstmgr/rtl/rstmgr_ctrl.sv \
    $OPENTITAN/rstmgr/rtl/rstmgr_leaf_rst.sv \
    $OPENTITAN/rstmgr/rtl/rstmgr_por.sv \
    $EARLGREY/ip/rstmgr/rtl/autogen/rstmgr_reg_top.sv \
]

set rtl_rv_core_ibex [ concat \
    $OPENTITAN/prim/rtl/prim_assert_standard_macros.svh \
    $OPENTITAN/prim/rtl/prim_assert.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_addr_trans.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex_cfg_reg_top.sv \
]

set rtl_rv_dm [ concat \
    $OPENTITAN/rv_dm/rtl/rv_dm.sv \
    $OPENTITAN/rv_dm/rtl/rv_dm_mem_reg_top.sv \
    $OPENTITAN/rv_dm/rtl/rv_dm_regs_reg_top.sv \
]

set rtl_rv_plic [ concat \
    $OPENTITAN/prim/rtl/prim_assert_standard_macros.svh \
    $OPENTITAN/prim/rtl/prim_assert.sv \
    $EARLGREY/ip_autogen/rv_plic/rtl/rv_plic.sv \
    $EARLGREY/ip_autogen/rv_plic/rtl/rv_plic_gateway.sv \
    $EARLGREY/ip_autogen/rv_plic/rtl/rv_plic_reg_top.sv \
    $EARLGREY/ip_autogen/rv_plic/rtl/rv_plic_target.sv \
]

set rtl_rv_timer [ concat \
    $OPENTITAN/rv_timer/rtl/rv_timer.sv \
    $OPENTITAN/rv_timer/rtl/rv_timer_reg_top.sv \
    $OPENTITAN/rv_timer/rtl/timer_core.sv \
]

set rtl_sensor_ctrl [ concat \
    $EARLGREY/ip/sensor_ctrl/rtl/sensor_ctrl.sv \
    $EARLGREY/ip/sensor_ctrl/rtl/sensor_ctrl_reg_top.sv \
]

set rtl_spi_device [ concat \
    $OPENTITAN/spi_device/rtl/spi_cmdparse.sv \
    $OPENTITAN/spi_device/rtl/spi_device.sv \
    $OPENTITAN/spi_device/rtl/spi_device_reg_top.sv \
    $OPENTITAN/spi_device/rtl/spi_fwm_rxf_ctrl.sv \
    $OPENTITAN/spi_device/rtl/spi_fwm_txf_ctrl.sv \
    $OPENTITAN/spi_device/rtl/spi_fwmode.sv \
    $OPENTITAN/spi_device/rtl/spi_p2s.sv \
    $OPENTITAN/spi_device/rtl/spi_passthrough.sv \
    $OPENTITAN/spi_device/rtl/spi_readcmd.sv \
    $OPENTITAN/spi_device/rtl/spi_s2p.sv \
    $OPENTITAN/spi_device/rtl/spi_tpm.sv \
    $OPENTITAN/spi_device/rtl/spid_addr_4b.sv \
    $OPENTITAN/spi_device/rtl/spid_fifo2sram_adapter.sv \
    $OPENTITAN/spi_device/rtl/spid_jedec.sv \
    $OPENTITAN/spi_device/rtl/spid_readbuffer.sv \
    $OPENTITAN/spi_device/rtl/spid_readsram.sv \
    $OPENTITAN/spi_device/rtl/spid_status.sv \
    $OPENTITAN/spi_device/rtl/spid_upload.sv \
]

set rtl_spi_host [ concat \
    $OPENTITAN/spi_host/rtl/spi_host.sv \
    $OPENTITAN/spi_host/rtl/spi_host_byte_merge.sv \
    $OPENTITAN/spi_host/rtl/spi_host_byte_select.sv \
    $OPENTITAN/spi_host/rtl/spi_host_command_queue.sv \
    $OPENTITAN/spi_host/rtl/spi_host_core.sv \
    $OPENTITAN/spi_host/rtl/spi_host_data_fifos.sv \
    $OPENTITAN/spi_host/rtl/spi_host_fsm.sv \
    $OPENTITAN/spi_host/rtl/spi_host_reg_top.sv \
    $OPENTITAN/spi_host/rtl/spi_host_shift_register.sv \
    $OPENTITAN/spi_host/rtl/spi_host_window.sv \
]

set rtl_sram_ctrl [ concat \
    $OPENTITAN/sram_ctrl/rtl/sram_ctrl.sv \
    $OPENTITAN/sram_ctrl/rtl/sram_ctrl_regs_reg_top.sv \
]

set rtl_sysrst_ctrl [ concat \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_autoblock.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_combo.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_comboact.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_detect.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_keyintr.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_pin.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_reg_top.sv \
    $OPENTITAN/sysrst_ctrl/rtl/sysrst_ctrl_ulp.sv \
]

set rtl_tlul [ concat \
    $OPENTITAN/tlul/rtl/tlul_adapter_host.sv \
    $OPENTITAN/tlul/rtl/tlul_adapter_reg.sv \
    $OPENTITAN/tlul/rtl/tlul_adapter_sram.sv \
    $OPENTITAN/tlul/rtl/tlul_cmd_intg_chk.sv \
    $OPENTITAN/tlul/rtl/tlul_cmd_intg_gen.sv \
    $OPENTITAN/tlul/rtl/tlul_data_integ_enc.sv \
    $OPENTITAN/tlul/rtl/tlul_data_integ_dec.sv \
    $OPENTITAN/tlul/rtl/tlul_err.sv \
    $OPENTITAN/tlul/rtl/tlul_err_resp.sv \
    $OPENTITAN/tlul/rtl/tlul_fifo_async.sv \
    $OPENTITAN/tlul/rtl/tlul_fifo_sync.sv \
    $OPENTITAN/tlul/rtl/tlul_lc_gate.sv \
    $OPENTITAN/tlul/rtl/tlul_rsp_intg_chk.sv \
    $OPENTITAN/tlul/rtl/tlul_rsp_intg_gen.sv \
    $OPENTITAN/tlul/rtl/tlul_socket_m1.sv \
    $OPENTITAN/tlul/rtl/tlul_socket_1n.sv \
    $OPENTITAN/tlul/rtl/tlul_sram_byte.sv \
]

set rtl_uart [ concat \
    $OPENTITAN/uart/rtl/uart.sv \
    $OPENTITAN/uart/rtl/uart_core.sv \
    $OPENTITAN/uart/rtl/uart_reg_top.sv \
    $OPENTITAN/uart/rtl/uart_rx.sv \
    $OPENTITAN/uart/rtl/uart_tx.sv \
]

set rtl_usbdev [ concat \
    $OPENTITAN/usbdev/rtl/usb_fs_nb_in_pe.sv \
    $OPENTITAN/usbdev/rtl/usb_fs_nb_out_pe.sv \
    $OPENTITAN/usbdev/rtl/usb_fs_nb_pe.sv \
    $OPENTITAN/usbdev/rtl/usb_fs_rx.sv \
    $OPENTITAN/usbdev/rtl/usb_fs_tx.sv \
    $OPENTITAN/usbdev/rtl/usb_fs_tx_mux.sv \
    $OPENTITAN/usbdev/rtl/usbdev.sv \
    $OPENTITAN/usbdev/rtl/usbdev_aon_wake.sv \
    $OPENTITAN/usbdev/rtl/usbdev_iomux.sv \
    $OPENTITAN/usbdev/rtl/usbdev_linkstate.sv \
    $OPENTITAN/usbdev/rtl/usbdev_reg_top.sv \
    $OPENTITAN/usbdev/rtl/usbdev_usbif.sv \
]

set rtl_xbar [ concat \
    $EARLGREY/ip/xbar_main/rtl/autogen/xbar_main.sv \
    $EARLGREY/ip/xbar_peri/rtl/autogen/xbar_peri.sv \
]

set rtl_top_earlgrey [ concat \
    $OPENTITAN/prim/rtl/prim_assert_standard_macros.svh \
    $OPENTITAN/prim/rtl/prim_assert.sv \
    $EARLGREY/rtl/autogen/top_earlgrey.sv \
]

set rtl_chip_earlgrey_asic [ concat \
    $EARLGREY/ip/ast/rtl/ast_pkg.sv \
    $EARLGREY/rtl/autogen/top_earlgrey_pkg.sv \
    $EARLGREY/rtl/padring.sv \
    $EARLGREY/rtl/physical_pads.sv \
    $EARLGREY/rtl/autogen/chip_earlgrey_asic.sv \
]

set rtl_chip_earlgrey [ concat \
    $EARLGREY/ip/ast/rtl/ast_pkg.sv \
    $EARLGREY/rtl/autogen/top_earlgrey_pkg.sv \
    $HW/padring.sv \
    $HW/slice8_wrapper.sv \
    $EARLGREY/rtl/autogen/chip_earlgrey_asic.sv \
]