LOG_DIR=logs
LOG_FILE=$LOG_DIR/$0.log
COMMON=../common/regression_common.sh
TESTS="             \
    cpu_cluster     \
    gpio_tlul       \
    ibex_tlul       \
    mem_tlul        \
    spi_device_tlul \
    xbar_main       \
    xbar_2to1       \
"

source $COMMON

# Prep
prerun_steps;

# Run
for t in $TESTS; do
    make clean
    make TEST=$t
    postrun_steps $t
done

# Report
regress_report;