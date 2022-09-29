#based on files from: /data/PDKs/intel/Intel16/pdk/pdk224_r0.9HP2/models/core/datasheets/m11_1x_3xa_1xb_1xc_2y_ 2ga_mim2_lgb_bumpp 

set_layer_rc -layer gm0 -resistance 0.0280631 -capacitance 0.563158 
set_layer rc -layer gmb -resistance 0.00956714 -capacitance 0.4914 
set_layer_rc -layer gmz -resistance 0.0280631 -capacitance 0.591368 
set_layer_rc -layer m1 -resistance 12.5830941176471 -capacitance 0.133353 
set_layer_rc -layer m2 -resistance 20.0448 -capacitance 0.217568 
set_layer_rc -layer m3 -resistance 20.0448 -capacitance 0.217568 
set_layer_rc -layer m4 -resistance 20.0448 -capacitance 0.217568 
set_layer_rc -layer m5 -resistance 20.0448 -capacitance 0.217568 
set_layer_rc -layer m6 -resistance 20.0448 -capacitance 0.219298 
set_layer_rc -layer m7 -resistance 0.687816 -capacitance 0.288907 
set_layer_rc -layer m8 -resistance 0.687816 -capacitance 0.274399

set_layer_rc -via gv0 -resistance 0.00315643 
set_layer_rc -via gv1 -resistance 0.0000888 
set_layer_rc -via v1 -resistance 5.80882 
set_layer_rc -via v1 -resistance 3.65233 
set_layer_rc -via v2 -resistance 3.77827 
set_layer_rc -via v3 -resistance 3.77827 
set_layer_rc -via v4 -resistance 2.55034 
set_layer_rc -via v5 -resistance 2.55034 
set_layer_rc -via v6 -resistance 0.507325 
set_layer_rc -via v7 -resistance 0.121758 
set_layer_rc -via v8 -resistance 0.121758 
set_layer_rc -via vmz -resistance 0.121758

if { [llength [sta::corners]] != 1 } {
    # typical temperature 25 skew tttt 
    set_layer_rc -layer gm0 -resistance 0.0165682 -capacitance 0.460484 -corner typical
    set_layer_rc -layer gmb -resistance 0.00559894 -capacitance 0.413999 -corner typical 
    set_layer_rc -layer gmz -resistance 0.0165682 -capacitance 0.479293 -corner typical 
    set_layer_rc -layer m1 -resistance 8.89557058823529 -capacitance 0.123672352941176 -corner typical 
    set_layer_rc -layer m2 -resistance 14.0684 -capacitance 0.2003 -corner typical 
    set_layer_rc -layer m3 -resistance 14.0684 -capacitance 0.2003 -corner typical
    set_layer_rc -layer m4 -resistance 14.0684 -capacitance 0.2003 -corner typical 
    set_layer_rc -layer m5 -resistance 14.0684 -capacitance 0.2003 -corner typical 
    set_layer_rc -layer m6 -resistance 14.0684 -capacitance 0.20389 -corner typical 
    set_layer_rc -layer m7 -resistance 0.42735 -capacitance 0.250428 -corner typical 
    set_layer_rc -layer m8 -resistance 0.42735 -capacitance 0.239086 -corner typical

    set_layer_rc -via gv0 -resistance 0.005239 -corner typical 
    set_layer_rc -via gv1 -resistance 0.000147 -corner typical 
    set_layer_rc -via v0 -resistance 7.69737 -corner typical
    set_layer_rc -via v1 -resistance 4.73168 -corner typical 
    set_layer_rc -via v2 -resistance 4.89484 -corner typical 
    set_layer_rc -via v3 -resistance 4.89484 -corner typical 
    set_layer_rc -via v4 -resistance 3.30402 -corner typical 
    set_layer_rc -via v5 -resistance 3.30402 -corner typical 
    set_layer_rc -via v6 -resistance 0.841963 -corner typical 
    set_layer_rc -via v7 -resistance 0.202071 -corner typical 
    set_layer_rc -via v8 -resistance 0.202071 -corner typical 
    set_layer_rc -via vmz -resistance 0.202071 -corner typical

    # slow temperature 125 skew prcs 
    set_layer_rc -layer gm0 -resistance 0.0280631 -capacitance 0.40804 -corner slow 
    set_layer_rc -layer gmb -resistance 0.00956714 -capacitance 0.372604 -corner slow 
    set_layer_rc -layer gmz -resistance 0.0280631 -capacitance 0.435021 -corner slow 
    set_layer_rc -layer m1 -resistance 12.5830941176471 -capacitance 0.114610294117647 -corner slow
    set_layer_rc -layer m2 -resistance 20.0448 -capacitance 0.185823 -corner slow 
    set_layer_rc -layer m3 -resistance 20.0448 -capacitance 0.185823 -corner slow 
    set_layer_rc -layer m4 -resistance 20.0448 -capacitance 0.185823 -corner slow 
    set_layer_rc -layer m5 -resistance 20.0448 -capacitance 0.185823 -corner slow 
    set_layer_rc -layer m6 -resistance 20.0448 -capacitance 0.189872 -corner slow 
    set_layer_rc -layer m7 -resistance 0.687816 -capacitance 0.225432 -corner slow 
    set_layer_rc -layer m8 -resistance 0.687816 -capacitance 0.212091 -corner slow
    set_layer_rc -via gv0 -resistance 0.0086292 -corner slow 
    set_layer_rc -via gv1 -resistance 0.00024165 -corner slow 
    set_layer_rc -via v0 -resistance 9.86033 -corner slow 
    set_layer_rc -via v1 -resistance 5.86501 -corner slow 
    set_layer_rc -via v2 -resistance 6.06726 -corner slow 
    set_layer_rc -via v3 -resistance 6.06726 -corner slow 
    set_layer_rc -via v4 -resistance 4.09539 -corner slow 
    set_layer_rc -via v5 -resistance 4.09539 -corner slow 
    set_layer_rc -via v6 -resistance 1.38672 -corner slow 
    set_layer_rc -via v7 -resistance 0.332811 -corner slow 
    set_layer_rc -via v8 -resistance 0.332811 -corner slow 
    set_layer_rc -via vmz -resistance 0.332811 -corner slow

    # fast temperature -40 skew prcf 
    set_layer_rc -layer gm0 -resistance 0.0104022 -capacitance 0.535236 -corner fast 
    set_layer_rc -layer gmb -resistance 0.00347645 -capacitance 0.470783 -corner fast 
    set_layer_rc -layer gmz -resistance 0.0104022 -capacitance 0.548403 -corner fast 
    set_layer_rc -layer m1 -resistance 6.74280588235294 -capacitance 0.130069176470588 -corner fast
    set_layer_rc -layer gmz -resistance 0.0104022 -capacitance 0.548403 -corner fast 
    set_layer_rc -layer m1 -resistance 6.74280588235294 -capacitance 0.130069176470588 -corner fast 
    set_layer_rc -layer m2 -resistance 10.6545 -capacitance 0.20944 -corner fast 
    set_layer_rc -layer m3 -resistance 10.6545 -capacitance 0.20944 -corner fast 
    set_layer_rc -layer m4 -resistance 10.6545 -capacitance 0.20944 -corner fast 
    set_layer_rc -layer m5 -resistance 10.6545 -capacitance 0.20944 -corner fast 
    set_layer_rc -layer m6 -resistance 10.6545 -capacitance 0.213572 -corner fast 
    set_layer_rc -layer m7 -resistance 0.284841 -capacitance 0.282129 -corner fast 
    set_layer_rc -layer m8 -resistance 0.284841 -capacitance 0.271865 -corner fast
    set_layer_rc -via gv0 -resistance 0.00315643 -corner fast 
    set_layer_rc -via gv1 -resistance 0.0000888 -corner fast 
    set_layer_rc -via v0 -resistance 5.80882 -corner fast 
    set_layer_rc -via v1 -resistance 3.65233 -corner fast 
    set_layer_rc -via v2 -resistance 3.77827 -corner fast 
    set_layer_rc -via v3 -resistance 3.77827 -corner fast 
    set_layer_rc -via v4 -resistance 2.55034 -corner fast 
    set_layer_rc -via v5 -resistance 2.55034 -corner fast 
    set_layer_rc -via v6 -resistance 0.507325 -corner fast 
    set_layer_rc -via v7 -resistance 0.121758 -corner fast 
    set_layer_rc -via v8 -resistance 0.121758 -corner fast 
    set_layer_rc -via vmz -resistance 0.121758 -corner fast
}
set_wire_rc -signal -layer m3 
set_wire_rc -clock -layer m5
