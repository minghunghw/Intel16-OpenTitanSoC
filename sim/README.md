### Simulation 
-----------------------------------------------------------

The testbench is located in [hw/tb](https://github.com/minghungumich/Intel16-OpenTitanSoC/tree/main/hw/tb). You can run the simulation for each file in vc folder. If you want to run simulation itself, type 
```
make TEST=<test_name>
```

If you want to run simulation with DVE, type 
```
make dve TEST=<test_name>
```
### How to do regression test in unit folder
-----------------------------------------------------------

The regression test will run all the files in the variable `TEST` of `regression.sh`, type 
```
./regression.sh
```

### How to add customized unit testbench 
-----------------------------------------------------------

This VCS uses fielist structure for simulation. First, create a testbench called `tb_utils_<test_name>.sv` in the folder. Then create `<test_name>.vc` in the `pre_syn_unit/vc` folder defining source and include path.

### How to add customized top level testbench 
-----------------------------------------------------------

Current top level test structure supports SPI program loading. Since Ibex core will start fetching instruction from `0x0000_0080`, we should first load the instructions from this address with SPI device. After all instrctions are transmitted, turn on `fetch_enable_i` and `en_ifetch_i`. After ibex core loads the instrutcion data correctly, turn off those two signals again. For each 32 bit RISC-V transaction, you need to provide `cmd`, `addr`, and `data` like [this](https://github.com/minghungumich/Intel16-OpenTitanSoC/blob/main/hw/tb/pkg/tb_spi_pkg.sv#L35-L37).