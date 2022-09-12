### Simulation 
-----------------------------------------------------------

The testbench is located in [hw/tb](https://github.com/minghungumich/Intel16-OpenTitanSoC/tree/main/hw/tb). You can run the simulation for each file in vc folder. If you want to run simulation itself, type 
```
make TEST=<test_name>
```

If youw want to run simulation with DVE, type 
```
make dve TEST=<test_name>
```

### How to add customized unit testbench 
-----------------------------------------------------------

This VCS uses fielist structure for simulation. First, create a testbench called `tb_utils_<test_name>.sv` in the folder. Then create `<test_name>.vc` in the vc folder defining source and include path.