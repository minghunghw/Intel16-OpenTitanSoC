# RTL filelists
#------------------
set HW          "../../hw/sv"
set OPENTITAN   "../../ip/opentitan/hw/ip"

set rtl_includes [ concat \
    $OPENTITAN/prim/rtl \
]

set rtl_packages [ concat \
    $HW/top_pkg.sv \
    $OPENTITAN/prim/rtl/prim_util_pkg.sv \
    $OPENTITAN/prim/rtl/prim_secded_pkg.sv \
    $OPENTITAN/prim/rtl/prim_mubi_pkg.sv \
    $OPENTITAN/tlul/rtl/tlul_pkg.sv \
]

set rtl_prim [ concat \
    $OPENTITAN/prim/rtl/prim_fifo_sync_cnt.sv \
    $OPENTITAN/prim/rtl/prim_fifo_sync.sv \
    $OPENTITAN/prim/rtl/prim_secded_inv_39_32_enc.sv \
]

set rtl_tlul [ concat \
    $OPENTITAN/tlul/rtl/tlul_err.sv \
    $OPENTITAN/tlul/rtl/tlul_rsp_intg_gen.sv \
    $OPENTITAN/tlul/rtl/tlul_data_integ_enc.sv \
    $OPENTITAN/tlul/rtl/tlul_sram_byte.sv \
    $OPENTITAN/tlul/rtl/tlul_adapter_sram.sv \
]

set rtl_mem [ concat \
    $HW/mem/mem_tlul.sv \
]
