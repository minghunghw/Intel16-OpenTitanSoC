set libs [list \
    "ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_tttt_0.85v_25c" \
]

foreach lib $libs {
    read_lib "$lib.lib"
    write_lib -output "$lib.db" -format db ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_tttt_0.85v_25c
    remove_lib ip224uhdlp1p11rf_2048x32m8b2c1s0_t0r0p0d0a1m1h_tttt_0.85v_25c
}

quit
