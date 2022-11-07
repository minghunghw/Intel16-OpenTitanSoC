### STA Flow 
-----------------------------------------------------------

The static timing analysis is using Synopsys PrimeTime, and it needs constraints (`sdc`), netlist (`sv`), and spef to run the STA flow. The Synopsys provides four different run types. They are setup (`max`), hold (`min`), power, and noise If you want to run one of them, type 
```
make netlist DESIGN_NAME=<some_design>
make <max/min/power/noise> DESIGN_NAME=<some_design>
```

If you want to run STA flow for all types, type 
```
make DESIGN_NAME=<some_design>