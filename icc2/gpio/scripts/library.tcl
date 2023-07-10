set INTEL_NDM_REF_LIBS {}

foreach type {dsseq lvl base seq pwm spcl} {
    foreach variant {ulvt lvt lplvt lp nom hp ulp} {
        set vt "$type\_$variant"
        lappend INTEL_NDM_REF_LIBS $env(ICC2_NDM)/${vt}/ndm/lib224_b0m_6t_108pp_${vt}.ndm
        if { ${vt} == "spcl_ulvt" || ${vt} == "spcl_lvt" || ${vt} == "spcl_lplvt" || ${vt} == "spcl_lp" || ${vt} == "spcl_nom" || ${vt} == "spcl_hp" || ${vt} == "spcl_ulp"} {
            lappend INTEL_NDM_REF_LIBS $env(ICC2_NDM)/${vt}/ndm/lib224_b0m_6t_108pp_${vt}_layonly.ndm
        }
    }
}
puts "Intel NDM Reference Libraries: $INTEL_NDM_REF_LIBS"