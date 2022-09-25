# Clear all preloaded modules
# ---------------------------
module purge

# Load cadre software
module use /afs/eecs.umich.edu/cadre/software/modules
module use /afs/eecs.umich.edu/cadre/software/openroad/modules

# Load modules
module load devtoolset-el7/8
module load cmake/3.14.0
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