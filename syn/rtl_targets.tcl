set HW          "../../hw/sv"
set IP          "../../ip"
set OPENTITAN   "../../ip/opentitan/hw/ip"
set DV          "../../ip/opentitan/hw/dv"
set EARLGREY    "../../ip/opentitan/hw/top_earlgrey"
set IBEX 	   	"../../ip/opentitan/hw/vendor/lowrisc_ibex"

set rtl_includes [ concat \
    $OPENTITAN/prim/rtl \
    $DV/sv/dv_utils \
]

set rtl_packages [ concat \
    $HW/top_pkg.sv \
    $OPENTITAN/prim/rtl/prim_alert_pkg.sv \
    $OPENTITAN/prim/rtl/prim_cipher_pkg.sv \
    $OPENTITAN/prim/rtl/prim_util_pkg.sv \
    $OPENTITAN/prim/rtl/prim_secded_pkg.sv \
    $OPENTITAN/prim/rtl/prim_subreg_pkg.sv \
    $OPENTITAN/prim/rtl/prim_mubi_pkg.sv \
    $OPENTITAN/prim/rtl/prim_ram_1p_pkg.sv \
    $OPENTITAN/tlul/rtl/tlul_pkg.sv \
    $OPENTITAN/gpio/rtl/gpio_reg_pkg.sv \
    $IBEX/rtl/ibex_pkg.sv \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_pkg.sv \
    $IP/xbar/rtl/tl_main_pkg.sv \
    $IP/xbar/rtl/tl_periph_pkg.sv \
    $IP/xbar/rtl/tl_1to2_pkg.sv \
    $IP/shodan/ml_top/rtl/ml_pkg.sv \
    $IP/shodan/ml_top/rtl/ml_top_reg_pkg.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex_pkg.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex_reg_pkg.sv \
    $OPENTITAN/prim/rtl/prim_esc_pkg.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_reg_pkg.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_state_pkg.sv \
    $OPENTITAN/lc_ctrl/rtl/lc_ctrl_pkg.sv \
    $IP/opentitan/hw/top_earlgrey/ip/pwrmgr/rtl/autogen/pwrmgr_reg_pkg.sv \
    $OPENTITAN/pwrmgr/rtl/pwrmgr_pkg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_pkg.sv \
    $OPENTITAN/entropy_src/rtl/entropy_src_reg_pkg.sv \
    $OPENTITAN/edn/rtl/edn_reg_pkg.sv \
    $OPENTITAN/edn/rtl/edn_pkg.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_reg_pkg.sv \
    $OPENTITAN/otp_ctrl/rtl/otp_ctrl_pkg.sv \
    $IP/opentitan/hw/top_earlgrey/ip_autogen/alert_handler/rtl/alert_handler_reg_pkg.sv \
]

set rtl_prim [ concat \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_clock_gating.sv \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_buf.sv \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_flop.sv \
    $OPENTITAN/prim/rtl/prim_fifo_sync_cnt.sv \
    $OPENTITAN/prim/rtl/prim_fifo_sync.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_39_32_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_39_32_dec.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_64_57_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_64_57_dec.sv \
    $OPENTITAN/prim/rtl/prim_alert_sender.sv \
    $OPENTITAN/prim/rtl/prim_diff_decode.sv \
    $OPENTITAN/prim/rtl/prim_flop_2sync.sv \
    $OPENTITAN/prim/rtl/prim_cdc_rand_delay.sv \
    $OPENTITAN/prim/rtl/prim_sec_anchor_buf.sv \
    $OPENTITAN/prim/rtl/prim_sec_anchor_flop.sv \
    $OPENTITAN/prim/rtl/prim_filter_ctr.sv \
    $OPENTITAN/prim/rtl/prim_intr_hw.sv \
    $OPENTITAN/prim/rtl/prim_subreg_ext.sv \
    $OPENTITAN/prim/rtl/prim_subreg.sv \
    $OPENTITAN/prim/rtl/prim_subreg_arb.sv \
    $OPENTITAN/prim/rtl/prim_reg_we_check.sv \
    $OPENTITAN/prim/rtl/prim_onehot_check.sv \
    $OPENTITAN/prim/rtl/prim_arbiter_ppc.sv \
    $OPENTITAN/prim/rtl/prim_lc_sync.sv \
    $OPENTITAN/prim/rtl/prim_sync_reqack_data.sv \
    $OPENTITAN/prim/rtl/prim_lc_sender.sv \
    $OPENTITAN/prim/rtl/prim_edn_req.sv \
    $OPENTITAN/prim/rtl/prim_ram_1p_scr.sv \
    $OPENTITAN/prim/rtl/prim_esc_receiver.sv \
    $OPENTITAN/prim/rtl/prim_sync_reqack.sv \
    $OPENTITAN/prim/rtl/prim_arbiter_fixed.sv \
    $OPENTITAN/prim/rtl/prim_packer_fifo.sv \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_clock_mux2.sv \
    $OPENTITAN/prim/rtl/prim_subst_perm.sv \
    $OPENTITAN/prim/rtl/prim_prince.sv \
    $OPENTITAN/prim/rtl/prim_ram_1p_adv.sv \
    $OPENTITAN/prim/rtl/prim_lfsr.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_28_22_enc.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_28_22_dec.sv \
    $OPENTITAN/prim/rtl/prim_count.sv \
    $IBEX/dv/uvm/core_ibex/common/prim/prim_ram_1p.sv \
]

set rtl_prim_generic [ concat \
    $OPENTITAN/prim_generic/rtl/prim_generic_clock_gating.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_buf.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_flop.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_clock_mux2.sv \
    $OPENTITAN/prim_generic/rtl/prim_generic_ram_1p.sv \
]

set rtl_tlul [ concat \
    $OPENTITAN/tlul/rtl/tlul_err.sv \
    $OPENTITAN/tlul/rtl/tlul_err_resp.sv \
    $OPENTITAN/tlul/rtl/tlul_sram_byte.sv \
    $OPENTITAN/tlul/rtl/tlul_adapter_sram.sv \
    $OPENTITAN/tlul/rtl/tlul_adapter_host.sv \
    $OPENTITAN/tlul/rtl/tlul_adapter_reg.sv \
    $OPENTITAN/tlul/rtl/tlul_cmd_intg_chk.sv \
    $OPENTITAN/tlul/rtl/tlul_cmd_intg_gen.sv \
    $OPENTITAN/tlul/rtl/tlul_rsp_intg_chk.sv \
    $OPENTITAN/tlul/rtl/tlul_rsp_intg_gen.sv \
    $OPENTITAN/tlul/rtl/tlul_data_integ_enc.sv \
    $OPENTITAN/tlul/rtl/tlul_data_integ_dec.sv \
    $OPENTITAN/tlul/rtl/tlul_socket_m1.sv \
    $OPENTITAN/tlul/rtl/tlul_socket_1n.sv \
    $OPENTITAN/tlul/rtl/tlul_fifo_sync.sv \
]

set rtl_ibex [ concat \
    $HW/ibex/ibex_tlul.sv \
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
    $rtl_prim \
    $rtl_prim_generic \
    $rtl_tlul \
]

set rtl_rv_core_ibex [ concat \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_addr_trans.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex_cfg_reg_top.sv \
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
    $rtl_prim \
    $rtl_prim_generic \
    $rtl_tlul \
    $OPENTITAN/prim/rtl/prim_assert_standard_macros.svh \
    $OPENTITAN/prim/rtl/prim_assert.sv \
    $OPENTITAN/rv_core_ibex/rtl/rv_core_ibex.sv \
]

set rtl_gpio [ concat \
    $OPENTITAN/gpio/rtl/gpio.sv \
    $OPENTITAN/gpio/rtl/gpio_reg_top.sv \
    $rtl_prim \
    $rtl_prim_generic \
    $rtl_tlul \
]

set rtl_mem [ concat \
    $HW/mem/mem_tlul.sv \
    $rtl_prim \
    $rtl_tlul \
]

set rtl_dc_fifo [ concat \
    $IP/dc_fifo/dc_data_buffer.sv \
    $IP/dc_fifo/dc_full_detector.sv \
    $IP/dc_fifo/dc_synchronizer.sv \
    $IP/dc_fifo/dc_token_ring_fifo_din.sv \
    $IP/dc_fifo/dc_token_ring_fifo_dout.sv \
    $IP/dc_fifo/dc_token_ring.sv \
    $IP/dc_fifo/onehot_to_bin.sv \
]

set rtl_spi_device [ concat \
    $HW/spi/spi_device_cmd_parser.sv \
    $HW/spi/spi_device_controller.sv \
    $HW/spi/spi_device_dc_fifo.sv \
    $HW/spi/spi_device_regs.sv \
    $HW/spi/spi_device_rx.sv \
    $HW/spi/spi_device_tx.sv \
    $HW/spi/spi_device_syncro.sv \
    $HW/spi/spi_device_tlul_plug.sv \
    $HW/spi/spi_device_tlul.sv \
    $rtl_prim \
    $rtl_tlul \
    $rtl_dc_fifo \
]

set rtl_xbar [ concat \
    $IP/xbar/rtl/xbar_1to2.sv \
    $IP/xbar/rtl/xbar_2to1.sv \
    $IP/xbar/rtl/xbar_main.sv \
    $IP/xbar/rtl/xbar_periph.sv \
]

set rtl_ml_top [ concat \
    $IP/shodan/ml_top/rtl/kelvin.sv \
    $IP/shodan/ml_top/rtl/ClockGate.sv \
    $IP/shodan/ml_top/rtl/ml_dmem.sv \
    $IP/shodan/ml_top/rtl/ml_top_core_reg_top.sv \
    $IP/shodan/ml_top/rtl/ml_top.sv \
    $IP/shodan/ml_top/rtl/Sram_1rw_256x256.sv \
    $IP/shodan/ml_top/rtl/Sram_1rwm_256x288.sv \
    $IP/shodan/ml_top/rtl/xbar_sram.sv \
    $rtl_prim \
    $rtl_prim_generic \
    $rtl_tlul \
]

set rtl_peri_device [ concat \
    $HW/peri_device.sv \
    $rtl_xbar \
    $rtl_gpio \
]
set rtl_peri_device [lsort -unique $rtl_peri_device]

set rtl_cpu_cluster [ concat \
    $HW/cpu_cluster.sv \
    $rtl_xbar \
    $rtl_ibex \
    $rtl_mem \
]
set rtl_cpu_cluster [lsort -unique $rtl_cpu_cluster]

set rtl_trng [ concat \
    $HW/trng/counter.sv \
    $HW/trng/ro.sv \
    $HW/trng/stage.sv \
    $HW/trng/trng.sv \
]

set rtl_toy_design [ concat \
    $HW/toy/toy_design.sv \
    $HW/toy/ring_terminator_n1.sv \
    $HW/toy/sup1v8_n1.sv \
    $HW/mem/mem_tlul.sv \
    $rtl_prim \
    $rtl_tlul \
]

set rtl_top_core [ concat \
    $HW/top_core.sv \
    $HW/rst_gen.sv \
    $rtl_xbar \
    $rtl_spi_device \
    $rtl_peri_device \
    $rtl_cpu_cluster \
]
set rtl_top_core [lsort -unique $rtl_top_core]

set rtl_top_chip [ concat \
    $HW/top_chip.sv \
    $HW/padring.sv \
    $rtl_top_core \
]
set rtl_top_chip [lsort -unique $rtl_top_chip]