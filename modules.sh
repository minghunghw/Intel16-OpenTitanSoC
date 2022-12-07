# Clear all preloaded modules
# ---------------------------
module purge

# Load cadre software
module use /afs/eecs.umich.edu/cadre/software/modules
module use /afs/eecs.umich.edu/cadre/software/openroad/modules
module use /afs/eecs.umich.edu/vlsida/projects/restricted/intel/modules

# Load modules
module load riscv/9.2
module load devtoolset-el7/8
module load cmake/3.24.0
module load boost
module load swig-rhel7/4.0.1
module load tcl-devel
module load spdlog
module load zlib
module load lemon/1.3.1
module load eigen/3.3.7
module load tcl-tclreadline/2.1.0
module load bison
module load libffi-devel
module load readline-devel
module load qt5-qtbase-devel/5.9.7
module load python/3.8.11
module load anaconda3/2018.12
module load klayout-el7/0.27.3
module load or-tools/9.4.1874

# Load commercial tools
module load vcs/2017.12-SP2-1
module load calibre/2022.2_15.10_aoi
module load synopsys-icv/2022.03-SP2
module load synopsys-icvwb/2021.06
module load synopsys-synth/2021.06-SP4
module load starrc/2022.03-SP3
module load primetime/2021.06-SP4
module load synopsys-lib-compiler/2022.03-SP3

# Load OpenROAD-flow-srcipts tool
if [ -d "ip/OpenROAD-flow-scripts/tools/install" ]; then
    source ip/OpenROAD-flow-scripts/setup_env.sh
else
    echo -e "\e[31m[ERROR]\e[0m Please execute this command first: ./tool.sh --orfs"
    return
fi

echo "OpenTitan module setup done"