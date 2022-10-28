Footprint library {
  types {
    sig top_gpiov2_pad
    vdd vccd_hvc_power_pad
    vss vssd_hvc_ground_pad
    vddio vddio_hvc_power_pad 
    vssio vssio_hvc_ground_pad
  }

  pad_pin_name PAD
  pad_pin_layer met5

  cells {
    top_gpiov2_pad {
      cell_name sky130_ef_io__gpiov2_pad_wrapped
      orient {bottom R180 right R270 top R0 left R90}
      flip_pair 1
    }
    vccd_hvc_power_pad {
      cell_name sky130_ef_io__vccd_hvc_pad
      physical_only 1
      orient {bottom R180 right R270 top R0 left R90}
    }
  }
}
