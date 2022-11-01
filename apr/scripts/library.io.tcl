Footprint library {
  types {
    sig sdio_1v8_pad
    vccio sup1v8_pad 
  }

  pad_pin_name PAD
  pad_pin_layer met5

  cells {
    sdio_1v8_pad {
      cell_name sdio_1v8_n1
      orient {bottom R180 right R270 top R0 left R90}
      flip_pair 1
    }
    sup1v8_pad {
      cell_name sup1v8_n1
      physical_only 1
      orient {bottom R180 right R270 top R0 left R90}
    }
  }
}
