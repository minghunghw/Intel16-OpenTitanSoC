#####################################

#####################################
#define hierarchy variable(s)
$TOP=/mss_top_top

# define RTL parameters, please take note that the parameter values below
## may be plus one compared to parameter values in RTL
## VALUES MUST MATCH PARAMETER VALUES CODED IN RTL
$DATA_SIZE=8
$VISA_LANE_WIDTH=8
$VISA_NUM_LANES=2
## OR M4 files may be used to configure parameters
#m4_include(mss_top_visa_defines.m4)

UnitModule::src_sync_clks=1

+UnitModule(visa_unit_mux_s)
#################################################
# VISA2 - ULML0_0 configuration
#################################################
hierarchy=$TOP/mss_top_visa_ulml0_0
# EITHER hardcode parameters
num_output_lanes=$VISA_NUM_LANES 
lane_width=$VISA_LANE_WIDTH
# OR get parameter values from m4 files
#num_output_lanes=m4_eval(VISA_NUM_LANES)          # 1 output lane
#lane_width=m4_eval(VISA_LANE_WIDTH)
num_xbar_lanes=0                # xbar not supported
use_clkmux=1

# now set the properties needed for visa_validate to know what the default parameter tieoffs are
visa_unit_id=0
reg_start_index=0

.visa_unit_id       = $TOP/visa_unit_id           # the visa_unit_id port is set to a strap or parameter
.reg_start_index    = $TOP/visa_reg_start_index   # the reg_start_index port is set to a parameter [5] -- optional

.lane_out           = $TOP/visa_dbg_lane          # Output [VISA_NUM_LANES][VISA_LANE_WIDTH]
.ss_clk_out         = $TOP/visa_clk               # Output [VISA_NUM_LANES]

##.visa_clk           = $TOP/visa_clk_in          # Input - muxes with gasket or with children with gasket (rare)
.visa_resetb        = $TOP/visa_resetb            # Input - reset
.visa_unit_id       = $TOP/visa_unit_id           # Input - unit ID [9]
##.fscan_mode         = $TOP/visa_fscan_mode        # Input - fscan_mode; commenting since this is usually internally tied to 0
.lane_in            = $TOP/visa_lane_in           # Input - concatenated from lane_out of multiple children [NUM_LANES][LANE_WIDTH]
.customer_disable   = $TOP/visa_customer_dis      # Input ; optional, controls security for the ulm
.all_disable        = $TOP/visa_all_dis           # Input ; optional, drives ulm which is placed within this IP
.serial_cfg_out     = $TOP/visa_serial_cfg_out    # Output [3] ; optional, needed if you are feeding a subIP ulm
.src_clk            = $TOP/visa_src_clk           # Input  [NUM_INPUT_CLKS] clock if the ulm is receiving raw functional signals/clocks across IP boundary, such as a subIP
.serial_cfg_in      = $TOP/visa_serial_cfg_in     # Input  [3]

## set the functional clock to be observed, and all signals to be referrenced by this clock
## if more than one functional clock, then repeat for all clocks with their
## set of signals
## NOTE: signal paths are hierarchical, but an entry "$signal_path=<hierarchy>" can be used to enable listing simple signal names 
clk=$TOP/clk
## update if DATA_SIZE changes!!
$TOP/data_o[7:0]
#$fill_lane

## clk=$TOP/clk2
## list of signals for $TOP/clk2


## read subIP sig files, but do not insert on subIP from parent IP
## - ideally each IP should be inserted independently (so you don't get a
## subIP that is inserted differently depending on the parent)
##.include <child_sig_file> -autoinsert=0

