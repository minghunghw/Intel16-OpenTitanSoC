#based on files from: /data/PDKs/intel/Intel16/pdk/pdk224_r0.9HP2/models/core/datasheets/m11_1x_3xa_1xb_1xc_2y_2ga_mim2_lgb__bumpp 

set CORNER TC
puts "\[INFO\]\[FLOW\] Using corner $CORNER"

# Liberty units are fF,kOhm
if {"$CORNER" eq "TC"} {
    # typical temperature 25 skew tttt 
    set_layer_rc -layer gm0 -resistance 0.0165682 -capacitance 0.460484 
    set_layer_rc -layer gmb -resistance 0.00559894 -capacitance 0.413999  
    set_layer_rc -layer gmz -resistance 0.0165682 -capacitance 0.479293  
    set_layer_rc -layer m1 -resistance 13.7477 -capacitance 0.19113  
    set_layer_rc -layer m2 -resistance 14.0684 -capacitance 0.2003  
    set_layer_rc -layer m3 -resistance 14.0684 -capacitance 0.2003 
    set_layer_rc -layer m4 -resistance 14.0684 -capacitance 0.2003  
    set_layer_rc -layer m5 -resistance 14.0684 -capacitance 0.2003  
    set_layer_rc -layer m6 -resistance 14.0684 -capacitance 0.20389  
    set_layer_rc -layer m7 -resistance 0.401897 -capacitance 0.243924 
    set_layer_rc -layer m8 -resistance 0.401897 -capacitance 0.232623
    set_layer_rc -via gv0 -resistance 0.005239  
    set_layer_rc -via gv1 -resistance 0.000147  
    set_layer_rc -via v0 -resistance 7.69737 
    set_layer_rc -via v1 -resistance 4.73168  
    set_layer_rc -via v2 -resistance 4.89484  
    set_layer_rc -via v3 -resistance 4.89484  
    set_layer_rc -via v4 -resistance 3.30402  
    set_layer_rc -via v5 -resistance 3.30402  
    set_layer_rc -via v6 -resistance 0.841963  
    set_layer_rc -via v7 -resistance 0.202071  
    set_layer_rc -via v8 -resistance 0.202071  
    set_layer_rc -via vmz -resistance 0.202071 
} elseif {"$CORNER" eq "WC"} {
    # slow temperature 125 skew prcs 
    set_layer_rc -layer gm0 -resistance 0.0280631 -capacitance 0.40804  
    set_layer_rc -layer gmb -resistance 0.00956714 -capacitance 0.372604  
    set_layer_rc -layer gmz -resistance 0.0280631 -capacitance 0.435021  
    set_layer_rc -layer m1 -resistance 19.4466 -capacitance 0.177125 
    set_layer_rc -layer m2 -resistance 20.0448 -capacitance 0.185823  
    set_layer_rc -layer m3 -resistance 20.0448 -capacitance 0.185823  
    set_layer_rc -layer m4 -resistance 20.0448 -capacitance 0.185823  
    set_layer_rc -layer m5 -resistance 20.0448 -capacitance 0.185823  
    set_layer_rc -layer m6 -resistance 20.0448 -capacitance 0.189872  
    set_layer_rc -layer m7 -resistance 0.687816 -capacitance 0.220551  
    set_layer_rc -layer m8 -resistance 0.687816 -capacitance 0.207283 
    set_layer_rc -via gv0 -resistance 0.0086292  
    set_layer_rc -via gv1 -resistance 0.00024165  
    set_layer_rc -via v0 -resistance 9.86033  
    set_layer_rc -via v1 -resistance 5.86501  
    set_layer_rc -via v2 -resistance 6.06726  
    set_layer_rc -via v3 -resistance 6.06726  
    set_layer_rc -via v4 -resistance 4.09539  
    set_layer_rc -via v5 -resistance 4.09539  
    set_layer_rc -via v6 -resistance 1.38672  
    set_layer_rc -via v7 -resistance 0.332811  
    set_layer_rc -via v8 -resistance 0.332811  
    set_layer_rc -via vmz -resistance 0.332811 
} elseif {"$CORNER" eq "BC"} {
    # fast temperature -40 skew prcf 
    set_layer_rc -layer gm0 -resistance 0.0104022 -capacitance 0.535236  
    set_layer_rc -layer gmb -resistance 0.00347645 -capacitance 0.470783  
    set_layer_rc -layer gmz -resistance 0.0104022 -capacitance 0.548403  
    set_layer_rc -layer m1 -resistance 10.4207 -capacitance 0.201016  
    set_layer_rc -layer m2 -resistance 10.6545 -capacitance 0.20944  
    set_layer_rc -layer m3 -resistance 10.6545 -capacitance 0.20944  
    set_layer_rc -layer m4 -resistance 10.6545 -capacitance 0.20944  
    set_layer_rc -layer m5 -resistance 10.6545 -capacitance 0.20944  
    set_layer_rc -layer m6 -resistance 10.6545 -capacitance 0.213572  
    set_layer_rc -layer m7 -resistance 0.267944 -capacitance 0.273854  
    set_layer_rc -layer m8 -resistance 0.267944 -capacitance 0.263639 
    set_layer_rc -via gv0 -resistance 0.00315643  
    set_layer_rc -via gv1 -resistance 0.0000888  
    set_layer_rc -via v0 -resistance 5.80882  
    set_layer_rc -via v1 -resistance 3.65233  
    set_layer_rc -via v2 -resistance 3.77827  
    set_layer_rc -via v3 -resistance 3.77827  
    set_layer_rc -via v4 -resistance 2.55034  
    set_layer_rc -via v5 -resistance 2.55034  
    set_layer_rc -via v6 -resistance 0.507325  
    set_layer_rc -via v7 -resistance 0.121758  
    set_layer_rc -via v8 -resistance 0.121758  
    set_layer_rc -via vmz -resistance 0.121758 
} else {
  puts "\[ERROR\]\[FLOW\] '$CORNER' is not a valid corner name. Check setRC.tcl"
}

set_wire_rc -signal -layer m3 
set_wire_rc -clock -layer m5
