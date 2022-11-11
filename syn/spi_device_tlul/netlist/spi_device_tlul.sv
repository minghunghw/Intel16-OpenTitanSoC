/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP1
// Date      : Fri Nov 11 03:14:11 2022
/////////////////////////////////////////////////////////////


module spi_device_tlul ( clk_i, rst_ni, test_mode, spi_sclk, spi_cs, spi_mode, 
        spi_sdi0, spi_sdi1, spi_sdi2, spi_sdi3, spi_sdo0, spi_sdo1, spi_sdo2, 
        spi_sdo3, tl_i, tl_o );
  output [1:0] spi_mode;
  input [65:0] tl_i;
  output [108:0] tl_o;
  input clk_i, rst_ni, test_mode, spi_sclk, spi_cs, spi_sdi0, spi_sdi1,
         spi_sdi2, spi_sdi3;
  output spi_sdo0, spi_sdo1, spi_sdo2, spi_sdo3;
  wire   en_quad, tx_counter_upd, tx_data_valid, tx_done, ctrl_rd_wr,
         ctrl_addr_valid, ctrl_data_tx_ready, rd_wr_sync, u_rxreg_net873,
         u_rxreg_net868, u_rxreg_net863, u_rxreg_net857, u_rxreg_N60,
         u_rxreg_N59, u_rxreg_N58, u_rxreg_N57, u_rxreg_N56, u_rxreg_N55,
         u_rxreg_N54, u_rxreg_N53, u_rxreg_N52, u_rxreg_N51, u_rxreg_N50,
         u_rxreg_N49, u_rxreg_N48, u_rxreg_N47, u_rxreg_N46, u_rxreg_N45,
         u_rxreg_N44, u_rxreg_N43, u_rxreg_N42, u_rxreg_N41, u_rxreg_N40,
         u_rxreg_N39, u_rxreg_N38, u_rxreg_N37, u_rxreg_N36, u_rxreg_N35,
         u_rxreg_N34, u_rxreg_N33, u_rxreg_N32, u_rxreg_N31, u_rxreg_N30,
         u_rxreg_N29, u_rxreg_N28, u_rxreg_N27, u_rxreg_N26, u_rxreg_N25,
         u_rxreg_N24, u_rxreg_N23, u_rxreg_N22, u_rxreg_N9, u_rxreg_N7,
         u_txreg_net840, u_txreg_net835, u_txreg_net830, u_txreg_net824,
         u_txreg_sclk_test, u_txreg_N65, u_txreg_N64, u_txreg_N63, u_txreg_N62,
         u_txreg_N61, u_txreg_N60, u_txreg_N59, u_txreg_N58, u_txreg_N57,
         u_txreg_N56, u_txreg_N55, u_txreg_N54, u_txreg_N53, u_txreg_N52,
         u_txreg_N51, u_txreg_N50, u_txreg_N49, u_txreg_N48, u_txreg_N47,
         u_txreg_N46, u_txreg_N45, u_txreg_N44, u_txreg_N43, u_txreg_N42,
         u_txreg_N41, u_txreg_N40, u_txreg_N39, u_txreg_N38, u_txreg_N37,
         u_txreg_N36, u_txreg_N35, u_txreg_N34, u_txreg_N31, u_txreg_N30,
         u_txreg_N29, u_txreg_N28, u_txreg_N27, u_txreg_N26, u_txreg_N25,
         u_txreg_N24, u_txreg_N11, u_txreg_running, u_txreg_N10,
         u_device_sm_net774, u_device_sm_net769, u_device_sm_net763,
         u_device_sm_N205, u_device_sm_N204, u_device_sm_N203,
         u_device_sm_N202, u_device_sm_N201, u_device_sm_N200,
         u_device_sm_N199, u_device_sm_N198, u_device_sm_N197,
         u_device_sm_N196, u_device_sm_N195, u_device_sm_N194,
         u_device_sm_N193, u_device_sm_N192, u_device_sm_N191,
         u_device_sm_N190, u_device_sm_N189, u_device_sm_N188,
         u_device_sm_N187, u_device_sm_N186, u_device_sm_N185,
         u_device_sm_N184, u_device_sm_N183, u_device_sm_N182,
         u_device_sm_N181, u_device_sm_N180, u_device_sm_N179,
         u_device_sm_N178, u_device_sm_N177, u_device_sm_N176,
         u_device_sm_N175, u_device_sm_N174, u_device_sm_N163,
         u_device_sm_tx_done_reg, u_device_sm_tx_data_valid_next,
         u_device_sm_ctrl_data_tx_ready_next, u_device_sm_sample_CMD,
         u_device_sm_sample_ADDR, u_device_sm_tx_counter_upd_next,
         u_device_sm_tx_counter_next_3_, u_spi_device_tlul_plug_net617,
         u_spi_device_tlul_plug_net611, u_spi_device_tlul_plug_N61,
         u_spi_device_tlul_plug_we, u_syncro_rdwr_reg_0_, u_syncro_cs_reg_0_,
         u_device_sm_u_spiregs_net807, u_device_sm_u_spiregs_net802,
         u_device_sm_u_spiregs_net797, u_device_sm_u_spiregs_net791,
         u_device_sm_u_spiregs_N34, u_device_sm_u_spiregs_N33,
         u_device_sm_u_spiregs_N32, u_device_sm_u_spiregs_N31,
         u_dcfifo_tx_u_din_write_enable, u_dcfifo_rx_u_din_write_enable,
         u_dcfifo_tx_u_dout_read_enable, u_dcfifo_tx_u_din_buffer_net746,
         u_dcfifo_tx_u_din_buffer_net741, u_dcfifo_tx_u_din_buffer_net736,
         u_dcfifo_tx_u_din_buffer_net731, u_dcfifo_tx_u_din_buffer_net726,
         u_dcfifo_tx_u_din_buffer_net721, u_dcfifo_tx_u_din_buffer_net716,
         u_dcfifo_tx_u_din_buffer_net711, u_dcfifo_tx_u_din_buffer_net706,
         u_dcfifo_tx_u_din_buffer_net701, u_dcfifo_tx_u_din_buffer_net696,
         u_dcfifo_tx_u_din_buffer_net691, u_dcfifo_tx_u_din_buffer_net686,
         u_dcfifo_tx_u_din_buffer_net681, u_dcfifo_tx_u_din_buffer_net676,
         u_dcfifo_tx_u_din_buffer_net670, u_dcfifo_tx_u_din_buffer_N33,
         u_dcfifo_tx_u_din_buffer_N32, u_dcfifo_tx_u_din_buffer_N31,
         u_dcfifo_tx_u_din_buffer_N30, u_dcfifo_tx_u_din_buffer_N29,
         u_dcfifo_tx_u_din_buffer_N28, u_dcfifo_tx_u_din_buffer_N27,
         u_dcfifo_tx_u_din_buffer_N26, u_dcfifo_tx_u_din_write_tr_net652,
         u_dcfifo_tx_u_din_full_N0, u_dcfifo_tx_u_din_full_latched_full_s,
         u_dcfifo_tx_u_din_full_full_up, u_dcfifo_tx_u_din_full_full_dn,
         u_dcfifo_rx_u_din_full_N0, u_dcfifo_rx_u_din_full_latched_full_s,
         u_dcfifo_rx_u_din_full_full_up, u_dcfifo_rx_u_din_full_full_dn,
         u_dcfifo_tx_u_dout_read_tr_net634, u_dcfifo_rx_u_din_buffer_net746,
         u_dcfifo_rx_u_din_buffer_net741, u_dcfifo_rx_u_din_buffer_net736,
         u_dcfifo_rx_u_din_buffer_net731, u_dcfifo_rx_u_din_buffer_net726,
         u_dcfifo_rx_u_din_buffer_net721, u_dcfifo_rx_u_din_buffer_net716,
         u_dcfifo_rx_u_din_buffer_net711, u_dcfifo_rx_u_din_buffer_net706,
         u_dcfifo_rx_u_din_buffer_net701, u_dcfifo_rx_u_din_buffer_net696,
         u_dcfifo_rx_u_din_buffer_net691, u_dcfifo_rx_u_din_buffer_net686,
         u_dcfifo_rx_u_din_buffer_net681, u_dcfifo_rx_u_din_buffer_net676,
         u_dcfifo_rx_u_din_buffer_net670, u_dcfifo_rx_u_din_buffer_N33,
         u_dcfifo_rx_u_din_buffer_N32, u_dcfifo_rx_u_din_buffer_N31,
         u_dcfifo_rx_u_din_buffer_N30, u_dcfifo_rx_u_din_buffer_N29,
         u_dcfifo_rx_u_din_buffer_N28, u_dcfifo_rx_u_din_buffer_N27,
         u_dcfifo_rx_u_din_buffer_N26, u_dcfifo_rx_u_din_write_tr_net652,
         u_dcfifo_rx_u_dout_read_tr_net634,
         u_dcfifo_tx_u_din_full_full_synch_d_middle_0_,
         u_dcfifo_rx_u_din_full_full_synch_d_middle_0_, n604, n1455, n1456,
         n1691, n1694, n1697, n1700, n1703, n1706, n1709, n1712, n1715, n1718,
         n1721, n1724, n1727, n1730, n1733, n1736, n1739, n1742, n1745, n1748,
         n1751, n1754, n1757, n1760, n1763, n1766, n1769, n1772, n1775, n1778,
         n1781, n1784, n1787, n1790, n1793, n1796, n1799, n1802, n1869, n1878,
         n1881, n2656, n2723, n2736, n2737, n2738, n2739, n2740, n2741, n2742,
         n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751, n2752,
         n2753, n2754, n2755, n2756, n2757, n2759, n2760, n2761, n2762, n2763,
         n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771, n2772, n2773,
         n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781, n2782, n2783,
         n2784, n2785, n2786, n2787, n2788, n2789, n2790, n2791, n2792, n2793,
         n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801, n2802, n2803,
         n2804, n2805, n2806, n2807, n2808, n2809, n2810, n2811, n2812, n2813,
         n2814, n2815, n2816, n2817, n2818, n2819, n2820, n2821, n2822, n2823,
         n2824, n2825, n2826, n2827, n2828, n2829, n2830, n2831, n2832, n2833,
         n2834, n2835, n2836, n2837, n2838, n2839, n2840, n2841, n2842, n2843,
         n2844, n2845, n2846, n2847, n2848, n2849, n2850, n2851, n2852, n2853,
         n2854, n2855, n2856, n2857, n2858, n2859, n2860, n2861, n2862, n2863,
         n2864, n2866, n2867, n2868, n2869, n2870, n2871, n2872, n2873, n2874,
         n2875, n2876, n2877, n2878, n2879, n2880, n2881, n2882, n2883, n2884,
         n2885, n2886, n2887, n2888, n2889, n2890, n2891, n2892, n2893, n2894,
         n2895, n2896, n2897, n2898, n2899, n2900, n2901, n2902, n2903, n2904,
         n2905, n2906, n2907, n2908, n2909, n2910, n2911, n2912, n2913, n2914,
         n2915, n2916, n2917, n2918, n2919, n2920, n2921, n2922, n2923, n2924,
         n2925, n2926, n2927, n2928, n2929, n2930, n2931, n2932, n2933, n2934,
         n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942, n2943, n2944,
         n2945, n2946, n2947, n2948, n2949, n2950, n2951, n2952, n2953, n2954,
         n2955, n2956, n2957, n2958, n2959, n2960, n2961, n2962, n2963, n2964,
         n2965, n2966, n2967, n2968, n2969, n2970, n2971, n2972, n2973, n2974,
         n2975, n2976, n2977, n2978, n2979, n2980, n2981, n2982, n2983, n2984,
         n2985, n2986, n2987, n2988, n2989, n2990, n2991, n2992, n2993, n2994,
         n2995, n2996, n2997, n2998, n2999, n3000, n3001, n3002, n3003, n3004,
         n3005, n3006, n3007, n3008, n3010, n3013, n3014, n3015, n3016, n3017,
         n3018, n3019, n3021, n3022, n3024, n3025, n3026, n3027, n3028, n3029,
         n3030, n3031, n3032, n3033, n3034, n3035, n3036, n3037, n3038, n3039,
         n3040, n3041, n3042, n3043, n3044, n3047, n3048, n3049, n3050, n3051,
         n3052, n3054, n3055, n3056, n3057, n3058, n3059, n3060, n3061, n3062,
         n3063, n3064, n3065, n3066, n3067, n3068, n3069, n3070, n3072, n3073,
         n3074, n3075, n3076, n3078, n3079, n3080, n3081, n3082, n3083, n3085,
         n3086, n3088, n3089, n3090, n3091, n3092, n3093, n3094, n3097, n3098,
         n3099, n3100, n3101, n3102, n3103, n3104, n3105, n3106, n3107, n3108,
         n3111, n3113, n3114, n3115, n3116, n3117, n3118, n3119, n3120, n3121,
         n3122, n3123, n3124, n3125, n3126, n3127, n3128, n3129, n3130, n3131,
         n3132, n3133, n3134, n3135, n3136, n3137, n3139, n3141, n3142, n3143,
         n3144, n3145, n3146, n3148, n3149, n3150, n3157, n3158, n3159, n3160,
         n3161, n3162, n3163, n3164, n3165, n3166, n3167, n3168, n3169, n3170,
         n3171, n3172, n3173, n3174, n3175, n3176, n3177, n3178, n3179, n3180,
         n3181, n3182, n3183, n3184, n3185, n3186, n3187, n3188, n3189, n3190,
         n3191, n3192, n3193, n3194, n3195, n3196, n3197, n3198, n3199, n3200,
         n3201, n3202, n3203, n3204, n3205, n3206, n3207, n3208, n3209, n3210,
         n3211, n3212, n3213, n3214, n3217, n3218, n3219, n3220, n3221, n3222,
         n3223, n3224, n3225, n3226, n3227, n3228, n3229, n3230, n3231, n3232,
         n3233, n3234, n3235, n3236, n3237, n3238, n3239, n3240, n3241, n3242,
         n3243, n3244, n3245, n3246, n3247, n3248, n3249, n3250, n3251, n3252,
         n3253, n3254, n3255, n3256, n3257, n3258, n3259, n3260, n3261, n3262,
         n3263, n3264, n3265, n3266, n3267, n3268, n3269, n3270, n3271, n3272,
         n3273, n3274, n3275, n3276, n3277, n3278, n3279, n3280, n3281, n3282,
         n3283, n3284, n3285, n3286, n3287, n3288, n3289, n3290, n3291, n3292,
         n3293, n3294, n3295, n3296, n3297, n3298, n3301, n3302, n3303, n3304,
         n3305, n3307, n3308, n3309, n3310, n3311, n3312, n3313, n3314, n3315,
         n3316, n3317, n3318, n3320, n3321, n3322, n3323, n3324, n3325, n3326,
         n3327, n3328, n3329, n3330, n3331, n3332, n3333, n3334, n3335, n3336,
         n3337, n3338, n3339, n3340, n3341, n3342, n3343, n3344, n3345, n3346,
         n3347, n3348, n3349, n3350, n3351, n3352, n3353, n3354, n3356, n3357,
         n3358, n3359, n3360, n3361, n3362, n3363, n3364, n3365, n3366, n3367,
         n3368, n3369, n3370, n3371, n3372, n3373, n3374, n3375, n3376, n3377,
         n3378, n3379, n3380, n3381, n3382, n3383, n3384, n3385, n3386, n3387,
         n3388, n3389, n3390, n3391, n3392, n3393, n3394, n3395, n3396, n3397,
         n3398, n3399, n3400, n3401, n3402, n3403, n3404, n3405, n3406, n3407,
         n3408, n3409, n3410, n3411, n3412, n3413, n3414, n3415, n3417, n3418,
         n3419, n3420, n3421, n3422, n3423, n3424, n3425, n3426, n3427, n3428,
         n3429, n3430, n3431, n3432, n3433, n3434, n3435, n3436, n3442, n3443,
         n3444, n3445, n3446, n3453, n3454, n3455, n3456, n3457, n3463, n3464,
         n3465, n3466, n3467, n3476, n3477, n3478, n3479, n3480, n3482, n3483,
         n3484, n3485, n3486, n3487, n3488, n3489, n3490, n3491, n3492, n3493,
         n3494, n3495, n3497, n3498, n3499, n3500, n3501, n3503, n3504, n3505,
         n3506, n3507, n3508, n3509, n3510, n3511, n3512, n3513, n3514, n3515,
         n3516, n3517, n3518, n3519, n3520, n3521, n3522, n3523, n3524, n3525,
         n3526, n3527, n3528, n3529, n3530, n3531, n3532, n3533, n3534, n3535,
         n3536, n3537, n3538, n3539, n3540, n3541, n3542, n3543, n3544, n3549,
         n3550, n3551, n3552, n3553, n3554, n3556, n3557, n3558, n3559, n3560,
         n3561, n3562, n3563, n3564, n3565, n3566, n3567, n3568, n3571, n3572,
         n3573, n3574, n3575, n3576, n3577, n3578, n3579, n3580, n3581, n3582,
         n3583, n3584, n3585, n3586, n3587, n3589, n3590, n3591, n3592, n3593,
         n3594, n3595, n3596, n3599, n3600, n3601, n3602, n3603, n3604, n3605,
         n3606, n3607, n3608, n3617, n3618, n3619, n3620, n3621, n3622, n3623,
         n3624, n3625, n3626, n3627, n3628, n3629, n3631, n3632, n3633, n3634,
         n3635, n3636, n3637, n3638, n3639, n3640, n3641, n3642, n3643, n3644,
         n3645, n3646, n3647, n3648, n3679, n3680, n3681, n3682, n3683, n3684,
         n3685, n3686, n3687, n3693, n3694, n3696, n3722, n3723, n3724, n3726,
         n3728, n3730, n3731, n3732, n3733, n3734, n3735, n3736;
  wire   [7:0] tx_counter;
  wire   [31:0] tx_data;
  wire   [31:1] ctrl_data_rx;
  wire   [31:0] addr_sync;
  wire   [31:0] u_rxreg_data_int;
  wire   [7:0] u_rxreg_counter;
  wire   [7:0] u_rxreg_counter_trgt_next;
  wire   [7:0] u_rxreg_counter_trgt;
  wire   [7:0] u_txreg_counter;
  wire   [7:0] u_txreg_counter_trgt;
  wire   [31:0] u_txreg_data_int;
  wire   [2:0] u_device_sm_state;
  wire   [2:0] u_device_sm_state_next;
  wire   [7:0] u_device_sm_s_dummy_cycles;
  wire   [7:0] u_device_sm_cmd_reg;
  wire   [1:0] u_spi_device_tlul_plug_state;
  wire   [31:0] u_spi_device_tlul_plug_wdata_next;
  wire   [1:0] u_spi_device_tlul_plug_state_next;
  wire   [2:0] u_syncro_valid_reg;
  wire   [7:0] u_dcfifo_tx_write_token;
  wire   [7:0] u_dcfifo_rx_write_token;
  wire   [7:1] u_device_sm_u_spiregs_reg0;
  wire   [1:16] u_device_sm_u_spiregs_n;
  wire   [7:0] u_dcfifo_tx_u_dout_write_token_dn;
  wire   [7:0] u_dcfifo_tx_u_dout_read_token;
  wire   [7:0] u_dcfifo_rx_u_dout_write_token_dn;
  wire   [7:0] u_dcfifo_rx_u_dout_read_token;
  wire   [255:0] u_dcfifo_tx_u_din_buffer_data;
  wire   [7:0] u_dcfifo_tx_u_dout_empty_synch_d_middle;
  wire   [7:0] u_dcfifo_rx_u_dout_empty_synch_d_middle;
  wire   [255:0] u_dcfifo_rx_u_din_buffer_data;

  b15fqy00car1n06x5 u_syncro_cs_reg_reg_1_ ( .si(1'b0), .d(u_syncro_cs_reg_0_), 
        .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o() );
  b15lsn000ar1n02x5 u_device_sm_pad_mode_next_reg_1_ ( .clk(u_device_sm_N163), 
        .d(1'b0), .o() );
  b15lsn000ar1n02x5 u_device_sm_pad_mode_next_reg_0_ ( .clk(u_device_sm_N163), 
        .d(1'b1), .o() );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_0_ ( .si(1'b0), .d(1'b1), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3683), .o(tx_counter[0]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_1_ ( .si(1'b0), .d(1'b1), .ssb(
        1'b1), .clk(n3694), .rb(n3679), .o(tx_counter[1]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_2_ ( .si(1'b0), .d(1'b1), .ssb(
        1'b1), .clk(n3694), .rb(n3685), .o(tx_counter[2]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_5_ ( .si(1'b0), .d(1'b0), .ssb(
        1'b1), .clk(n3694), .rb(n3679), .o(tx_counter[5]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_6_ ( .si(1'b0), .d(1'b0), .ssb(
        1'b1), .clk(n3694), .rb(n3679), .o(tx_counter[6]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_7_ ( .si(1'b0), .d(1'b0), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3683), .o(tx_counter[7]) );
  b15fqy003ar1n02x5 u_dcfifo_rx_u_din_full_latched_full_s_reg ( .si(1'b0), .d(
        u_dcfifo_rx_u_din_full_N0), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), 
        .o(u_dcfifo_rx_u_din_full_latched_full_s) );
  b15fqy003ar1n02x5 u_device_sm_ctrl_data_tx_ready_reg ( .si(1'b0), .d(
        u_device_sm_ctrl_data_tx_ready_next), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3679), .o(ctrl_data_tx_ready) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_1_ ( .si(1'b0), .d(
        u_device_sm_N175), .ssb(1'b1), .clk(spi_sclk), .rb(n3684), .o(
        tx_data[1]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_2_ ( .si(1'b0), .d(
        u_device_sm_N176), .ssb(1'b1), .clk(spi_sclk), .rb(n3684), .o(
        tx_data[2]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_3_ ( .si(1'b0), .d(
        u_device_sm_N177), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[3]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_4_ ( .si(1'b0), .d(
        u_device_sm_N178), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[4]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_5_ ( .si(1'b0), .d(
        u_device_sm_N179), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[5]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_6_ ( .si(1'b0), .d(
        u_device_sm_N180), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[6]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_7_ ( .si(1'b0), .d(
        u_device_sm_N181), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[7]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_8_ ( .si(1'b0), .d(
        u_device_sm_N182), .ssb(1'b1), .clk(spi_sclk), .rb(n3681), .o(
        tx_data[8]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_9_ ( .si(1'b0), .d(
        u_device_sm_N183), .ssb(1'b1), .clk(spi_sclk), .rb(n3681), .o(
        tx_data[9]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_10_ ( .si(1'b0), .d(
        u_device_sm_N184), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[10]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_11_ ( .si(1'b0), .d(
        u_device_sm_N185), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[11]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_12_ ( .si(1'b0), .d(
        u_device_sm_N186), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[12]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_13_ ( .si(1'b0), .d(
        u_device_sm_N187), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[13]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_14_ ( .si(1'b0), .d(
        u_device_sm_N188), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[14]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_15_ ( .si(1'b0), .d(
        u_device_sm_N189), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[15]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_16_ ( .si(1'b0), .d(
        u_device_sm_N190), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[16]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_18_ ( .si(1'b0), .d(
        u_device_sm_N192), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[18]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_19_ ( .si(1'b0), .d(
        u_device_sm_N193), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[19]) );
  b15fqy043ar1n02x5 u_txreg_running_reg ( .si(1'b0), .d(tx_counter_upd), .den(
        u_txreg_N10), .ssb(1'b1), .clk(u_txreg_sclk_test), .rb(n3685), .o(
        u_txreg_running) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_17_ ( .si(1'b0), .d(
        u_device_sm_N191), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[17]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_20_ ( .si(1'b0), .d(
        u_device_sm_N194), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[20]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_21_ ( .si(1'b0), .d(
        u_device_sm_N195), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[21]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_22_ ( .si(1'b0), .d(
        u_device_sm_N196), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[22]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_23_ ( .si(1'b0), .d(
        u_device_sm_N197), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[23]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_24_ ( .si(1'b0), .d(
        u_device_sm_N198), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[24]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_25_ ( .si(1'b0), .d(
        u_device_sm_N199), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[25]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_26_ ( .si(1'b0), .d(
        u_device_sm_N200), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[26]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_27_ ( .si(1'b0), .d(
        u_device_sm_N201), .ssb(1'b1), .clk(spi_sclk), .rb(n3687), .o(
        tx_data[27]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_28_ ( .si(1'b0), .d(
        u_device_sm_N202), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[28]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_29_ ( .si(1'b0), .d(
        u_device_sm_N203), .ssb(1'b1), .clk(spi_sclk), .rb(n3684), .o(
        tx_data[29]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_30_ ( .si(1'b0), .d(
        u_device_sm_N204), .ssb(1'b1), .clk(spi_sclk), .rb(n3684), .o(
        tx_data[30]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_31_ ( .si(1'b0), .d(
        u_device_sm_N205), .ssb(1'b1), .clk(spi_sclk), .rb(n3686), .o(
        tx_data[31]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_5_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[5]), .ssb(1'b1), .clk(
        spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[5]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_0_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[0]), .ssb(1'b1), .clk(
        spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[0]) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_0_ ( .si(1'b0), .d(
        u_device_sm_N174), .ssb(1'b1), .clk(spi_sclk), .rb(n3684), .o(
        tx_data[0]) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_19_ ( .si(1'b0), .d(n1769), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1769) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_20_ ( .si(1'b0), .d(n1766), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1766) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_21_ ( .si(1'b0), .d(n1763), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1763) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_22_ ( .si(1'b0), .d(n1760), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3685), .o(n1760) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_23_ ( .si(1'b0), .d(n1757), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1757) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_24_ ( .si(1'b0), .d(n1754), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1754) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_25_ ( .si(1'b0), .d(n1751), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1751) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_26_ ( .si(1'b0), .d(n1748), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1748) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_27_ ( .si(1'b0), .d(n1745), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1745) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_28_ ( .si(1'b0), .d(n1742), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1742) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_29_ ( .si(1'b0), .d(n1739), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1739) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_30_ ( .si(1'b0), .d(n1736), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1736) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_31_ ( .si(1'b0), .d(n1733), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1733) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_7_ ( .si(1'b0), .d(n1730), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1730) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_7_ ( .si(1'b0), .d(n1727), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1727) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_6_ ( .si(1'b0), .d(n1724), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1724) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_6_ ( .si(1'b0), .d(n1721), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1721) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_1_ ( .si(1'b0), .d(n1718), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1718) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_1_ ( .si(1'b0), .d(n1715), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1715) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_0_ ( .si(1'b0), .d(n1712), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1712) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_0_ ( .si(1'b0), .d(n1709), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1709) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_4_ ( .si(1'b0), .d(n1706), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1706) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_4_ ( .si(1'b0), .d(n1703), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1703) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_2_ ( .si(1'b0), .d(n1700), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3679), .o(n1700) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_2_ ( .si(1'b0), .d(n1697), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1697) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_3_ ( .si(1'b0), .d(n1694), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1694) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_3_ ( .si(1'b0), .d(n1691), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1691) );
  b15fqy003ar1n02x5 u_device_sm_ctrl_addr_valid_reg ( .si(1'b0), .d(
        u_device_sm_sample_ADDR), .ssb(1'b1), .clk(spi_sclk), .rb(n3685), .o(
        ctrl_addr_valid) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_3_ ( .si(1'b0), .d(
        u_device_sm_tx_counter_next_3_), .ssb(1'b1), .clk(n3694), .rb(n3685), 
        .o(tx_counter[3]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_4_ ( .si(1'b0), .d(
        u_device_sm_tx_counter_next_3_), .ssb(1'b1), .clk(spi_sclk), .rb(n3685), .o(tx_counter[4]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_7_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[7]), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[7]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_6_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[6]), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[6]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_5_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[5]), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[5]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_4_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[4]), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[4]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_1_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[1]), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[1]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_0_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[0]), .ssb(1'b1), .clk(spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[0]) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_5_ ( .si(1'b0), .d(n1881), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3683), .o(n1881) );
  b15fqy003ar1n02x5 u_device_sm_mode_reg_reg_5_ ( .si(1'b0), .d(n1878), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3683), .o(n1878) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_8_ ( .si(1'b0), .d(n1802), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1802) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_9_ ( .si(1'b0), .d(n1799), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1799) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_10_ ( .si(1'b0), .d(n1796), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1796) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_11_ ( .si(1'b0), .d(n1793), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1793) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_12_ ( .si(1'b0), .d(n1790), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1790) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_13_ ( .si(1'b0), .d(n1787), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1787) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_14_ ( .si(1'b0), .d(n1784), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1784) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_15_ ( .si(1'b0), .d(n1781), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1781) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_16_ ( .si(1'b0), .d(n1778), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1778) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_17_ ( .si(1'b0), .d(n1775), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1775) );
  b15fqy003ar1n02x5 u_device_sm_data_reg_reg_18_ ( .si(1'b0), .d(n1772), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3682), .o(n1772) );
  b15fqy003ar1n02x5 u_dcfifo_rx_u_din_full_full_synch_d_middle_reg_0_ ( .si(
        1'b0), .d(u_dcfifo_rx_u_din_full_full_dn), .ssb(1'b1), .clk(n3694), 
        .rb(rst_ni), .o(u_dcfifo_rx_u_din_full_full_synch_d_middle_0_) );
  b15fqy003ar1n02x5 u_txreg_counter_trgt_reg_7_ ( .si(1'b0), .d(tx_counter[7]), 
        .ssb(1'b1), .clk(u_txreg_net840), .rb(n3685), .o(
        u_txreg_counter_trgt[7]) );
  b15fqy003ar1n02x5 u_dcfifo_rx_u_din_full_full_synch_d_out_reg_0_ ( .si(1'b0), 
        .d(u_dcfifo_rx_u_din_full_full_synch_d_middle_0_), .ssb(1'b1), .clk(
        n3694), .rb(rst_ni), .o(u_dcfifo_rx_u_din_full_full_up) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_7_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[7]), .ssb(1'b1), .clk(
        spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[7]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_4_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[4]), .ssb(1'b1), .clk(
        spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[4]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_1_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[1]), .ssb(1'b1), .clk(
        spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[1]) );
  b15fqy003ar1n02x5 u_device_sm_u_spiregs_reg1_reg_7_ ( .si(1'b0), .d(
        ctrl_data_rx[7]), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net802), .rb(
        rst_ni), .o(u_device_sm_s_dummy_cycles[7]) );
  b15fqy003ar1n02x5 u_rxreg_counter_trgt_reg_7_ ( .si(1'b0), .d(
        u_rxreg_counter_trgt_next[7]), .ssb(1'b1), .clk(u_rxreg_net873), .rb(
        n3683), .o(u_rxreg_counter_trgt[7]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_6_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[6]), .ssb(1'b1), .clk(
        spi_sclk), .rb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[6]) );
  b15fqy003ar1n02x5 u_device_sm_tx_done_reg_reg ( .si(1'b0), .d(tx_done), 
        .ssb(1'b1), .clk(spi_sclk), .rb(n3685), .o(u_device_sm_tx_done_reg) );
  b15fqy003ar1n02x5 u_device_sm_state_reg_2_ ( .si(1'b0), .d(
        u_device_sm_state_next[2]), .ssb(1'b1), .clk(spi_sclk), .rb(n3685), 
        .o(u_device_sm_state[2]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_upd_reg ( .si(1'b0), .d(
        u_device_sm_tx_counter_upd_next), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3685), .o(tx_counter_upd) );
  b15fqy003ar1n02x5 u_device_sm_state_reg_1_ ( .si(1'b0), .d(
        u_device_sm_state_next[1]), .ssb(1'b1), .clk(spi_sclk), .rb(n3685), 
        .o(u_device_sm_state[1]) );
  b15fqy003ar1n02x5 u_device_sm_state_reg_0_ ( .si(1'b0), .d(
        u_device_sm_state_next[0]), .ssb(1'b1), .clk(spi_sclk), .rb(n3685), 
        .o(u_device_sm_state[0]) );
  b15fqy043ar1n02x5 u_rxreg_running_reg ( .si(1'b0), .d(n2656), .den(
        u_rxreg_N9), .ssb(1'b1), .clk(spi_sclk), .rb(n3685), .o(n1869) );
  b15fqy003ar1n02x5 u_syncro_valid_reg_reg_2_ ( .si(1'b0), .d(
        u_syncro_valid_reg[1]), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o(
        u_syncro_valid_reg[2]) );
  b15mbn022ar1n02x5 U2913 ( .b(n3693), .a(spi_sclk), .sa(test_mode), .o(
        u_txreg_sclk_test) );
  b15nandp2ar1n03x5 U2944 ( .a(u_dcfifo_tx_u_dout_read_token[0]), .b(
        u_dcfifo_tx_u_dout_read_token[1]), .o1(n3517) );
  b15nor002ar1n03x5 U2945 ( .a(u_dcfifo_tx_u_dout_write_token_dn[1]), .b(n3517), .o1(n2748) );
  b15inv000ar1n03x5 U2946 ( .a(u_dcfifo_tx_u_dout_write_token_dn[5]), .o1(
        n2738) );
  b15nandp2ar1n03x5 U2947 ( .a(u_dcfifo_tx_u_dout_read_token[4]), .b(
        u_dcfifo_tx_u_dout_read_token[5]), .o1(n3519) );
  b15inv000ar1n03x5 U2948 ( .a(n3519), .o1(n2814) );
  b15and003ar1n03x5 U2949 ( .a(n2738), .b(n2814), .c(
        u_dcfifo_tx_u_dout_write_token_dn[6]), .o(n2747) );
  b15nandp2ar1n03x5 U2950 ( .a(u_dcfifo_tx_u_dout_read_token[1]), .b(
        u_dcfifo_tx_u_dout_read_token[2]), .o1(n3510) );
  b15inv000ar1n03x5 U2951 ( .a(n3510), .o1(n3507) );
  b15inv000ar1n03x5 U2952 ( .a(u_dcfifo_tx_u_dout_write_token_dn[2]), .o1(
        n2737) );
  b15nandp2ar1n03x5 U2953 ( .a(u_dcfifo_tx_u_dout_read_token[5]), .b(
        u_dcfifo_tx_u_dout_read_token[6]), .o1(n3525) );
  b15nonb03ar1n02x5 U2954 ( .a(u_dcfifo_tx_u_dout_write_token_dn[7]), .b(
        u_dcfifo_tx_u_dout_write_token_dn[6]), .c(n3525), .out0(n2736) );
  b15aoi013ar1n02x3 U2955 ( .b(n3507), .c(u_dcfifo_tx_u_dout_write_token_dn[3]), .d(n2737), .a(n2736), .o1(n2745) );
  b15nandp2ar1n03x5 U2956 ( .a(u_dcfifo_tx_u_dout_read_token[2]), .b(
        u_dcfifo_tx_u_dout_read_token[3]), .o1(n3509) );
  b15inv000ar1n03x5 U2957 ( .a(n3509), .o1(n3522) );
  b15inv000ar1n03x5 U2958 ( .a(u_dcfifo_tx_u_dout_write_token_dn[3]), .o1(
        n2740) );
  b15nandp2ar1n03x5 U2959 ( .a(u_dcfifo_tx_u_dout_read_token[4]), .b(
        u_dcfifo_tx_u_dout_read_token[3]), .o1(n3512) );
  b15nor003ar1n02x7 U2960 ( .a(u_dcfifo_tx_u_dout_write_token_dn[4]), .b(n2738), .c(n3512), .o1(n2739) );
  b15aoi013ar1n02x3 U2961 ( .b(n3522), .c(u_dcfifo_tx_u_dout_write_token_dn[4]), .d(n2740), .a(n2739), .o1(n2744) );
  b15nandp2ar1n03x5 U2962 ( .a(u_dcfifo_tx_u_dout_read_token[0]), .b(
        u_dcfifo_tx_u_dout_read_token[7]), .o1(n2819) );
  b15inv000ar1n03x5 U2963 ( .a(n2819), .o1(n3505) );
  b15inv000ar1n03x5 U2964 ( .a(u_dcfifo_tx_u_dout_write_token_dn[0]), .o1(
        n2742) );
  b15nandp2ar1n03x5 U2965 ( .a(u_dcfifo_tx_u_dout_read_token[7]), .b(
        u_dcfifo_tx_u_dout_read_token[6]), .o1(n3513) );
  b15oai013ar1n02x3 U2966 ( .b(u_dcfifo_tx_u_dout_write_token_dn[7]), .c(n3513), .d(n2742), .a(ctrl_data_tx_ready), .o1(n2741) );
  b15aoi013ar1n02x3 U2967 ( .b(n3505), .c(u_dcfifo_tx_u_dout_write_token_dn[1]), .d(n2742), .a(n2741), .o1(n2743) );
  b15nand03ar1n03x5 U2968 ( .a(n2745), .b(n2744), .c(n2743), .o1(n2746) );
  b15aoi112ar1n02x3 U2969 ( .c(n2748), .d(u_dcfifo_tx_u_dout_write_token_dn[2]), .a(n2747), .b(n2746), .o1(u_dcfifo_tx_u_dout_read_enable) );
  b15inv000ar1n03x5 U2974 ( .a(u_rxreg_data_int[3]), .o1(n2752) );
  b15inv000ar1n03x5 U2975 ( .a(u_rxreg_data_int[6]), .o1(n3003) );
  b15aoi022ar1n02x3 U2977 ( .a(n3731), .b(n2752), .c(n3003), .d(n3732), .o1(
        u_rxreg_N36) );
  b15oa0022ar1n03x5 U2979 ( .a(n3726), .b(u_rxreg_data_int[7]), .c(u_rxreg_N36), .d(n1869), .o(ctrl_data_rx[7]) );
  b15oai022ar1n02x5 U2982 ( .a(n3732), .b(u_rxreg_data_int[2]), .c(
        u_rxreg_data_int[5]), .d(n3731), .o1(n3105) );
  b15nandp2ar1n03x5 U2986 ( .a(en_quad), .b(spi_sdi1), .o1(n2749) );
  b15aob012ar1n03x5 U2987 ( .b(n3730), .c(u_rxreg_data_int[0]), .a(n2749), 
        .out0(u_rxreg_N30) );
  b15inv000ar1n03x5 U2989 ( .a(u_rxreg_data_int[1]), .o1(n2751) );
  b15nandp2ar1n03x5 U2992 ( .a(en_quad), .b(spi_sdi2), .o1(n2750) );
  b15oai012ar1n03x5 U2993 ( .b(en_quad), .c(n2751), .a(n2750), .o1(u_rxreg_N31) );
  b15oa0022ar1n03x5 U2994 ( .a(n3724), .b(u_rxreg_data_int[2]), .c(u_rxreg_N31), .d(n3723), .o(ctrl_data_rx[2]) );
  b15inv000ar1n03x5 U2995 ( .a(u_rxreg_data_int[4]), .o1(n3002) );
  b15aoi022ar1n02x3 U2996 ( .a(en_quad), .b(n2751), .c(n3002), .d(n3730), .o1(
        u_rxreg_N34) );
  b15aoi022ar1n02x3 U2997 ( .a(n3731), .b(spi_sdi3), .c(u_rxreg_data_int[2]), 
        .d(n3732), .o1(n2992) );
  b15oai022ar1n02x5 U2999 ( .a(n3732), .b(u_rxreg_data_int[0]), .c(
        u_rxreg_data_int[3]), .d(n3731), .o1(n3104) );
  b15inv000ar1n03x5 U3001 ( .a(u_device_sm_state[2]), .o1(n2907) );
  b15inv000ar1n03x5 U3002 ( .a(u_device_sm_state[1]), .o1(n2908) );
  b15nandp2ar1n03x5 U3003 ( .a(n2907), .b(n2908), .o1(n2926) );
  b15nor002ar1n03x5 U3004 ( .a(n2926), .b(u_device_sm_state[0]), .o1(n2757) );
  b15orn003ar1n03x5 U3006 ( .a(n3734), .b(ctrl_data_rx[7]), .c(ctrl_data_rx[6]), .o(n2753) );
  b15oai013ar1n02x3 U3007 ( .b(n2757), .c(u_device_sm_cmd_reg[7]), .d(
        u_device_sm_cmd_reg[6]), .a(n2753), .o1(n2790) );
  b15aoi022ar1n02x3 U3008 ( .a(n2757), .b(ctrl_data_rx[1]), .c(
        u_device_sm_cmd_reg[1]), .d(n3734), .o1(n2763) );
  b15aoi022ar1n02x3 U3009 ( .a(n2757), .b(ctrl_data_rx[2]), .c(
        u_device_sm_cmd_reg[2]), .d(n3734), .o1(n2924) );
  b15nandp2ar1n03x5 U3010 ( .a(n2763), .b(n2924), .o1(n2762) );
  b15nonb02ar1n02x3 U3011 ( .a(n2790), .b(n2762), .out0(n2918) );
  b15oai022ar1n02x5 U3012 ( .a(n3724), .b(u_rxreg_data_int[5]), .c(u_rxreg_N34), .d(n3723), .o1(n2975) );
  b15nandp2ar1n03x5 U3013 ( .a(n3734), .b(u_device_sm_cmd_reg[5]), .o1(n2754)
         );
  b15oai012ar1n03x5 U3014 ( .b(n3734), .c(n2975), .a(n2754), .o1(n2792) );
  b15inv000ar1n03x5 U3015 ( .a(n2792), .o1(n2760) );
  b15nandp2ar1n03x5 U3016 ( .a(n3734), .b(u_device_sm_cmd_reg[3]), .o1(n2755)
         );
  b15aob012ar1n03x5 U3017 ( .b(n2757), .c(ctrl_data_rx[3]), .a(n2755), .out0(
        n2795) );
  b15nor002ar1n03x5 U3018 ( .a(n2760), .b(n2795), .o1(n2920) );
  b15nandp2ar1n03x5 U3019 ( .a(n3734), .b(u_device_sm_cmd_reg[4]), .o1(n2756)
         );
  b15aob012ar1n03x5 U3020 ( .b(n2757), .c(ctrl_data_rx[4]), .a(n2756), .out0(
        n2923) );
  b15inv000ar1n03x5 U3021 ( .a(n2923), .o1(n2781) );
  b15nor002ar1n03x5 U3022 ( .a(n2763), .b(n2923), .o1(n2791) );
  b15nanb02ar1n02x5 U3023 ( .a(n2924), .b(n2791), .out0(n2761) );
  b15oai022ar1n02x5 U3024 ( .a(n3724), .b(u_rxreg_data_int[0]), .c(spi_sdi0), 
        .d(n3723), .o1(n2993) );
  b15nandp2ar1n03x5 U3025 ( .a(n3734), .b(u_device_sm_cmd_reg[0]), .o1(n2759)
         );
  b15oai012ar1n03x5 U3026 ( .b(n3734), .c(n2993), .a(n2759), .o1(n2919) );
  b15nandp2ar1n03x5 U3027 ( .a(n2919), .b(n2760), .o1(n2794) );
  b15nor002ar1n03x5 U3028 ( .a(n2795), .b(n2794), .o1(n2796) );
  b15nandp2ar1n03x5 U3029 ( .a(n2796), .b(n2790), .o1(n2922) );
  b15oaoi13ar1n02x3 U3030 ( .c(n2781), .d(n2762), .b(n2761), .a(n2922), .o1(
        n3622) );
  b15aoi012ar1n02x5 U3031 ( .b(n2918), .c(n2920), .a(n3622), .o1(n3626) );
  b15inv000ar1n03x5 U3032 ( .a(n3626), .o1(n3554) );
  b15nand04ar1n03x5 U3033 ( .a(n2796), .b(n2763), .c(n2781), .d(n2790), .o1(
        n3627) );
  b15inv000ar1n03x5 U3034 ( .a(n3627), .o1(n3556) );
  b15nor002ar1n03x5 U3035 ( .a(n3554), .b(n3556), .o1(n3566) );
  b15inv000ar1n03x5 U3037 ( .a(u_rxreg_counter_trgt[4]), .o1(n2900) );
  b15inv000ar1n03x5 U3038 ( .a(u_rxreg_counter_trgt[6]), .o1(n2765) );
  b15aoi022ar1n02x3 U3039 ( .a(n2900), .b(u_rxreg_counter[4]), .c(
        u_rxreg_counter[6]), .d(n2765), .o1(n2764) );
  b15oai122ar1n02x5 U3040 ( .b(n2900), .c(u_rxreg_counter[4]), .d(n2765), .e(
        u_rxreg_counter[6]), .a(n2764), .o1(n2776) );
  b15inv000ar1n03x5 U3041 ( .a(u_rxreg_counter_trgt[0]), .o1(n2903) );
  b15inv000ar1n03x5 U3042 ( .a(u_rxreg_counter_trgt[2]), .o1(n2767) );
  b15aoi022ar1n02x3 U3043 ( .a(n2903), .b(u_rxreg_counter[0]), .c(
        u_rxreg_counter[2]), .d(n2767), .o1(n2766) );
  b15oai122ar1n02x5 U3044 ( .b(n2903), .c(u_rxreg_counter[0]), .d(n2767), .e(
        u_rxreg_counter[2]), .a(n2766), .o1(n2775) );
  b15inv000ar1n03x5 U3045 ( .a(u_rxreg_counter_trgt[5]), .o1(n2770) );
  b15inv000ar1n03x5 U3046 ( .a(u_rxreg_counter_trgt[1]), .o1(n2769) );
  b15aoi022ar1n02x3 U3047 ( .a(n2770), .b(u_rxreg_counter[5]), .c(
        u_rxreg_counter[1]), .d(n2769), .o1(n2768) );
  b15oai122ar1n02x5 U3048 ( .b(n2770), .c(u_rxreg_counter[5]), .d(n2769), .e(
        u_rxreg_counter[1]), .a(n2768), .o1(n2774) );
  b15inv000ar1n03x5 U3049 ( .a(u_rxreg_counter_trgt[7]), .o1(n2772) );
  b15inv000ar1n03x5 U3050 ( .a(u_rxreg_counter_trgt[3]), .o1(n2899) );
  b15aoi022ar1n02x3 U3051 ( .a(n2772), .b(u_rxreg_counter[7]), .c(
        u_rxreg_counter[3]), .d(n2899), .o1(n2771) );
  b15oai122ar1n02x5 U3052 ( .b(n2772), .c(u_rxreg_counter[7]), .d(n2899), .e(
        u_rxreg_counter[3]), .a(n2771), .o1(n2773) );
  b15nor004ar1n02x3 U3053 ( .a(n2776), .b(n2775), .c(n2774), .d(n2773), .o1(
        n2976) );
  b15inv000ar1n03x5 U3054 ( .a(n2976), .o1(n2929) );
  b15nor002ar1n03x5 U3055 ( .a(n2929), .b(n3723), .o1(n2985) );
  b15inv000ar1n03x5 U3056 ( .a(n2985), .o1(n2984) );
  b15inv000ar1n03x5 U3057 ( .a(u_device_sm_state[0]), .o1(n2798) );
  b15nand03ar1n03x5 U3058 ( .a(u_device_sm_state[2]), .b(n2798), .c(n2908), 
        .o1(n3118) );
  b15nor002ar1n03x5 U3059 ( .a(n2984), .b(n3118), .o1(n2904) );
  b15inv000ar1n03x5 U3060 ( .a(n2904), .o1(n2777) );
  b15aoi112ar1n02x3 U3061 ( .c(u_dcfifo_rx_u_din_full_full_up), .d(
        u_dcfifo_rx_u_din_full_latched_full_s), .a(n3736), .b(n2777), .o1(
        u_dcfifo_rx_u_din_write_enable) );
  b15nandp2ar1n03x5 U3062 ( .a(u_dcfifo_rx_write_token[5]), .b(
        u_dcfifo_rx_write_token[4]), .o1(n2954) );
  b15nandp2ar1n03x5 U3063 ( .a(u_dcfifo_rx_write_token[3]), .b(
        u_dcfifo_rx_write_token[2]), .o1(n2964) );
  b15nandp2ar1n03x5 U3064 ( .a(u_dcfifo_rx_write_token[6]), .b(
        u_dcfifo_rx_write_token[7]), .o1(n2962) );
  b15nandp2ar1n03x5 U3065 ( .a(u_dcfifo_rx_write_token[0]), .b(
        u_dcfifo_rx_write_token[1]), .o1(n2958) );
  b15nand04ar1n03x5 U3066 ( .a(n2954), .b(n2964), .c(n2962), .d(n2958), .o1(
        n2785) );
  b15oa0012ar1n03x5 U3067 ( .b(u_dcfifo_rx_write_token[5]), .c(
        u_dcfifo_rx_write_token[7]), .a(u_dcfifo_rx_write_token[6]), .o(n2955)
         );
  b15oaoi13ar1n02x3 U3068 ( .c(u_dcfifo_rx_write_token[5]), .d(
        u_dcfifo_rx_write_token[3]), .b(u_dcfifo_rx_write_token[4]), .a(n2955), 
        .o1(n2778) );
  b15and002ar1n02x5 U3069 ( .a(u_dcfifo_rx_u_din_write_enable), .b(n2778), .o(
        n2783) );
  b15oai012ar1n03x5 U3070 ( .b(u_dcfifo_rx_write_token[3]), .c(
        u_dcfifo_rx_write_token[1]), .a(u_dcfifo_rx_write_token[2]), .o1(n2951) );
  b15nandp2ar1n03x5 U3071 ( .a(n2783), .b(n2951), .o1(n2782) );
  b15nor002ar1n03x5 U3072 ( .a(n2785), .b(n2782), .o1(
        u_dcfifo_rx_u_din_buffer_N26) );
  b15nona23ar1n02x5 U3073 ( .a(n2955), .b(n2778), .c(n2951), .d(
        u_dcfifo_rx_u_din_write_enable), .out0(n2787) );
  b15nor002ar1n03x5 U3074 ( .a(n2785), .b(n2787), .o1(
        u_dcfifo_rx_u_din_buffer_N30) );
  b15inv000ar1n03x5 U3075 ( .a(n3622), .o1(n3605) );
  b15nor002ar1n03x5 U3076 ( .a(n2777), .b(n3605), .o1(
        u_device_sm_u_spiregs_N33) );
  b15nandp2ar1n03x5 U3077 ( .a(n2920), .b(n2918), .o1(n2780) );
  b15nor002ar1n03x5 U3078 ( .a(n2923), .b(n2780), .o1(n3624) );
  b15and002ar1n02x5 U3079 ( .a(n3624), .b(n2904), .o(u_device_sm_u_spiregs_N34) );
  b15nor002ar1n03x5 U3080 ( .a(tx_counter_upd), .b(u_txreg_running), .o1(n3144) );
  b15inv000ar1n03x5 U3081 ( .a(n3144), .o1(u_txreg_N11) );
  b15nor002ar1n03x5 U3082 ( .a(n2777), .b(n3627), .o1(
        u_device_sm_u_spiregs_N32) );
  b15inv000ar1n03x5 U3083 ( .a(n2951), .o1(n2784) );
  b15nonb02ar1n02x3 U3084 ( .a(u_dcfifo_rx_u_din_write_enable), .b(n2778), 
        .out0(n2779) );
  b15oai012ar1n03x5 U3085 ( .b(n2784), .c(n2955), .a(n2779), .o1(n2786) );
  b15nor002ar1n03x5 U3086 ( .a(n2785), .b(n2786), .o1(
        u_dcfifo_rx_u_din_buffer_N32) );
  b15nor002ar1n03x5 U3087 ( .a(n2781), .b(n2780), .o1(n3621) );
  b15and002ar1n02x5 U3088 ( .a(n3621), .b(n2904), .o(u_device_sm_u_spiregs_N31) );
  b15inv000ar1n03x5 U3089 ( .a(n2785), .o1(n2789) );
  b15nor002ar1n03x5 U3090 ( .a(n2789), .b(n2782), .o1(
        u_dcfifo_rx_u_din_buffer_N27) );
  b15nandp2ar1n03x5 U3091 ( .a(n2784), .b(n2783), .o1(n2788) );
  b15nor002ar1n03x5 U3092 ( .a(n2785), .b(n2788), .o1(
        u_dcfifo_rx_u_din_buffer_N28) );
  b15nor002ar1n03x5 U3093 ( .a(n2789), .b(n2786), .o1(
        u_dcfifo_rx_u_din_buffer_N33) );
  b15nor002ar1n03x5 U3094 ( .a(n2789), .b(n2787), .o1(
        u_dcfifo_rx_u_din_buffer_N31) );
  b15nor002ar1n03x5 U3095 ( .a(n2789), .b(n2788), .o1(
        u_dcfifo_rx_u_din_buffer_N29) );
  b15nand03ar1n03x5 U3096 ( .a(n2924), .b(n2791), .c(n2790), .o1(n2793) );
  b15nor004ar1n02x3 U3097 ( .a(n2919), .b(n2795), .c(n2792), .d(n2793), .o1(
        n3114) );
  b15nonb03ar1n02x5 U3098 ( .a(n2795), .b(n2794), .c(n2793), .out0(n3123) );
  b15nor002ar1n03x5 U3099 ( .a(n3114), .b(n3123), .o1(n3489) );
  b15nandp2ar1n03x5 U3100 ( .a(n3489), .b(u_device_sm_tx_done_reg), .o1(n2932)
         );
  b15nandp2ar1n03x5 U3101 ( .a(n2907), .b(u_device_sm_state[1]), .o1(n3193) );
  b15nor002ar1n03x5 U3102 ( .a(n2798), .b(n3193), .o1(n3179) );
  b15inv000ar1n03x5 U3103 ( .a(n3179), .o1(n3494) );
  b15nor002ar1n03x5 U3104 ( .a(n2932), .b(n3494), .o1(n2800) );
  b15nor002ar1n03x5 U3105 ( .a(u_device_sm_state[0]), .b(n3193), .o1(n3116) );
  b15inv000ar1n03x5 U3106 ( .a(n3116), .o1(n2994) );
  b15oai012ar1n03x5 U3107 ( .b(n2926), .c(n2798), .a(n2994), .o1(n3498) );
  b15inv000ar1n03x5 U3108 ( .a(n2919), .o1(n2797) );
  b15aoai13ar1n02x3 U3109 ( .c(n2920), .d(n2797), .b(n2796), .a(n2918), .o1(
        n2939) );
  b15inv000ar1n03x5 U3110 ( .a(n2939), .o1(n2910) );
  b15nor002ar1n03x5 U3111 ( .a(n2910), .b(n3114), .o1(n2940) );
  b15inv000ar1n03x5 U3112 ( .a(n2940), .o1(n3492) );
  b15nor002ar1n03x5 U3113 ( .a(n3123), .b(n3492), .o1(n3504) );
  b15nano22ar1n03x5 U3114 ( .a(n3498), .b(n2985), .c(n3504), .out0(n2909) );
  b15nor003ar1n02x7 U3115 ( .a(u_device_sm_state[1]), .b(n2907), .c(n2798), 
        .o1(n3115) );
  b15nandp2ar1n03x5 U3116 ( .a(n3115), .b(n3492), .o1(n2911) );
  b15oaoi13ar1n02x3 U3117 ( .c(n3504), .d(n3734), .b(n2911), .a(n2984), .o1(
        n2799) );
  b15nor004ar1n02x3 U3118 ( .a(n2800), .b(n2909), .c(n2904), .d(n2799), .o1(
        n2656) );
  b15nandp2ar1n03x5 U3119 ( .a(n2656), .b(n2929), .o1(u_rxreg_N9) );
  b15inv000ar1n03x5 U3120 ( .a(u_txreg_counter[2]), .o1(n2999) );
  b15inv000ar1n03x5 U3121 ( .a(u_txreg_counter[5]), .o1(n2810) );
  b15xor002ar1n02x5 U3122 ( .a(u_txreg_counter_trgt[3]), .b(u_txreg_counter[3]), .out0(n2809) );
  b15inv000ar1n03x5 U3123 ( .a(u_txreg_counter[0]), .o1(n2806) );
  b15xor002ar1n02x5 U3124 ( .a(u_txreg_counter_trgt[7]), .b(u_txreg_counter[7]), .out0(n2805) );
  b15nandp2ar1n03x5 U3125 ( .a(u_txreg_counter[4]), .b(u_txreg_counter_trgt[4]), .o1(n2802) );
  b15xor002ar1n02x5 U3126 ( .a(u_txreg_counter_trgt[6]), .b(u_txreg_counter[6]), .out0(n2801) );
  b15oaoi13ar1n02x3 U3127 ( .c(u_txreg_counter[4]), .d(u_txreg_counter_trgt[4]), .b(n2802), .a(n2801), .o1(n2803) );
  b15oai012ar1n03x5 U3128 ( .b(u_txreg_counter_trgt[0]), .c(n2806), .a(n2803), 
        .o1(n2804) );
  b15aoi112ar1n02x3 U3129 ( .c(u_txreg_counter_trgt[0]), .d(n2806), .a(n2805), 
        .b(n2804), .o1(n2807) );
  b15oai012ar1n03x5 U3130 ( .b(n2810), .c(u_txreg_counter_trgt[5]), .a(n2807), 
        .o1(n2808) );
  b15aoi112ar1n02x3 U3131 ( .c(n2810), .d(u_txreg_counter_trgt[5]), .a(n2809), 
        .b(n2808), .o1(n2813) );
  b15xor002ar1n02x5 U3132 ( .a(u_txreg_counter_trgt[1]), .b(u_txreg_counter[1]), .out0(n2811) );
  b15aoi012ar1n02x5 U3133 ( .b(u_txreg_counter_trgt[2]), .c(n2999), .a(n2811), 
        .o1(n2812) );
  b15oai112ar1n02x5 U3134 ( .c(u_txreg_counter_trgt[2]), .d(n2999), .a(n2813), 
        .b(n2812), .o1(n3143) );
  b15nanb02ar1n02x5 U3135 ( .a(tx_counter_upd), .b(n3143), .out0(u_txreg_N10)
         );
  b15nandp2ar1n03x5 U3136 ( .a(n2819), .b(n3517), .o1(n3506) );
  b15oaoi13ar1n02x3 U3137 ( .c(u_dcfifo_tx_u_dout_read_token[5]), .d(
        u_dcfifo_tx_u_dout_read_token[3]), .b(u_dcfifo_tx_u_dout_read_token[4]), .a(n3506), .o1(n2824) );
  b15nandp2ar1n03x5 U3138 ( .a(n3519), .b(n3512), .o1(n3521) );
  b15oaoi13ar1n02x3 U3139 ( .c(u_dcfifo_tx_u_dout_read_token[1]), .d(
        u_dcfifo_tx_u_dout_read_token[3]), .b(u_dcfifo_tx_u_dout_read_token[2]), .a(n3521), .o1(n2822) );
  b15aoi022ar1n02x3 U3140 ( .a(u_dcfifo_tx_u_dout_read_token[0]), .b(
        u_dcfifo_tx_u_dout_read_token[1]), .c(u_dcfifo_tx_u_dout_read_token[7]), .d(u_dcfifo_tx_u_dout_read_token[6]), .o1(n2818) );
  b15inv000ar1n03x5 U3141 ( .a(n2818), .o1(n2817) );
  b15aoi112ar1n02x3 U3142 ( .c(u_dcfifo_tx_u_dout_read_token[2]), .d(
        u_dcfifo_tx_u_dout_read_token[3]), .a(n2814), .b(n2817), .o1(n2823) );
  b15nanb02ar1n02x5 U3143 ( .a(n2822), .b(n2823), .out0(n2815) );
  b15inv000ar1n03x5 U3146 ( .a(n2824), .o1(n2827) );
  b15aoi022ar1n02x3 U3150 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[203]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[139]), .o1(n2834) );
  b15nandp2ar1n03x5 U3151 ( .a(n2822), .b(n2817), .o1(n2829) );
  b15nandp2ar1n03x5 U3154 ( .a(n2822), .b(n2818), .o1(n2821) );
  b15aoi022ar1n02x3 U3158 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[43]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[75]), .o1(n2833) );
  b15orn002ar1n02x5 U3161 ( .a(n2823), .b(n2822), .o(n2826) );
  b15aoi022ar1n02x3 U3165 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[11]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[235]), .o1(n2832) );
  b15aoi022ar1n02x3 U3172 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[171]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[107]), .o1(n2831) );
  b15nand04ar1n03x5 U3173 ( .a(n2834), .b(n2833), .c(n2832), .d(n2831), .o1(
        n2835) );
  b15nonb02ar1n02x3 U3174 ( .a(n2835), .b(n3736), .out0(u_device_sm_N185) );
  b15aoi022ar1n02x3 U3176 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[50]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[242]), .o1(n2839) );
  b15aoi022ar1n02x3 U3179 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[210]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[178]), .o1(n2838) );
  b15aoi022ar1n02x3 U3182 ( .a(n2816), .b(u_dcfifo_tx_u_din_buffer_data[146]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[114]), .o1(n2837) );
  b15aoi022ar1n02x3 U3184 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[18]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[82]), .o1(n2836) );
  b15nand04ar1n03x5 U3185 ( .a(n2839), .b(n2838), .c(n2837), .d(n2836), .o1(
        n2840) );
  b15nonb02ar1n02x3 U3186 ( .a(n2840), .b(n3736), .out0(u_device_sm_N192) );
  b15aoi022ar1n02x3 U3187 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[201]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[137]), .o1(n2845) );
  b15aoi022ar1n02x3 U3189 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[233]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[105]), .o1(n2844) );
  b15aoi022ar1n02x3 U3191 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[9]), 
        .c(n2841), .d(u_dcfifo_tx_u_din_buffer_data[41]), .o1(n2843) );
  b15aoi022ar1n02x3 U3193 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[73]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[169]), .o1(n2842) );
  b15nand04ar1n03x5 U3194 ( .a(n2845), .b(n2844), .c(n2843), .d(n2842), .o1(
        n2846) );
  b15nonb02ar1n02x3 U3195 ( .a(n2846), .b(n3736), .out0(u_device_sm_N183) );
  b15aoi022ar1n02x3 U3196 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[199]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[103]), .o1(n2850) );
  b15aoi022ar1n02x3 U3197 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[7]), 
        .c(n2841), .d(u_dcfifo_tx_u_din_buffer_data[39]), .o1(n2849) );
  b15aoi022ar1n02x3 U3198 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[231]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[135]), .o1(n2848) );
  b15aoi022ar1n02x3 U3199 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[71]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[167]), .o1(n2847) );
  b15nand04ar1n03x5 U3200 ( .a(n2850), .b(n2849), .c(n2848), .d(n2847), .o1(
        n2854) );
  b15aoi022ar1n02x3 U3201 ( .a(n3624), .b(u_device_sm_u_spiregs_n[9]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[1]), .o1(n2851) );
  b15aob012ar1n03x5 U3202 ( .b(n3622), .c(u_device_sm_s_dummy_cycles[7]), .a(
        n2851), .out0(n2852) );
  b15oaoi13ar1n02x3 U3203 ( .c(u_device_sm_u_spiregs_reg0[7]), .d(n3627), .b(
        n3626), .a(n2852), .o1(n2853) );
  b15oab012ar1n02x5 U3204 ( .b(n2854), .c(n3736), .a(n2853), .out0(
        u_device_sm_N181) );
  b15aoi022ar1n02x3 U3205 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[204]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[140]), .o1(n2858) );
  b15aoi022ar1n02x3 U3206 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[44]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[76]), .o1(n2857) );
  b15aoi022ar1n02x3 U3207 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[12]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[172]), .o1(n2856) );
  b15aoi022ar1n02x3 U3208 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[236]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[108]), .o1(n2855) );
  b15nand04ar1n03x5 U3209 ( .a(n2858), .b(n2857), .c(n2856), .d(n2855), .o1(
        n2859) );
  b15nonb02ar1n02x3 U3210 ( .a(n2859), .b(n3736), .out0(u_device_sm_N186) );
  b15aoi022ar1n02x3 U3211 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[206]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[238]), .o1(n2863) );
  b15aoi022ar1n02x3 U3212 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[14]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[110]), .o1(n2862) );
  b15aoi022ar1n02x3 U3213 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[78]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[142]), .o1(n2861) );
  b15aoi022ar1n02x3 U3214 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[46]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[174]), .o1(n2860) );
  b15nand04ar1n03x5 U3215 ( .a(n2863), .b(n2862), .c(n2861), .d(n2860), .o1(
        n2864) );
  b15nonb02ar1n02x3 U3216 ( .a(n2864), .b(n3736), .out0(u_device_sm_N188) );
  b15aoi022ar1n02x3 U3217 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[51]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[243]), .o1(n2869) );
  b15aoi022ar1n02x3 U3218 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[211]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[83]), .o1(n2868) );
  b15aoi022ar1n02x3 U3220 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[179]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[115]), .o1(n2867) );
  b15aoi022ar1n02x3 U3221 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[19]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[147]), .o1(n2866) );
  b15nand04ar1n03x5 U3222 ( .a(n2869), .b(n2868), .c(n2867), .d(n2866), .o1(
        n2870) );
  b15nonb02ar1n02x3 U3223 ( .a(n2870), .b(n3736), .out0(u_device_sm_N193) );
  b15aoi022ar1n02x3 U3224 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[40]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[232]), .o1(n2874) );
  b15aoi022ar1n02x3 U3225 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[168]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[136]), .o1(n2873) );
  b15aoi022ar1n02x3 U3226 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[8]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[104]), .o1(n2872) );
  b15aoi022ar1n02x3 U3227 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[200]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[72]), .o1(n2871) );
  b15nand04ar1n03x5 U3228 ( .a(n2874), .b(n2873), .c(n2872), .d(n2871), .o1(
        n2875) );
  b15nonb02ar1n02x3 U3229 ( .a(n2875), .b(n3736), .out0(u_device_sm_N182) );
  b15aoi022ar1n02x3 U3230 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[74]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[170]), .o1(n2880) );
  b15aoi022ar1n02x3 U3232 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[42]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[202]), .o1(n2879) );
  b15aoi022ar1n02x3 U3233 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[234]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[106]), .o1(n2878) );
  b15aoi022ar1n02x3 U3234 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[10]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[138]), .o1(n2877) );
  b15nand04ar1n03x5 U3235 ( .a(n2880), .b(n2879), .c(n2878), .d(n2877), .o1(
        n2881) );
  b15nonb02ar1n02x3 U3236 ( .a(n2881), .b(n3736), .out0(u_device_sm_N184) );
  b15aoi022ar1n02x3 U3237 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[77]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[173]), .o1(n2885) );
  b15aoi022ar1n02x3 U3238 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[205]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[237]), .o1(n2884) );
  b15aoi022ar1n02x3 U3239 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[45]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[109]), .o1(n2883) );
  b15aoi022ar1n02x3 U3240 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[13]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[141]), .o1(n2882) );
  b15nand04ar1n03x5 U3241 ( .a(n2885), .b(n2884), .c(n2883), .d(n2882), .o1(
        n2886) );
  b15nonb02ar1n02x3 U3242 ( .a(n2886), .b(n3736), .out0(u_device_sm_N187) );
  b15aoi022ar1n02x3 U3243 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[207]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[111]), .o1(n2890) );
  b15aoi022ar1n02x3 U3244 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[79]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[143]), .o1(n2889) );
  b15aoi022ar1n02x3 U3245 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[15]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[239]), .o1(n2888) );
  b15aoi022ar1n02x3 U3246 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[47]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[175]), .o1(n2887) );
  b15nand04ar1n03x5 U3247 ( .a(n2890), .b(n2889), .c(n2888), .d(n2887), .o1(
        n2891) );
  b15nonb02ar1n02x3 U3248 ( .a(n2891), .b(n3736), .out0(u_device_sm_N189) );
  b15aoi022ar1n02x3 U3249 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[48]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[112]), .o1(n2895) );
  b15aoi022ar1n02x3 U3250 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[16]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[176]), .o1(n2894) );
  b15aoi022ar1n02x3 U3251 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[208]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[240]), .o1(n2893) );
  b15aoi022ar1n02x3 U3252 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[80]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[144]), .o1(n2892) );
  b15nand04ar1n03x5 U3253 ( .a(n2895), .b(n2894), .c(n2893), .d(n2892), .o1(
        n2896) );
  b15nonb02ar1n02x3 U3254 ( .a(n2896), .b(n3736), .out0(u_device_sm_N190) );
  b15nor002ar1n03x5 U3255 ( .a(tx_data_valid), .b(n3732), .o1(n3149) );
  b15nor002ar1n03x5 U3256 ( .a(n3731), .b(tx_data_valid), .o1(n2897) );
  b15aoi022ar1n02x3 U3259 ( .a(tx_data_valid), .b(tx_data[13]), .c(n2897), .d(
        u_txreg_data_int[12]), .o1(n2898) );
  b15aob012ar1n03x5 U3260 ( .b(n3149), .c(u_txreg_data_int[9]), .a(n2898), 
        .out0(u_txreg_N47) );
  b15nor004ar1n02x3 U3261 ( .a(u_rxreg_counter_trgt[2]), .b(
        u_rxreg_counter_trgt[5]), .c(u_rxreg_counter_trgt[1]), .d(
        u_rxreg_counter_trgt[7]), .o1(n2901) );
  b15nand04ar1n03x5 U3262 ( .a(n2901), .b(n2900), .c(n2899), .d(n3730), .o1(
        n2902) );
  b15oai013ar1n02x3 U3263 ( .b(u_rxreg_counter_trgt[6]), .c(n2903), .d(n2902), 
        .a(n2656), .o1(u_rxreg_N7) );
  b15nand03ar1n03x5 U3264 ( .a(n2985), .b(n2940), .c(n3115), .o1(n3150) );
  b15nanb03ar1n03x5 U3265 ( .a(n3489), .b(n3179), .c(u_device_sm_tx_done_reg), 
        .out0(n2925) );
  b15oai112ar1n02x5 U3266 ( .c(n3736), .d(n3150), .a(n2926), .b(n2925), .o1(
        u_device_sm_ctrl_data_tx_ready_next) );
  b15ao0012ar1n02x5 U3267 ( .b(n3566), .c(n2904), .a(
        u_dcfifo_rx_u_din_full_full_up), .o(u_dcfifo_rx_u_din_full_N0) );
  b15inv000ar1n03x5 U3268 ( .a(u_rxreg_data_int[24]), .o1(n3111) );
  b15inv000ar1n03x5 U3269 ( .a(u_rxreg_data_int[27]), .o1(n3019) );
  b15aoi022ar1n02x3 U3270 ( .a(en_quad), .b(n3111), .c(n3019), .d(n3728), .o1(
        u_rxreg_N57) );
  b15ao0022ar1n03x5 U3271 ( .a(n1869), .b(u_rxreg_data_int[28]), .c(
        u_rxreg_N57), .d(n3722), .o(ctrl_data_rx[28]) );
  b15inv000ar1n03x5 U3272 ( .a(u_txreg_counter[6]), .o1(n2982) );
  b15inv000ar1n03x5 U3273 ( .a(u_txreg_counter[4]), .o1(n2947) );
  b15and003ar1n03x5 U3274 ( .a(u_txreg_counter[2]), .b(u_txreg_counter[1]), 
        .c(u_txreg_counter[0]), .o(n2997) );
  b15nandp2ar1n03x5 U3275 ( .a(u_txreg_counter[3]), .b(n2997), .o1(n2946) );
  b15nor002ar1n03x5 U3276 ( .a(n2947), .b(n2946), .o1(n2945) );
  b15nandp2ar1n03x5 U3277 ( .a(u_txreg_counter[5]), .b(n2945), .o1(n2981) );
  b15nor002ar1n03x5 U3278 ( .a(n2982), .b(n2981), .o1(n2980) );
  b15oai012ar1n03x5 U3279 ( .b(u_txreg_counter[7]), .c(n2980), .a(n3143), .o1(
        n2905) );
  b15aoi012ar1n02x5 U3280 ( .b(u_txreg_counter[7]), .c(n2980), .a(n2905), .o1(
        u_txreg_N31) );
  b15oai112ar1n02x5 U3281 ( .c(u_txreg_counter[3]), .d(n2997), .a(n2946), .b(
        n3143), .o1(n2906) );
  b15inv000ar1n03x5 U3282 ( .a(n2906), .o1(u_txreg_N27) );
  b15nor002ar1n03x5 U3283 ( .a(n2984), .b(n3734), .o1(u_device_sm_sample_CMD)
         );
  b15aoi012ar1n02x5 U3284 ( .b(n2985), .c(n2908), .a(n2907), .o1(n3490) );
  b15aoi112ar1n02x3 U3285 ( .c(u_device_sm_sample_CMD), .d(n2910), .a(n2909), 
        .b(n3490), .o1(n2912) );
  b15oai112ar1n02x5 U3286 ( .c(n3489), .d(n3118), .a(n2912), .b(n2911), .o1(
        u_device_sm_state_next[2]) );
  b15inv000ar1n03x5 U3287 ( .a(u_rxreg_data_int[21]), .o1(n3007) );
  b15aoi022ar1n02x3 U3288 ( .a(en_quad), .b(n3007), .c(n3111), .d(n3728), .o1(
        u_rxreg_N54) );
  b15oa0022ar1n03x5 U3289 ( .a(n3722), .b(u_rxreg_data_int[25]), .c(
        u_rxreg_N54), .d(n1869), .o(ctrl_data_rx[25]) );
  b15aboi22ar1n02x3 U3290 ( .c(en_quad), .d(n3019), .a(u_rxreg_data_int[30]), 
        .b(n3728), .out0(u_rxreg_N60) );
  b15ao0022ar1n03x5 U3291 ( .a(u_rxreg_data_int[31]), .b(n1869), .c(
        u_rxreg_N60), .d(n3722), .o(ctrl_data_rx[31]) );
  b15inv000ar1n03x5 U3292 ( .a(u_rxreg_counter[2]), .o1(n2913) );
  b15nandp2ar1n03x5 U3293 ( .a(u_rxreg_counter[0]), .b(u_rxreg_counter[1]), 
        .o1(n2930) );
  b15and003ar1n03x5 U3294 ( .a(u_rxreg_counter[0]), .b(u_rxreg_counter[2]), 
        .c(u_rxreg_counter[1]), .o(n2915) );
  b15aoi112ar1n02x3 U3295 ( .c(n2913), .d(n2930), .a(n2915), .b(n2976), .o1(
        u_rxreg_N24) );
  b15oa0022ar1n03x5 U3296 ( .a(n3728), .b(u_rxreg_data_int[19]), .c(
        u_rxreg_data_int[22]), .d(en_quad), .o(u_rxreg_N52) );
  b15oa0022ar1n03x5 U3297 ( .a(n3722), .b(u_rxreg_data_int[23]), .c(
        u_rxreg_N52), .d(n1869), .o(ctrl_data_rx[23]) );
  b15inv000ar1n03x5 U3298 ( .a(u_rxreg_counter[6]), .o1(n2979) );
  b15inv000ar1n03x5 U3299 ( .a(u_rxreg_counter[4]), .o1(n2950) );
  b15nandp2ar1n03x5 U3300 ( .a(u_rxreg_counter[3]), .b(n2915), .o1(n2949) );
  b15nor002ar1n03x5 U3301 ( .a(n2950), .b(n2949), .o1(n2948) );
  b15nandp2ar1n03x5 U3302 ( .a(u_rxreg_counter[5]), .b(n2948), .o1(n2978) );
  b15nor002ar1n03x5 U3303 ( .a(n2979), .b(n2978), .o1(n2977) );
  b15oai012ar1n03x5 U3304 ( .b(u_rxreg_counter[7]), .c(n2977), .a(n2929), .o1(
        n2914) );
  b15aoi012ar1n02x5 U3305 ( .b(u_rxreg_counter[7]), .c(n2977), .a(n2914), .o1(
        u_rxreg_N29) );
  b15oai112ar1n02x5 U3306 ( .c(u_rxreg_counter[3]), .d(n2915), .a(n2949), .b(
        n2929), .o1(n2916) );
  b15inv000ar1n03x5 U3307 ( .a(n2916), .o1(u_rxreg_N25) );
  b15oai112ar1n02x5 U3308 ( .c(u_rxreg_counter[5]), .d(n2948), .a(n2978), .b(
        n2929), .o1(n2917) );
  b15inv000ar1n03x5 U3309 ( .a(n2917), .o1(u_rxreg_N27) );
  b15aoi013ar1n02x3 U3310 ( .b(n2920), .c(n2919), .d(n2918), .a(n3123), .o1(
        n2921) );
  b15oai013ar1n02x3 U3311 ( .b(n2924), .c(n2923), .d(n2922), .a(n2921), .o1(
        ctrl_rd_wr) );
  b15inv000ar1n03x5 U3312 ( .a(n3123), .o1(n2983) );
  b15nandp2ar1n03x5 U3313 ( .a(n2983), .b(ctrl_rd_wr), .o1(n3499) );
  b15nandp2ar1n03x5 U3314 ( .a(n3116), .b(n2985), .o1(n2943) );
  b15aobi12ar1n02x5 U3315 ( .b(u_device_sm_sample_CMD), .c(n3504), .a(n3150), 
        .out0(n2935) );
  b15oai112ar1n02x5 U3316 ( .c(n3499), .d(n2943), .a(n2935), .b(n2925), .o1(
        u_device_sm_tx_data_valid_next) );
  b15nanb02ar1n02x5 U3317 ( .a(n2926), .b(u_device_sm_state[0]), .out0(n2995)
         );
  b15nor002ar1n03x5 U3318 ( .a(n2995), .b(n2984), .o1(u_device_sm_sample_ADDR)
         );
  b15inv000ar1n03x5 U3319 ( .a(u_device_sm_sample_ADDR), .o1(n2936) );
  b15oabi12ar1n03x5 U3320 ( .b(n3499), .c(n2936), .a(
        u_device_sm_tx_data_valid_next), .out0(u_device_sm_tx_counter_upd_next) );
  b15inv000ar1n03x5 U3321 ( .a(u_rxreg_data_int[15]), .o1(n3005) );
  b15inv000ar1n03x5 U3322 ( .a(u_rxreg_data_int[18]), .o1(n3008) );
  b15aoi022ar1n02x3 U3323 ( .a(en_quad), .b(n3005), .c(n3008), .d(n3728), .o1(
        u_rxreg_N48) );
  b15oa0022ar1n03x5 U3324 ( .a(n3722), .b(u_rxreg_data_int[19]), .c(
        u_rxreg_N48), .d(n1869), .o(ctrl_data_rx[19]) );
  b15oai112ar1n02x5 U3325 ( .c(u_txreg_counter[5]), .d(n2945), .a(n2981), .b(
        n3143), .o1(n2927) );
  b15inv000ar1n03x5 U3326 ( .a(n2927), .o1(u_txreg_N29) );
  b15nandp2ar1n03x5 U3327 ( .a(u_txreg_counter[1]), .b(u_txreg_counter[0]), 
        .o1(n2998) );
  b15oai112ar1n02x5 U3328 ( .c(u_txreg_counter[1]), .d(u_txreg_counter[0]), 
        .a(n2998), .b(n3143), .o1(n2928) );
  b15inv000ar1n03x5 U3329 ( .a(n2928), .o1(u_txreg_N25) );
  b15oai112ar1n02x5 U3330 ( .c(u_rxreg_counter[0]), .d(u_rxreg_counter[1]), 
        .a(n2930), .b(n2929), .o1(n2931) );
  b15inv000ar1n03x5 U3331 ( .a(n2931), .o1(u_rxreg_N23) );
  b15and003ar1n03x5 U3332 ( .a(u_device_sm_state[1]), .b(u_device_sm_state[0]), 
        .c(n2932), .o(n2937) );
  b15oaoi13ar1n02x3 U3333 ( .c(n3123), .d(n3492), .b(n2985), .a(n2994), .o1(
        n2933) );
  b15aoi112ar1n02x3 U3334 ( .c(u_device_sm_state[1]), .d(u_device_sm_state[2]), 
        .a(n2937), .b(n2933), .o1(n2934) );
  b15oai112ar1n02x5 U3335 ( .c(n3499), .d(n2936), .a(n2935), .b(n2934), .o1(
        u_device_sm_state_next[1]) );
  b15inv000ar1n03x5 U3336 ( .a(n3143), .o1(n2996) );
  b15nor002ar1n03x5 U3337 ( .a(u_txreg_counter[0]), .b(n2996), .o1(u_txreg_N24) );
  b15nor002ar1n03x5 U3338 ( .a(u_rxreg_counter[0]), .b(n2976), .o1(u_rxreg_N22) );
  b15inv000ar1n03x5 U3339 ( .a(ctrl_rd_wr), .o1(n2944) );
  b15nor002ar1n03x5 U3340 ( .a(n2985), .b(n2995), .o1(n2938) );
  b15aoi112ar1n02x3 U3341 ( .c(u_device_sm_sample_CMD), .d(n2939), .a(n2938), 
        .b(n2937), .o1(n2942) );
  b15oai112ar1n02x5 U3342 ( .c(n2940), .d(n3490), .a(u_device_sm_state[0]), 
        .b(n3193), .o1(n2941) );
  b15oai112ar1n02x5 U3343 ( .c(n2944), .d(n2943), .a(n2942), .b(n2941), .o1(
        u_device_sm_state_next[0]) );
  b15inv000ar1n03x5 U3344 ( .a(u_rxreg_data_int[9]), .o1(n3004) );
  b15oai022ar1n02x5 U3345 ( .a(n3732), .b(u_rxreg_data_int[5]), .c(
        u_rxreg_data_int[8]), .d(n3731), .o1(n3107) );
  b15aoi022ar1n02x3 U3346 ( .a(n1869), .b(n3004), .c(n3107), .d(n3726), .o1(
        ctrl_data_rx[9]) );
  b15aoi112ar1n02x3 U3347 ( .c(n2947), .d(n2946), .a(n2945), .b(n2996), .o1(
        u_txreg_N28) );
  b15aoi112ar1n02x3 U3348 ( .c(n2950), .d(n2949), .a(n2948), .b(n2976), .o1(
        u_rxreg_N26) );
  b15nandp2ar1n03x5 U3349 ( .a(u_dcfifo_rx_u_dout_read_token[7]), .b(
        u_dcfifo_rx_u_dout_read_token[6]), .o1(n3257) );
  b15aoi012ar1n02x5 U3351 ( .b(u_dcfifo_rx_u_dout_read_token[5]), .c(
        u_dcfifo_rx_u_dout_read_token[4]), .a(n2971), .o1(n3270) );
  b15oai012ar1n03x5 U3352 ( .b(u_dcfifo_rx_write_token[5]), .c(n2971), .a(
        n2955), .o1(n2974) );
  b15oai012ar1n03x5 U3353 ( .b(u_dcfifo_rx_write_token[5]), .c(
        u_dcfifo_rx_write_token[3]), .a(u_dcfifo_rx_write_token[4]), .o1(n2953) );
  b15oai012ar1n03x5 U3354 ( .b(u_dcfifo_rx_u_dout_read_token[3]), .c(
        u_dcfifo_rx_u_dout_read_token[5]), .a(u_dcfifo_rx_u_dout_read_token[4]), .o1(n2952) );
  b15nandp2ar1n03x5 U3355 ( .a(u_dcfifo_rx_u_dout_read_token[1]), .b(
        u_dcfifo_rx_u_dout_read_token[2]), .o1(n2959) );
  b15nandp2ar1n03x5 U3356 ( .a(u_dcfifo_rx_u_dout_read_token[3]), .b(
        u_dcfifo_rx_u_dout_read_token[2]), .o1(n3268) );
  b15nandp2ar1n03x5 U3357 ( .a(n2959), .b(n3268), .o1(n3273) );
  b15oai022ar1n02x5 U3359 ( .a(n2953), .b(n2952), .c(n3276), .d(n2951), .o1(
        n2970) );
  b15nandp2ar1n03x5 U3360 ( .a(u_dcfifo_rx_u_dout_read_token[0]), .b(
        u_dcfifo_rx_u_dout_read_token[7]), .o1(n2961) );
  b15nandp2ar1n03x5 U3361 ( .a(u_dcfifo_rx_u_dout_read_token[0]), .b(
        u_dcfifo_rx_u_dout_read_token[1]), .o1(n3269) );
  b15nandp2ar1n03x5 U3362 ( .a(n2961), .b(n3269), .o1(n3272) );
  b15inv000ar1n03x5 U3363 ( .a(n3272), .o1(n2960) );
  b15inv000ar1n03x5 U3364 ( .a(n2954), .o1(n2956) );
  b15oai112ar1n02x5 U3365 ( .c(n2956), .d(n2955), .a(
        u_dcfifo_rx_u_dout_read_token[5]), .b(u_dcfifo_rx_u_dout_read_token[6]), .o1(n2957) );
  b15aoai13ar1n02x3 U3366 ( .c(n2960), .d(n2959), .b(n2958), .a(n2957), .o1(
        n2969) );
  b15nandp2ar1n03x5 U3367 ( .a(u_dcfifo_rx_u_dout_read_token[4]), .b(
        u_dcfifo_rx_u_dout_read_token[3]), .o1(n2963) );
  b15oai022ar1n02x5 U3368 ( .a(n2964), .b(n2963), .c(n2962), .d(n2961), .o1(
        n2968) );
  b15nandp2ar1n03x5 U3369 ( .a(u_dcfifo_rx_write_token[4]), .b(
        u_dcfifo_rx_write_token[3]), .o1(n2966) );
  b15nandp2ar1n03x5 U3370 ( .a(u_dcfifo_rx_write_token[2]), .b(
        u_dcfifo_rx_write_token[1]), .o1(n2965) );
  b15oai022ar1n02x5 U3371 ( .a(n2966), .b(n3268), .c(n3269), .d(n2965), .o1(
        n2967) );
  b15nor004ar1n02x3 U3372 ( .a(n2970), .b(n2969), .c(n2968), .d(n2967), .o1(
        n2973) );
  b15oai112ar1n02x5 U3373 ( .c(n2971), .d(n3272), .a(
        u_dcfifo_rx_write_token[0]), .b(u_dcfifo_rx_write_token[7]), .o1(n2972) );
  b15oai112ar1n02x5 U3374 ( .c(n3270), .d(n2974), .a(n2973), .b(n2972), .o1(
        u_dcfifo_rx_u_din_full_full_dn) );
  b15aoi112ar1n02x3 U3376 ( .c(n2979), .d(n2978), .a(n2977), .b(n2976), .o1(
        u_rxreg_N28) );
  b15aoi112ar1n02x3 U3377 ( .c(n2982), .d(n2981), .a(n2980), .b(n2996), .o1(
        u_txreg_N30) );
  b15nor002ar1n03x5 U3378 ( .a(n2984), .b(n2983), .o1(n3486) );
  b15inv000ar1n03x5 U3379 ( .a(u_device_sm_s_dummy_cycles[2]), .o1(n3576) );
  b15nor002ar1n03x5 U3380 ( .a(n2656), .b(n2995), .o1(n3487) );
  b15inv000ar1n03x5 U3381 ( .a(n3487), .o1(n3133) );
  b15nor002ar1n03x5 U3382 ( .a(n3489), .b(n3118), .o1(n2988) );
  b15nandp2ar1n03x5 U3383 ( .a(n2985), .b(en_quad), .o1(n3500) );
  b15inv000ar1n03x5 U3384 ( .a(n3500), .o1(n3503) );
  b15oai022ar1n02x5 U3385 ( .a(en_quad), .b(n3494), .c(n3503), .d(n3118), .o1(
        n2987) );
  b15inv000ar1n03x5 U3386 ( .a(n3486), .o1(n3482) );
  b15aoi112ar1n02x3 U3387 ( .c(n3116), .d(n3482), .a(n3115), .b(n2656), .o1(
        n3485) );
  b15aoai13ar1n02x3 U3388 ( .c(n3503), .d(n3736), .b(n3734), .a(n3485), .o1(
        n2986) );
  b15oai013ar1n02x3 U3389 ( .b(n2988), .c(n2987), .d(n2986), .a(u_rxreg_N7), 
        .o1(n3132) );
  b15aoai13ar1n02x3 U3390 ( .c(n3486), .d(n3576), .b(n3133), .a(n3132), .o1(
        u_rxreg_counter_trgt_next[2]) );
  b15aoi022ar1n02x3 U3391 ( .a(tx_data_valid), .b(tx_data[31]), .c(n2897), .d(
        u_txreg_data_int[30]), .o1(n2989) );
  b15aob012ar1n03x5 U3392 ( .b(n3149), .c(u_txreg_data_int[27]), .a(n2989), 
        .out0(u_txreg_N65) );
  b15aoi022ar1n02x3 U3394 ( .a(tx_data_valid), .b(tx_data[29]), .c(n2897), .d(
        u_txreg_data_int[28]), .o1(n2990) );
  b15aob012ar1n03x5 U3395 ( .b(n3149), .c(u_txreg_data_int[25]), .a(n2990), 
        .out0(u_txreg_N63) );
  b15oai022ar1n02x5 U3396 ( .a(n3728), .b(u_rxreg_data_int[22]), .c(
        u_rxreg_data_int[25]), .d(en_quad), .o1(n3018) );
  b15inv000ar1n03x5 U3397 ( .a(n3018), .o1(u_rxreg_N55) );
  b15aoi022ar1n02x3 U3398 ( .a(tx_data_valid), .b(tx_data[30]), .c(n2897), .d(
        u_txreg_data_int[29]), .o1(n2991) );
  b15aob012ar1n03x5 U3399 ( .b(n3149), .c(u_txreg_data_int[26]), .a(n2991), 
        .out0(u_txreg_N64) );
  b15inv000ar1n03x5 U3400 ( .a(n2992), .o1(u_rxreg_N32) );
  b15inv000ar1n03x5 U3402 ( .a(u_device_sm_s_dummy_cycles[5]), .o1(n3604) );
  b15oaoi13ar1n02x3 U3403 ( .c(n2995), .d(n3604), .b(n2994), .a(n3482), .o1(
        u_rxreg_counter_trgt_next[5]) );
  b15aoi112ar1n02x3 U3404 ( .c(n2999), .d(n2998), .a(n2997), .b(n2996), .o1(
        u_txreg_N26) );
  b15ao0022ar1n03x5 U3405 ( .a(tx_data_valid), .b(tx_data[2]), .c(n2897), .d(
        u_txreg_data_int[1]), .o(u_txreg_N36) );
  b15aoi022ar1n02x3 U3406 ( .a(tx_data_valid), .b(tx_data[27]), .c(n2897), .d(
        u_txreg_data_int[26]), .o1(n3000) );
  b15aob012ar1n03x5 U3407 ( .b(n3149), .c(u_txreg_data_int[23]), .a(n3000), 
        .out0(u_txreg_N61) );
  b15ao0022ar1n03x5 U3408 ( .a(tx_data_valid), .b(tx_data[1]), .c(n2897), .d(
        u_txreg_data_int[0]), .o(u_txreg_N35) );
  b15aoi022ar1n02x3 U3409 ( .a(tx_data_valid), .b(tx_data[12]), .c(n2897), .d(
        u_txreg_data_int[11]), .o1(n3001) );
  b15aob012ar1n03x5 U3410 ( .b(n3149), .c(u_txreg_data_int[8]), .a(n3001), 
        .out0(u_txreg_N46) );
  b15and002ar1n02x5 U3411 ( .a(tx_data_valid), .b(tx_data[0]), .o(u_txreg_N34)
         );
  b15aboi22ar1n02x3 U3412 ( .c(n3731), .d(n3002), .a(u_rxreg_data_int[7]), .b(
        n3732), .out0(u_rxreg_N37) );
  b15oa0022ar1n03x5 U3413 ( .a(u_rxreg_N37), .b(n1869), .c(u_rxreg_data_int[8]), .d(n3726), .o(ctrl_data_rx[8]) );
  b15aoi022ar1n02x3 U3414 ( .a(n3731), .b(n3003), .c(n3004), .d(n3732), .o1(
        u_rxreg_N39) );
  b15oa0022ar1n03x5 U3415 ( .a(n3726), .b(u_rxreg_data_int[10]), .c(
        u_rxreg_N39), .d(n1869), .o(ctrl_data_rx[10]) );
  b15oa0022ar1n03x5 U3416 ( .a(n3732), .b(u_rxreg_data_int[7]), .c(
        u_rxreg_data_int[10]), .d(n3731), .o(u_rxreg_N40) );
  b15oa0022ar1n03x5 U3417 ( .a(u_rxreg_N40), .b(n1869), .c(
        u_rxreg_data_int[11]), .d(n3726), .o(ctrl_data_rx[11]) );
  b15inv000ar1n03x5 U3418 ( .a(u_rxreg_data_int[12]), .o1(n3006) );
  b15oai022ar1n02x5 U3419 ( .a(n3732), .b(u_rxreg_data_int[8]), .c(
        u_rxreg_data_int[11]), .d(n3731), .o1(n3113) );
  b15aoi022ar1n02x3 U3420 ( .a(n1869), .b(n3006), .c(n3113), .d(n3726), .o1(
        ctrl_data_rx[12]) );
  b15aoi022ar1n02x3 U3421 ( .a(n3731), .b(n3004), .c(n3006), .d(n3732), .o1(
        u_rxreg_N42) );
  b15oa0022ar1n03x5 U3422 ( .a(n3726), .b(u_rxreg_data_int[13]), .c(
        u_rxreg_N42), .d(n1869), .o(ctrl_data_rx[13]) );
  b15oa0022ar1n03x5 U3423 ( .a(n3732), .b(u_rxreg_data_int[10]), .c(
        u_rxreg_data_int[13]), .d(n3731), .o(u_rxreg_N43) );
  b15oa0022ar1n03x5 U3424 ( .a(n3726), .b(u_rxreg_data_int[14]), .c(
        u_rxreg_N43), .d(n1869), .o(ctrl_data_rx[14]) );
  b15oai022ar1n02x5 U3425 ( .a(n3732), .b(u_rxreg_data_int[11]), .c(
        u_rxreg_data_int[14]), .d(n3731), .o1(n3128) );
  b15aoi022ar1n02x3 U3426 ( .a(n1869), .b(n3005), .c(n3128), .d(n3726), .o1(
        ctrl_data_rx[15]) );
  b15aoi022ar1n02x3 U3427 ( .a(n3731), .b(n3006), .c(n3005), .d(n3732), .o1(
        u_rxreg_N45) );
  b15oa0022ar1n03x5 U3428 ( .a(n3726), .b(u_rxreg_data_int[16]), .c(
        u_rxreg_N45), .d(n1869), .o(ctrl_data_rx[16]) );
  b15oa0022ar1n03x5 U3429 ( .a(n3728), .b(u_rxreg_data_int[13]), .c(
        u_rxreg_data_int[16]), .d(en_quad), .o(u_rxreg_N46) );
  b15oa0022ar1n03x5 U3430 ( .a(n3726), .b(u_rxreg_data_int[17]), .c(
        u_rxreg_N46), .d(n1869), .o(ctrl_data_rx[17]) );
  b15oai022ar1n02x5 U3431 ( .a(n3728), .b(u_rxreg_data_int[14]), .c(
        u_rxreg_data_int[17]), .d(en_quad), .o1(n3131) );
  b15aoi022ar1n02x3 U3432 ( .a(n1869), .b(n3008), .c(n3131), .d(n3722), .o1(
        ctrl_data_rx[18]) );
  b15oa0022ar1n03x5 U3433 ( .a(n3728), .b(u_rxreg_data_int[16]), .c(
        u_rxreg_data_int[19]), .d(en_quad), .o(u_rxreg_N49) );
  b15oa0022ar1n03x5 U3434 ( .a(n3722), .b(u_rxreg_data_int[20]), .c(
        u_rxreg_N49), .d(n1869), .o(ctrl_data_rx[20]) );
  b15oai022ar1n02x5 U3435 ( .a(n3728), .b(u_rxreg_data_int[17]), .c(
        u_rxreg_data_int[20]), .d(en_quad), .o1(n3127) );
  b15aoi022ar1n02x3 U3436 ( .a(n1869), .b(n3007), .c(n3127), .d(n3722), .o1(
        ctrl_data_rx[21]) );
  b15aoi022ar1n02x3 U3437 ( .a(en_quad), .b(n3008), .c(n3007), .d(n3728), .o1(
        u_rxreg_N51) );
  b15oa0022ar1n03x5 U3438 ( .a(n3722), .b(u_rxreg_data_int[22]), .c(
        u_rxreg_N51), .d(n1869), .o(ctrl_data_rx[22]) );
  b15aoi022ar1n02x3 U3440 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[189]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[253]), .o1(n3016) );
  b15aoi022ar1n02x3 U3443 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[29]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[125]), .o1(n3015) );
  b15aoi022ar1n02x3 U3444 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[61]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[221]), .o1(n3014) );
  b15aoi022ar1n02x3 U3446 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[93]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[157]), .o1(n3013) );
  b15nand04ar1n03x5 U3447 ( .a(n3016), .b(n3015), .c(n3014), .d(n3013), .o1(
        n3017) );
  b15nonb02ar1n02x3 U3448 ( .a(n3017), .b(n3736), .out0(u_device_sm_N203) );
  b15inv000ar1n03x5 U3449 ( .a(u_rxreg_data_int[26]), .o1(n3022) );
  b15oai022ar1n02x5 U3451 ( .a(n3728), .b(u_rxreg_data_int[23]), .c(
        u_rxreg_data_int[26]), .d(en_quad), .o1(n3137) );
  b15inv000ar1n03x5 U3453 ( .a(u_rxreg_data_int[29]), .o1(n3021) );
  b15oai022ar1n02x5 U3454 ( .a(n3728), .b(u_rxreg_data_int[25]), .c(
        u_rxreg_data_int[28]), .d(en_quad), .o1(n3130) );
  b15oai022ar1n02x5 U3455 ( .a(n3722), .b(n3021), .c(n3130), .d(n1869), .o1(
        ctrl_data_rx[29]) );
  b15aoi022ar1n02x3 U3456 ( .a(en_quad), .b(n3022), .c(n3021), .d(n3728), .o1(
        u_rxreg_N59) );
  b15ao0022ar1n03x5 U3457 ( .a(n1869), .b(u_rxreg_data_int[30]), .c(
        u_rxreg_N59), .d(n3722), .o(ctrl_data_rx[30]) );
  b15aoi022ar1n02x3 U3458 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[49]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[177]), .o1(n3027) );
  b15aoi022ar1n02x3 U3459 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[17]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[209]), .o1(n3026) );
  b15aoi022ar1n02x3 U3460 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[241]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[113]), .o1(n3025) );
  b15aoi022ar1n02x3 U3461 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[81]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[145]), .o1(n3024) );
  b15nand04ar1n03x5 U3462 ( .a(n3027), .b(n3026), .c(n3025), .d(n3024), .o1(
        n3028) );
  b15nonb02ar1n02x3 U3463 ( .a(n3028), .b(n3736), .out0(u_device_sm_N191) );
  b15aoi022ar1n02x3 U3464 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[20]), 
        .c(n2841), .d(u_dcfifo_tx_u_din_buffer_data[52]), .o1(n3032) );
  b15aoi022ar1n02x3 U3465 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[212]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[244]), .o1(n3031) );
  b15aoi022ar1n02x3 U3466 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[84]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[116]), .o1(n3030) );
  b15aoi022ar1n02x3 U3467 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[180]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[148]), .o1(n3029) );
  b15nand04ar1n03x5 U3468 ( .a(n3032), .b(n3031), .c(n3030), .d(n3029), .o1(
        n3033) );
  b15nonb02ar1n02x3 U3469 ( .a(n3033), .b(n3736), .out0(u_device_sm_N194) );
  b15aoi022ar1n02x3 U3470 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[85]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[149]), .o1(n3037) );
  b15aoi022ar1n02x3 U3471 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[53]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[245]), .o1(n3036) );
  b15aoi022ar1n02x3 U3472 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[181]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[117]), .o1(n3035) );
  b15aoi022ar1n02x3 U3473 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[21]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[213]), .o1(n3034) );
  b15nand04ar1n03x5 U3474 ( .a(n3037), .b(n3036), .c(n3035), .d(n3034), .o1(
        n3038) );
  b15nonb02ar1n02x3 U3475 ( .a(n3038), .b(n3736), .out0(u_device_sm_N195) );
  b15aoi022ar1n02x3 U3476 ( .a(tx_data_valid), .b(tx_data[14]), .c(n2897), .d(
        u_txreg_data_int[13]), .o1(n3039) );
  b15aob012ar1n03x5 U3477 ( .b(n3149), .c(u_txreg_data_int[10]), .a(n3039), 
        .out0(u_txreg_N48) );
  b15aoi022ar1n02x3 U3478 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[54]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[118]), .o1(n3043) );
  b15aoi022ar1n02x3 U3479 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[22]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[86]), .o1(n3042) );
  b15aoi022ar1n02x3 U3480 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[214]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[182]), .o1(n3041) );
  b15aoi022ar1n02x3 U3481 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[246]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[150]), .o1(n3040) );
  b15nand04ar1n03x5 U3482 ( .a(n3043), .b(n3042), .c(n3041), .d(n3040), .o1(
        n3044) );
  b15nonb02ar1n02x3 U3483 ( .a(n3044), .b(n3736), .out0(u_device_sm_N196) );
  b15aoi022ar1n02x3 U3484 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[215]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[119]), .o1(n3050) );
  b15aoi022ar1n02x3 U3485 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[23]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[247]), .o1(n3049) );
  b15aoi022ar1n02x3 U3486 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[87]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[183]), .o1(n3048) );
  b15aoi022ar1n02x3 U3487 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[55]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[151]), .o1(n3047) );
  b15nand04ar1n03x5 U3488 ( .a(n3050), .b(n3049), .c(n3048), .d(n3047), .o1(
        n3051) );
  b15nonb02ar1n02x3 U3489 ( .a(n3051), .b(n3736), .out0(u_device_sm_N197) );
  b15aoi022ar1n02x3 U3490 ( .a(tx_data_valid), .b(tx_data[11]), .c(n2897), .d(
        u_txreg_data_int[10]), .o1(n3052) );
  b15aob012ar1n03x5 U3491 ( .b(n3149), .c(u_txreg_data_int[7]), .a(n3052), 
        .out0(u_txreg_N45) );
  b15aoi022ar1n02x3 U3492 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[24]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[184]), .o1(n3057) );
  b15aoi022ar1n02x3 U3493 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[88]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[120]), .o1(n3056) );
  b15aoi022ar1n02x3 U3494 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[56]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[152]), .o1(n3055) );
  b15aoi022ar1n02x3 U3495 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[216]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[248]), .o1(n3054) );
  b15nand04ar1n03x5 U3496 ( .a(n3057), .b(n3056), .c(n3055), .d(n3054), .o1(
        n3058) );
  b15nonb02ar1n02x3 U3497 ( .a(n3058), .b(n3736), .out0(u_device_sm_N198) );
  b15aoi022ar1n02x3 U3498 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[185]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[121]), .o1(n3062) );
  b15aoi022ar1n02x3 U3499 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[57]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[89]), .o1(n3061) );
  b15aoi022ar1n02x3 U3500 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[25]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[217]), .o1(n3060) );
  b15aoi022ar1n02x3 U3501 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[249]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[153]), .o1(n3059) );
  b15nand04ar1n03x5 U3502 ( .a(n3062), .b(n3061), .c(n3060), .d(n3059), .o1(
        n3063) );
  b15nonb02ar1n02x3 U3503 ( .a(n3063), .b(n3736), .out0(u_device_sm_N199) );
  b15aoi022ar1n02x3 U3504 ( .a(tx_data_valid), .b(tx_data[15]), .c(n2897), .d(
        u_txreg_data_int[14]), .o1(n3064) );
  b15aob012ar1n03x5 U3505 ( .b(n3149), .c(u_txreg_data_int[11]), .a(n3064), 
        .out0(u_txreg_N49) );
  b15aoi022ar1n02x3 U3506 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[186]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[122]), .o1(n3068) );
  b15aoi022ar1n02x3 U3507 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[26]), 
        .c(n2841), .d(u_dcfifo_tx_u_din_buffer_data[58]), .o1(n3067) );
  b15aoi022ar1n02x3 U3508 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[218]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[250]), .o1(n3066) );
  b15aoi022ar1n02x3 U3509 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[90]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[154]), .o1(n3065) );
  b15nand04ar1n03x5 U3510 ( .a(n3068), .b(n3067), .c(n3066), .d(n3065), .o1(
        n3069) );
  b15nonb02ar1n02x3 U3511 ( .a(n3069), .b(n3736), .out0(u_device_sm_N200) );
  b15aoi022ar1n02x3 U3512 ( .a(tx_data_valid), .b(tx_data[10]), .c(n2897), .d(
        u_txreg_data_int[9]), .o1(n3070) );
  b15aob012ar1n03x5 U3513 ( .b(n3149), .c(u_txreg_data_int[6]), .a(n3070), 
        .out0(u_txreg_N44) );
  b15aoi022ar1n02x3 U3514 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[59]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[123]), .o1(n3075) );
  b15aoi022ar1n02x3 U3515 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[219]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[251]), .o1(n3074) );
  b15aoi022ar1n02x3 U3516 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[27]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[187]), .o1(n3073) );
  b15aoi022ar1n02x3 U3517 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[91]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[155]), .o1(n3072) );
  b15nand04ar1n03x5 U3518 ( .a(n3075), .b(n3074), .c(n3073), .d(n3072), .o1(
        n3076) );
  b15nonb02ar1n02x3 U3519 ( .a(n3076), .b(n3736), .out0(u_device_sm_N201) );
  b15aoi022ar1n02x3 U3521 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[28]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[92]), .o1(n3081) );
  b15aoi022ar1n02x3 U3522 ( .a(n2816), .b(u_dcfifo_tx_u_din_buffer_data[156]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[124]), .o1(n3080) );
  b15aoi022ar1n02x3 U3523 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[188]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[252]), .o1(n3079) );
  b15aoi022ar1n02x3 U3524 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[60]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[220]), .o1(n3078) );
  b15nand04ar1n03x5 U3525 ( .a(n3081), .b(n3080), .c(n3079), .d(n3078), .o1(
        n3082) );
  b15nonb02ar1n02x3 U3526 ( .a(n3082), .b(n3736), .out0(u_device_sm_N202) );
  b15aoi022ar1n02x3 U3527 ( .a(tx_data_valid), .b(tx_data[16]), .c(n2897), .d(
        u_txreg_data_int[15]), .o1(n3083) );
  b15aob012ar1n03x5 U3528 ( .b(n3149), .c(u_txreg_data_int[12]), .a(n3083), 
        .out0(u_txreg_N50) );
  b15aoi022ar1n02x3 U3530 ( .a(tx_data_valid), .b(tx_data[9]), .c(n2897), .d(
        u_txreg_data_int[8]), .o1(n3085) );
  b15aob012ar1n03x5 U3531 ( .b(n3149), .c(u_txreg_data_int[5]), .a(n3085), 
        .out0(u_txreg_N43) );
  b15aoi022ar1n02x3 U3532 ( .a(tx_data_valid), .b(tx_data[17]), .c(n2897), .d(
        u_txreg_data_int[16]), .o1(n3086) );
  b15aob012ar1n03x5 U3533 ( .b(n3149), .c(u_txreg_data_int[13]), .a(n3086), 
        .out0(u_txreg_N51) );
  b15aoi022ar1n02x3 U3534 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[222]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[254]), .o1(n3091) );
  b15aoi022ar1n02x3 U3535 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[30]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[126]), .o1(n3090) );
  b15aoi022ar1n02x3 U3536 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[190]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[158]), .o1(n3089) );
  b15aoi022ar1n02x3 U3537 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[62]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[94]), .o1(n3088) );
  b15nand04ar1n03x5 U3538 ( .a(n3091), .b(n3090), .c(n3089), .d(n3088), .o1(
        n3092) );
  b15nonb02ar1n02x3 U3539 ( .a(n3092), .b(n3736), .out0(u_device_sm_N204) );
  b15aoi022ar1n02x3 U3540 ( .a(tx_data_valid), .b(tx_data[8]), .c(n2897), .d(
        u_txreg_data_int[7]), .o1(n3093) );
  b15aob012ar1n03x5 U3541 ( .b(n3149), .c(u_txreg_data_int[4]), .a(n3093), 
        .out0(u_txreg_N42) );
  b15aoi022ar1n02x3 U3542 ( .a(tx_data_valid), .b(tx_data[18]), .c(n2897), .d(
        u_txreg_data_int[17]), .o1(n3094) );
  b15aob012ar1n03x5 U3543 ( .b(n3149), .c(u_txreg_data_int[14]), .a(n3094), 
        .out0(u_txreg_N52) );
  b15aoi022ar1n02x3 U3544 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[63]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[223]), .o1(n3100) );
  b15aoi022ar1n02x3 U3545 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[31]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[95]), .o1(n3099) );
  b15aoi022ar1n02x3 U3546 ( .a(n2816), .b(u_dcfifo_tx_u_din_buffer_data[159]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[127]), .o1(n3098) );
  b15aoi022ar1n02x3 U3547 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[191]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[255]), .o1(n3097) );
  b15nand04ar1n03x5 U3548 ( .a(n3100), .b(n3099), .c(n3098), .d(n3097), .o1(
        n3101) );
  b15nonb02ar1n02x3 U3549 ( .a(n3101), .b(n3736), .out0(u_device_sm_N205) );
  b15aoi022ar1n02x3 U3550 ( .a(tx_data_valid), .b(tx_data[7]), .c(n2897), .d(
        u_txreg_data_int[6]), .o1(n3102) );
  b15aob012ar1n03x5 U3551 ( .b(n3149), .c(u_txreg_data_int[3]), .a(n3102), 
        .out0(u_txreg_N41) );
  b15aoi022ar1n02x3 U3552 ( .a(tx_data_valid), .b(tx_data[19]), .c(n2897), .d(
        u_txreg_data_int[18]), .o1(n3103) );
  b15aob012ar1n03x5 U3553 ( .b(n3149), .c(u_txreg_data_int[15]), .a(n3103), 
        .out0(u_txreg_N53) );
  b15inv000ar1n03x5 U3554 ( .a(n3104), .o1(u_rxreg_N33) );
  b15inv000ar1n03x5 U3555 ( .a(n3105), .o1(u_rxreg_N35) );
  b15aoi022ar1n02x3 U3556 ( .a(tx_data_valid), .b(tx_data[6]), .c(n2897), .d(
        u_txreg_data_int[5]), .o1(n3106) );
  b15aob012ar1n03x5 U3557 ( .b(n3149), .c(u_txreg_data_int[2]), .a(n3106), 
        .out0(u_txreg_N40) );
  b15inv000ar1n03x5 U3558 ( .a(n3107), .o1(u_rxreg_N38) );
  b15aoi022ar1n02x3 U3559 ( .a(tx_data_valid), .b(tx_data[21]), .c(n2897), .d(
        u_txreg_data_int[20]), .o1(n3108) );
  b15aob012ar1n03x5 U3560 ( .b(n3149), .c(u_txreg_data_int[17]), .a(n3108), 
        .out0(u_txreg_N55) );
  b15oai022ar1n02x5 U3561 ( .a(n3728), .b(u_rxreg_data_int[20]), .c(
        u_rxreg_data_int[23]), .d(en_quad), .o1(n3129) );
  b15inv000ar1n03x5 U3563 ( .a(n3113), .o1(u_rxreg_N41) );
  b15aoi022ar1n02x3 U3564 ( .a(n3123), .b(u_device_sm_s_dummy_cycles[4]), .c(
        n3482), .d(n3500), .o1(n3122) );
  b15nor003ar1n02x7 U3565 ( .a(en_quad), .b(n3734), .c(n3736), .o1(n3121) );
  b15nor002ar1n03x5 U3566 ( .a(n3114), .b(n3123), .o1(n3119) );
  b15aoi012ar1n02x5 U3567 ( .b(n3116), .c(n3482), .a(n3115), .o1(n3117) );
  b15oaoi13ar1n02x3 U3568 ( .c(n3119), .d(n3118), .b(n3117), .a(n3503), .o1(
        n3120) );
  b15oabi12ar1n03x5 U3569 ( .b(n3121), .c(n3120), .a(n2656), .out0(n3124) );
  b15oai012ar1n03x5 U3570 ( .b(n3122), .c(n3133), .a(n3124), .o1(
        u_rxreg_counter_trgt_next[4]) );
  b15aoi022ar1n02x3 U3571 ( .a(n3123), .b(u_device_sm_s_dummy_cycles[3]), .c(
        n3482), .d(n3500), .o1(n3125) );
  b15oai012ar1n03x5 U3572 ( .b(n3125), .c(n3133), .a(n3124), .o1(
        u_rxreg_counter_trgt_next[3]) );
  b15aoi022ar1n02x3 U3573 ( .a(tx_data_valid), .b(tx_data[26]), .c(n2897), .d(
        u_txreg_data_int[25]), .o1(n3126) );
  b15aob012ar1n03x5 U3574 ( .b(n3149), .c(u_txreg_data_int[22]), .a(n3126), 
        .out0(u_txreg_N60) );
  b15inv000ar1n03x5 U3575 ( .a(n3127), .o1(u_rxreg_N50) );
  b15inv000ar1n03x5 U3576 ( .a(n3128), .o1(u_rxreg_N44) );
  b15inv000ar1n03x5 U3577 ( .a(n3129), .o1(u_rxreg_N53) );
  b15inv000ar1n03x5 U3578 ( .a(n3130), .o1(u_rxreg_N58) );
  b15inv000ar1n03x5 U3579 ( .a(n3131), .o1(u_rxreg_N47) );
  b15inv000ar1n03x5 U3580 ( .a(u_device_sm_s_dummy_cycles[1]), .o1(n3134) );
  b15aoai13ar1n02x3 U3581 ( .c(n3486), .d(n3134), .b(n3133), .a(n3132), .o1(
        u_rxreg_counter_trgt_next[1]) );
  b15aoi022ar1n02x3 U3582 ( .a(tx_data_valid), .b(tx_data[23]), .c(n2897), .d(
        u_txreg_data_int[22]), .o1(n3135) );
  b15aob012ar1n03x5 U3583 ( .b(n3149), .c(u_txreg_data_int[19]), .a(n3135), 
        .out0(u_txreg_N57) );
  b15aoi022ar1n02x3 U3584 ( .a(tx_data_valid), .b(tx_data[4]), .c(n2897), .d(
        u_txreg_data_int[3]), .o1(n3136) );
  b15aob012ar1n03x5 U3585 ( .b(n3149), .c(u_txreg_data_int[0]), .a(n3136), 
        .out0(u_txreg_N38) );
  b15inv000ar1n03x5 U3586 ( .a(n3137), .o1(u_rxreg_N56) );
  b15aoi022ar1n02x3 U3587 ( .a(tx_data_valid), .b(tx_data[20]), .c(n2897), .d(
        u_txreg_data_int[19]), .o1(n3139) );
  b15aob012ar1n03x5 U3588 ( .b(n3149), .c(u_txreg_data_int[16]), .a(n3139), 
        .out0(u_txreg_N54) );
  b15aoi022ar1n02x3 U3589 ( .a(tx_data_valid), .b(tx_data[5]), .c(n2897), .d(
        u_txreg_data_int[4]), .o1(n3141) );
  b15aob012ar1n03x5 U3590 ( .b(n3149), .c(u_txreg_data_int[1]), .a(n3141), 
        .out0(u_txreg_N39) );
  b15aoi022ar1n02x3 U3591 ( .a(tx_data_valid), .b(tx_data[24]), .c(n2897), .d(
        u_txreg_data_int[23]), .o1(n3142) );
  b15aob012ar1n03x5 U3592 ( .b(n3149), .c(u_txreg_data_int[20]), .a(n3142), 
        .out0(u_txreg_N58) );
  b15nor002ar1n03x5 U3593 ( .a(n3144), .b(n3143), .o1(tx_done) );
  b15aoi022ar1n02x3 U3594 ( .a(tx_data_valid), .b(tx_data[22]), .c(n2897), .d(
        u_txreg_data_int[21]), .o1(n3145) );
  b15aob012ar1n03x5 U3595 ( .b(n3149), .c(u_txreg_data_int[18]), .a(n3145), 
        .out0(u_txreg_N56) );
  b15aoi022ar1n02x3 U3596 ( .a(tx_data_valid), .b(tx_data[28]), .c(
        u_txreg_data_int[27]), .d(n2897), .o1(n3146) );
  b15aob012ar1n03x5 U3597 ( .b(n3149), .c(u_txreg_data_int[24]), .a(n3146), 
        .out0(u_txreg_N62) );
  b15ao0022ar1n03x5 U3598 ( .a(tx_data_valid), .b(tx_data[3]), .c(n2897), .d(
        u_txreg_data_int[2]), .o(u_txreg_N37) );
  b15aoi022ar1n02x3 U3599 ( .a(tx_data_valid), .b(tx_data[25]), .c(n2897), .d(
        u_txreg_data_int[24]), .o1(n3148) );
  b15aob012ar1n03x5 U3600 ( .b(n3149), .c(u_txreg_data_int[21]), .a(n3148), 
        .out0(u_txreg_N59) );
  b15nor002ar1n03x5 U3601 ( .a(n3730), .b(n3150), .o1(u_device_sm_N163) );
  b15inv000ar1n03x5 U3614 ( .a(tl_o[67]), .o1(n3536) );
  b15inv000ar1n03x5 U3615 ( .a(tl_o[77]), .o1(n3207) );
  b15aoi022ar1n02x3 U3616 ( .a(tl_o[77]), .b(tl_o[67]), .c(n3536), .d(n3207), 
        .o1(n3634) );
  b15inv000ar1n03x5 U3617 ( .a(tl_o[79]), .o1(n3198) );
  b15inv000ar1n03x5 U3618 ( .a(tl_o[63]), .o1(n3535) );
  b15aoi022ar1n02x3 U3619 ( .a(tl_o[63]), .b(tl_o[79]), .c(n3198), .d(n3535), 
        .o1(n3158) );
  b15inv000ar1n03x5 U3620 ( .a(tl_o[84]), .o1(n3166) );
  b15inv000ar1n03x5 U3621 ( .a(tl_o[86]), .o1(n3631) );
  b15aoi022ar1n02x3 U3622 ( .a(tl_o[86]), .b(n3166), .c(tl_o[84]), .d(n3631), 
        .o1(n3157) );
  b15xor002ar1n02x5 U3623 ( .a(n3158), .b(n3157), .out0(n3183) );
  b15inv000ar1n03x5 U3624 ( .a(tl_o[73]), .o1(n3188) );
  b15aboi22ar1n02x3 U3625 ( .c(tl_o[75]), .d(n3188), .a(tl_o[75]), .b(tl_o[73]), .out0(n3159) );
  b15xor002ar1n02x5 U3626 ( .a(n3183), .b(n3159), .out0(n3161) );
  b15inv000ar1n03x5 U3627 ( .a(tl_o[65]), .o1(n3167) );
  b15aboi22ar1n02x3 U3628 ( .c(tl_o[83]), .d(tl_o[65]), .a(tl_o[83]), .b(n3167), .out0(n3160) );
  b15xor002ar1n02x5 U3629 ( .a(n3161), .b(n3160), .out0(n3162) );
  b15xor002ar1n02x5 U3630 ( .a(n3634), .b(n3162), .out0(n3164) );
  b15inv000ar1n03x5 U3631 ( .a(tl_o[89]), .o1(n3180) );
  b15inv000ar1n03x5 U3632 ( .a(tl_o[91]), .o1(n3165) );
  b15aoi022ar1n02x3 U3633 ( .a(tl_o[91]), .b(tl_o[89]), .c(n3180), .d(n3165), 
        .o1(n3538) );
  b15xor002ar1n02x5 U3634 ( .a(tl_o[70]), .b(n3538), .out0(n3196) );
  b15inv000ar1n03x5 U3635 ( .a(tl_o[87]), .o1(n3632) );
  b15inv000ar1n03x5 U3636 ( .a(tl_o[81]), .o1(n3199) );
  b15aoi022ar1n02x3 U3637 ( .a(tl_o[81]), .b(tl_o[87]), .c(n3632), .d(n3199), 
        .o1(n3177) );
  b15xor002ar1n02x5 U3638 ( .a(n3196), .b(n3177), .out0(n3163) );
  b15xor002ar1n02x5 U3639 ( .a(n3164), .b(n3163), .out0(tl_o[13]) );
  b15inv000ar1n03x5 U3640 ( .a(u_spi_device_tlul_plug_we), .o1(tl_o[107]) );
  b15aoi022ar1n02x3 U3641 ( .a(tl_o[91]), .b(tl_o[84]), .c(n3166), .d(n3165), 
        .o1(n3174) );
  b15inv000ar1n03x5 U3642 ( .a(tl_o[66]), .o1(n3642) );
  b15aoi022ar1n02x3 U3643 ( .a(u_spi_device_tlul_plug_we), .b(tl_o[66]), .c(
        n3642), .d(tl_o[107]), .o1(n3169) );
  b15aboi22ar1n02x3 U3644 ( .c(tl_o[62]), .d(tl_o[65]), .a(tl_o[62]), .b(n3167), .out0(n3168) );
  b15xor002ar1n02x5 U3645 ( .a(n3169), .b(n3168), .out0(n3541) );
  b15inv000ar1n03x5 U3646 ( .a(tl_o[82]), .o1(n3204) );
  b15inv000ar1n03x5 U3647 ( .a(tl_o[85]), .o1(n3191) );
  b15aoi022ar1n02x3 U3648 ( .a(tl_o[85]), .b(tl_o[82]), .c(n3204), .d(n3191), 
        .o1(n3170) );
  b15xor002ar1n02x5 U3649 ( .a(n3541), .b(n3170), .out0(n3172) );
  b15inv000ar1n03x5 U3650 ( .a(tl_o[72]), .o1(n3181) );
  b15inv000ar1n03x5 U3651 ( .a(tl_o[76]), .o1(n3638) );
  b15aoi022ar1n02x3 U3652 ( .a(tl_o[76]), .b(tl_o[72]), .c(n3181), .d(n3638), 
        .o1(n3171) );
  b15xor002ar1n02x5 U3653 ( .a(tl_o[75]), .b(n3171), .out0(n3211) );
  b15xor002ar1n02x5 U3654 ( .a(n3172), .b(n3211), .out0(n3173) );
  b15xor002ar1n02x5 U3655 ( .a(n3174), .b(n3173), .out0(n3175) );
  b15inv000ar1n03x5 U3656 ( .a(tl_o[78]), .o1(n3182) );
  b15inv000ar1n03x5 U3657 ( .a(tl_o[69]), .o1(n3208) );
  b15aoi022ar1n02x3 U3658 ( .a(tl_o[69]), .b(tl_o[78]), .c(n3182), .d(n3208), 
        .o1(n3194) );
  b15xor002ar1n02x5 U3659 ( .a(n3175), .b(n3194), .out0(n3176) );
  b15xor002ar1n02x5 U3660 ( .a(n3177), .b(n3176), .out0(n3178) );
  b15xor002ar1n02x5 U3661 ( .a(n3178), .b(tl_o[88]), .out0(tl_o[12]) );
  b15nonb02ar1n02x3 U3662 ( .a(u_txreg_data_int[30]), .b(n3730), .out0(
        spi_sdo2) );
  b15nonb02ar1n02x3 U3663 ( .a(u_txreg_data_int[29]), .b(n3730), .out0(
        spi_sdo1) );
  b15nonb02ar1n02x3 U3664 ( .a(u_txreg_data_int[31]), .b(n3730), .out0(
        spi_sdo3) );
  b15nor002ar1n03x5 U3665 ( .a(n3179), .b(n3730), .o1(spi_mode[1]) );
  b15inv000ar1n03x5 U3666 ( .a(tl_o[80]), .o1(n3203) );
  b15aoi022ar1n02x3 U3667 ( .a(tl_o[89]), .b(n3203), .c(tl_o[80]), .d(n3180), 
        .o1(n3187) );
  b15aoi022ar1n02x3 U3668 ( .a(tl_o[72]), .b(tl_o[78]), .c(n3182), .d(n3181), 
        .o1(n3184) );
  b15xor002ar1n02x5 U3669 ( .a(n3184), .b(n3183), .out0(n3185) );
  b15inv000ar1n03x5 U3670 ( .a(tl_o[90]), .o1(n3641) );
  b15aboi22ar1n02x3 U3671 ( .c(tl_o[90]), .d(tl_o[88]), .a(tl_o[88]), .b(n3641), .out0(n3544) );
  b15xor002ar1n02x5 U3672 ( .a(n3544), .b(tl_o[68]), .out0(n3195) );
  b15xor002ar1n02x5 U3673 ( .a(n3185), .b(n3195), .out0(n3186) );
  b15xor002ar1n02x5 U3674 ( .a(n3187), .b(n3186), .out0(n3189) );
  b15aboi22ar1n02x3 U3675 ( .c(tl_o[74]), .d(n3188), .a(tl_o[74]), .b(tl_o[73]), .out0(n3213) );
  b15xor002ar1n02x5 U3676 ( .a(n3189), .b(n3213), .out0(n3190) );
  b15xor002ar1n02x5 U3677 ( .a(tl_o[62]), .b(n3190), .out0(n3192) );
  b15inv000ar1n03x5 U3678 ( .a(tl_o[64]), .o1(n3537) );
  b15aoi022ar1n02x3 U3679 ( .a(tl_o[85]), .b(tl_o[64]), .c(n3537), .d(n3191), 
        .o1(n3635) );
  b15xor002ar1n02x5 U3680 ( .a(n3192), .b(n3635), .out0(tl_o[11]) );
  b15nandp2ar1n03x5 U3681 ( .a(u_device_sm_state[0]), .b(en_quad), .o1(n3491)
         );
  b15nor002ar1n03x5 U3682 ( .a(n3193), .b(n3491), .o1(spi_mode[0]) );
  b15xor002ar1n02x5 U3683 ( .a(n3194), .b(u_spi_device_tlul_plug_we), .out0(
        n3202) );
  b15xor002ar1n02x5 U3684 ( .a(tl_o[71]), .b(n3195), .out0(n3197) );
  b15xor002ar1n02x5 U3685 ( .a(n3197), .b(n3196), .out0(n3210) );
  b15aoi022ar1n02x3 U3686 ( .a(tl_o[79]), .b(tl_o[81]), .c(n3199), .d(n3198), 
        .o1(n3200) );
  b15xor002ar1n02x5 U3687 ( .a(n3210), .b(n3200), .out0(n3201) );
  b15xor002ar1n02x5 U3688 ( .a(n3202), .b(n3201), .out0(n3206) );
  b15aoi022ar1n02x3 U3689 ( .a(tl_o[80]), .b(n3204), .c(tl_o[82]), .d(n3203), 
        .o1(n3205) );
  b15xor002ar1n02x5 U3690 ( .a(tl_o[83]), .b(n3205), .out0(n3646) );
  b15xor002ar1n02x5 U3691 ( .a(n3206), .b(n3646), .out0(tl_o[10]) );
  b15aoi022ar1n02x3 U3692 ( .a(tl_o[77]), .b(tl_o[69]), .c(n3208), .d(n3207), 
        .o1(n3209) );
  b15xor002ar1n02x5 U3693 ( .a(n3210), .b(n3209), .out0(n3212) );
  b15xor002ar1n02x5 U3694 ( .a(n3212), .b(n3211), .out0(n3214) );
  b15xor002ar1n02x5 U3695 ( .a(n3214), .b(n3213), .out0(tl_o[9]) );
  b15ao0022ar1n03x5 U3696 ( .a(n3731), .b(u_txreg_data_int[28]), .c(
        u_txreg_data_int[31]), .d(n3732), .o(spi_sdo0) );
  b15inv000ar1n03x5 U3697 ( .a(tl_i[57]), .o1(n3218) );
  b15aboi22ar1n02x3 U3698 ( .c(tl_i[57]), .d(tl_i[64]), .a(tl_i[64]), .b(n3218), .out0(n3235) );
  b15inv000ar1n03x5 U3699 ( .a(tl_i[58]), .o1(n3232) );
  b15xor002ar1n02x5 U3700 ( .a(tl_i[11]), .b(tl_i[64]), .out0(n3224) );
  b15xor002ar1n02x5 U3701 ( .a(tl_i[64]), .b(tl_i[9]), .out0(n3220) );
  b15inv000ar1n03x5 U3702 ( .a(tl_i[63]), .o1(n3228) );
  b15aboi22ar1n02x3 U3703 ( .c(tl_i[62]), .d(n3228), .a(tl_i[62]), .b(tl_i[63]), .out0(n3217) );
  b15xor002ar1n02x5 U3704 ( .a(tl_i[58]), .b(n3217), .out0(n3219) );
  b15xor002ar1n02x5 U3705 ( .a(n3219), .b(n3218), .out0(n3221) );
  b15xor002ar1n02x5 U3706 ( .a(n3220), .b(n3221), .out0(n3223) );
  b15xnr002ar1n02x5 U3707 ( .a(tl_i[10]), .b(n3221), .out0(n3222) );
  b15nor004ar1n02x3 U3708 ( .a(tl_i[1]), .b(n3224), .c(n3223), .d(n3222), .o1(
        n3226) );
  b15nand04ar1n03x5 U3709 ( .a(tl_i[1]), .b(n3224), .c(n3223), .d(n3222), .o1(
        n3225) );
  b15nanb02ar1n02x5 U3710 ( .a(n3226), .b(n3225), .out0(n3230) );
  b15oai022ar1n02x5 U3711 ( .a(n3228), .b(tl_i[15]), .c(tl_i[14]), .d(tl_i[62]), .o1(n3227) );
  b15aoi122ar1n02x3 U3712 ( .b(n3228), .c(tl_i[15]), .d(tl_i[62]), .e(tl_i[14]), .a(n3227), .o1(n3229) );
  b15oai112ar1n02x5 U3713 ( .c(n3232), .d(tl_i[13]), .a(n3230), .b(n3229), 
        .o1(n3231) );
  b15aoi012ar1n02x5 U3714 ( .b(n3232), .c(tl_i[13]), .a(n3231), .o1(n3233) );
  b15oai012ar1n03x5 U3715 ( .b(n3235), .c(tl_i[12]), .a(n3233), .o1(n3234) );
  b15aoai13ar1n02x3 U3716 ( .c(tl_i[12]), .d(n3235), .b(n3234), .a(tl_i[65]), 
        .o1(n3236) );
  b15nanb02ar1n02x5 U3717 ( .a(n1455), .b(n3236), .out0(n1456) );
  b15orn002ar1n02x5 U3718 ( .a(u_dcfifo_tx_u_din_full_full_up), .b(tl_i[65]), 
        .o(u_dcfifo_tx_u_din_full_N0) );
  b15inv000ar1n03x5 U3719 ( .a(u_spi_device_tlul_plug_state[1]), .o1(n3264) );
  b15nor002ar1n03x5 U3720 ( .a(u_spi_device_tlul_plug_state[0]), .b(n3264), 
        .o1(tl_o[108]) );
  b15aoi022ar1n02x3 U3722 ( .a(u_dcfifo_tx_write_token[7]), .b(
        u_dcfifo_tx_write_token[6]), .c(u_dcfifo_tx_write_token[5]), .d(
        u_dcfifo_tx_write_token[4]), .o1(n3237) );
  b15nandp2ar1n03x5 U3723 ( .a(u_dcfifo_tx_write_token[1]), .b(
        u_dcfifo_tx_write_token[0]), .o1(n3533) );
  b15nandp2ar1n03x5 U3724 ( .a(u_dcfifo_tx_write_token[3]), .b(
        u_dcfifo_tx_write_token[2]), .o1(n3511) );
  b15nand03ar1n03x5 U3725 ( .a(n3237), .b(n3533), .c(n3511), .o1(n3248) );
  b15oai012ar1n03x5 U3727 ( .b(u_dcfifo_tx_write_token[7]), .c(
        u_dcfifo_tx_write_token[5]), .a(u_dcfifo_tx_write_token[6]), .o1(n3515) );
  b15oai012ar1n03x5 U3728 ( .b(u_dcfifo_tx_write_token[1]), .c(
        u_dcfifo_tx_write_token[3]), .a(u_dcfifo_tx_write_token[2]), .o1(n3508) );
  b15nandp2ar1n03x5 U3729 ( .a(n3515), .b(n3508), .o1(n3243) );
  b15and002ar1n02x5 U3731 ( .a(u_dcfifo_tx_write_token[7]), .b(
        u_dcfifo_tx_write_token[6]), .o(n3238) );
  b15oaoi13ar1n02x3 U3732 ( .c(u_dcfifo_tx_write_token[6]), .d(
        u_dcfifo_tx_write_token[4]), .b(u_dcfifo_tx_write_token[5]), .a(n3238), 
        .o1(n3526) );
  b15aob012ar1n03x5 U3733 ( .b(u_dcfifo_tx_write_token[3]), .c(
        u_dcfifo_tx_write_token[4]), .a(n3526), .out0(n3241) );
  b15nand03ar1n03x5 U3734 ( .a(n3242), .b(u_dcfifo_tx_u_din_write_enable), .c(
        n3241), .o1(n3239) );
  b15nor002ar1n03x5 U3735 ( .a(n3245), .b(n3239), .o1(
        u_dcfifo_tx_u_din_buffer_N31) );
  b15nand03ar1n03x5 U3736 ( .a(u_dcfifo_tx_u_din_write_enable), .b(n3243), .c(
        n3241), .o1(n3240) );
  b15nor002ar1n03x5 U3737 ( .a(n3245), .b(n3240), .o1(
        u_dcfifo_tx_u_din_buffer_N33) );
  b15nor002ar1n03x5 U3738 ( .a(n3248), .b(n3239), .o1(
        u_dcfifo_tx_u_din_buffer_N30) );
  b15nor002ar1n03x5 U3739 ( .a(n3248), .b(n3240), .o1(
        u_dcfifo_tx_u_din_buffer_N32) );
  b15nonb02ar1n02x3 U3740 ( .a(u_dcfifo_tx_u_din_write_enable), .b(n3241), 
        .out0(n3244) );
  b15nandp2ar1n03x5 U3741 ( .a(n3242), .b(n3244), .o1(n3246) );
  b15nor002ar1n03x5 U3742 ( .a(n3245), .b(n3246), .o1(
        u_dcfifo_tx_u_din_buffer_N27) );
  b15nandp2ar1n03x5 U3743 ( .a(n3244), .b(n3243), .o1(n3247) );
  b15nor002ar1n03x5 U3744 ( .a(n3245), .b(n3247), .o1(
        u_dcfifo_tx_u_din_buffer_N29) );
  b15nor002ar1n03x5 U3745 ( .a(n3248), .b(n3246), .o1(
        u_dcfifo_tx_u_din_buffer_N26) );
  b15nor002ar1n03x5 U3746 ( .a(n3248), .b(n3247), .o1(
        u_dcfifo_tx_u_din_buffer_N28) );
  b15inv000ar1n03x5 U3747 ( .a(u_dcfifo_rx_u_dout_read_token[3]), .o1(n3250)
         );
  b15aoai13ar1n02x3 U3748 ( .c(u_dcfifo_rx_u_dout_read_token[5]), .d(
        u_dcfifo_rx_u_dout_write_token_dn[6]), .b(
        u_dcfifo_rx_u_dout_write_token_dn[5]), .a(
        u_dcfifo_rx_u_dout_read_token[4]), .o1(n3249) );
  b15oaoi13ar1n02x3 U3749 ( .c(u_dcfifo_rx_u_dout_write_token_dn[4]), .d(n3250), .b(u_dcfifo_rx_u_dout_write_token_dn[5]), .a(n3249), .o1(n3262) );
  b15inv000ar1n03x5 U3750 ( .a(u_dcfifo_rx_u_dout_write_token_dn[2]), .o1(
        n3252) );
  b15nand04ar1n03x5 U3752 ( .a(u_dcfifo_rx_u_dout_read_token[7]), .b(
        u_dcfifo_rx_u_dout_read_token[0]), .c(
        u_dcfifo_rx_u_dout_write_token_dn[1]), .d(n3258), .o1(n3251) );
  b15oai013ar1n02x5 U3753 ( .b(u_dcfifo_rx_u_dout_write_token_dn[1]), .c(n3269), .d(n3252), .a(n3251), .o1(n3261) );
  b15inv000ar1n03x5 U3754 ( .a(u_dcfifo_rx_u_dout_write_token_dn[4]), .o1(
        n3254) );
  b15nand04ar1n03x5 U3755 ( .a(u_dcfifo_rx_u_dout_read_token[1]), .b(
        u_dcfifo_rx_u_dout_read_token[2]), .c(
        u_dcfifo_rx_u_dout_write_token_dn[3]), .d(n3252), .o1(n3253) );
  b15oai013ar1n02x5 U3756 ( .b(u_dcfifo_rx_u_dout_write_token_dn[3]), .c(n3254), .d(n3268), .a(n3253), .o1(n3260) );
  b15inv000ar1n03x5 U3757 ( .a(u_dcfifo_rx_u_dout_write_token_dn[6]), .o1(
        n3255) );
  b15nand04ar1n03x5 U3758 ( .a(u_dcfifo_rx_u_dout_read_token[5]), .b(
        u_dcfifo_rx_u_dout_read_token[6]), .c(
        u_dcfifo_rx_u_dout_write_token_dn[7]), .d(n3255), .o1(n3256) );
  b15oai013ar1n02x5 U3759 ( .b(u_dcfifo_rx_u_dout_write_token_dn[7]), .c(n3258), .d(n3257), .a(n3256), .o1(n3259) );
  b15nor004ar1n02x7 U3760 ( .a(n3262), .b(n3261), .c(n3260), .d(n3259), .o1(
        n2723) );
  b15inv000ar1n03x5 U3761 ( .a(n2723), .o1(n3266) );
  b15aoi012ar1n02x5 U3763 ( .b(rd_wr_sync), .c(n3265), .a(
        u_spi_device_tlul_plug_state[0]), .o1(n3263) );
  b15aoi013ar1n02x3 U3764 ( .b(u_spi_device_tlul_plug_state[0]), .c(n3264), 
        .d(n3266), .a(n3263), .o1(u_spi_device_tlul_plug_state_next[1]) );
  b15inv000ar1n03x5 U3765 ( .a(n3265), .o1(n3488) );
  b15inv000ar1n03x5 U3766 ( .a(u_spi_device_tlul_plug_state[0]), .o1(n3267) );
  b15oaoi13ar1n02x3 U3769 ( .c(rd_wr_sync), .d(n3488), .b(n3267), .a(n3292), 
        .o1(u_spi_device_tlul_plug_state_next[0]) );
  b15nand03ar1n03x5 U3771 ( .a(n3270), .b(n3269), .c(n3268), .o1(n3285) );
  b15oaoi13ar1n02x3 U3773 ( .c(u_dcfifo_rx_u_dout_read_token[3]), .d(
        u_dcfifo_rx_u_dout_read_token[5]), .b(u_dcfifo_rx_u_dout_read_token[4]), .a(n3273), .o1(n3278) );
  b15nandp2ar1n03x5 U3774 ( .a(n3278), .b(n3272), .o1(n3275) );
  b15oaoi13ar1n02x3 U3778 ( .c(u_dcfifo_rx_u_dout_read_token[3]), .d(
        u_dcfifo_rx_u_dout_read_token[5]), .b(u_dcfifo_rx_u_dout_read_token[4]), .a(n3272), .o1(n3277) );
  b15nandp2ar1n03x5 U3779 ( .a(n3277), .b(n3273), .o1(n3284) );
  b15aoi022ar1n02x3 U3783 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[111]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[175]), .o1(n3290) );
  b15nandp2ar1n03x5 U3786 ( .a(n3276), .b(n3277), .o1(n3280) );
  b15aoi022ar1n02x3 U3789 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[79]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[47]), .o1(n3289) );
  b15orn002ar1n02x5 U3790 ( .a(n3278), .b(n3277), .o(n3282) );
  b15aoi022ar1n02x3 U3796 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[239]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[15]), .o1(n3288) );
  b15aoi022ar1n02x3 U3803 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[207]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[143]), .o1(n3287) );
  b15nand04ar1n03x5 U3804 ( .a(n3290), .b(n3289), .c(n3288), .d(n3287), .o1(
        n3291) );
  b15and002ar1n02x5 U3805 ( .a(n3292), .b(n3291), .o(
        u_spi_device_tlul_plug_wdata_next[15]) );
  b15aoi022ar1n02x3 U3808 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[137]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[9]), .o1(n3296) );
  b15aoi022ar1n02x3 U3811 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[41]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[233]), .o1(n3295) );
  b15aoi022ar1n02x3 U3813 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[73]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[105]), .o1(n3294) );
  b15aoi022ar1n02x3 U3815 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[201]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[169]), .o1(n3293) );
  b15nand04ar1n03x5 U3816 ( .a(n3296), .b(n3295), .c(n3294), .d(n3293), .o1(
        n3297) );
  b15and002ar1n02x5 U3817 ( .a(n3292), .b(n3297), .o(
        u_spi_device_tlul_plug_wdata_next[9]) );
  b15aoi022ar1n02x3 U3819 ( .a(n3281), .b(u_dcfifo_rx_u_din_buffer_data[2]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[162]), .o1(n3304) );
  b15aoi022ar1n02x3 U3822 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[34]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[194]), .o1(n3303) );
  b15aoi022ar1n02x3 U3825 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[66]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[98]), .o1(n3302) );
  b15aoi022ar1n02x3 U3827 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[226]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[130]), .o1(n3301) );
  b15nand04ar1n03x5 U3828 ( .a(n3304), .b(n3303), .c(n3302), .d(n3301), .o1(
        n3305) );
  b15and002ar1n02x5 U3829 ( .a(n3292), .b(n3305), .o(
        u_spi_device_tlul_plug_wdata_next[2]) );
  b15aoi022ar1n02x3 U3831 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[157]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[189]), .o1(n3312) );
  b15aoi022ar1n02x3 U3832 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[61]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[221]), .o1(n3311) );
  b15aoi022ar1n02x3 U3834 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[253]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[125]), .o1(n3310) );
  b15aoi022ar1n02x3 U3836 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[93]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[29]), .o1(n3309) );
  b15nand04ar1n03x5 U3837 ( .a(n3312), .b(n3311), .c(n3310), .d(n3309), .o1(
        n3313) );
  b15and002ar1n02x5 U3838 ( .a(n3292), .b(n3313), .o(
        u_spi_device_tlul_plug_wdata_next[29]) );
  b15aoi022ar1n02x3 U3839 ( .a(n3281), .b(u_dcfifo_rx_u_din_buffer_data[17]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[177]), .o1(n3317) );
  b15aoi022ar1n02x3 U3840 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[81]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[49]), .o1(n3316) );
  b15aoi022ar1n02x3 U3841 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[209]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[145]), .o1(n3315) );
  b15aoi022ar1n02x3 U3842 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[241]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[113]), .o1(n3314) );
  b15nand04ar1n03x5 U3843 ( .a(n3317), .b(n3316), .c(n3315), .d(n3314), .o1(
        n3318) );
  b15and002ar1n02x5 U3844 ( .a(n3292), .b(n3318), .o(
        u_spi_device_tlul_plug_wdata_next[17]) );
  b15aoi022ar1n02x3 U3846 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[86]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[214]), .o1(n3323) );
  b15aoi022ar1n02x3 U3847 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[54]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[150]), .o1(n3322) );
  b15aoi022ar1n02x3 U3848 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[118]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[22]), .o1(n3321) );
  b15aoi022ar1n02x3 U3849 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[246]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[182]), .o1(n3320) );
  b15nand04ar1n03x5 U3850 ( .a(n3323), .b(n3322), .c(n3321), .d(n3320), .o1(
        n3324) );
  b15and002ar1n02x5 U3851 ( .a(n3292), .b(n3324), .o(
        u_spi_device_tlul_plug_wdata_next[22]) );
  b15aoi022ar1n02x3 U3852 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[95]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[63]), .o1(n3328) );
  b15aoi022ar1n02x3 U3853 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[223]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[255]), .o1(n3327) );
  b15aoi022ar1n02x3 U3854 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[127]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[159]), .o1(n3326) );
  b15aoi022ar1n02x3 U3855 ( .a(n3281), .b(u_dcfifo_rx_u_din_buffer_data[31]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[191]), .o1(n3325) );
  b15nand04ar1n03x5 U3856 ( .a(n3328), .b(n3327), .c(n3326), .d(n3325), .o1(
        n3329) );
  b15and002ar1n02x5 U3857 ( .a(n3292), .b(n3329), .o(
        u_spi_device_tlul_plug_wdata_next[31]) );
  b15aoi022ar1n02x3 U3858 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[84]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[52]), .o1(n3333) );
  b15aoi022ar1n02x3 U3859 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[244]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[148]), .o1(n3332) );
  b15aoi022ar1n02x3 U3860 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[212]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[20]), .o1(n3331) );
  b15aoi022ar1n02x3 U3861 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[116]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[180]), .o1(n3330) );
  b15nand04ar1n03x5 U3862 ( .a(n3333), .b(n3332), .c(n3331), .d(n3330), .o1(
        n3334) );
  b15and002ar1n02x5 U3863 ( .a(n3292), .b(n3334), .o(
        u_spi_device_tlul_plug_wdata_next[20]) );
  b15aoi022ar1n02x3 U3864 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[56]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[120]), .o1(n3338) );
  b15aoi022ar1n02x3 U3865 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[248]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[184]), .o1(n3337) );
  b15aoi022ar1n02x3 U3866 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[152]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[24]), .o1(n3336) );
  b15aoi022ar1n02x3 U3867 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[88]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[216]), .o1(n3335) );
  b15nand04ar1n03x5 U3868 ( .a(n3338), .b(n3337), .c(n3336), .d(n3335), .o1(
        n3339) );
  b15and002ar1n02x5 U3869 ( .a(n3292), .b(n3339), .o(
        u_spi_device_tlul_plug_wdata_next[24]) );
  b15aoi022ar1n02x3 U3870 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[53]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[21]), .o1(n3343) );
  b15aoi022ar1n02x3 U3871 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[245]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[149]), .o1(n3342) );
  b15aoi022ar1n02x3 U3872 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[85]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[213]), .o1(n3341) );
  b15aoi022ar1n02x3 U3873 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[117]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[181]), .o1(n3340) );
  b15nand04ar1n03x5 U3874 ( .a(n3343), .b(n3342), .c(n3341), .d(n3340), .o1(
        n3344) );
  b15and002ar1n02x5 U3875 ( .a(n3292), .b(n3344), .o(
        u_spi_device_tlul_plug_wdata_next[21]) );
  b15aoi022ar1n02x3 U3876 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[62]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[126]), .o1(n3348) );
  b15aoi022ar1n02x3 U3877 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[222]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[30]), .o1(n3347) );
  b15aoi022ar1n02x3 U3878 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[254]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[190]), .o1(n3346) );
  b15aoi022ar1n02x3 U3879 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[94]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[158]), .o1(n3345) );
  b15nand04ar1n03x5 U3880 ( .a(n3348), .b(n3347), .c(n3346), .d(n3345), .o1(
        n3349) );
  b15and002ar1n02x5 U3881 ( .a(n3292), .b(n3349), .o(
        u_spi_device_tlul_plug_wdata_next[30]) );
  b15aoi022ar1n02x3 U3882 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[42]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[170]), .o1(n3353) );
  b15aoi022ar1n02x3 U3883 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[138]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[10]), .o1(n3352) );
  b15aoi022ar1n02x3 U3884 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[234]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[106]), .o1(n3351) );
  b15aoi022ar1n02x3 U3885 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[74]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[202]), .o1(n3350) );
  b15nand04ar1n03x5 U3886 ( .a(n3353), .b(n3352), .c(n3351), .d(n3350), .o1(
        n3354) );
  b15and002ar1n02x5 U3887 ( .a(n3292), .b(n3354), .o(
        u_spi_device_tlul_plug_wdata_next[10]) );
  b15aoi022ar1n02x3 U3888 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[197]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[165]), .o1(n3359) );
  b15aoi022ar1n02x3 U3889 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[37]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[101]), .o1(n3358) );
  b15aoi022ar1n02x3 U3890 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[69]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[229]), .o1(n3357) );
  b15aoi022ar1n02x3 U3892 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[133]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[5]), .o1(n3356) );
  b15nand04ar1n03x5 U3893 ( .a(n3359), .b(n3358), .c(n3357), .d(n3356), .o1(
        n3360) );
  b15and002ar1n02x5 U3894 ( .a(n3292), .b(n3360), .o(
        u_spi_device_tlul_plug_wdata_next[5]) );
  b15aoi022ar1n02x3 U3895 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[38]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[6]), .o1(n3364) );
  b15aoi022ar1n02x3 U3896 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[70]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[134]), .o1(n3363) );
  b15aoi022ar1n02x3 U3897 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[198]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[230]), .o1(n3362) );
  b15aoi022ar1n02x3 U3898 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[102]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[166]), .o1(n3361) );
  b15nand04ar1n03x5 U3899 ( .a(n3364), .b(n3363), .c(n3362), .d(n3361), .o1(
        n3365) );
  b15and002ar1n02x5 U3900 ( .a(n3292), .b(n3365), .o(
        u_spi_device_tlul_plug_wdata_next[6]) );
  b15aoi022ar1n02x3 U3901 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[55]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[183]), .o1(n3369) );
  b15aoi022ar1n02x3 U3902 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[87]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[247]), .o1(n3368) );
  b15aoi022ar1n02x3 U3903 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[215]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[23]), .o1(n3367) );
  b15aoi022ar1n02x3 U3904 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[119]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[151]), .o1(n3366) );
  b15nand04ar1n03x5 U3905 ( .a(n3369), .b(n3368), .c(n3367), .d(n3366), .o1(
        n3370) );
  b15and002ar1n02x5 U3906 ( .a(n3292), .b(n3370), .o(
        u_spi_device_tlul_plug_wdata_next[23]) );
  b15aoi022ar1n02x3 U3907 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[109]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[13]), .o1(n3374) );
  b15aoi022ar1n02x3 U3908 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[77]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[205]), .o1(n3373) );
  b15aoi022ar1n02x3 U3909 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[45]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[141]), .o1(n3372) );
  b15aoi022ar1n02x3 U3910 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[237]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[173]), .o1(n3371) );
  b15nand04ar1n03x5 U3911 ( .a(n3374), .b(n3373), .c(n3372), .d(n3371), .o1(
        n3375) );
  b15and002ar1n02x5 U3912 ( .a(n3292), .b(n3375), .o(
        u_spi_device_tlul_plug_wdata_next[13]) );
  b15aoi022ar1n02x3 U3913 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[71]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[135]), .o1(n3379) );
  b15aoi022ar1n02x3 U3914 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[231]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[167]), .o1(n3378) );
  b15aoi022ar1n02x3 U3915 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[39]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[199]), .o1(n3377) );
  b15aoi022ar1n02x3 U3916 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[103]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[7]), .o1(n3376) );
  b15nand04ar1n03x5 U3917 ( .a(n3379), .b(n3378), .c(n3377), .d(n3376), .o1(
        n3380) );
  b15and002ar1n02x5 U3918 ( .a(n3292), .b(n3380), .o(
        u_spi_device_tlul_plug_wdata_next[7]) );
  b15aoi022ar1n02x3 U3919 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[110]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[142]), .o1(n3384) );
  b15aoi022ar1n02x3 U3920 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[78]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[206]), .o1(n3383) );
  b15aoi022ar1n02x3 U3921 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[46]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[14]), .o1(n3382) );
  b15aoi022ar1n02x3 U3922 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[238]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[174]), .o1(n3381) );
  b15nand04ar1n03x5 U3923 ( .a(n3384), .b(n3383), .c(n3382), .d(n3381), .o1(
        n3385) );
  b15and002ar1n02x5 U3924 ( .a(n3292), .b(n3385), .o(
        u_spi_device_tlul_plug_wdata_next[14]) );
  b15aoi022ar1n02x3 U3925 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[75]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[139]), .o1(n3389) );
  b15aoi022ar1n02x3 U3926 ( .a(n3281), .b(u_dcfifo_rx_u_din_buffer_data[11]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[171]), .o1(n3388) );
  b15aoi022ar1n02x3 U3927 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[43]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[203]), .o1(n3387) );
  b15aoi022ar1n02x3 U3928 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[235]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[107]), .o1(n3386) );
  b15nand04ar1n03x5 U3929 ( .a(n3389), .b(n3388), .c(n3387), .d(n3386), .o1(
        n3390) );
  b15and002ar1n02x5 U3930 ( .a(n3292), .b(n3390), .o(
        u_spi_device_tlul_plug_wdata_next[11]) );
  b15aoi022ar1n02x3 U3931 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[35]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[99]), .o1(n3394) );
  b15aoi022ar1n02x3 U3932 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[67]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[3]), .o1(n3393) );
  b15aoi022ar1n02x3 U3933 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[131]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[163]), .o1(n3392) );
  b15aoi022ar1n02x3 U3934 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[195]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[227]), .o1(n3391) );
  b15nand04ar1n03x5 U3935 ( .a(n3394), .b(n3393), .c(n3392), .d(n3391), .o1(
        n3395) );
  b15and002ar1n02x5 U3936 ( .a(n3292), .b(n3395), .o(
        u_spi_device_tlul_plug_wdata_next[3]) );
  b15aoi022ar1n02x3 U3937 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[124]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[188]), .o1(n3399) );
  b15aoi022ar1n02x3 U3938 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[156]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[28]), .o1(n3398) );
  b15aoi022ar1n02x3 U3939 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[60]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[220]), .o1(n3397) );
  b15aoi022ar1n02x3 U3940 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[92]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[252]), .o1(n3396) );
  b15nand04ar1n03x5 U3941 ( .a(n3399), .b(n3398), .c(n3397), .d(n3396), .o1(
        n3400) );
  b15and002ar1n02x5 U3942 ( .a(n3292), .b(n3400), .o(
        u_spi_device_tlul_plug_wdata_next[28]) );
  b15aoi022ar1n02x3 U3943 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[232]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[136]), .o1(n3404) );
  b15aoi022ar1n02x3 U3944 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[200]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[168]), .o1(n3403) );
  b15aoi022ar1n02x3 U3945 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[104]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[8]), .o1(n3402) );
  b15aoi022ar1n02x3 U3946 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[72]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[40]), .o1(n3401) );
  b15nand04ar1n03x5 U3947 ( .a(n3404), .b(n3403), .c(n3402), .d(n3401), .o1(
        n3405) );
  b15and002ar1n02x5 U3948 ( .a(n3292), .b(n3405), .o(
        u_spi_device_tlul_plug_wdata_next[8]) );
  b15aoi022ar1n02x3 U3949 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[240]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[144]), .o1(n3409) );
  b15aoi022ar1n02x3 U3950 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[112]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[16]), .o1(n3408) );
  b15aoi022ar1n02x3 U3951 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[208]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[176]), .o1(n3407) );
  b15aoi022ar1n02x3 U3952 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[80]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[48]), .o1(n3406) );
  b15nand04ar1n03x5 U3953 ( .a(n3409), .b(n3408), .c(n3407), .d(n3406), .o1(
        n3410) );
  b15and002ar1n02x5 U3954 ( .a(n3292), .b(n3410), .o(
        u_spi_device_tlul_plug_wdata_next[16]) );
  b15aoi022ar1n02x3 U3955 ( .a(n3281), .b(u_dcfifo_rx_u_din_buffer_data[4]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[164]), .o1(n3414) );
  b15aoi022ar1n02x3 U3956 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[196]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[132]), .o1(n3413) );
  b15aoi022ar1n02x3 U3957 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[228]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[100]), .o1(n3412) );
  b15aoi022ar1n02x3 U3958 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[68]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[36]), .o1(n3411) );
  b15nand04ar1n03x5 U3959 ( .a(n3414), .b(n3413), .c(n3412), .d(n3411), .o1(
        n3415) );
  b15and002ar1n02x5 U3960 ( .a(n3292), .b(n3415), .o(
        u_spi_device_tlul_plug_wdata_next[4]) );
  b15aoi022ar1n02x3 U3961 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[250]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[122]), .o1(n3420) );
  b15aoi022ar1n02x3 U3962 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[218]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[154]), .o1(n3419) );
  b15aoi022ar1n02x3 U3963 ( .a(n3281), .b(u_dcfifo_rx_u_din_buffer_data[26]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[186]), .o1(n3418) );
  b15aoi022ar1n02x3 U3964 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[90]), 
        .c(n3298), .d(u_dcfifo_rx_u_din_buffer_data[58]), .o1(n3417) );
  b15nand04ar1n03x5 U3965 ( .a(n3420), .b(n3419), .c(n3418), .d(n3417), .o1(
        n3421) );
  b15and002ar1n02x5 U3966 ( .a(n3292), .b(n3421), .o(
        u_spi_device_tlul_plug_wdata_next[26]) );
  b15aoi022ar1n02x3 U3967 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[76]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[204]), .o1(n3425) );
  b15aoi022ar1n02x3 U3968 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[140]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[12]), .o1(n3424) );
  b15aoi022ar1n02x3 U3969 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[236]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[108]), .o1(n3423) );
  b15aoi022ar1n02x3 U3970 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[44]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[172]), .o1(n3422) );
  b15nand04ar1n03x5 U3971 ( .a(n3425), .b(n3424), .c(n3423), .d(n3422), .o1(
        n3426) );
  b15and002ar1n02x5 U3972 ( .a(n3292), .b(n3426), .o(
        u_spi_device_tlul_plug_wdata_next[12]) );
  b15aoi022ar1n02x3 U3973 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[153]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[25]), .o1(n3430) );
  b15aoi022ar1n02x3 U3974 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[217]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[249]), .o1(n3429) );
  b15aoi022ar1n02x3 U3975 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[89]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[121]), .o1(n3428) );
  b15aoi022ar1n02x3 U3976 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[57]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[185]), .o1(n3427) );
  b15nand04ar1n03x5 U3977 ( .a(n3430), .b(n3429), .c(n3428), .d(n3427), .o1(
        n3431) );
  b15and002ar1n02x5 U3978 ( .a(n3292), .b(n3431), .o(
        u_spi_device_tlul_plug_wdata_next[25]) );
  b15aoi022ar1n02x3 U3979 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[64]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[160]), .o1(n3435) );
  b15aoi022ar1n02x3 U3980 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[96]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[0]), .o1(n3434) );
  b15aoi022ar1n02x3 U3981 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[224]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[128]), .o1(n3433) );
  b15aoi022ar1n02x3 U3982 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[32]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[192]), .o1(n3432) );
  b15nand04ar1n03x5 U3983 ( .a(n3435), .b(n3434), .c(n3433), .d(n3432), .o1(
        n3436) );
  b15and002ar1n02x5 U3984 ( .a(n3292), .b(n3436), .o(
        u_spi_device_tlul_plug_wdata_next[0]) );
  b15aoi022ar1n02x3 U3985 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[97]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[129]), .o1(n3445) );
  b15aoi022ar1n02x3 U3986 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[65]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[193]), .o1(n3444) );
  b15aoi022ar1n02x3 U3987 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[225]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[161]), .o1(n3443) );
  b15aoi022ar1n02x3 U3988 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[33]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[1]), .o1(n3442) );
  b15nand04ar1n03x5 U3989 ( .a(n3445), .b(n3444), .c(n3443), .d(n3442), .o1(
        n3446) );
  b15and002ar1n02x5 U3990 ( .a(n3292), .b(n3446), .o(
        u_spi_device_tlul_plug_wdata_next[1]) );
  b15aoi022ar1n02x3 U3991 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[155]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[27]), .o1(n3456) );
  b15aoi022ar1n02x3 U3992 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[251]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[123]), .o1(n3455) );
  b15aoi022ar1n02x3 U3993 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[91]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[187]), .o1(n3454) );
  b15aoi022ar1n02x3 U3994 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[59]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[219]), .o1(n3453) );
  b15nand04ar1n03x5 U3995 ( .a(n3456), .b(n3455), .c(n3454), .d(n3453), .o1(
        n3457) );
  b15and002ar1n02x5 U3996 ( .a(n3292), .b(n3457), .o(
        u_spi_device_tlul_plug_wdata_next[27]) );
  b15aoi022ar1n02x3 U3997 ( .a(n3271), .b(u_dcfifo_rx_u_din_buffer_data[115]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[179]), .o1(n3466) );
  b15aoi022ar1n02x3 U3998 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[83]), 
        .c(n3307), .d(u_dcfifo_rx_u_din_buffer_data[243]), .o1(n3465) );
  b15aoi022ar1n02x3 U3999 ( .a(n3286), .b(u_dcfifo_rx_u_din_buffer_data[147]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[19]), .o1(n3464) );
  b15aoi022ar1n02x3 U4000 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[51]), 
        .c(n3283), .d(u_dcfifo_rx_u_din_buffer_data[211]), .o1(n3463) );
  b15nand04ar1n03x5 U4001 ( .a(n3466), .b(n3465), .c(n3464), .d(n3463), .o1(
        n3467) );
  b15and002ar1n02x5 U4002 ( .a(n3292), .b(n3467), .o(
        u_spi_device_tlul_plug_wdata_next[19]) );
  b15aoi022ar1n02x3 U4003 ( .a(n3307), .b(u_dcfifo_rx_u_din_buffer_data[242]), 
        .c(n3281), .d(u_dcfifo_rx_u_din_buffer_data[18]), .o1(n3479) );
  b15aoi022ar1n02x3 U4004 ( .a(n3308), .b(u_dcfifo_rx_u_din_buffer_data[82]), 
        .c(n3286), .d(u_dcfifo_rx_u_din_buffer_data[146]), .o1(n3478) );
  b15aoi022ar1n02x3 U4005 ( .a(n3283), .b(u_dcfifo_rx_u_din_buffer_data[210]), 
        .c(n3271), .d(u_dcfifo_rx_u_din_buffer_data[114]), .o1(n3477) );
  b15aoi022ar1n02x3 U4006 ( .a(n3298), .b(u_dcfifo_rx_u_din_buffer_data[50]), 
        .c(n3274), .d(u_dcfifo_rx_u_din_buffer_data[178]), .o1(n3476) );
  b15nand04ar1n03x5 U4007 ( .a(n3479), .b(n3478), .c(n3477), .d(n3476), .o1(
        n3480) );
  b15and002ar1n02x5 U4008 ( .a(n3292), .b(n3480), .o(
        u_spi_device_tlul_plug_wdata_next[18]) );
  b15inv000ar1n03x5 U4009 ( .a(u_rxreg_N7), .o1(n3484) );
  b15oai012ar1n03x5 U4010 ( .b(u_device_sm_s_dummy_cycles[0]), .c(n3482), .a(
        n3487), .o1(n3483) );
  b15aoai13ar1n02x3 U4011 ( .c(n3485), .d(n3498), .b(n3484), .a(n3483), .o1(
        u_rxreg_counter_trgt_next[0]) );
  b15and003ar1n03x5 U4012 ( .a(n3487), .b(n3486), .c(
        u_device_sm_s_dummy_cycles[6]), .o(u_rxreg_counter_trgt_next[6]) );
  b15and003ar1n03x5 U4013 ( .a(n3487), .b(n3486), .c(
        u_device_sm_s_dummy_cycles[7]), .o(u_rxreg_counter_trgt_next[7]) );
  b15nor002ar1n03x5 U4014 ( .a(u_spi_device_tlul_plug_state[0]), .b(n3488), 
        .o1(u_spi_device_tlul_plug_N61) );
  b15nonb02ar1n02x3 U4016 ( .a(u_device_sm_tx_done_reg), .b(n3489), .out0(
        n3495) );
  b15oaoi13ar1n02x3 U4017 ( .c(n3492), .d(n3491), .b(u_device_sm_state[2]), 
        .a(n3490), .o1(n3493) );
  b15aoai13ar1n02x3 U4018 ( .c(en_quad), .d(n3495), .b(n3494), .a(n3493), .o1(
        n3497) );
  b15oaoi13ar1n02x3 U4019 ( .c(n3500), .d(n3499), .b(n3498), .a(n3497), .o1(
        n3501) );
  b15aoai13ar1n02x3 U4020 ( .c(n3504), .d(n3503), .b(n3734), .a(n3501), .o1(
        u_device_sm_tx_counter_next_3_) );
  b15aoai13ar1n02x3 U4021 ( .c(n3505), .d(u_dcfifo_tx_write_token[6]), .b(
        u_dcfifo_tx_write_token[0]), .a(u_dcfifo_tx_write_token[7]), .o1(n3534) );
  b15aoi012ar1n02x5 U4022 ( .b(u_dcfifo_tx_write_token[1]), .c(n3507), .a(
        n3506), .o1(n3532) );
  b15inv000ar1n03x5 U4023 ( .a(n3508), .o1(n3530) );
  b15oai112ar1n02x5 U4024 ( .c(n3512), .d(n3511), .a(n3510), .b(n3509), .o1(
        n3529) );
  b15nandp2ar1n03x5 U4025 ( .a(u_dcfifo_tx_write_token[0]), .b(
        u_dcfifo_tx_write_token[7]), .o1(n3514) );
  b15aoi012ar1n02x5 U4026 ( .b(n3515), .c(n3514), .a(n3513), .o1(n3528) );
  b15nandp2ar1n03x5 U4027 ( .a(u_dcfifo_tx_write_token[6]), .b(
        u_dcfifo_tx_write_token[5]), .o1(n3518) );
  b15nandp2ar1n03x5 U4028 ( .a(u_dcfifo_tx_write_token[1]), .b(
        u_dcfifo_tx_write_token[2]), .o1(n3516) );
  b15oai022ar1n02x5 U4029 ( .a(n3519), .b(n3518), .c(n3517), .d(n3516), .o1(
        n3520) );
  b15aoi013ar1n02x3 U4030 ( .b(u_dcfifo_tx_write_token[5]), .c(
        u_dcfifo_tx_write_token[4]), .d(n3521), .a(n3520), .o1(n3524) );
  b15oai112ar1n02x5 U4031 ( .c(n3522), .d(n3521), .a(
        u_dcfifo_tx_write_token[3]), .b(u_dcfifo_tx_write_token[4]), .o1(n3523) );
  b15oai112ar1n02x5 U4032 ( .c(n3526), .d(n3525), .a(n3524), .b(n3523), .o1(
        n3527) );
  b15aoi112ar1n02x3 U4033 ( .c(n3530), .d(n3529), .a(n3528), .b(n3527), .o1(
        n3531) );
  b15aoai13ar1n02x3 U4034 ( .c(n3534), .d(n3533), .b(n3532), .a(n3531), .o1(
        u_dcfifo_tx_u_din_full_full_dn) );
  b15aoi022ar1n02x3 U4035 ( .a(tl_o[63]), .b(tl_o[67]), .c(n3536), .d(n3535), 
        .o1(n3540) );
  b15aboi22ar1n02x3 U4036 ( .c(n3538), .d(n3537), .a(n3538), .b(tl_o[64]), 
        .out0(n3539) );
  b15xor002ar1n02x5 U4037 ( .a(n3540), .b(n3539), .out0(n3542) );
  b15xor002ar1n02x5 U4038 ( .a(n3542), .b(n3541), .out0(n3543) );
  b15xor002ar1n02x5 U4039 ( .a(n3544), .b(n3543), .out0(tl_o[8]) );
  b15aoi022ar1n02x3 U4040 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[160]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[128]), .o1(n3552) );
  b15aoi022ar1n02x3 U4041 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[0]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[64]), .o1(n3551) );
  b15aoi022ar1n02x3 U4042 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[32]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[224]), .o1(n3550) );
  b15aoi022ar1n02x3 U4043 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[192]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[96]), .o1(n3549) );
  b15nand04ar1n03x5 U4044 ( .a(n3552), .b(n3551), .c(n3550), .d(n3549), .o1(
        n3559) );
  b15aoi022ar1n02x3 U4045 ( .a(n3624), .b(u_device_sm_u_spiregs_n[16]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[8]), .o1(n3553) );
  b15aoai13ar1n02x3 U4046 ( .c(n3556), .d(n3732), .b(n3554), .a(n3553), .o1(
        n3557) );
  b15aoi012ar1n02x5 U4047 ( .b(u_device_sm_s_dummy_cycles[0]), .c(n3622), .a(
        n3557), .o1(n3558) );
  b15oab012ar1n02x5 U4048 ( .b(n3736), .c(n3559), .a(n3558), .out0(
        u_device_sm_N174) );
  b15aoi022ar1n02x3 U4049 ( .a(n3622), .b(u_device_sm_s_dummy_cycles[1]), .c(
        n3624), .d(u_device_sm_u_spiregs_n[15]), .o1(n3568) );
  b15aoi022ar1n02x3 U4050 ( .a(n3626), .b(u_device_sm_u_spiregs_reg0[1]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[7]), .o1(n3567) );
  b15aoi022ar1n02x3 U4051 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[1]), 
        .c(n2841), .d(u_dcfifo_tx_u_din_buffer_data[33]), .o1(n3563) );
  b15aoi022ar1n02x3 U4052 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[193]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[65]), .o1(n3562) );
  b15aoi022ar1n02x3 U4053 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[161]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[225]), .o1(n3561) );
  b15aoi022ar1n02x3 U4054 ( .a(n2816), .b(u_dcfifo_tx_u_din_buffer_data[129]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[97]), .o1(n3560) );
  b15nand04ar1n03x5 U4055 ( .a(n3563), .b(n3562), .c(n3561), .d(n3560), .o1(
        n3564) );
  b15nandp2ar1n03x5 U4056 ( .a(n3566), .b(n3564), .o1(n3565) );
  b15aoai13ar1n02x3 U4057 ( .c(n3568), .d(n3567), .b(n3566), .a(n3565), .o1(
        u_device_sm_N175) );
  b15aoi022ar1n02x3 U4058 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[34]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[98]), .o1(n3574) );
  b15aoi022ar1n02x3 U4059 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[2]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[226]), .o1(n3573) );
  b15aoi022ar1n02x3 U4060 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[162]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[130]), .o1(n3572) );
  b15aoi022ar1n02x3 U4061 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[194]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[66]), .o1(n3571) );
  b15nand04ar1n03x5 U4062 ( .a(n3574), .b(n3573), .c(n3572), .d(n3571), .o1(
        n3579) );
  b15aoi022ar1n02x3 U4063 ( .a(n3624), .b(u_device_sm_u_spiregs_n[14]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[6]), .o1(n3575) );
  b15oai012ar1n03x5 U4064 ( .b(n3605), .c(n3576), .a(n3575), .o1(n3577) );
  b15oaoi13ar1n02x3 U4065 ( .c(u_device_sm_u_spiregs_reg0[2]), .d(n3627), .b(
        n3626), .a(n3577), .o1(n3578) );
  b15oab012ar1n02x5 U4066 ( .b(n3736), .c(n3579), .a(n3578), .out0(
        u_device_sm_N176) );
  b15aoi022ar1n02x3 U4067 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[35]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[163]), .o1(n3583) );
  b15aoi022ar1n02x3 U4068 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[3]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[67]), .o1(n3582) );
  b15aoi022ar1n02x3 U4069 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[195]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[131]), .o1(n3581) );
  b15aoi022ar1n02x3 U4070 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[227]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[99]), .o1(n3580) );
  b15nand04ar1n03x5 U4071 ( .a(n3583), .b(n3582), .c(n3581), .d(n3580), .o1(
        n3587) );
  b15aoi022ar1n02x3 U4072 ( .a(n3624), .b(u_device_sm_u_spiregs_n[13]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[5]), .o1(n3584) );
  b15aob012ar1n03x5 U4073 ( .b(n3622), .c(u_device_sm_s_dummy_cycles[3]), .a(
        n3584), .out0(n3585) );
  b15oaoi13ar1n02x3 U4074 ( .c(u_device_sm_u_spiregs_reg0[3]), .d(n3627), .b(
        n3626), .a(n3585), .o1(n3586) );
  b15oab012ar1n02x5 U4075 ( .b(n3736), .c(n3587), .a(n3586), .out0(
        u_device_sm_N177) );
  b15aoi022ar1n02x3 U4076 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[4]), 
        .c(n2876), .d(u_dcfifo_tx_u_din_buffer_data[196]), .o1(n3592) );
  b15aoi022ar1n02x3 U4077 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[36]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[100]), .o1(n3591) );
  b15aoi022ar1n02x3 U4078 ( .a(n2828), .b(u_dcfifo_tx_u_din_buffer_data[164]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[228]), .o1(n3590) );
  b15aoi022ar1n02x3 U4079 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[68]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[132]), .o1(n3589) );
  b15nand04ar1n03x5 U4080 ( .a(n3592), .b(n3591), .c(n3590), .d(n3589), .o1(
        n3596) );
  b15aoi022ar1n02x3 U4081 ( .a(n3624), .b(u_device_sm_u_spiregs_n[12]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[4]), .o1(n3593) );
  b15aob012ar1n03x5 U4082 ( .b(n3622), .c(u_device_sm_s_dummy_cycles[4]), .a(
        n3593), .out0(n3594) );
  b15oaoi13ar1n02x3 U4083 ( .c(u_device_sm_u_spiregs_reg0[4]), .d(n3627), .b(
        n3626), .a(n3594), .o1(n3595) );
  b15oab012ar1n02x5 U4084 ( .b(n3736), .c(n3596), .a(n3595), .out0(
        u_device_sm_N178) );
  b15aoi022ar1n02x3 U4085 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[197]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[133]), .o1(n3602) );
  b15aoi022ar1n02x3 U4086 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[37]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[101]), .o1(n3601) );
  b15aoi022ar1n02x3 U4087 ( .a(n2820), .b(u_dcfifo_tx_u_din_buffer_data[69]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[165]), .o1(n3600) );
  b15aoi022ar1n02x3 U4088 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[5]), 
        .c(n2825), .d(u_dcfifo_tx_u_din_buffer_data[229]), .o1(n3599) );
  b15nand04ar1n03x5 U4089 ( .a(n3602), .b(n3601), .c(n3600), .d(n3599), .o1(
        n3608) );
  b15aoi022ar1n02x3 U4090 ( .a(n3624), .b(u_device_sm_u_spiregs_n[11]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[3]), .o1(n3603) );
  b15oai012ar1n03x5 U4091 ( .b(n3605), .c(n3604), .a(n3603), .o1(n3606) );
  b15oaoi13ar1n02x3 U4092 ( .c(u_device_sm_u_spiregs_reg0[5]), .d(n3627), .b(
        n3626), .a(n3606), .o1(n3607) );
  b15oab012ar1n02x5 U4093 ( .b(n3736), .c(n3608), .a(n3607), .out0(
        u_device_sm_N179) );
  b15aoi022ar1n02x3 U4094 ( .a(n2876), .b(u_dcfifo_tx_u_din_buffer_data[198]), 
        .c(n2820), .d(u_dcfifo_tx_u_din_buffer_data[70]), .o1(n3620) );
  b15aoi022ar1n02x3 U4095 ( .a(n2825), .b(u_dcfifo_tx_u_din_buffer_data[230]), 
        .c(n2830), .d(u_dcfifo_tx_u_din_buffer_data[102]), .o1(n3619) );
  b15aoi022ar1n02x3 U4096 ( .a(n2841), .b(u_dcfifo_tx_u_din_buffer_data[38]), 
        .c(n2816), .d(u_dcfifo_tx_u_din_buffer_data[134]), .o1(n3618) );
  b15aoi022ar1n02x3 U4097 ( .a(n3010), .b(u_dcfifo_tx_u_din_buffer_data[6]), 
        .c(n2828), .d(u_dcfifo_tx_u_din_buffer_data[166]), .o1(n3617) );
  b15nand04ar1n03x5 U4098 ( .a(n3620), .b(n3619), .c(n3618), .d(n3617), .o1(
        n3629) );
  b15aoi022ar1n02x3 U4099 ( .a(n3622), .b(u_device_sm_s_dummy_cycles[6]), .c(
        n3621), .d(u_device_sm_u_spiregs_n[2]), .o1(n3623) );
  b15aob012ar1n03x5 U4100 ( .b(n3624), .c(u_device_sm_u_spiregs_n[10]), .a(
        n3623), .out0(n3625) );
  b15oaoi13ar1n02x3 U4101 ( .c(u_device_sm_u_spiregs_reg0[6]), .d(n3627), .b(
        n3626), .a(n3625), .o1(n3628) );
  b15oab012ar1n02x5 U4102 ( .b(n3736), .c(n3629), .a(n3628), .out0(
        u_device_sm_N180) );
  b15aoi022ar1n02x3 U4104 ( .a(tl_o[86]), .b(tl_o[87]), .c(n3632), .d(n3631), 
        .o1(n3633) );
  b15xor002ar1n02x5 U4105 ( .a(n3634), .b(n3633), .out0(n3637) );
  b15xor002ar1n02x5 U4106 ( .a(tl_o[74]), .b(n3635), .out0(n3636) );
  b15xor002ar1n02x5 U4107 ( .a(n3637), .b(n3636), .out0(n3640) );
  b15aboi22ar1n02x3 U4108 ( .c(tl_o[71]), .d(n3638), .a(tl_o[71]), .b(tl_o[76]), .out0(n3639) );
  b15xor002ar1n02x5 U4109 ( .a(n3640), .b(n3639), .out0(n3644) );
  b15aoi022ar1n02x3 U4110 ( .a(tl_o[90]), .b(tl_o[66]), .c(n3642), .d(n3641), 
        .o1(n3643) );
  b15xor002ar1n02x5 U4111 ( .a(n3644), .b(n3643), .out0(n3645) );
  b15xor002ar1n02x5 U4112 ( .a(n3646), .b(n3645), .out0(tl_o[14]) );
  b15inv000ar1n03x5 U4113 ( .a(tl_o[92]), .o1(n3648) );
  b15nand03ar1n03x5 U4114 ( .a(tl_o[108]), .b(tl_i[0]), .c(n3648), .o1(n3647)
         );
  b15aoai13ar1n02x3 U4115 ( .c(tl_i[0]), .d(tl_o[108]), .b(n3648), .a(n3647), 
        .o1(n604) );
  b15nor002ar1n03x5 U3152 ( .a(n3506), .b(n2829), .o1(n2841) );
  b15nor002ar1n03x5 U3155 ( .a(n2819), .b(n2821), .o1(n2820) );
  b15nor002ar1n03x5 U3159 ( .a(n3505), .b(n2821), .o1(n3010) );
  b15nor002ar1n03x5 U3775 ( .a(n3279), .b(n3275), .o1(n3271) );
  b15nor002ar1n03x5 U3780 ( .a(n3279), .b(n3284), .o1(n3274) );
  b15nor002ar1n03x5 U3787 ( .a(n3279), .b(n3280), .o1(n3298) );
  b15nor002ar1n03x5 U3791 ( .a(n3279), .b(n3282), .o1(n3307) );
  b15aoi022ar1n04x5 U2984 ( .a(n3723), .b(n3003), .c(n3105), .d(n3724), .o1(
        ctrl_data_rx[6]) );
  b15aoi022ar1n04x5 U2998 ( .a(n3723), .b(n2752), .c(n2992), .d(n3724), .o1(
        ctrl_data_rx[3]) );
  b15aoi022ar1n04x5 U3000 ( .a(n3723), .b(n3002), .c(n3104), .d(n3724), .o1(
        ctrl_data_rx[4]) );
  b15nor002ar1n03x5 U3793 ( .a(n3285), .b(n3280), .o1(n3281) );
  b15nor002ar1n03x5 U3800 ( .a(n3285), .b(n3284), .o1(n3286) );
  b15inv000ar1n03x5 U2917 ( .a(spi_cs), .o1(n3681) );
  b15inv000ar1n03x5 U2921 ( .a(spi_cs), .o1(n3685) );
  b15inv000ar1n03x5 U2923 ( .a(spi_cs), .o1(n3687) );
  b15inv000ar1n03x5 U2929 ( .a(spi_sclk), .o1(n3693) );
  b15bfn000ar1n02x5 U2930 ( .a(spi_sclk), .o(n3694) );
  b15inv000ar1n03x5 U3145 ( .a(n1869), .o1(n3722) );
  b15bfn000ar1n02x5 U3148 ( .a(n1869), .o(n3723) );
  b15inv000ar1n03x5 U3149 ( .a(n3723), .o1(n3724) );
  b15inv000ar1n03x5 U3156 ( .a(n1869), .o1(n3726) );
  b15inv000ar1n03x5 U3160 ( .a(en_quad), .o1(n3728) );
  b15inv000ar1n03x5 U3164 ( .a(en_quad), .o1(n3730) );
  b15bfn000ar1n02x5 U3167 ( .a(en_quad), .o(n3731) );
  b15inv000ar1n03x5 U3168 ( .a(n3731), .o1(n3732) );
  b15inv000ar1n03x5 U3170 ( .a(n2993), .o1(n3733) );
  b15inv000ar1n03x5 U3171 ( .a(n2757), .o1(n3734) );
  b15inv000ar1n03x5 U3175 ( .a(n2975), .o1(n3735) );
  b15inv000ar1n03x5 U3177 ( .a(n3566), .o1(n3736) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[3]), .ssb(1'b1), .clk(n3694), .psb(rst_ni), 
        .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[3]) );
  b15fqy00car1n02x5 u_rxreg_counter_trgt_reg_0_ ( .si(1'b0), .d(
        u_rxreg_counter_trgt_next[0]), .ssb(1'b1), .clk(u_rxreg_net873), .psb(
        n3683), .o(u_rxreg_counter_trgt[0]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[2]), .ssb(1'b1), .clk(n3694), .psb(rst_ni), 
        .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[2]) );
  b15fqy00car1n02x5 u_device_sm_u_spiregs_reg1_reg_5_ ( .si(1'b0), .d(n3735), 
        .ssb(1'b1), .clk(u_device_sm_u_spiregs_net802), .psb(rst_ni), .o(
        u_device_sm_s_dummy_cycles[5]) );
  b15fqy00car1n02x5 u_txreg_counter_trgt_reg_0_ ( .si(1'b0), .d(tx_counter[0]), 
        .ssb(1'b1), .clk(u_txreg_net840), .psb(n3685), .o(
        u_txreg_counter_trgt[0]) );
  b15fqy00car1n02x5 u_txreg_counter_trgt_reg_1_ ( .si(1'b0), .d(tx_counter[1]), 
        .ssb(1'b1), .clk(u_txreg_net840), .psb(n3679), .o(
        u_txreg_counter_trgt[1]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[2]), .ssb(1'b1), .clk(
        spi_sclk), .psb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[2]) );
  b15fqy00car1n02x5 u_txreg_counter_trgt_reg_2_ ( .si(1'b0), .d(tx_counter[2]), 
        .ssb(1'b1), .clk(u_txreg_net840), .psb(n3685), .o(
        u_txreg_counter_trgt[2]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[3]), .ssb(1'b1), .clk(
        spi_sclk), .psb(rst_ni), .o(u_dcfifo_tx_u_dout_write_token_dn[3]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_0_ ( .si(1'b0), .d(
        u_dcfifo_tx_u_dout_read_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .psb(rst_ni), .o(
        u_dcfifo_tx_u_dout_read_token[0]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_1_ ( .si(1'b0), .d(
        u_dcfifo_tx_u_dout_read_token[0]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .psb(rst_ni), .o(
        u_dcfifo_tx_u_dout_read_token[1]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_2_ ( .si(1'b0), .d(
        u_dcfifo_rx_write_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .psb(rst_ni), .o(
        u_dcfifo_rx_write_token[2]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_3_ ( .si(1'b0), .d(
        u_dcfifo_rx_write_token[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .psb(rst_ni), .o(
        u_dcfifo_rx_write_token[3]) );
  b15fqy00car1n02x5 u_syncro_cs_reg_reg_0_ ( .si(1'b0), .d(spi_cs), .ssb(1'b1), 
        .clk(clk_i), .psb(rst_ni), .o(u_syncro_cs_reg_0_) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_rx_write_token[3]), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), 
        .o(u_dcfifo_rx_u_dout_empty_synch_d_middle[3]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_rx_write_token[2]), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), 
        .o(u_dcfifo_rx_u_dout_empty_synch_d_middle[2]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_3_ ( .si(1'b0), .d(
        u_dcfifo_tx_write_token[2]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .psb(rst_ni), .o(
        u_dcfifo_tx_write_token[3]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_2_ ( .si(1'b0), .d(
        u_dcfifo_tx_write_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .psb(rst_ni), .o(
        u_dcfifo_tx_write_token[2]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_rx_u_dout_empty_synch_d_middle[3]), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(u_dcfifo_rx_u_dout_write_token_dn[3]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_rx_u_dout_empty_synch_d_middle[2]), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), .o(u_dcfifo_rx_u_dout_write_token_dn[2]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_0_ ( .si(1'b0), .d(
        u_dcfifo_rx_u_dout_read_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .psb(rst_ni), .o(
        u_dcfifo_rx_u_dout_read_token[0]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_1_ ( .si(1'b0), .d(
        u_dcfifo_rx_u_dout_read_token[0]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .psb(rst_ni), .o(
        u_dcfifo_rx_u_dout_read_token[1]) );
  b15fqy003ar1n03x5 u_device_sm_tx_data_valid_reg ( .si(1'b0), .d(
        u_device_sm_tx_data_valid_next), .ssb(1'b1), .clk(spi_sclk), .rb(n3683), .o(tx_data_valid) );
  b15bfn000ar1n02x5 U2932 ( .a(rst_ni), .o(n3696) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_counter_trgt_reg_latch ( .clk(spi_sclk), 
        .en(u_rxreg_N7), .te(1'b0), .clkout(u_rxreg_net873) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_data_int_reg_0_latch ( .clk(n3694), .en(
        n3722), .te(1'b0), .clkout(u_rxreg_net868) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_data_int_reg_latch ( .clk(spi_sclk), .en(
        n3724), .te(1'b0), .clkout(u_rxreg_net863) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_counter_reg_latch ( .clk(spi_sclk), .en(
        n3724), .te(1'b0), .clkout(u_rxreg_net857) );
  b15cilb05ah1n02x3 u_txreg_clk_gate_counter_trgt_reg_latch ( .clk(
        u_txreg_sclk_test), .en(tx_counter_upd), .te(1'b0), .clkout(
        u_txreg_net840) );
  b15cilb05ah1n02x3 u_txreg_clk_gate_data_int_reg_0_latch ( .clk(
        u_txreg_sclk_test), .en(u_txreg_N11), .te(1'b0), .clkout(
        u_txreg_net835) );
  b15cilb05ah1n02x3 u_txreg_clk_gate_data_int_reg_latch ( .clk(
        u_txreg_sclk_test), .en(u_txreg_N11), .te(1'b0), .clkout(
        u_txreg_net830) );
  b15cilb05ah1n02x3 u_txreg_clk_gate_counter_reg_latch ( .clk(
        u_txreg_sclk_test), .en(u_txreg_N11), .te(1'b0), .clkout(
        u_txreg_net824) );
  b15cilb05ah1n02x3 u_device_sm_clk_gate_cmd_reg_reg_latch ( .clk(spi_sclk), 
        .en(u_device_sm_sample_CMD), .te(1'b0), .clkout(u_device_sm_net774) );
  b15cilb05ah1n02x3 u_device_sm_clk_gate_addr_reg_reg_0_latch ( .clk(spi_sclk), 
        .en(u_device_sm_sample_ADDR), .te(1'b0), .clkout(u_device_sm_net769)
         );
  b15cilb05ah1n02x3 u_device_sm_clk_gate_addr_reg_reg_latch ( .clk(spi_sclk), 
        .en(u_device_sm_sample_ADDR), .te(1'b0), .clkout(u_device_sm_net763)
         );
  b15cilb05ah1n02x3 u_spi_device_tlul_plug_clk_gate_addr_reg_0_latch ( .clk(
        clk_i), .en(u_spi_device_tlul_plug_N61), .te(1'b0), .clkout(
        u_spi_device_tlul_plug_net617) );
  b15cilb05ah1n02x3 u_spi_device_tlul_plug_clk_gate_addr_reg_latch ( .clk(
        clk_i), .en(u_spi_device_tlul_plug_N61), .te(1'b0), .clkout(
        u_spi_device_tlul_plug_net611) );
  b15cilb05ah1n02x3 u_device_sm_u_spiregs_clk_gate_reg2_reg_latch ( .clk(
        spi_sclk), .en(u_device_sm_u_spiregs_N34), .te(1'b0), .clkout(
        u_device_sm_u_spiregs_net807) );
  b15cilb05ah1n02x3 u_device_sm_u_spiregs_clk_gate_reg1_reg_latch ( .clk(
        spi_sclk), .en(u_device_sm_u_spiregs_N33), .te(1'b0), .clkout(
        u_device_sm_u_spiregs_net802) );
  b15cilb05ah1n02x3 u_device_sm_u_spiregs_clk_gate_reg0_reg_latch ( .clk(
        spi_sclk), .en(u_device_sm_u_spiregs_N32), .te(1'b0), .clkout(
        u_device_sm_u_spiregs_net797) );
  b15cilb05ah1n02x3 u_device_sm_u_spiregs_clk_gate_reg3_reg_latch ( .clk(
        spi_sclk), .en(u_device_sm_u_spiregs_N31), .te(1'b0), .clkout(
        u_device_sm_u_spiregs_net791) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_0__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N26), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net746) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_0__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N26), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net741) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_1__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N27), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net736) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_1__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N27), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net731) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_2__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N28), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net726) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_2__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N28), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net721) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_3__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N29), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net716) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_3__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N29), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net711) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_4__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N30), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net706) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_4__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N30), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net701) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_5__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N31), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net696) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_5__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N31), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net691) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_6__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N32), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net686) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_6__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N32), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net681) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_7__0_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N33), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net676) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_buffer_clk_gate_data_reg_7__latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_buffer_N33), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_buffer_net670) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_din_write_tr_clk_gate_state_reg_latch ( 
        .clk(clk_i), .en(u_dcfifo_tx_u_din_write_enable), .te(1'b0), .clkout(
        u_dcfifo_tx_u_din_write_tr_net652) );
  b15cilb05ah1n02x3 u_dcfifo_tx_u_dout_read_tr_clk_gate_state_reg_latch ( 
        .clk(n3694), .en(u_dcfifo_tx_u_dout_read_enable), .te(1'b0), .clkout(
        u_dcfifo_tx_u_dout_read_tr_net634) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_0__0_latch ( 
        .clk(n3694), .en(u_dcfifo_rx_u_din_buffer_N26), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net746) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_0__latch ( 
        .clk(n3694), .en(u_dcfifo_rx_u_din_buffer_N26), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net741) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_1__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N27), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net736) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_1__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N27), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net731) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_2__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N28), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net726) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_2__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N28), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net721) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_3__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N29), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net716) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_3__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N29), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net711) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_4__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N30), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net706) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_4__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N30), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net701) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_5__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N31), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net696) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_5__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N31), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net691) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_6__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N32), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net686) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_6__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N32), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net681) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_7__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N33), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net676) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_7__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N33), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net670) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_write_tr_clk_gate_state_reg_latch ( 
        .clk(n3694), .en(u_dcfifo_rx_u_din_write_enable), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_write_tr_net652) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_dout_read_tr_clk_gate_state_reg_latch ( 
        .clk(clk_i), .en(n2723), .te(1'b0), .clkout(
        u_dcfifo_rx_u_dout_read_tr_net634) );
  b15fqy203ar1n02x5 u_rxreg_counter_trgt_reg_1__u_rxreg_counter_trgt_reg_2_ ( 
        .si1(1'b0), .d1(u_rxreg_counter_trgt_next[1]), .ssb(1'b1), .clk(
        u_rxreg_net873), .rb(n3683), .o1(u_rxreg_counter_trgt[1]), .si2(1'b0), 
        .d2(u_rxreg_counter_trgt_next[2]), .o2(u_rxreg_counter_trgt[2]) );
  b15fqy203ar1n02x5 u_rxreg_counter_trgt_reg_3__u_rxreg_counter_trgt_reg_4_ ( 
        .si1(1'b0), .d1(u_rxreg_counter_trgt_next[3]), .ssb(1'b1), .clk(
        u_rxreg_net873), .rb(n3683), .o1(u_rxreg_counter_trgt[3]), .si2(1'b0), 
        .d2(u_rxreg_counter_trgt_next[4]), .o2(u_rxreg_counter_trgt[4]) );
  b15fqy203ar1n02x5 u_rxreg_counter_trgt_reg_5__u_rxreg_counter_trgt_reg_6_ ( 
        .si1(1'b0), .d1(u_rxreg_counter_trgt_next[5]), .ssb(1'b1), .clk(
        u_rxreg_net873), .rb(n3683), .o1(u_rxreg_counter_trgt[5]), .si2(1'b0), 
        .d2(u_rxreg_counter_trgt_next[6]), .o2(u_rxreg_counter_trgt[6]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_16__u_rxreg_data_int_reg_17_ ( .si1(
        1'b0), .d1(u_rxreg_N45), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[16]), .si2(1'b0), .d2(u_rxreg_N46), .o2(
        u_rxreg_data_int[17]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_18__u_rxreg_data_int_reg_19_ ( .si1(
        1'b0), .d1(u_rxreg_N47), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[18]), .si2(1'b0), .d2(u_rxreg_N48), .o2(
        u_rxreg_data_int[19]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_20__u_rxreg_data_int_reg_21_ ( .si1(
        1'b0), .d1(u_rxreg_N49), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[20]), .si2(1'b0), .d2(u_rxreg_N50), .o2(
        u_rxreg_data_int[21]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_22__u_rxreg_data_int_reg_23_ ( .si1(
        1'b0), .d1(u_rxreg_N51), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[22]), .si2(1'b0), .d2(u_rxreg_N52), .o2(
        u_rxreg_data_int[23]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_24__u_rxreg_data_int_reg_25_ ( .si1(
        1'b0), .d1(u_rxreg_N53), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[24]), .si2(1'b0), .d2(u_rxreg_N54), .o2(
        u_rxreg_data_int[25]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_26__u_rxreg_data_int_reg_27_ ( .si1(
        1'b0), .d1(u_rxreg_N55), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[26]), .si2(1'b0), .d2(u_rxreg_N56), .o2(
        u_rxreg_data_int[27]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_28__u_rxreg_data_int_reg_29_ ( .si1(
        1'b0), .d1(u_rxreg_N57), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[28]), .si2(1'b0), .d2(u_rxreg_N58), .o2(
        u_rxreg_data_int[29]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_30__u_rxreg_data_int_reg_31_ ( .si1(
        1'b0), .d1(u_rxreg_N59), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3680), 
        .o1(u_rxreg_data_int[30]), .si2(1'b0), .d2(u_rxreg_N60), .o2(
        u_rxreg_data_int[31]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_0__u_rxreg_data_int_reg_1_ ( .si1(
        1'b0), .d1(spi_sdi0), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[0]), .si2(1'b0), .d2(u_rxreg_N30), .o2(
        u_rxreg_data_int[1]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_2__u_rxreg_data_int_reg_3_ ( .si1(
        1'b0), .d1(u_rxreg_N31), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[2]), .si2(1'b0), .d2(u_rxreg_N32), .o2(
        u_rxreg_data_int[3]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_4__u_rxreg_data_int_reg_5_ ( .si1(
        1'b0), .d1(u_rxreg_N33), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[4]), .si2(1'b0), .d2(u_rxreg_N34), .o2(
        u_rxreg_data_int[5]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_6__u_rxreg_data_int_reg_7_ ( .si1(
        1'b0), .d1(u_rxreg_N35), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[6]), .si2(1'b0), .d2(u_rxreg_N36), .o2(
        u_rxreg_data_int[7]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_8__u_rxreg_data_int_reg_9_ ( .si1(
        1'b0), .d1(u_rxreg_N37), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[8]), .si2(1'b0), .d2(u_rxreg_N38), .o2(
        u_rxreg_data_int[9]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_10__u_rxreg_data_int_reg_11_ ( .si1(
        1'b0), .d1(u_rxreg_N39), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[10]), .si2(1'b0), .d2(u_rxreg_N40), .o2(
        u_rxreg_data_int[11]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_12__u_rxreg_data_int_reg_13_ ( .si1(
        1'b0), .d1(u_rxreg_N41), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[12]), .si2(1'b0), .d2(u_rxreg_N42), .o2(
        u_rxreg_data_int[13]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_14__u_rxreg_data_int_reg_15_ ( .si1(
        1'b0), .d1(u_rxreg_N43), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3680), 
        .o1(u_rxreg_data_int[14]), .si2(1'b0), .d2(u_rxreg_N44), .o2(
        u_rxreg_data_int[15]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_0__u_rxreg_counter_reg_1_ ( .si1(1'b0), 
        .d1(u_rxreg_N22), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3683), .o1(
        u_rxreg_counter[0]), .si2(1'b0), .d2(u_rxreg_N23), .o2(
        u_rxreg_counter[1]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_2__u_rxreg_counter_reg_3_ ( .si1(1'b0), 
        .d1(u_rxreg_N24), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3683), .o1(
        u_rxreg_counter[2]), .si2(1'b0), .d2(u_rxreg_N25), .o2(
        u_rxreg_counter[3]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_4__u_rxreg_counter_reg_5_ ( .si1(1'b0), 
        .d1(u_rxreg_N26), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3683), .o1(
        u_rxreg_counter[4]), .si2(1'b0), .d2(u_rxreg_N27), .o2(
        u_rxreg_counter[5]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_6__u_rxreg_counter_reg_7_ ( .si1(1'b0), 
        .d1(u_rxreg_N28), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3683), .o1(
        u_rxreg_counter[6]), .si2(1'b0), .d2(u_rxreg_N29), .o2(
        u_rxreg_counter[7]) );
  b15fqy203ar1n02x5 u_txreg_counter_trgt_reg_3__u_txreg_counter_trgt_reg_4_ ( 
        .si1(1'b0), .d1(tx_counter[3]), .ssb(1'b1), .clk(u_txreg_net840), .rb(
        n3685), .o1(u_txreg_counter_trgt[3]), .si2(1'b0), .d2(tx_counter[4]), 
        .o2(u_txreg_counter_trgt[4]) );
  b15fqy203ar1n02x5 u_txreg_counter_trgt_reg_5__u_txreg_counter_trgt_reg_6_ ( 
        .si1(1'b0), .d1(tx_counter[5]), .ssb(1'b1), .clk(u_txreg_net840), .rb(
        n3679), .o1(u_txreg_counter_trgt[5]), .si2(1'b0), .d2(tx_counter[6]), 
        .o2(u_txreg_counter_trgt[6]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_16__u_txreg_data_int_reg_17_ ( .si1(
        1'b0), .d1(u_txreg_N50), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3681), 
        .o1(u_txreg_data_int[16]), .si2(1'b0), .d2(u_txreg_N51), .o2(
        u_txreg_data_int[17]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_18__u_txreg_data_int_reg_19_ ( .si1(
        1'b0), .d1(u_txreg_N52), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3681), 
        .o1(u_txreg_data_int[18]), .si2(1'b0), .d2(u_txreg_N53), .o2(
        u_txreg_data_int[19]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_20__u_txreg_data_int_reg_21_ ( .si1(
        1'b0), .d1(u_txreg_N54), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3681), 
        .o1(u_txreg_data_int[20]), .si2(1'b0), .d2(u_txreg_N55), .o2(
        u_txreg_data_int[21]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_22__u_txreg_data_int_reg_23_ ( .si1(
        1'b0), .d1(u_txreg_N56), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3681), 
        .o1(u_txreg_data_int[22]), .si2(1'b0), .d2(u_txreg_N57), .o2(
        u_txreg_data_int[23]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_24__u_txreg_data_int_reg_25_ ( .si1(
        1'b0), .d1(u_txreg_N58), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3681), 
        .o1(u_txreg_data_int[24]), .si2(1'b0), .d2(u_txreg_N59), .o2(
        u_txreg_data_int[25]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_26__u_txreg_data_int_reg_27_ ( .si1(
        1'b0), .d1(u_txreg_N60), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3681), 
        .o1(u_txreg_data_int[26]), .si2(1'b0), .d2(u_txreg_N61), .o2(
        u_txreg_data_int[27]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_28__u_txreg_data_int_reg_29_ ( .si1(
        1'b0), .d1(u_txreg_N62), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3686), 
        .o1(u_txreg_data_int[28]), .si2(1'b0), .d2(u_txreg_N63), .o2(
        u_txreg_data_int[29]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_30__u_txreg_data_int_reg_31_ ( .si1(
        1'b0), .d1(u_txreg_N64), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3686), 
        .o1(u_txreg_data_int[30]), .si2(1'b0), .d2(u_txreg_N65), .o2(
        u_txreg_data_int[31]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_0__u_txreg_data_int_reg_1_ ( .si1(
        1'b0), .d1(u_txreg_N34), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3686), 
        .o1(u_txreg_data_int[0]), .si2(1'b0), .d2(u_txreg_N35), .o2(
        u_txreg_data_int[1]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_2__u_txreg_data_int_reg_3_ ( .si1(
        1'b0), .d1(u_txreg_N36), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3686), 
        .o1(u_txreg_data_int[2]), .si2(1'b0), .d2(u_txreg_N37), .o2(
        u_txreg_data_int[3]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_4__u_txreg_data_int_reg_5_ ( .si1(
        1'b0), .d1(u_txreg_N38), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3686), 
        .o1(u_txreg_data_int[4]), .si2(1'b0), .d2(u_txreg_N39), .o2(
        u_txreg_data_int[5]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_6__u_txreg_data_int_reg_7_ ( .si1(
        1'b0), .d1(u_txreg_N40), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3686), 
        .o1(u_txreg_data_int[6]), .si2(1'b0), .d2(u_txreg_N41), .o2(
        u_txreg_data_int[7]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_8__u_txreg_data_int_reg_9_ ( .si1(
        1'b0), .d1(u_txreg_N42), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3681), 
        .o1(u_txreg_data_int[8]), .si2(1'b0), .d2(u_txreg_N43), .o2(
        u_txreg_data_int[9]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_10__u_txreg_data_int_reg_11_ ( .si1(
        1'b0), .d1(u_txreg_N44), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3681), 
        .o1(u_txreg_data_int[10]), .si2(1'b0), .d2(u_txreg_N45), .o2(
        u_txreg_data_int[11]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_12__u_txreg_data_int_reg_13_ ( .si1(
        1'b0), .d1(u_txreg_N46), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3681), 
        .o1(u_txreg_data_int[12]), .si2(1'b0), .d2(u_txreg_N47), .o2(
        u_txreg_data_int[13]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_14__u_txreg_data_int_reg_15_ ( .si1(
        1'b0), .d1(u_txreg_N48), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3681), 
        .o1(u_txreg_data_int[14]), .si2(1'b0), .d2(u_txreg_N49), .o2(
        u_txreg_data_int[15]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_0__u_txreg_counter_reg_1_ ( .si1(1'b0), 
        .d1(u_txreg_N24), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3679), .o1(
        u_txreg_counter[0]), .si2(1'b0), .d2(u_txreg_N25), .o2(
        u_txreg_counter[1]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_2__u_txreg_counter_reg_3_ ( .si1(1'b0), 
        .d1(u_txreg_N26), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3679), .o1(
        u_txreg_counter[2]), .si2(1'b0), .d2(u_txreg_N27), .o2(
        u_txreg_counter[3]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_4__u_txreg_counter_reg_5_ ( .si1(1'b0), 
        .d1(u_txreg_N28), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3679), .o1(
        u_txreg_counter[4]), .si2(1'b0), .d2(u_txreg_N29), .o2(
        u_txreg_counter[5]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_6__u_txreg_counter_reg_7_ ( .si1(1'b0), 
        .d1(u_txreg_N30), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3685), .o1(
        u_txreg_counter[6]), .si2(1'b0), .d2(u_txreg_N31), .o2(
        u_txreg_counter[7]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_0__u_device_sm_cmd_reg_reg_1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(u_device_sm_net774), .rb(
        n3683), .o1(u_device_sm_cmd_reg[0]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_device_sm_cmd_reg[1]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_2__u_device_sm_cmd_reg_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(u_device_sm_net774), 
        .rb(n3683), .o1(u_device_sm_cmd_reg[2]), .si2(1'b0), .d2(
        ctrl_data_rx[3]), .o2(u_device_sm_cmd_reg[3]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_4__u_device_sm_cmd_reg_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(u_device_sm_net774), 
        .rb(n3683), .o1(u_device_sm_cmd_reg[4]), .si2(1'b0), .d2(n3735), .o2(
        u_device_sm_cmd_reg[5]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_6__u_device_sm_cmd_reg_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(u_device_sm_net774), 
        .rb(n3684), .o1(u_device_sm_cmd_reg[6]), .si2(1'b0), .d2(
        ctrl_data_rx[7]), .o2(u_device_sm_cmd_reg[7]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_16__u_device_sm_addr_reg_reg_17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[16]), .si2(1'b0), .d2(ctrl_data_rx[17]), .o2(
        addr_sync[17]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_18__u_device_sm_addr_reg_reg_19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[18]), .si2(1'b0), .d2(ctrl_data_rx[19]), .o2(
        addr_sync[19]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_20__u_device_sm_addr_reg_reg_21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[20]), .si2(1'b0), .d2(ctrl_data_rx[21]), .o2(
        addr_sync[21]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_22__u_device_sm_addr_reg_reg_23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[22]), .si2(1'b0), .d2(ctrl_data_rx[23]), .o2(
        addr_sync[23]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_24__u_device_sm_addr_reg_reg_25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[24]), .si2(1'b0), .d2(ctrl_data_rx[25]), .o2(
        addr_sync[25]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_26__u_device_sm_addr_reg_reg_27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[26]), .si2(1'b0), .d2(ctrl_data_rx[27]), .o2(
        addr_sync[27]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_28__u_device_sm_addr_reg_reg_29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[28]), .si2(1'b0), .d2(ctrl_data_rx[29]), .o2(
        addr_sync[29]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_30__u_device_sm_addr_reg_reg_31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3684), .o1(addr_sync[30]), .si2(1'b0), .d2(ctrl_data_rx[31]), .o2(
        addr_sync[31]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_0__u_device_sm_addr_reg_reg_1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(u_device_sm_net763), .rb(
        n3684), .o1(addr_sync[0]), .si2(1'b0), .d2(ctrl_data_rx[1]), .o2(
        addr_sync[1]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_2__u_device_sm_addr_reg_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3682), .o1(addr_sync[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        addr_sync[3]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_4__u_device_sm_addr_reg_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3684), .o1(addr_sync[4]), .si2(1'b0), .d2(n3735), .o2(
        addr_sync[5]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_6__u_device_sm_addr_reg_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3686), .o1(addr_sync[6]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        addr_sync[7]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_8__u_device_sm_addr_reg_reg_9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3686), .o1(addr_sync[8]), .si2(1'b0), .d2(ctrl_data_rx[9]), .o2(
        addr_sync[9]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_10__u_device_sm_addr_reg_reg_11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(u_device_sm_net763), .rb(n3686), .o1(addr_sync[10]), .si2(1'b0), .d2(ctrl_data_rx[11]), .o2(
        addr_sync[11]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_12__u_device_sm_addr_reg_reg_13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(u_device_sm_net763), .rb(n3684), .o1(addr_sync[12]), .si2(1'b0), .d2(ctrl_data_rx[13]), .o2(
        addr_sync[13]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_14__u_device_sm_addr_reg_reg_15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(u_device_sm_net763), .rb(n3684), .o1(addr_sync[14]), .si2(1'b0), .d2(ctrl_data_rx[15]), .o2(
        addr_sync[15]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_16__u_spi_device_tlul_plug_addr_reg_17_ ( 
        .si1(1'b0), .d1(addr_sync[16]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[76]), .si2(1'b0), 
        .d2(addr_sync[17]), .o2(tl_o[77]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_18__u_spi_device_tlul_plug_addr_reg_19_ ( 
        .si1(1'b0), .d1(addr_sync[18]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[78]), .si2(1'b0), 
        .d2(addr_sync[19]), .o2(tl_o[79]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_20__u_spi_device_tlul_plug_addr_reg_21_ ( 
        .si1(1'b0), .d1(addr_sync[20]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[80]), .si2(1'b0), 
        .d2(addr_sync[21]), .o2(tl_o[81]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_22__u_spi_device_tlul_plug_addr_reg_23_ ( 
        .si1(1'b0), .d1(addr_sync[22]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[82]), .si2(1'b0), 
        .d2(addr_sync[23]), .o2(tl_o[83]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_24__u_spi_device_tlul_plug_addr_reg_25_ ( 
        .si1(1'b0), .d1(addr_sync[24]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[84]), .si2(1'b0), 
        .d2(addr_sync[25]), .o2(tl_o[85]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_26__u_spi_device_tlul_plug_addr_reg_27_ ( 
        .si1(1'b0), .d1(addr_sync[26]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[86]), .si2(1'b0), 
        .d2(addr_sync[27]), .o2(tl_o[87]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_28__u_spi_device_tlul_plug_addr_reg_29_ ( 
        .si1(1'b0), .d1(addr_sync[28]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[88]), .si2(1'b0), 
        .d2(addr_sync[29]), .o2(tl_o[89]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_30__u_spi_device_tlul_plug_addr_reg_31_ ( 
        .si1(1'b0), .d1(addr_sync[30]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(rst_ni), .o1(tl_o[90]), .si2(1'b0), 
        .d2(addr_sync[31]), .o2(tl_o[91]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_0__u_spi_device_tlul_plug_addr_reg_1_ ( 
        .si1(1'b0), .d1(addr_sync[0]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(), .si2(1'b0), .d2(
        addr_sync[1]), .o2() );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_2__u_spi_device_tlul_plug_addr_reg_3_ ( 
        .si1(1'b0), .d1(addr_sync[2]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[62]), .si2(1'b0), 
        .d2(addr_sync[3]), .o2(tl_o[63]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_4__u_spi_device_tlul_plug_addr_reg_5_ ( 
        .si1(1'b0), .d1(addr_sync[4]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[64]), .si2(1'b0), 
        .d2(addr_sync[5]), .o2(tl_o[65]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_6__u_spi_device_tlul_plug_addr_reg_7_ ( 
        .si1(1'b0), .d1(addr_sync[6]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[66]), .si2(1'b0), 
        .d2(addr_sync[7]), .o2(tl_o[67]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_8__u_spi_device_tlul_plug_addr_reg_9_ ( 
        .si1(1'b0), .d1(addr_sync[8]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[68]), .si2(1'b0), 
        .d2(addr_sync[9]), .o2(tl_o[69]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_10__u_spi_device_tlul_plug_addr_reg_11_ ( 
        .si1(1'b0), .d1(addr_sync[10]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[70]), .si2(1'b0), 
        .d2(addr_sync[11]), .o2(tl_o[71]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_12__u_spi_device_tlul_plug_addr_reg_13_ ( 
        .si1(1'b0), .d1(addr_sync[12]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[72]), .si2(1'b0), 
        .d2(addr_sync[13]), .o2(tl_o[73]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_14__u_spi_device_tlul_plug_addr_reg_15_ ( 
        .si1(1'b0), .d1(addr_sync[14]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(rst_ni), .o1(tl_o[74]), .si2(1'b0), 
        .d2(addr_sync[15]), .o2(tl_o[75]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_0__u_device_sm_u_spiregs_reg2_reg_1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net807), 
        .rb(rst_ni), .o1(u_device_sm_u_spiregs_n[16]), .si2(1'b0), .d2(
        ctrl_data_rx[1]), .o2(u_device_sm_u_spiregs_n[15]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_2__u_device_sm_u_spiregs_reg2_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net807), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_n[14]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_u_spiregs_n[13]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_4__u_device_sm_u_spiregs_reg2_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net807), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_n[12]), .si2(1'b0), .d2(n3735), .o2(
        u_device_sm_u_spiregs_n[11]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_6__u_device_sm_u_spiregs_reg2_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net807), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_n[10]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        u_device_sm_u_spiregs_n[9]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg1_reg_0__u_device_sm_u_spiregs_reg1_reg_1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net802), 
        .rb(rst_ni), .o1(u_device_sm_s_dummy_cycles[0]), .si2(1'b0), .d2(
        ctrl_data_rx[1]), .o2(u_device_sm_s_dummy_cycles[1]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg1_reg_2__u_device_sm_u_spiregs_reg1_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net802), .rb(rst_ni), .o1(
        u_device_sm_s_dummy_cycles[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_s_dummy_cycles[3]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg1_reg_4__u_device_sm_u_spiregs_reg1_reg_6_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net802), .rb(rst_ni), .o1(
        u_device_sm_s_dummy_cycles[4]), .si2(1'b0), .d2(ctrl_data_rx[6]), .o2(
        u_device_sm_s_dummy_cycles[6]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_0__u_device_sm_u_spiregs_reg0_reg_1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net797), 
        .rb(rst_ni), .o1(en_quad), .si2(1'b0), .d2(ctrl_data_rx[1]), .o2(
        u_device_sm_u_spiregs_reg0[1]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_2__u_device_sm_u_spiregs_reg0_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net797), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_reg0[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_u_spiregs_reg0[3]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_4__u_device_sm_u_spiregs_reg0_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net797), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_reg0[4]), .si2(1'b0), .d2(n3735), .o2(
        u_device_sm_u_spiregs_reg0[5]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_6__u_device_sm_u_spiregs_reg0_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net797), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_reg0[6]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        u_device_sm_u_spiregs_reg0[7]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_0__u_device_sm_u_spiregs_reg3_reg_1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net791), 
        .rb(rst_ni), .o1(u_device_sm_u_spiregs_n[8]), .si2(1'b0), .d2(
        ctrl_data_rx[1]), .o2(u_device_sm_u_spiregs_n[7]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_2__u_device_sm_u_spiregs_reg3_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net791), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_n[6]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_u_spiregs_n[5]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_4__u_device_sm_u_spiregs_reg3_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net791), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_n[4]), .si2(1'b0), .d2(n3735), .o2(
        u_device_sm_u_spiregs_n[3]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_6__u_device_sm_u_spiregs_reg3_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net791), .rb(rst_ni), .o1(
        u_device_sm_u_spiregs_n[2]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        u_device_sm_u_spiregs_n[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__16__u_dcfifo_tx_u_din_buffer_data_reg_0__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[16]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[17]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__18__u_dcfifo_tx_u_din_buffer_data_reg_0__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[18]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[19]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__20__u_dcfifo_tx_u_din_buffer_data_reg_0__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[20]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[21]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__22__u_dcfifo_tx_u_din_buffer_data_reg_0__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[22]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[23]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__24__u_dcfifo_tx_u_din_buffer_data_reg_0__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[24]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[25]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__26__u_dcfifo_tx_u_din_buffer_data_reg_0__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[26]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[27]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__28__u_dcfifo_tx_u_din_buffer_data_reg_0__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[28]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[29]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__30__u_dcfifo_tx_u_din_buffer_data_reg_0__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[30]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[31]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__0__u_dcfifo_tx_u_din_buffer_data_reg_0__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[0]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__2__u_dcfifo_tx_u_din_buffer_data_reg_0__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[2]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[3]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__4__u_dcfifo_tx_u_din_buffer_data_reg_0__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[4]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__6__u_dcfifo_tx_u_din_buffer_data_reg_0__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[6]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[7]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__8__u_dcfifo_tx_u_din_buffer_data_reg_0__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3696), .o1(
        u_dcfifo_tx_u_din_buffer_data[8]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[9]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__10__u_dcfifo_tx_u_din_buffer_data_reg_0__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[10]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[11]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__12__u_dcfifo_tx_u_din_buffer_data_reg_0__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[12]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[13]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__14__u_dcfifo_tx_u_din_buffer_data_reg_0__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[14]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[15]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__16__u_dcfifo_tx_u_din_buffer_data_reg_1__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[48]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[49]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__18__u_dcfifo_tx_u_din_buffer_data_reg_1__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[50]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[51]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__20__u_dcfifo_tx_u_din_buffer_data_reg_1__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[52]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[53]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__22__u_dcfifo_tx_u_din_buffer_data_reg_1__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[54]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[55]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__24__u_dcfifo_tx_u_din_buffer_data_reg_1__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[56]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[57]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__26__u_dcfifo_tx_u_din_buffer_data_reg_1__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[58]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[59]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__28__u_dcfifo_tx_u_din_buffer_data_reg_1__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[60]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[61]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__30__u_dcfifo_tx_u_din_buffer_data_reg_1__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[62]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[63]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__0__u_dcfifo_tx_u_din_buffer_data_reg_1__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[32]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[33]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__2__u_dcfifo_tx_u_din_buffer_data_reg_1__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[34]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[35]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__4__u_dcfifo_tx_u_din_buffer_data_reg_1__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[36]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[37]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__6__u_dcfifo_tx_u_din_buffer_data_reg_1__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[38]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[39]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__8__u_dcfifo_tx_u_din_buffer_data_reg_1__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3696), .o1(
        u_dcfifo_tx_u_din_buffer_data[40]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[41]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__10__u_dcfifo_tx_u_din_buffer_data_reg_1__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[42]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[43]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__12__u_dcfifo_tx_u_din_buffer_data_reg_1__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[44]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[45]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__14__u_dcfifo_tx_u_din_buffer_data_reg_1__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[46]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[47]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__16__u_dcfifo_tx_u_din_buffer_data_reg_2__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[80]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[81]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__18__u_dcfifo_tx_u_din_buffer_data_reg_2__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[82]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[83]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__20__u_dcfifo_tx_u_din_buffer_data_reg_2__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[84]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[85]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__22__u_dcfifo_tx_u_din_buffer_data_reg_2__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[86]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[87]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__24__u_dcfifo_tx_u_din_buffer_data_reg_2__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[88]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[89]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__26__u_dcfifo_tx_u_din_buffer_data_reg_2__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[90]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[91]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__28__u_dcfifo_tx_u_din_buffer_data_reg_2__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[92]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[93]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__30__u_dcfifo_tx_u_din_buffer_data_reg_2__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[94]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[95]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__0__u_dcfifo_tx_u_din_buffer_data_reg_2__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[64]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[65]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__2__u_dcfifo_tx_u_din_buffer_data_reg_2__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[66]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[67]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__4__u_dcfifo_tx_u_din_buffer_data_reg_2__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[68]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[69]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__6__u_dcfifo_tx_u_din_buffer_data_reg_2__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[70]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[71]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__8__u_dcfifo_tx_u_din_buffer_data_reg_2__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3696), .o1(
        u_dcfifo_tx_u_din_buffer_data[72]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[73]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__10__u_dcfifo_tx_u_din_buffer_data_reg_2__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[74]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[75]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__12__u_dcfifo_tx_u_din_buffer_data_reg_2__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[76]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[77]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__14__u_dcfifo_tx_u_din_buffer_data_reg_2__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[78]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[79]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__16__u_dcfifo_tx_u_din_buffer_data_reg_3__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[112]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[113]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__18__u_dcfifo_tx_u_din_buffer_data_reg_3__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[114]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[115]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__20__u_dcfifo_tx_u_din_buffer_data_reg_3__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[116]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[117]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__22__u_dcfifo_tx_u_din_buffer_data_reg_3__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[118]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[119]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__24__u_dcfifo_tx_u_din_buffer_data_reg_3__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[120]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[121]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__26__u_dcfifo_tx_u_din_buffer_data_reg_3__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[122]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[123]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__28__u_dcfifo_tx_u_din_buffer_data_reg_3__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[124]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[125]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__30__u_dcfifo_tx_u_din_buffer_data_reg_3__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[126]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[127]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__0__u_dcfifo_tx_u_din_buffer_data_reg_3__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[96]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[97]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__2__u_dcfifo_tx_u_din_buffer_data_reg_3__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[98]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[99]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__4__u_dcfifo_tx_u_din_buffer_data_reg_3__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[100]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[101]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__6__u_dcfifo_tx_u_din_buffer_data_reg_3__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[102]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[103]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__8__u_dcfifo_tx_u_din_buffer_data_reg_3__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[104]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[105]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__10__u_dcfifo_tx_u_din_buffer_data_reg_3__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[106]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[107]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__12__u_dcfifo_tx_u_din_buffer_data_reg_3__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[108]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[109]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__14__u_dcfifo_tx_u_din_buffer_data_reg_3__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[110]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[111]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__16__u_dcfifo_tx_u_din_buffer_data_reg_4__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[144]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[145]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__18__u_dcfifo_tx_u_din_buffer_data_reg_4__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[146]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[147]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__20__u_dcfifo_tx_u_din_buffer_data_reg_4__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[148]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[149]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__22__u_dcfifo_tx_u_din_buffer_data_reg_4__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[150]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[151]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__24__u_dcfifo_tx_u_din_buffer_data_reg_4__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[152]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[153]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__26__u_dcfifo_tx_u_din_buffer_data_reg_4__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[154]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[155]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__28__u_dcfifo_tx_u_din_buffer_data_reg_4__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[156]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[157]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__30__u_dcfifo_tx_u_din_buffer_data_reg_4__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[158]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[159]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__0__u_dcfifo_tx_u_din_buffer_data_reg_4__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[128]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[129]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__2__u_dcfifo_tx_u_din_buffer_data_reg_4__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[130]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[131]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__4__u_dcfifo_tx_u_din_buffer_data_reg_4__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[132]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[133]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__6__u_dcfifo_tx_u_din_buffer_data_reg_4__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[134]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[135]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__8__u_dcfifo_tx_u_din_buffer_data_reg_4__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3696), .o1(
        u_dcfifo_tx_u_din_buffer_data[136]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[137]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__10__u_dcfifo_tx_u_din_buffer_data_reg_4__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[138]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[139]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__12__u_dcfifo_tx_u_din_buffer_data_reg_4__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[140]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[141]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__14__u_dcfifo_tx_u_din_buffer_data_reg_4__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[142]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[143]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__16__u_dcfifo_tx_u_din_buffer_data_reg_5__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[176]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[177]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__18__u_dcfifo_tx_u_din_buffer_data_reg_5__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[178]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[179]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__20__u_dcfifo_tx_u_din_buffer_data_reg_5__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[180]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[181]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__22__u_dcfifo_tx_u_din_buffer_data_reg_5__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[182]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[183]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__24__u_dcfifo_tx_u_din_buffer_data_reg_5__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[184]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[185]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__26__u_dcfifo_tx_u_din_buffer_data_reg_5__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[186]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[187]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__28__u_dcfifo_tx_u_din_buffer_data_reg_5__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[188]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[189]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__30__u_dcfifo_tx_u_din_buffer_data_reg_5__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[190]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[191]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__0__u_dcfifo_tx_u_din_buffer_data_reg_5__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[160]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[161]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__2__u_dcfifo_tx_u_din_buffer_data_reg_5__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[162]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[163]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__4__u_dcfifo_tx_u_din_buffer_data_reg_5__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[164]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[165]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__6__u_dcfifo_tx_u_din_buffer_data_reg_5__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[166]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[167]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__8__u_dcfifo_tx_u_din_buffer_data_reg_5__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3696), .o1(
        u_dcfifo_tx_u_din_buffer_data[168]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[169]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__10__u_dcfifo_tx_u_din_buffer_data_reg_5__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[170]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[171]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__12__u_dcfifo_tx_u_din_buffer_data_reg_5__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[172]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[173]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__14__u_dcfifo_tx_u_din_buffer_data_reg_5__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[174]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[175]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__16__u_dcfifo_tx_u_din_buffer_data_reg_6__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[208]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[209]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__18__u_dcfifo_tx_u_din_buffer_data_reg_6__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[210]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[211]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__20__u_dcfifo_tx_u_din_buffer_data_reg_6__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[212]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[213]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__22__u_dcfifo_tx_u_din_buffer_data_reg_6__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[214]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[215]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__24__u_dcfifo_tx_u_din_buffer_data_reg_6__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[216]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[217]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__26__u_dcfifo_tx_u_din_buffer_data_reg_6__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[218]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[219]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__28__u_dcfifo_tx_u_din_buffer_data_reg_6__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[220]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[221]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__30__u_dcfifo_tx_u_din_buffer_data_reg_6__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[222]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[223]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__0__u_dcfifo_tx_u_din_buffer_data_reg_6__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[192]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[193]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__2__u_dcfifo_tx_u_din_buffer_data_reg_6__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[194]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[195]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__4__u_dcfifo_tx_u_din_buffer_data_reg_6__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[196]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[197]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__6__u_dcfifo_tx_u_din_buffer_data_reg_6__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[198]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[199]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__8__u_dcfifo_tx_u_din_buffer_data_reg_6__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3696), .o1(
        u_dcfifo_tx_u_din_buffer_data[200]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[201]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__10__u_dcfifo_tx_u_din_buffer_data_reg_6__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[202]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[203]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__12__u_dcfifo_tx_u_din_buffer_data_reg_6__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[204]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[205]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__14__u_dcfifo_tx_u_din_buffer_data_reg_6__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[206]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[207]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__16__u_dcfifo_tx_u_din_buffer_data_reg_7__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[240]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[241]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__18__u_dcfifo_tx_u_din_buffer_data_reg_7__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[242]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[243]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__20__u_dcfifo_tx_u_din_buffer_data_reg_7__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[244]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[245]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__22__u_dcfifo_tx_u_din_buffer_data_reg_7__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[246]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[247]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__24__u_dcfifo_tx_u_din_buffer_data_reg_7__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[248]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[249]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__26__u_dcfifo_tx_u_din_buffer_data_reg_7__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[250]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[251]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__28__u_dcfifo_tx_u_din_buffer_data_reg_7__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[252]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[253]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__30__u_dcfifo_tx_u_din_buffer_data_reg_7__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[254]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[255]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__0__u_dcfifo_tx_u_din_buffer_data_reg_7__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[224]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[225]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__2__u_dcfifo_tx_u_din_buffer_data_reg_7__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[226]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[227]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__4__u_dcfifo_tx_u_din_buffer_data_reg_7__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[228]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[229]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__6__u_dcfifo_tx_u_din_buffer_data_reg_7__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[230]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[231]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__8__u_dcfifo_tx_u_din_buffer_data_reg_7__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[232]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[233]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__10__u_dcfifo_tx_u_din_buffer_data_reg_7__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[234]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[235]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__12__u_dcfifo_tx_u_din_buffer_data_reg_7__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[236]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[237]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__14__u_dcfifo_tx_u_din_buffer_data_reg_7__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_din_buffer_data[238]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[239]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_0__u_dcfifo_tx_u_din_write_tr_state_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .rb(rst_ni), .o1(
        u_dcfifo_tx_write_token[0]), .si2(1'b0), .d2(
        u_dcfifo_tx_write_token[0]), .o2(u_dcfifo_tx_write_token[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_4__u_dcfifo_tx_u_din_write_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .rb(rst_ni), .o1(
        u_dcfifo_tx_write_token[4]), .si2(1'b0), .d2(
        u_dcfifo_tx_write_token[4]), .o2(u_dcfifo_tx_write_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_6__u_dcfifo_tx_u_din_write_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .rb(rst_ni), .o1(
        u_dcfifo_tx_write_token[6]), .si2(1'b0), .d2(
        u_dcfifo_tx_write_token[6]), .o2(u_dcfifo_tx_write_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_2__u_dcfifo_tx_u_dout_read_tr_state_reg_3_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_read_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_dout_read_token[2]), .si2(1'b0), .d2(
        u_dcfifo_tx_u_dout_read_token[2]), .o2(
        u_dcfifo_tx_u_dout_read_token[3]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_4__u_dcfifo_tx_u_dout_read_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_read_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_dout_read_token[4]), .si2(1'b0), .d2(
        u_dcfifo_tx_u_dout_read_token[4]), .o2(
        u_dcfifo_tx_u_dout_read_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_6__u_dcfifo_tx_u_dout_read_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_read_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .rb(rst_ni), .o1(
        u_dcfifo_tx_u_dout_read_token[6]), .si2(1'b0), .d2(
        u_dcfifo_tx_u_dout_read_token[6]), .o2(
        u_dcfifo_tx_u_dout_read_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__16__u_dcfifo_rx_u_din_buffer_data_reg_0__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[16]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[17]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__18__u_dcfifo_rx_u_din_buffer_data_reg_0__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[18]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[19]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__20__u_dcfifo_rx_u_din_buffer_data_reg_0__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[20]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[21]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__22__u_dcfifo_rx_u_din_buffer_data_reg_0__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[22]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[23]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__24__u_dcfifo_rx_u_din_buffer_data_reg_0__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[24]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[25]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__26__u_dcfifo_rx_u_din_buffer_data_reg_0__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[26]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[27]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__28__u_dcfifo_rx_u_din_buffer_data_reg_0__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[28]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[29]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__30__u_dcfifo_rx_u_din_buffer_data_reg_0__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[30]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[31]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__0__u_dcfifo_rx_u_din_buffer_data_reg_0__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[0]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__2__u_dcfifo_rx_u_din_buffer_data_reg_0__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[3]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__4__u_dcfifo_rx_u_din_buffer_data_reg_0__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[4]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__6__u_dcfifo_rx_u_din_buffer_data_reg_0__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[6]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__8__u_dcfifo_rx_u_din_buffer_data_reg_0__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[8]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[9]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__10__u_dcfifo_rx_u_din_buffer_data_reg_0__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[10]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[11]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__12__u_dcfifo_rx_u_din_buffer_data_reg_0__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[12]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[13]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__14__u_dcfifo_rx_u_din_buffer_data_reg_0__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[14]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[15]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__16__u_dcfifo_rx_u_din_buffer_data_reg_1__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[48]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[49]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__18__u_dcfifo_rx_u_din_buffer_data_reg_1__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[50]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[51]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__20__u_dcfifo_rx_u_din_buffer_data_reg_1__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[52]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[53]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__22__u_dcfifo_rx_u_din_buffer_data_reg_1__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[54]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[55]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__24__u_dcfifo_rx_u_din_buffer_data_reg_1__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[56]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[57]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__26__u_dcfifo_rx_u_din_buffer_data_reg_1__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[58]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[59]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__28__u_dcfifo_rx_u_din_buffer_data_reg_1__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[60]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[61]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__30__u_dcfifo_rx_u_din_buffer_data_reg_1__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[62]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[63]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__0__u_dcfifo_rx_u_din_buffer_data_reg_1__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[32]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[33]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__2__u_dcfifo_rx_u_din_buffer_data_reg_1__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[34]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[35]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__4__u_dcfifo_rx_u_din_buffer_data_reg_1__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[36]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[37]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__6__u_dcfifo_rx_u_din_buffer_data_reg_1__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[38]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[39]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__8__u_dcfifo_rx_u_din_buffer_data_reg_1__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[40]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[41]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__10__u_dcfifo_rx_u_din_buffer_data_reg_1__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[42]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[43]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__12__u_dcfifo_rx_u_din_buffer_data_reg_1__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[44]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[45]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__14__u_dcfifo_rx_u_din_buffer_data_reg_1__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[46]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[47]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__16__u_dcfifo_rx_u_din_buffer_data_reg_2__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[80]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[81]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__18__u_dcfifo_rx_u_din_buffer_data_reg_2__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[82]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[83]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__20__u_dcfifo_rx_u_din_buffer_data_reg_2__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[84]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[85]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__22__u_dcfifo_rx_u_din_buffer_data_reg_2__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[86]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[87]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__24__u_dcfifo_rx_u_din_buffer_data_reg_2__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[88]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[89]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__26__u_dcfifo_rx_u_din_buffer_data_reg_2__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[90]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[91]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__28__u_dcfifo_rx_u_din_buffer_data_reg_2__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[92]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[93]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__30__u_dcfifo_rx_u_din_buffer_data_reg_2__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[94]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[95]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__0__u_dcfifo_rx_u_din_buffer_data_reg_2__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[64]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[65]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__2__u_dcfifo_rx_u_din_buffer_data_reg_2__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[66]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[67]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__4__u_dcfifo_rx_u_din_buffer_data_reg_2__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[68]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[69]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__6__u_dcfifo_rx_u_din_buffer_data_reg_2__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[70]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[71]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__8__u_dcfifo_rx_u_din_buffer_data_reg_2__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[72]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[73]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__10__u_dcfifo_rx_u_din_buffer_data_reg_2__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[74]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[75]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__12__u_dcfifo_rx_u_din_buffer_data_reg_2__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[76]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[77]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__14__u_dcfifo_rx_u_din_buffer_data_reg_2__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[78]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[79]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__16__u_dcfifo_rx_u_din_buffer_data_reg_3__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[112]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[113]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__18__u_dcfifo_rx_u_din_buffer_data_reg_3__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[114]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[115]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__20__u_dcfifo_rx_u_din_buffer_data_reg_3__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[116]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[117]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__22__u_dcfifo_rx_u_din_buffer_data_reg_3__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[118]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[119]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__24__u_dcfifo_rx_u_din_buffer_data_reg_3__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[120]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[121]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__26__u_dcfifo_rx_u_din_buffer_data_reg_3__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[122]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[123]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__28__u_dcfifo_rx_u_din_buffer_data_reg_3__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[124]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[125]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__30__u_dcfifo_rx_u_din_buffer_data_reg_3__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[126]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[127]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__0__u_dcfifo_rx_u_din_buffer_data_reg_3__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[96]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[97]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__2__u_dcfifo_rx_u_din_buffer_data_reg_3__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[98]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[99]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__4__u_dcfifo_rx_u_din_buffer_data_reg_3__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[100]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[101]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__6__u_dcfifo_rx_u_din_buffer_data_reg_3__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[102]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[103]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__8__u_dcfifo_rx_u_din_buffer_data_reg_3__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[104]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[105]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__10__u_dcfifo_rx_u_din_buffer_data_reg_3__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[106]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[107]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__12__u_dcfifo_rx_u_din_buffer_data_reg_3__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[108]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[109]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__14__u_dcfifo_rx_u_din_buffer_data_reg_3__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[110]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[111]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__16__u_dcfifo_rx_u_din_buffer_data_reg_4__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[144]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[145]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__18__u_dcfifo_rx_u_din_buffer_data_reg_4__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[146]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[147]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__20__u_dcfifo_rx_u_din_buffer_data_reg_4__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[148]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[149]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__22__u_dcfifo_rx_u_din_buffer_data_reg_4__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[150]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[151]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__24__u_dcfifo_rx_u_din_buffer_data_reg_4__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[152]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[153]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__26__u_dcfifo_rx_u_din_buffer_data_reg_4__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[154]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[155]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__28__u_dcfifo_rx_u_din_buffer_data_reg_4__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[156]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[157]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__30__u_dcfifo_rx_u_din_buffer_data_reg_4__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[158]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[159]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__0__u_dcfifo_rx_u_din_buffer_data_reg_4__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[128]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[129]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__2__u_dcfifo_rx_u_din_buffer_data_reg_4__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[130]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[131]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__4__u_dcfifo_rx_u_din_buffer_data_reg_4__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[132]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[133]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__6__u_dcfifo_rx_u_din_buffer_data_reg_4__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[134]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[135]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__8__u_dcfifo_rx_u_din_buffer_data_reg_4__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[136]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[137]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__10__u_dcfifo_rx_u_din_buffer_data_reg_4__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[138]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[139]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__12__u_dcfifo_rx_u_din_buffer_data_reg_4__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[140]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[141]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__14__u_dcfifo_rx_u_din_buffer_data_reg_4__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[142]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[143]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__16__u_dcfifo_rx_u_din_buffer_data_reg_5__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[176]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[177]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__18__u_dcfifo_rx_u_din_buffer_data_reg_5__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[178]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[179]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__20__u_dcfifo_rx_u_din_buffer_data_reg_5__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[180]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[181]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__22__u_dcfifo_rx_u_din_buffer_data_reg_5__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[182]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[183]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__24__u_dcfifo_rx_u_din_buffer_data_reg_5__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[184]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[185]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__26__u_dcfifo_rx_u_din_buffer_data_reg_5__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[186]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[187]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__28__u_dcfifo_rx_u_din_buffer_data_reg_5__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[188]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[189]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__30__u_dcfifo_rx_u_din_buffer_data_reg_5__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[190]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[191]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__0__u_dcfifo_rx_u_din_buffer_data_reg_5__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[160]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[161]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__2__u_dcfifo_rx_u_din_buffer_data_reg_5__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[162]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[163]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__4__u_dcfifo_rx_u_din_buffer_data_reg_5__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[164]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[165]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__6__u_dcfifo_rx_u_din_buffer_data_reg_5__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[166]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[167]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__8__u_dcfifo_rx_u_din_buffer_data_reg_5__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[168]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[169]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__10__u_dcfifo_rx_u_din_buffer_data_reg_5__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[170]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[171]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__12__u_dcfifo_rx_u_din_buffer_data_reg_5__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[172]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[173]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__14__u_dcfifo_rx_u_din_buffer_data_reg_5__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[174]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[175]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__16__u_dcfifo_rx_u_din_buffer_data_reg_6__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[208]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[209]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__18__u_dcfifo_rx_u_din_buffer_data_reg_6__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[210]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[211]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__20__u_dcfifo_rx_u_din_buffer_data_reg_6__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[212]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[213]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__22__u_dcfifo_rx_u_din_buffer_data_reg_6__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[214]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[215]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__24__u_dcfifo_rx_u_din_buffer_data_reg_6__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[216]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[217]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__26__u_dcfifo_rx_u_din_buffer_data_reg_6__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[218]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[219]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__28__u_dcfifo_rx_u_din_buffer_data_reg_6__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[220]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[221]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__30__u_dcfifo_rx_u_din_buffer_data_reg_6__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[222]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[223]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__0__u_dcfifo_rx_u_din_buffer_data_reg_6__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[192]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[193]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__2__u_dcfifo_rx_u_din_buffer_data_reg_6__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[194]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[195]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__4__u_dcfifo_rx_u_din_buffer_data_reg_6__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[196]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[197]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__6__u_dcfifo_rx_u_din_buffer_data_reg_6__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[198]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[199]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__8__u_dcfifo_rx_u_din_buffer_data_reg_6__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[200]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[201]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__10__u_dcfifo_rx_u_din_buffer_data_reg_6__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[202]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[203]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__12__u_dcfifo_rx_u_din_buffer_data_reg_6__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[204]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[205]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__14__u_dcfifo_rx_u_din_buffer_data_reg_6__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[206]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[207]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__16__u_dcfifo_rx_u_din_buffer_data_reg_7__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[240]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[241]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__18__u_dcfifo_rx_u_din_buffer_data_reg_7__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[242]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[243]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__20__u_dcfifo_rx_u_din_buffer_data_reg_7__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[244]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[245]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__22__u_dcfifo_rx_u_din_buffer_data_reg_7__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[246]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[247]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__24__u_dcfifo_rx_u_din_buffer_data_reg_7__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[248]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[249]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__26__u_dcfifo_rx_u_din_buffer_data_reg_7__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[250]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[251]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__28__u_dcfifo_rx_u_din_buffer_data_reg_7__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[252]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[253]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__30__u_dcfifo_rx_u_din_buffer_data_reg_7__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[254]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[255]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__0__u_dcfifo_rx_u_din_buffer_data_reg_7__1_ ( 
        .si1(1'b0), .d1(n3733), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[224]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[225]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__2__u_dcfifo_rx_u_din_buffer_data_reg_7__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[226]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[227]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__4__u_dcfifo_rx_u_din_buffer_data_reg_7__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[228]), .si2(1'b0), .d2(n3735), .o2(
        u_dcfifo_rx_u_din_buffer_data[229]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__6__u_dcfifo_rx_u_din_buffer_data_reg_7__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[230]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[231]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__8__u_dcfifo_rx_u_din_buffer_data_reg_7__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[232]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[233]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__10__u_dcfifo_rx_u_din_buffer_data_reg_7__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[234]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[235]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__12__u_dcfifo_rx_u_din_buffer_data_reg_7__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[236]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[237]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__14__u_dcfifo_rx_u_din_buffer_data_reg_7__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_din_buffer_data[238]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[239]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_0__u_dcfifo_rx_u_din_write_tr_state_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .rb(rst_ni), .o1(
        u_dcfifo_rx_write_token[0]), .si2(1'b0), .d2(
        u_dcfifo_rx_write_token[0]), .o2(u_dcfifo_rx_write_token[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_4__u_dcfifo_rx_u_din_write_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .rb(rst_ni), .o1(
        u_dcfifo_rx_write_token[4]), .si2(1'b0), .d2(
        u_dcfifo_rx_write_token[4]), .o2(u_dcfifo_rx_write_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_6__u_dcfifo_rx_u_din_write_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .rb(rst_ni), .o1(
        u_dcfifo_rx_write_token[6]), .si2(1'b0), .d2(
        u_dcfifo_rx_write_token[6]), .o2(u_dcfifo_rx_write_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_2__u_dcfifo_rx_u_dout_read_tr_state_reg_3_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_read_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_dout_read_token[2]), .si2(1'b0), .d2(
        u_dcfifo_rx_u_dout_read_token[2]), .o2(
        u_dcfifo_rx_u_dout_read_token[3]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_4__u_dcfifo_rx_u_dout_read_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_read_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_dout_read_token[4]), .si2(1'b0), .d2(
        u_dcfifo_rx_u_dout_read_token[4]), .o2(
        u_dcfifo_rx_u_dout_read_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_6__u_dcfifo_rx_u_dout_read_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_read_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .rb(rst_ni), .o1(
        u_dcfifo_rx_u_dout_read_token[6]), .si2(1'b0), .d2(
        u_dcfifo_rx_u_dout_read_token[6]), .o2(
        u_dcfifo_rx_u_dout_read_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_0__u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[0]), .ssb(1'b1), .clk(clk_i), 
        .rb(rst_ni), .o1(u_dcfifo_rx_u_dout_empty_synch_d_middle[0]), .si2(
        1'b0), .d2(u_dcfifo_rx_write_token[1]), .o2(
        u_dcfifo_rx_u_dout_empty_synch_d_middle[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_4__u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[4]), .ssb(1'b1), .clk(clk_i), 
        .rb(rst_ni), .o1(u_dcfifo_rx_u_dout_empty_synch_d_middle[4]), .si2(
        1'b0), .d2(u_dcfifo_rx_write_token[5]), .o2(
        u_dcfifo_rx_u_dout_empty_synch_d_middle[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_6__u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[6]), .ssb(1'b1), .clk(clk_i), 
        .rb(rst_ni), .o1(u_dcfifo_rx_u_dout_empty_synch_d_middle[6]), .si2(
        1'b0), .d2(u_dcfifo_rx_write_token[7]), .o2(
        u_dcfifo_rx_u_dout_empty_synch_d_middle[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_0__u_dcfifo_rx_u_dout_empty_synch_d_out_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_empty_synch_d_middle[0]), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(u_dcfifo_rx_u_dout_write_token_dn[0]), .si2(
        1'b0), .d2(u_dcfifo_rx_u_dout_empty_synch_d_middle[1]), .o2(
        u_dcfifo_rx_u_dout_write_token_dn[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_4__u_dcfifo_rx_u_dout_empty_synch_d_out_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_empty_synch_d_middle[4]), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(u_dcfifo_rx_u_dout_write_token_dn[4]), .si2(
        1'b0), .d2(u_dcfifo_rx_u_dout_empty_synch_d_middle[5]), .o2(
        u_dcfifo_rx_u_dout_write_token_dn[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_6__u_dcfifo_rx_u_dout_empty_synch_d_out_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_empty_synch_d_middle[6]), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(u_dcfifo_rx_u_dout_write_token_dn[6]), .si2(
        1'b0), .d2(u_dcfifo_rx_u_dout_empty_synch_d_middle[7]), .o2(
        u_dcfifo_rx_u_dout_write_token_dn[7]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_full_full_synch_d_middle_reg_0__u_dcfifo_tx_u_din_full_full_synch_d_out_reg_0_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_din_full_full_dn), .ssb(1'b1), .clk(
        clk_i), .rb(rst_ni), .o1(u_dcfifo_tx_u_din_full_full_synch_d_middle_0_), .si2(1'b0), .d2(u_dcfifo_tx_u_din_full_full_synch_d_middle_0_), .o2(
        u_dcfifo_tx_u_din_full_full_up) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_full_latched_full_s_reg_u_spi_device_tlul_plug_state_reg_0_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_din_full_N0), .ssb(1'b1), .clk(clk_i), 
        .rb(rst_ni), .o1(u_dcfifo_tx_u_din_full_latched_full_s), .si2(1'b0), 
        .d2(u_spi_device_tlul_plug_state_next[0]), .o2(
        u_spi_device_tlul_plug_state[0]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_state_reg_1__u_spi_device_tlul_plug_u_tlul_adapter_host_g_multiple_reqs_source_q_reg_0_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_state_next[1]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(u_spi_device_tlul_plug_state[1]), .si2(
        1'b0), .d2(n604), .o2(tl_o[92]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_u_tlul_adapter_host_intg_err_q_reg_u_spi_device_tlul_plug_wdata_reg_0_ ( 
        .si1(1'b0), .d1(n1456), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(
        n1455), .si2(1'b0), .d2(u_spi_device_tlul_plug_wdata_next[0]), .o2(
        tl_o[24]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_1__u_spi_device_tlul_plug_wdata_reg_2_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[1]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[25]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[2]), .o2(tl_o[26]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_3__u_spi_device_tlul_plug_wdata_reg_4_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[3]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[27]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[4]), .o2(tl_o[28]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_5__u_spi_device_tlul_plug_wdata_reg_6_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[5]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[29]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[6]), .o2(tl_o[30]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_7__u_spi_device_tlul_plug_wdata_reg_8_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[7]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[31]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[8]), .o2(tl_o[32]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_9__u_spi_device_tlul_plug_wdata_reg_10_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[9]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[33]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[10]), .o2(tl_o[34]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_11__u_spi_device_tlul_plug_wdata_reg_12_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[11]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[35]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[12]), .o2(tl_o[36]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_13__u_spi_device_tlul_plug_wdata_reg_14_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[13]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[37]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[14]), .o2(tl_o[38]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_15__u_spi_device_tlul_plug_wdata_reg_16_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[15]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[39]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[16]), .o2(tl_o[40]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_17__u_spi_device_tlul_plug_wdata_reg_18_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[17]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[41]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[18]), .o2(tl_o[42]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_19__u_spi_device_tlul_plug_wdata_reg_20_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[19]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[43]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[20]), .o2(tl_o[44]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_21__u_spi_device_tlul_plug_wdata_reg_22_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[21]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[45]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[22]), .o2(tl_o[46]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_23__u_spi_device_tlul_plug_wdata_reg_24_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[23]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[47]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[24]), .o2(tl_o[48]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_25__u_spi_device_tlul_plug_wdata_reg_26_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[25]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[49]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[26]), .o2(tl_o[50]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_27__u_spi_device_tlul_plug_wdata_reg_28_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[27]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[51]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[28]), .o2(tl_o[52]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_29__u_spi_device_tlul_plug_wdata_reg_30_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[29]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[53]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[30]), .o2(tl_o[54]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_31__u_spi_device_tlul_plug_we_reg ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[31]), .ssb(1'b1), 
        .clk(clk_i), .rb(rst_ni), .o1(tl_o[55]), .si2(1'b0), .d2(n3292), .o2(
        u_spi_device_tlul_plug_we) );
  b15fqy203ar1n02x5 u_syncro_rdwr_reg_reg_0__u_syncro_rdwr_reg_reg_1_ ( .si1(
        1'b0), .d1(ctrl_rd_wr), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), .o1(
        u_syncro_rdwr_reg_0_), .si2(1'b0), .d2(u_syncro_rdwr_reg_0_), .o2(
        rd_wr_sync) );
  b15fqy203ar1n02x5 u_syncro_valid_reg_reg_0__u_syncro_valid_reg_reg_1_ ( 
        .si1(1'b0), .d1(ctrl_addr_valid), .ssb(1'b1), .clk(clk_i), .rb(rst_ni), 
        .o1(u_syncro_valid_reg[0]), .si2(1'b0), .d2(u_syncro_valid_reg[0]), 
        .o2(u_syncro_valid_reg[1]) );
  b15inv000ar1n03x5 U2914 ( .a(1'b0), .o1(tl_o[0]) );
  b15inv000ar1n03x5 U2934 ( .a(1'b1), .o1(tl_o[1]) );
  b15inv000ar1n03x5 U2942 ( .a(1'b0), .o1(tl_o[2]) );
  b15inv000ar1n03x5 U3036 ( .a(1'b1), .o1(tl_o[3]) );
  b15inv000ar1n03x5 U3157 ( .a(1'b0), .o1(tl_o[4]) );
  b15inv000ar1n03x5 U3178 ( .a(1'b1), .o1(tl_o[5]) );
  b15inv000ar1n03x5 U3181 ( .a(1'b0), .o1(tl_o[6]) );
  b15inv000ar1n03x5 U3188 ( .a(1'b1), .o1(tl_o[7]) );
  b15inv000ar1n03x5 U3192 ( .a(1'b0), .o1(tl_o[15]) );
  b15inv000ar1n03x5 U3231 ( .a(1'b1), .o1(tl_o[16]) );
  b15inv000ar1n03x5 U3258 ( .a(1'b1), .o1(tl_o[17]) );
  b15inv000ar1n03x5 U3393 ( .a(1'b0), .o1(tl_o[18]) );
  b15inv000ar1n03x5 U3439 ( .a(1'b1), .o1(tl_o[19]) );
  b15inv000ar1n03x5 U3442 ( .a(1'b1), .o1(tl_o[20]) );
  b15inv000ar1n03x5 U3520 ( .a(1'b1), .o1(tl_o[21]) );
  b15inv000ar1n03x5 U3602 ( .a(1'b1), .o1(tl_o[22]) );
  b15inv000ar1n03x5 U3604 ( .a(1'b1), .o1(tl_o[23]) );
  b15inv000ar1n03x5 U3606 ( .a(1'b0), .o1(tl_o[56]) );
  b15inv000ar1n03x5 U3608 ( .a(1'b0), .o1(tl_o[57]) );
  b15inv000ar1n03x5 U3610 ( .a(1'b0), .o1(tl_o[58]) );
  b15inv000ar1n03x5 U3612 ( .a(1'b0), .o1(tl_o[59]) );
  b15inv000ar1n03x5 U3768 ( .a(1'b1), .o1(tl_o[60]) );
  b15inv000ar1n03x5 U3776 ( .a(1'b1), .o1(tl_o[61]) );
  b15inv000ar1n03x5 U3781 ( .a(1'b1), .o1(tl_o[93]) );
  b15inv000ar1n03x5 U3785 ( .a(1'b1), .o1(tl_o[94]) );
  b15inv000ar1n03x5 U3792 ( .a(1'b1), .o1(tl_o[95]) );
  b15inv000ar1n03x5 U3795 ( .a(1'b1), .o1(tl_o[96]) );
  b15inv000ar1n03x5 U3799 ( .a(1'b1), .o1(tl_o[97]) );
  b15inv000ar1n03x5 U3802 ( .a(1'b1), .o1(tl_o[98]) );
  b15inv000ar1n03x5 U3807 ( .a(1'b1), .o1(tl_o[99]) );
  b15inv000ar1n03x5 U3810 ( .a(1'b1), .o1(tl_o[100]) );
  b15inv000ar1n03x5 U3814 ( .a(1'b0), .o1(tl_o[101]) );
  b15inv000ar1n03x5 U3820 ( .a(1'b1), .o1(tl_o[102]) );
  b15inv000ar1n03x5 U3823 ( .a(1'b1), .o1(tl_o[103]) );
  b15inv000ar1n03x5 U3826 ( .a(1'b1), .o1(tl_o[104]) );
  b15inv000ar1n03x5 U3833 ( .a(1'b1), .o1(tl_o[105]) );
  b15inv000ar1n03x5 U3845 ( .a(1'b1), .o1(tl_o[106]) );
  b15nor002ar1n03x5 U3144 ( .a(n2824), .b(n2815), .o1(n2876) );
  b15nor002ar1n03x5 U3147 ( .a(n2827), .b(n2815), .o1(n2816) );
  b15nor002ar1n03x5 U3162 ( .a(n2824), .b(n2826), .o1(n2825) );
  b15nor002ar1n03x5 U3166 ( .a(n2827), .b(n2826), .o1(n2828) );
  b15nonb02ar1n03x5 U3169 ( .a(n3506), .b(n2829), .out0(n2830) );
  b15nor002ar1n03x5 U3784 ( .a(n3275), .b(n3285), .o1(n3308) );
  b15nor002ar1n03x5 U3797 ( .a(n3285), .b(n3282), .o1(n3283) );
  b15aoi022ar1n04x5 U3450 ( .a(n1869), .b(n3022), .c(n3018), .d(n3722), .o1(
        ctrl_data_rx[26]) );
  b15aoi022ar1n04x5 U3452 ( .a(n1869), .b(n3019), .c(n3137), .d(n3722), .o1(
        ctrl_data_rx[27]) );
  b15aoi022ar1n04x5 U3562 ( .a(n1869), .b(n3111), .c(n3129), .d(n3722), .o1(
        ctrl_data_rx[24]) );
  b15aboi22ar1n02x5 U2991 ( .c(n3723), .d(n2751), .a(u_rxreg_N30), .b(n3724), 
        .out0(ctrl_data_rx[1]) );
  b15inv000ar1n03x5 U2915 ( .a(spi_cs), .o1(n3679) );
  b15inv040ar1n03x5 U2916 ( .a(spi_cs), .o1(n3680) );
  b15inv000ar1n03x5 U2918 ( .a(spi_cs), .o1(n3682) );
  b15inv000ar1n03x5 U2922 ( .a(spi_cs), .o1(n3686) );
  b15inv040ar1n03x5 U2920 ( .a(spi_cs), .o1(n3684) );
  b15inv040ar1n03x5 U2919 ( .a(spi_cs), .o1(n3683) );
  b15inv000ar1n03x5 U3350 ( .a(n3257), .o1(n2971) );
  b15inv000ar1n03x5 U3751 ( .a(u_dcfifo_rx_u_dout_write_token_dn[0]), .o1(
        n3258) );
  b15inv000ar1n03x5 U3358 ( .a(n3273), .o1(n3276) );
  b15inv000ar1n03x5 U3772 ( .a(n3285), .o1(n3279) );
  b15inv000ar1n03x5 U3730 ( .a(n3243), .o1(n3242) );
  b15nonb03ar1n02x5 U3762 ( .a(u_syncro_valid_reg[1]), .b(
        u_spi_device_tlul_plug_state[1]), .c(u_syncro_valid_reg[2]), .out0(
        n3265) );
  b15inv000ar1n03x5 U3726 ( .a(n3248), .o1(n3245) );
  b15aobi12ar1n02x5 U3721 ( .b(u_dcfifo_tx_u_din_full_full_up), .c(
        u_dcfifo_tx_u_din_full_latched_full_s), .a(tl_i[65]), .out0(
        u_dcfifo_tx_u_din_write_enable) );
  b15nor003ar1n06x5 U3767 ( .a(u_spi_device_tlul_plug_state[1]), .b(n3267), 
        .c(n3266), .o1(n3292) );
endmodule

