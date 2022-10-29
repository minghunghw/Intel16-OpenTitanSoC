/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : S-2021.06-SP1
// Date      : Fri Oct 28 17:22:57 2022
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
         u_txreg_sclk_test, u_txreg_sclk_inv, u_txreg_N65, u_txreg_N64,
         u_txreg_N63, u_txreg_N62, u_txreg_N61, u_txreg_N60, u_txreg_N59,
         u_txreg_N58, u_txreg_N57, u_txreg_N56, u_txreg_N55, u_txreg_N54,
         u_txreg_N53, u_txreg_N52, u_txreg_N51, u_txreg_N50, u_txreg_N49,
         u_txreg_N48, u_txreg_N47, u_txreg_N46, u_txreg_N45, u_txreg_N44,
         u_txreg_N43, u_txreg_N42, u_txreg_N41, u_txreg_N40, u_txreg_N39,
         u_txreg_N38, u_txreg_N37, u_txreg_N36, u_txreg_N35, u_txreg_N34,
         u_txreg_N31, u_txreg_N30, u_txreg_N29, u_txreg_N28, u_txreg_N27,
         u_txreg_N26, u_txreg_N25, u_txreg_N24, u_txreg_N11, u_txreg_running,
         u_txreg_N10, u_device_sm_net774, u_device_sm_net769,
         u_device_sm_net763, u_device_sm_N205, u_device_sm_N204,
         u_device_sm_N203, u_device_sm_N202, u_device_sm_N201,
         u_device_sm_N200, u_device_sm_N199, u_device_sm_N198,
         u_device_sm_N197, u_device_sm_N196, u_device_sm_N195,
         u_device_sm_N194, u_device_sm_N193, u_device_sm_N192,
         u_device_sm_N191, u_device_sm_N190, u_device_sm_N189,
         u_device_sm_N188, u_device_sm_N187, u_device_sm_N186,
         u_device_sm_N185, u_device_sm_N184, u_device_sm_N183,
         u_device_sm_N182, u_device_sm_N181, u_device_sm_N180,
         u_device_sm_N179, u_device_sm_N178, u_device_sm_N177,
         u_device_sm_N176, u_device_sm_N175, u_device_sm_N174,
         u_device_sm_N163, u_device_sm_tx_done_reg,
         u_device_sm_tx_data_valid_next, u_device_sm_ctrl_data_tx_ready_next,
         u_device_sm_sample_CMD, u_device_sm_sample_ADDR,
         u_device_sm_tx_counter_upd_next, u_device_sm_tx_counter_next_3_,
         u_spi_device_tlul_plug_net617, u_spi_device_tlul_plug_net611,
         u_spi_device_tlul_plug_N61, u_spi_device_tlul_plug_we,
         u_syncro_rdwr_reg_0_, u_syncro_cs_reg_0_,
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
         n1881, n2656, n2723, n2726, n2727, n2728, n2729, n2730, n2731, n2732,
         n2733, n2734, n2735, n2736, n2737, n2738, n2739, n2740, n2741, n2742,
         n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751, n2763,
         n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771, n2772, n2773,
         n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781, n2782, n2783,
         n2784, n2787, n2788, n2789, n2790, n2791, n2792, n2793, n2794, n2795,
         n2796, n2797, n2798, n2799, n2802, n2803, n2804, n2805, n2806, n2807,
         n2808, n2809, n2810, n2811, n2812, n2813, n2814, n2815, n2816, n2819,
         n2820, n2822, n2823, n2824, n2825, n2826, n2827, n2828, n2829, n2830,
         n2831, n2832, n2833, n2834, n2835, n2836, n2837, n2838, n2839, n2840,
         n2841, n2842, n2843, n2844, n2845, n2846, n2847, n2848, n2849, n2850,
         n2851, n2852, n2853, n2854, n2855, n2856, n2857, n2858, n2859, n2860,
         n2861, n2862, n2863, n2864, n2865, n2866, n2867, n2868, n2870, n2871,
         n2872, n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880, n2881,
         n2882, n2883, n2884, n2885, n2886, n2887, n2888, n2889, n2890, n2891,
         n2892, n2893, n2894, n2895, n2896, n2897, n2898, n2899, n2900, n2901,
         n2902, n2903, n2904, n2905, n2906, n2907, n2908, n2917, n2919, n2920,
         n2921, n2922, n2923, n2925, n2927, n2928, n2929, n2930, n2931, n2932,
         n2933, n2934, n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942,
         n2943, n2945, n2946, n2948, n2951, n2953, n2954, n2955, n2956, n2957,
         n2958, n2959, n2960, n2961, n2962, n2963, n2964, n2965, n2966, n2967,
         n2968, n2969, n2970, n2971, n2972, n2973, n2974, n2975, n2976, n2977,
         n2978, n2979, n2980, n2981, n3001, n3002, n3003, n3004, n3005, n3006,
         n3007, n3008, n3009, n3010, n3011, n3012, n3013, n3014, n3015, n3016,
         n3017, n3018, n3019, n3020, n3021, n3022, n3023, n3024, n3025, n3026,
         n3027, n3028, n3029, n3031, n3035, n3036, n3037, n3038, n3039, n3041,
         n3042, n3043, n3044, n3045, n3047, n3048, n3049, n3050, n3051, n3052,
         n3053, n3054, n3055, n3056, n3058, n3059, n3060, n3061, n3062, n3063,
         n3064, n3065, n3066, n3067, n3068, n3069, n3070, n3071, n3072, n3073,
         n3074, n3075, n3076, n3077, n3078, n3079, n3080, n3081, n3082, n3083,
         n3084, n3085, n3086, n3087, n3088, n3089, n3090, n3091, n3092, n3093,
         n3094, n3095, n3096, n3097, n3098, n3099, n3100, n3101, n3102, n3103,
         n3104, n3105, n3106, n3107, n3108, n3109, n3110, n3111, n3112, n3114,
         n3115, n3116, n3117, n3118, n3119, n3120, n3121, n3122, n3123, n3124,
         n3125, n3126, n3127, n3128, n3131, n3132, n3133, n3134, n3135, n3136,
         n3137, n3138, n3139, n3140, n3143, n3144, n3145, n3146, n3148, n3150,
         n3151, n3152, n3153, n3155, n3157, n3158, n3159, n3160, n3161, n3162,
         n3163, n3164, n3169, n3170, n3171, n3172, n3173, n3174, n3176, n3177,
         n3178, n3179, n3180, n3181, n3182, n3183, n3184, n3185, n3186, n3187,
         n3188, n3189, n3190, n3191, n3192, n3193, n3194, n3196, n3197, n3198,
         n3199, n3200, n3201, n3202, n3203, n3204, n3205, n3206, n3209, n3210,
         n3211, n3212, n3213, n3214, n3215, n3216, n3222, n3223, n3224, n3225,
         n3226, n3227, n3228, n3229, n3230, n3233, n3234, n3235, n3236, n3237,
         n3238, n3239, n3240, n3241, n3242, n3243, n3244, n3245, n3246, n3247,
         n3248, n3249, n3250, n3251, n3252, n3253, n3254, n3255, n3256, n3257,
         n3258, n3259, n3260, n3261, n3262, n3263, n3264, n3265, n3266, n3267,
         n3268, n3269, n3270, n3271, n3272, n3273, n3274, n3275, n3276, n3277,
         n3278, n3279, n3280, n3281, n3282, n3283, n3284, n3285, n3286, n3287,
         n3288, n3289, n3290, n3291, n3292, n3293, n3294, n3295, n3296, n3297,
         n3298, n3299, n3300, n3301, n3302, n3303, n3304, n3305, n3306, n3307,
         n3308, n3309, n3310, n3311, n3312, n3313, n3314, n3315, n3316, n3317,
         n3318, n3319, n3320, n3321, n3322, n3323, n3324, n3325, n3326, n3327,
         n3328, n3329, n3330, n3331, n3332, n3333, n3334, n3335, n3336, n3337,
         n3338, n3339, n3340, n3341, n3342, n3343, n3344, n3345, n3346, n3347,
         n3348, n3349, n3350, n3351, n3352, n3353, n3354, n3355, n3356, n3357,
         n3358, n3359, n3360, n3361, n3362, n3363, n3364, n3365, n3366, n3367,
         n3368, n3369, n3370, n3372, n3373, n3374, n3375, n3376, n3380, n3381,
         n3382, n3383, n3384, n3385, n3386, n3387, n3388, n3389, n3390, n3391,
         n3392, n3393, n3394, n3398, n3399, n3400, n3401, n3402, n3404, n3405,
         n3406, n3407, n3408, n3409, n3410, n3411, n3412, n3413, n3415, n3416,
         n3417, n3418, n3419, n3420, n3421, n3422, n3423, n3424, n3425, n3426,
         n3427, n3428, n3429, n3430, n3431, n3432, n3433, n3434, n3435, n3436,
         n3437, n3438, n3439, n3440, n3441, n3442, n3443, n3444, n3445, n3446,
         n3447, n3448, n3449, n3450, n3451, n3452, n3453, n3454, n3455, n3456,
         n3457, n3458, n3459, n3460, n3461, n3462, n3463, n3464, n3465, n3466,
         n3467, n3468, n3469, n3471, n3472, n3473, n3474, n3475, n3477, n3478,
         n3479, n3480, n3481, n3482, n3483, n3484, n3485, n3486, n3487, n3488,
         n3489, n3490, n3491, n3492, n3493, n3494, n3495, n3496, n3497, n3498,
         n3499, n3500, n3501, n3503, n3504, n3505, n3506, n3507, n3510, n3511,
         n3512, n3513, n3514, n3517, n3518, n3519, n3520, n3521, n3525, n3526,
         n3527, n3528, n3529, n3532, n3533, n3534, n3535, n3536, n3542, n3543,
         n3544, n3545, n3546, n3556, n3557, n3558, n3559, n3560, n3561, n3562,
         n3563, n3564, n3565, n3566, n3567, n3568, n3569, n3570, n3571, n3572,
         n3573, n3574, n3575, n3576, n3577, n3578, n3579, n3580, n3581, n3582,
         n3583, n3584, n3585, n3586, n3587, n3588, n3589, n3590, n3591, n3592,
         n3593, n3594, n3595, n3596, n3597, n3598, n3599, n3600, n3601, n3602,
         n3603, n3604, n3605, n3606, n3607, n3608, n3609, n3610, n3611, n3612,
         n3613, n3614, n3615, n3616, n3617, n3618, n3619, n3620, n3621, n3622,
         n3623, n3625, n3626, n3627, n3628, n3629, n3631, n3632, n3633, n3634,
         n3635, n3636, n3637, n3638, n3639, n3640, n3641, n3642, n3643, n3644,
         n3645, n3646, n3647, n3648, n3649, n3650, n3651, n3652, n3653, n3654,
         n3655, n3656, n3657, n3658, n3659, n3660, n3661, n3662, n3663, n3664,
         n3665, n3666, n3675, n3676, n3677, n3678, n3679, n3680, n3681, n3682,
         n3683, n3685, n3688, n3769, n3770, n3771, n3772, n3773, n3774, n3776,
         n3777, n3778, n3780, n3781, n3782, n3783, n3784, n3785, n3786, n3787,
         n3788, n3789, n3790, n3791, n3792, n3793, n3794, n3795, n3796, n3797,
         n3798, n3799, n3800, n3801, n3802, n3803, n3804, n3805, n3806, n3807,
         n3808, n3809, n3811, n3812, n3813, n3815, n3817, n3818, n3819, n3820,
         n3821, n3822, n3897, n3898, n3899, n3900, n3901, n3902, n3903, n3904,
         n3905, n3906, n3907, n3908, n3909, n3910, n3911, n3912, n3913, n3914,
         n3915, n3916, n3917, n3918, n3919, n3920, n3922, n3923, n3924, n3925,
         n3926, n3927, n3928, n3929, n3930, n3931, n3932, n3934, n3935, n3938,
         n3939, n3940, n3941, n3942, n3943, n3944, n3945, n3946, n3947, n3949,
         n3950, n3952, n3953, n3955, n3959, n3960, n3962, n3963, n3964, n3966,
         n3967, n3968, n3969, n3970, n3971, n3972, n3973, n3974, n3975;
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
        .ssb(1'b1), .clk(clk_i), .psb(n3915), .o() );
  b15lsn000ar1n02x5 u_device_sm_pad_mode_next_reg_1_ ( .clk(u_device_sm_N163), 
        .d(1'b0), .o() );
  b15mbn022ar1n02x5 U2913 ( .b(u_txreg_sclk_inv), .a(spi_sclk), .sa(test_mode), 
        .o(u_txreg_sclk_test) );
  b15lsn000ar1n02x5 u_device_sm_pad_mode_next_reg_0_ ( .clk(u_device_sm_N163), 
        .d(1'b1), .o() );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[3]), .ssb(1'b1), .clk(spi_sclk), .psb(n3781), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[3]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_tx_write_token[2]), .ssb(1'b1), .clk(spi_sclk), .psb(n3781), .o(u_dcfifo_tx_u_dout_empty_synch_d_middle[2]) );
  b15fqy003ar1n02x5 u_device_sm_u_spiregs_reg1_reg_7_ ( .si(1'b0), .d(
        ctrl_data_rx[7]), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net802), .rb(
        n3962), .o(u_device_sm_s_dummy_cycles[7]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[2]), .ssb(1'b1), .clk(
        spi_sclk), .psb(n3781), .o(u_dcfifo_tx_u_dout_write_token_dn[2]) );
  b15fqy00car1n02x5 u_device_sm_u_spiregs_reg1_reg_5_ ( .si(1'b0), .d(n3820), 
        .ssb(1'b1), .clk(u_device_sm_u_spiregs_net802), .psb(n3789), .o(
        u_device_sm_s_dummy_cycles[5]) );
  b15fqy003ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_4_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[4]), .ssb(1'b1), .clk(
        spi_sclk), .rb(n3964), .o(u_dcfifo_tx_u_dout_write_token_dn[4]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_tx_u_dout_empty_synch_d_middle[3]), .ssb(1'b1), .clk(
        spi_sclk), .psb(n3781), .o(u_dcfifo_tx_u_dout_write_token_dn[3]) );
  b15fqy00car1n02x5 u_rxreg_counter_trgt_reg_0_ ( .si(1'b0), .d(
        u_rxreg_counter_trgt_next[0]), .ssb(1'b1), .clk(u_rxreg_net873), .psb(
        n3777), .o(u_rxreg_counter_trgt[0]) );
  b15fqy003ar1n02x5 u_rxreg_counter_trgt_reg_7_ ( .si(1'b0), .d(
        u_rxreg_counter_trgt_next[7]), .ssb(1'b1), .clk(u_rxreg_net873), .rb(
        n3778), .o(u_rxreg_counter_trgt[7]) );
  b15fqy003ar1n02x5 u_device_sm_tx_counter_reg_7_ ( .si(1'b0), .d(1'b0), .ssb(
        1'b1), .clk(spi_sclk), .rb(n3777), .o(tx_counter[7]) );
  b15fqy043ar1n02x5 u_txreg_running_reg ( .si(1'b0), .d(tx_counter_upd), .den(
        u_txreg_N10), .ssb(1'b1), .clk(u_txreg_sclk_test), .rb(n3777), .o(
        u_txreg_running) );
  b15fqy003ar1n02x5 u_device_sm_tx_data_reg_15_ ( .si(1'b0), .d(
        u_device_sm_N189), .ssb(1'b1), .clk(spi_sclk), .rb(n3773), .o(
        tx_data[15]) );
  b15fqy00car1n02x5 u_txreg_counter_trgt_reg_2_ ( .si(1'b0), .d(tx_counter[2]), 
        .ssb(1'b1), .clk(u_txreg_net840), .psb(n3769), .o(
        u_txreg_counter_trgt[2]) );
  b15fqy00car1n02x5 u_txreg_counter_trgt_reg_1_ ( .si(1'b0), .d(tx_counter[1]), 
        .ssb(1'b1), .clk(u_txreg_net840), .psb(n3769), .o(
        u_txreg_counter_trgt[1]) );
  b15fqy003ar1n02x5 u_txreg_counter_trgt_reg_7_ ( .si(1'b0), .d(tx_counter[7]), 
        .ssb(1'b1), .clk(u_txreg_net840), .rb(n3769), .o(
        u_txreg_counter_trgt[7]) );
  b15fqy00car1n02x5 u_txreg_counter_trgt_reg_0_ ( .si(1'b0), .d(tx_counter[0]), 
        .ssb(1'b1), .clk(u_txreg_net840), .psb(n3769), .o(
        u_txreg_counter_trgt[0]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_rx_write_token[2]), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), 
        .o(u_dcfifo_rx_u_dout_empty_synch_d_middle[2]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_rx_write_token[3]), .ssb(1'b1), .clk(clk_i), .psb(rst_ni), 
        .o(u_dcfifo_rx_u_dout_empty_synch_d_middle[3]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_2_ ( .si(1'b0), .d(
        u_dcfifo_rx_write_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .psb(n3969), .o(
        u_dcfifo_rx_write_token[2]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_3_ ( .si(1'b0), .d(
        u_dcfifo_rx_write_token[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .psb(n3969), .o(
        u_dcfifo_rx_write_token[3]) );
  b15fqy003ar1n02x5 u_syncro_valid_reg_reg_2_ ( .si(1'b0), .d(
        u_syncro_valid_reg[1]), .ssb(1'b1), .clk(clk_i), .rb(n3786), .o(
        u_syncro_valid_reg[2]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_3_ ( .si(1'b0), .d(
        u_dcfifo_tx_write_token[2]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .psb(n3781), .o(
        u_dcfifo_tx_write_token[3]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_2_ ( .si(1'b0), .d(
        u_dcfifo_tx_write_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .psb(n3783), .o(
        u_dcfifo_tx_write_token[2]) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_0_ ( .si(1'b0), .d(
        u_dcfifo_tx_u_dout_read_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .psb(n3792), .o(
        u_dcfifo_tx_u_dout_read_token[0]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_3_ ( .si(1'b0), 
        .d(u_dcfifo_rx_u_dout_empty_synch_d_middle[3]), .ssb(1'b1), .clk(clk_i), .psb(n3915), .o(u_dcfifo_rx_u_dout_write_token_dn[3]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_2_ ( .si(1'b0), 
        .d(u_dcfifo_rx_u_dout_empty_synch_d_middle[2]), .ssb(1'b1), .clk(clk_i), .psb(n3915), .o(u_dcfifo_rx_u_dout_write_token_dn[2]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_0_ ( .si(1'b0), .d(
        u_dcfifo_rx_u_dout_read_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .psb(n3915), .o(
        u_dcfifo_rx_u_dout_read_token[0]) );
  b15fqy00car1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_1_ ( .si(1'b0), .d(
        u_dcfifo_rx_u_dout_read_token[0]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .psb(n3915), .o(
        u_dcfifo_rx_u_dout_read_token[1]) );
  b15fqy043ar1n02x5 u_rxreg_running_reg ( .si(1'b0), .d(n2656), .den(
        u_rxreg_N9), .ssb(1'b1), .clk(spi_sclk), .rb(n3774), .o(n1869) );
  b15aoi022ar1n02x3 U2920 ( .a(n3812), .b(n2729), .c(n2787), .d(n3813), .o1(
        u_rxreg_N34) );
  b15inv000ar1n03x5 U2922 ( .a(u_rxreg_data_int[3]), .o1(n2726) );
  b15aoi022ar1n02x3 U2926 ( .a(n3912), .b(spi_sdi3), .c(u_rxreg_data_int[2]), 
        .d(n3817), .o1(n2778) );
  b15aoi022ar1n02x3 U2932 ( .a(n3912), .b(n2726), .c(n2798), .d(n3817), .o1(
        u_rxreg_N36) );
  b15oa0022ar1n03x5 U2934 ( .a(n3809), .b(u_rxreg_data_int[7]), .c(u_rxreg_N36), .d(n3808), .o(ctrl_data_rx[7]) );
  b15oai022ar1n02x5 U2936 ( .a(n3817), .b(u_rxreg_data_int[2]), .c(
        u_rxreg_data_int[5]), .d(n3912), .o1(n2776) );
  b15nandp2ar1n03x5 U2938 ( .a(n3912), .b(spi_sdi1), .o1(n2727) );
  b15aob012ar1n03x5 U2939 ( .b(n3817), .c(u_rxreg_data_int[0]), .a(n2727), 
        .out0(u_rxreg_N30) );
  b15nandp2ar1n03x5 U2942 ( .a(n3912), .b(spi_sdi2), .o1(n2728) );
  b15oai012ar1n03x5 U2943 ( .b(n3912), .c(n2729), .a(n2728), .o1(u_rxreg_N31)
         );
  b15oa0022ar1n03x5 U2944 ( .a(n3809), .b(u_rxreg_data_int[2]), .c(u_rxreg_N31), .d(n3808), .o(ctrl_data_rx[2]) );
  b15oai022ar1n02x5 U2945 ( .a(n3817), .b(u_rxreg_data_int[0]), .c(
        u_rxreg_data_int[3]), .d(n3912), .o1(n2777) );
  b15inv000ar1n03x5 U2948 ( .a(u_rxreg_counter_trgt[6]), .o1(n2731) );
  b15aoi022ar1n02x3 U2949 ( .a(n2871), .b(u_rxreg_counter[4]), .c(
        u_rxreg_counter[6]), .d(n2731), .o1(n2730) );
  b15oai122ar1n02x5 U2950 ( .b(n2871), .c(u_rxreg_counter[4]), .d(n2731), .e(
        u_rxreg_counter[6]), .a(n2730), .o1(n2742) );
  b15inv000ar1n03x5 U2952 ( .a(u_rxreg_counter_trgt[2]), .o1(n2733) );
  b15aoi022ar1n02x3 U2953 ( .a(n2874), .b(u_rxreg_counter[0]), .c(
        u_rxreg_counter[2]), .d(n2733), .o1(n2732) );
  b15oai122ar1n02x5 U2954 ( .b(n2874), .c(u_rxreg_counter[0]), .d(n2733), .e(
        u_rxreg_counter[2]), .a(n2732), .o1(n2741) );
  b15inv000ar1n03x5 U2955 ( .a(u_rxreg_counter_trgt[5]), .o1(n2736) );
  b15inv000ar1n03x5 U2956 ( .a(u_rxreg_counter_trgt[1]), .o1(n2735) );
  b15aoi022ar1n02x3 U2957 ( .a(n2736), .b(u_rxreg_counter[5]), .c(
        u_rxreg_counter[1]), .d(n2735), .o1(n2734) );
  b15oai122ar1n02x5 U2958 ( .b(n2736), .c(u_rxreg_counter[5]), .d(n2735), .e(
        u_rxreg_counter[1]), .a(n2734), .o1(n2740) );
  b15inv000ar1n03x5 U2959 ( .a(u_rxreg_counter_trgt[7]), .o1(n2738) );
  b15aoi022ar1n02x3 U2961 ( .a(n2738), .b(u_rxreg_counter[7]), .c(
        u_rxreg_counter[3]), .d(n2870), .o1(n2737) );
  b15oai122ar1n02x5 U2962 ( .b(n2738), .c(u_rxreg_counter[7]), .d(n2870), .e(
        u_rxreg_counter[3]), .a(n2737), .o1(n2739) );
  b15nor004ar1n02x7 U2963 ( .a(n2742), .b(n2741), .c(n2740), .d(n2739), .o1(
        n2781) );
  b15inv000ar1n03x5 U2964 ( .a(n2781), .o1(n2868) );
  b15nor002ar1n03x5 U2965 ( .a(n2868), .b(n1869), .o1(n2878) );
  b15inv000ar1n03x5 U2966 ( .a(u_device_sm_state[2]), .o1(n2840) );
  b15inv000ar1n03x5 U2967 ( .a(u_device_sm_state[1]), .o1(n2841) );
  b15nandp2ar1n03x5 U2968 ( .a(n2840), .b(n2841), .o1(n2876) );
  b15nor002ar1n03x5 U2969 ( .a(n2876), .b(u_device_sm_state[0]), .o1(n2750) );
  b15oai022ar1n02x5 U2971 ( .a(n3811), .b(u_rxreg_data_int[5]), .c(u_rxreg_N34), .d(n1869), .o1(n2802) );
  b15nandp2ar1n03x5 U2972 ( .a(n3819), .b(u_device_sm_cmd_reg[5]), .o1(n2743)
         );
  b15oai012ar1n03x5 U2973 ( .b(n3819), .c(n2802), .a(n2743), .o1(n2751) );
  b15inv000ar1n03x5 U2974 ( .a(n2751), .o1(n2746) );
  b15nandp2ar1n03x5 U2975 ( .a(n3819), .b(u_device_sm_cmd_reg[3]), .o1(n2744)
         );
  b15aob012ar1n03x5 U2976 ( .b(n2750), .c(ctrl_data_rx[3]), .a(n2744), .out0(
        n2832) );
  b15nor002ar1n03x5 U2977 ( .a(n2746), .b(n2832), .o1(n2858) );
  b15oai022ar1n02x5 U2978 ( .a(n3811), .b(u_rxreg_data_int[0]), .c(spi_sdi0), 
        .d(n1869), .o1(n2783) );
  b15nandp2ar1n03x5 U2979 ( .a(n3819), .b(u_device_sm_cmd_reg[0]), .o1(n2745)
         );
  b15oai012ar1n03x5 U2980 ( .b(n3819), .c(n2783), .a(n2745), .o1(n2833) );
  b15inv000ar1n03x5 U2981 ( .a(n2833), .o1(n2748) );
  b15nandp2ar1n03x5 U2982 ( .a(n2833), .b(n2746), .o1(n2831) );
  b15nor002ar1n03x5 U2983 ( .a(n2832), .b(n2831), .o1(n2826) );
  b15orn003ar1n03x5 U2984 ( .a(n3819), .b(ctrl_data_rx[7]), .c(ctrl_data_rx[6]), .o(n2747) );
  b15oai013ar1n02x3 U2985 ( .b(n2750), .c(u_device_sm_cmd_reg[7]), .d(
        u_device_sm_cmd_reg[6]), .a(n2747), .o1(n2825) );
  b15aoi022ar1n02x3 U2986 ( .a(n2750), .b(ctrl_data_rx[1]), .c(
        u_device_sm_cmd_reg[1]), .d(n3819), .o1(n2822) );
  b15aoi022ar1n02x3 U2987 ( .a(n2750), .b(ctrl_data_rx[2]), .c(
        u_device_sm_cmd_reg[2]), .d(n3819), .o1(n2837) );
  b15nandp2ar1n03x5 U2988 ( .a(n2822), .b(n2837), .o1(n2828) );
  b15aoai13ar1n02x3 U2990 ( .c(n2858), .d(n2748), .b(n2826), .a(n2859), .o1(
        n2839) );
  b15nandp2ar1n03x5 U2992 ( .a(n3819), .b(u_device_sm_cmd_reg[4]), .o1(n2749)
         );
  b15aob012ar1n03x5 U2993 ( .b(n2750), .c(ctrl_data_rx[4]), .a(n2749), .out0(
        n2836) );
  b15nor002ar1n03x5 U2994 ( .a(n2822), .b(n2836), .o1(n2824) );
  b15nand03ar1n03x5 U2995 ( .a(n2837), .b(n2824), .c(n2825), .o1(n2830) );
  b15nor004ar1n02x3 U2996 ( .a(n2833), .b(n2832), .c(n2751), .d(n2830), .o1(
        n2880) );
  b15nor002ar1n03x5 U2997 ( .a(n2853), .b(n2880), .o1(n2847) );
  b15inv000ar1n03x5 U2998 ( .a(u_device_sm_state[0]), .o1(n2852) );
  b15nor003ar1n02x7 U2999 ( .a(u_device_sm_state[1]), .b(n2840), .c(n2852), 
        .o1(n2890) );
  b15nand03ar1n03x5 U3000 ( .a(n2878), .b(n2847), .c(n2890), .o1(n2877) );
  b15nor002ar1n03x5 U3001 ( .a(n3813), .b(n2877), .o1(u_device_sm_N163) );
  b15inv000ar1n03x5 U3002 ( .a(spi_sclk), .o1(u_txreg_sclk_inv) );
  b15nandp2ar1n03x5 U3049 ( .a(u_dcfifo_tx_u_dout_read_token[0]), .b(
        u_dcfifo_tx_u_dout_read_token[1]), .o1(n3645) );
  b15nor002ar1n03x5 U3050 ( .a(u_dcfifo_tx_u_dout_write_token_dn[1]), .b(n3645), .o1(n2775) );
  b15nandp2ar1n03x5 U3052 ( .a(u_dcfifo_tx_u_dout_read_token[4]), .b(
        u_dcfifo_tx_u_dout_read_token[5]), .o1(n3647) );
  b15and003ar1n03x5 U3054 ( .a(n2765), .b(n3001), .c(
        u_dcfifo_tx_u_dout_write_token_dn[6]), .o(n2774) );
  b15nandp2ar1n03x5 U3055 ( .a(u_dcfifo_tx_u_dout_read_token[1]), .b(
        u_dcfifo_tx_u_dout_read_token[2]), .o1(n3638) );
  b15inv000ar1n03x5 U3057 ( .a(u_dcfifo_tx_u_dout_write_token_dn[2]), .o1(
        n2764) );
  b15nandp2ar1n03x5 U3058 ( .a(u_dcfifo_tx_u_dout_read_token[5]), .b(
        u_dcfifo_tx_u_dout_read_token[6]), .o1(n3653) );
  b15nonb03ar1n02x5 U3059 ( .a(u_dcfifo_tx_u_dout_write_token_dn[7]), .b(
        u_dcfifo_tx_u_dout_write_token_dn[6]), .c(n3653), .out0(n2763) );
  b15aoi013ar1n02x3 U3060 ( .b(n3635), .c(u_dcfifo_tx_u_dout_write_token_dn[3]), .d(n2764), .a(n2763), .o1(n2772) );
  b15nandp2ar1n03x5 U3061 ( .a(u_dcfifo_tx_u_dout_read_token[2]), .b(
        u_dcfifo_tx_u_dout_read_token[3]), .o1(n3637) );
  b15inv000ar1n03x5 U3063 ( .a(u_dcfifo_tx_u_dout_write_token_dn[3]), .o1(
        n2767) );
  b15nandp2ar1n03x5 U3064 ( .a(u_dcfifo_tx_u_dout_read_token[4]), .b(
        u_dcfifo_tx_u_dout_read_token[3]), .o1(n3640) );
  b15nor003ar1n02x7 U3065 ( .a(u_dcfifo_tx_u_dout_write_token_dn[4]), .b(n2765), .c(n3640), .o1(n2766) );
  b15aoi013ar1n02x3 U3066 ( .b(n3650), .c(u_dcfifo_tx_u_dout_write_token_dn[4]), .d(n2767), .a(n2766), .o1(n2771) );
  b15nandp2ar1n03x5 U3067 ( .a(u_dcfifo_tx_u_dout_read_token[0]), .b(
        u_dcfifo_tx_u_dout_read_token[7]), .o1(n3008) );
  b15nandp2ar1n03x5 U3070 ( .a(u_dcfifo_tx_u_dout_read_token[7]), .b(
        u_dcfifo_tx_u_dout_read_token[6]), .o1(n3641) );
  b15oai013ar1n02x3 U3071 ( .b(u_dcfifo_tx_u_dout_write_token_dn[7]), .c(n3641), .d(n2769), .a(ctrl_data_tx_ready), .o1(n2768) );
  b15aoi013ar1n02x3 U3072 ( .b(n3633), .c(u_dcfifo_tx_u_dout_write_token_dn[1]), .d(n2769), .a(n2768), .o1(n2770) );
  b15nand03ar1n03x5 U3073 ( .a(n2772), .b(n2771), .c(n2770), .o1(n2773) );
  b15aoi112ar1n02x3 U3074 ( .c(n2775), .d(u_dcfifo_tx_u_dout_write_token_dn[2]), .a(n2774), .b(n2773), .o1(u_dcfifo_tx_u_dout_read_enable) );
  b15nandp2ar1n03x5 U3075 ( .a(n2840), .b(u_device_sm_state[1]), .o1(n2842) );
  b15nor002ar1n03x5 U3076 ( .a(n2852), .b(n2842), .o1(n2860) );
  b15nor002ar1n03x5 U3077 ( .a(n2860), .b(n3813), .o1(spi_mode[1]) );
  b15oai022ar1n02x5 U3078 ( .a(n3813), .b(u_rxreg_data_int[25]), .c(
        u_rxreg_data_int[28]), .d(n3812), .o1(n2784) );
  b15nor002ar1n03x5 U3082 ( .a(u_rxreg_counter[0]), .b(n2781), .o1(u_rxreg_N22) );
  b15oai022ar1n02x5 U3083 ( .a(n3817), .b(u_rxreg_data_int[20]), .c(
        u_rxreg_data_int[23]), .d(n3912), .o1(n2811) );
  b15oai022ar1n02x5 U3085 ( .a(n3817), .b(u_rxreg_data_int[22]), .c(
        u_rxreg_data_int[25]), .d(n3912), .o1(n2807) );
  b15oai022ar1n02x5 U3087 ( .a(n3817), .b(u_rxreg_data_int[17]), .c(
        u_rxreg_data_int[20]), .d(n3912), .o1(n2813) );
  b15oai022ar1n02x5 U3089 ( .a(n3813), .b(u_rxreg_data_int[5]), .c(
        u_rxreg_data_int[8]), .d(n3812), .o1(n2803) );
  b15oai022ar1n02x5 U3091 ( .a(n3817), .b(u_rxreg_data_int[14]), .c(
        u_rxreg_data_int[17]), .d(n3912), .o1(n2805) );
  b15oai022ar1n02x5 U3093 ( .a(n3813), .b(u_rxreg_data_int[8]), .c(
        u_rxreg_data_int[11]), .d(n3812), .o1(n2815) );
  b15oai022ar1n02x5 U3095 ( .a(n3813), .b(u_rxreg_data_int[23]), .c(
        u_rxreg_data_int[26]), .d(n3812), .o1(n2809) );
  b15oai022ar1n02x5 U3097 ( .a(n3817), .b(u_rxreg_data_int[11]), .c(
        u_rxreg_data_int[14]), .d(n3912), .o1(n2819) );
  b15inv000ar1n03x5 U3099 ( .a(n2778), .o1(u_rxreg_N32) );
  b15inv000ar1n03x5 U3100 ( .a(u_rxreg_counter[2]), .o1(n2779) );
  b15nandp2ar1n03x5 U3101 ( .a(u_rxreg_counter[0]), .b(u_rxreg_counter[1]), 
        .o1(n2788) );
  b15and003ar1n03x5 U3102 ( .a(u_rxreg_counter[0]), .b(u_rxreg_counter[2]), 
        .c(u_rxreg_counter[1]), .o(n2791) );
  b15aoi112ar1n02x3 U3103 ( .c(n2779), .d(n2788), .a(n2791), .b(n2781), .o1(
        u_rxreg_N24) );
  b15inv000ar1n03x5 U3104 ( .a(u_rxreg_counter[4]), .o1(n2780) );
  b15nandp2ar1n03x5 U3105 ( .a(u_rxreg_counter[3]), .b(n2791), .o1(n2790) );
  b15nor002ar1n03x5 U3106 ( .a(n2780), .b(n2790), .o1(n2794) );
  b15aoi112ar1n02x3 U3107 ( .c(n2780), .d(n2790), .a(n2794), .b(n2781), .o1(
        u_rxreg_N26) );
  b15inv000ar1n03x5 U3108 ( .a(u_rxreg_counter[6]), .o1(n2782) );
  b15nandp2ar1n03x5 U3109 ( .a(u_rxreg_counter[5]), .b(n2794), .o1(n2793) );
  b15nor002ar1n03x5 U3110 ( .a(n2782), .b(n2793), .o1(n2797) );
  b15aoi112ar1n02x3 U3111 ( .c(n2782), .d(n2793), .a(n2797), .b(n2781), .o1(
        u_rxreg_N28) );
  b15nandp2ar1n03x5 U3112 ( .a(u_device_sm_state[0]), .b(n3812), .o1(n3619) );
  b15nor002ar1n03x5 U3113 ( .a(n2842), .b(n3619), .o1(spi_mode[0]) );
  b15aboi22ar1n02x3 U3118 ( .c(n3812), .d(n2787), .a(u_rxreg_data_int[7]), .b(
        n3813), .out0(u_rxreg_N37) );
  b15oa0022ar1n03x5 U3119 ( .a(u_rxreg_N37), .b(n3806), .c(u_rxreg_data_int[8]), .d(n3807), .o(ctrl_data_rx[8]) );
  b15aboi22ar1n02x3 U3121 ( .c(n3812), .d(n2810), .a(u_rxreg_data_int[30]), 
        .b(n3813), .out0(u_rxreg_N60) );
  b15ao0022ar1n03x5 U3122 ( .a(u_rxreg_data_int[31]), .b(n3806), .c(
        u_rxreg_N60), .d(n3807), .o(ctrl_data_rx[31]) );
  b15oai112ar1n02x5 U3123 ( .c(u_rxreg_counter[0]), .d(u_rxreg_counter[1]), 
        .a(n2788), .b(n2868), .o1(n2789) );
  b15inv000ar1n03x5 U3124 ( .a(n2789), .o1(u_rxreg_N23) );
  b15oai112ar1n02x5 U3125 ( .c(u_rxreg_counter[3]), .d(n2791), .a(n2790), .b(
        n2868), .o1(n2792) );
  b15inv000ar1n03x5 U3126 ( .a(n2792), .o1(u_rxreg_N25) );
  b15oai112ar1n02x5 U3127 ( .c(u_rxreg_counter[5]), .d(n2794), .a(n2793), .b(
        n2868), .o1(n2795) );
  b15inv000ar1n03x5 U3128 ( .a(n2795), .o1(u_rxreg_N27) );
  b15oa0022ar1n03x5 U3129 ( .a(n3813), .b(u_rxreg_data_int[7]), .c(
        u_rxreg_data_int[10]), .d(n3812), .o(u_rxreg_N40) );
  b15oa0022ar1n03x5 U3130 ( .a(u_rxreg_N40), .b(n3806), .c(
        u_rxreg_data_int[11]), .d(n3807), .o(ctrl_data_rx[11]) );
  b15oa0022ar1n03x5 U3131 ( .a(n3815), .b(u_rxreg_data_int[16]), .c(
        u_rxreg_data_int[19]), .d(en_quad), .o(u_rxreg_N49) );
  b15oa0022ar1n03x5 U3132 ( .a(n3809), .b(u_rxreg_data_int[20]), .c(
        u_rxreg_N49), .d(n3808), .o(ctrl_data_rx[20]) );
  b15oa0022ar1n03x5 U3133 ( .a(n3815), .b(u_rxreg_data_int[13]), .c(
        u_rxreg_data_int[16]), .d(en_quad), .o(u_rxreg_N46) );
  b15oa0022ar1n03x5 U3134 ( .a(n3809), .b(u_rxreg_data_int[17]), .c(
        u_rxreg_N46), .d(n3808), .o(ctrl_data_rx[17]) );
  b15oa0022ar1n03x5 U3135 ( .a(n3815), .b(u_rxreg_data_int[19]), .c(
        u_rxreg_data_int[22]), .d(en_quad), .o(u_rxreg_N52) );
  b15oa0022ar1n03x5 U3136 ( .a(n3809), .b(u_rxreg_data_int[23]), .c(
        u_rxreg_N52), .d(n3808), .o(ctrl_data_rx[23]) );
  b15oa0022ar1n03x5 U3137 ( .a(n3815), .b(u_rxreg_data_int[10]), .c(
        u_rxreg_data_int[13]), .d(en_quad), .o(u_rxreg_N43) );
  b15oa0022ar1n03x5 U3138 ( .a(n3809), .b(u_rxreg_data_int[14]), .c(
        u_rxreg_N43), .d(n3808), .o(ctrl_data_rx[14]) );
  b15oai012ar1n03x5 U3139 ( .b(u_rxreg_counter[7]), .c(n2797), .a(n2868), .o1(
        n2796) );
  b15aoi012ar1n02x5 U3140 ( .b(u_rxreg_counter[7]), .c(n2797), .a(n2796), .o1(
        u_rxreg_N29) );
  b15aoi022ar1n02x3 U3143 ( .a(n3912), .b(n2806), .c(n2814), .d(n3817), .o1(
        u_rxreg_N51) );
  b15oa0022ar1n03x5 U3144 ( .a(n3809), .b(u_rxreg_data_int[22]), .c(
        u_rxreg_N51), .d(n3808), .o(ctrl_data_rx[22]) );
  b15aoi022ar1n02x3 U3146 ( .a(n3912), .b(n2798), .c(n2804), .d(n3817), .o1(
        u_rxreg_N39) );
  b15oa0022ar1n03x5 U3147 ( .a(n3809), .b(u_rxreg_data_int[10]), .c(
        u_rxreg_N39), .d(n3808), .o(ctrl_data_rx[10]) );
  b15aoi022ar1n02x3 U3149 ( .a(n3912), .b(n2820), .c(n2806), .d(n3817), .o1(
        u_rxreg_N48) );
  b15oa0022ar1n03x5 U3150 ( .a(n3809), .b(u_rxreg_data_int[19]), .c(
        u_rxreg_N48), .d(n3808), .o(ctrl_data_rx[19]) );
  b15aoi022ar1n02x3 U3152 ( .a(n3812), .b(n2804), .c(n2816), .d(n3813), .o1(
        u_rxreg_N42) );
  b15oa0022ar1n03x5 U3153 ( .a(n3809), .b(u_rxreg_data_int[13]), .c(
        u_rxreg_N42), .d(n3808), .o(ctrl_data_rx[13]) );
  b15aoi022ar1n02x3 U3154 ( .a(n3812), .b(n2816), .c(n2820), .d(n3813), .o1(
        u_rxreg_N45) );
  b15oa0022ar1n03x5 U3155 ( .a(n3809), .b(u_rxreg_data_int[16]), .c(
        u_rxreg_N45), .d(n3808), .o(ctrl_data_rx[16]) );
  b15aoi022ar1n02x3 U3157 ( .a(en_quad), .b(n2814), .c(n2812), .d(n3815), .o1(
        u_rxreg_N54) );
  b15oa0022ar1n03x5 U3158 ( .a(n3809), .b(u_rxreg_data_int[25]), .c(
        u_rxreg_N54), .d(n3808), .o(ctrl_data_rx[25]) );
  b15inv000ar1n03x5 U3159 ( .a(u_rxreg_data_int[26]), .o1(n2808) );
  b15aoi022ar1n02x3 U3160 ( .a(n3812), .b(n2808), .c(n2799), .d(n3813), .o1(
        u_rxreg_N59) );
  b15ao0022ar1n03x5 U3161 ( .a(n1869), .b(u_rxreg_data_int[30]), .c(
        u_rxreg_N59), .d(n3811), .o(ctrl_data_rx[30]) );
  b15aoi022ar1n02x3 U3162 ( .a(en_quad), .b(n2812), .c(n2810), .d(n3815), .o1(
        u_rxreg_N57) );
  b15ao0022ar1n03x5 U3163 ( .a(n3806), .b(u_rxreg_data_int[28]), .c(
        u_rxreg_N57), .d(n3811), .o(ctrl_data_rx[28]) );
  b15inv000ar1n03x5 U3173 ( .a(n2878), .o1(n2862) );
  b15nand03ar1n03x5 U3174 ( .a(u_device_sm_state[2]), .b(n2852), .c(n2841), 
        .o1(n2889) );
  b15nor002ar1n03x5 U3175 ( .a(n2862), .b(n2889), .o1(n2865) );
  b15inv000ar1n03x5 U3176 ( .a(n2865), .o1(n2898) );
  b15nand04ar1n03x5 U3178 ( .a(n2826), .b(n2822), .c(n2829), .d(n2825), .o1(
        n3228) );
  b15nor002ar1n03x5 U3179 ( .a(n2898), .b(n3228), .o1(
        u_device_sm_u_spiregs_N32) );
  b15nandp2ar1n03x5 U3180 ( .a(n2858), .b(n2859), .o1(n2823) );
  b15nor002ar1n03x5 U3181 ( .a(n2829), .b(n2823), .o1(n3665) );
  b15and002ar1n02x5 U3182 ( .a(n3665), .b(n2865), .o(u_device_sm_u_spiregs_N31) );
  b15nor002ar1n03x5 U3183 ( .a(n2836), .b(n2823), .o1(n3663) );
  b15and002ar1n02x5 U3184 ( .a(n3663), .b(n2865), .o(u_device_sm_u_spiregs_N34) );
  b15nanb02ar1n02x5 U3185 ( .a(n2837), .b(n2824), .out0(n2827) );
  b15nandp2ar1n03x5 U3186 ( .a(n2826), .b(n2825), .o1(n2835) );
  b15nor002ar1n03x5 U3189 ( .a(n2898), .b(n3821), .o1(
        u_device_sm_u_spiregs_N33) );
  b15nanb02ar1n02x5 U3190 ( .a(n2876), .b(u_device_sm_state[0]), .out0(n2879)
         );
  b15nor002ar1n03x5 U3192 ( .a(u_device_sm_state[0]), .b(n2842), .o1(n2891) );
  b15inv000ar1n03x5 U3195 ( .a(n2886), .o1(n2846) );
  b15nor002ar1n03x5 U3196 ( .a(n2862), .b(n2846), .o1(n3611) );
  b15inv000ar1n03x5 U3197 ( .a(n3611), .o1(n3613) );
  b15oaoi13ar1n02x3 U3198 ( .c(n2879), .d(n3194), .b(n2851), .a(n3613), .o1(
        u_rxreg_counter_trgt_next[5]) );
  b15aoi013ar1n02x3 U3199 ( .b(n2858), .c(n2833), .d(n2859), .a(n2886), .o1(
        n2834) );
  b15oai013ar1n02x3 U3200 ( .b(n2837), .c(n2836), .d(n2835), .a(n2834), .o1(
        ctrl_rd_wr) );
  b15nor002ar1n03x5 U3201 ( .a(n2862), .b(n3819), .o1(u_device_sm_sample_CMD)
         );
  b15inv000ar1n03x5 U3202 ( .a(ctrl_rd_wr), .o1(n2845) );
  b15nandp2ar1n03x5 U3203 ( .a(n2891), .b(n2878), .o1(n2856) );
  b15nor002ar1n03x5 U3204 ( .a(n2878), .b(n2879), .o1(n2838) );
  b15nor002ar1n03x5 U3205 ( .a(n2880), .b(n2886), .o1(n3617) );
  b15nandp2ar1n03x5 U3206 ( .a(n3617), .b(u_device_sm_tx_done_reg), .o1(n2861)
         );
  b15and003ar1n03x5 U3207 ( .a(u_device_sm_state[1]), .b(u_device_sm_state[0]), 
        .c(n2861), .o(n2849) );
  b15aoi112ar1n02x3 U3208 ( .c(u_device_sm_sample_CMD), .d(n2839), .a(n2838), 
        .b(n2849), .o1(n2844) );
  b15aoi012ar1n02x5 U3209 ( .b(n2878), .c(n2841), .a(n2840), .o1(n3618) );
  b15oai112ar1n02x5 U3210 ( .c(n2847), .d(n3618), .a(u_device_sm_state[0]), 
        .b(n2842), .o1(n2843) );
  b15oai112ar1n02x5 U3211 ( .c(n2845), .d(n2856), .a(n2844), .b(n2843), .o1(
        u_device_sm_state_next[0]) );
  b15nor002ar1n03x5 U3212 ( .a(n2879), .b(n2862), .o1(u_device_sm_sample_ADDR)
         );
  b15nandp2ar1n03x5 U3213 ( .a(n2846), .b(ctrl_rd_wr), .o1(n3627) );
  b15inv000ar1n03x5 U3214 ( .a(u_device_sm_sample_ADDR), .o1(n2857) );
  b15nor002ar1n03x5 U3216 ( .a(n2886), .b(n3620), .o1(n3632) );
  b15aobi12ar1n02x5 U3217 ( .b(u_device_sm_sample_CMD), .c(n3632), .a(n2877), 
        .out0(n2855) );
  b15oaoi13ar1n02x3 U3218 ( .c(n2886), .d(n3620), .b(n2878), .a(n2851), .o1(
        n2848) );
  b15aoi112ar1n02x3 U3219 ( .c(u_device_sm_state[1]), .d(u_device_sm_state[2]), 
        .a(n2849), .b(n2848), .o1(n2850) );
  b15oai112ar1n02x5 U3220 ( .c(n3627), .d(n2857), .a(n2855), .b(n2850), .o1(
        u_device_sm_state_next[1]) );
  b15oai012ar1n03x5 U3221 ( .b(n2876), .c(n2852), .a(n2851), .o1(n3626) );
  b15nano22ar1n03x5 U3222 ( .a(n3626), .b(n2878), .c(n3632), .out0(n2866) );
  b15aoi112ar1n02x3 U3223 ( .c(u_device_sm_sample_CMD), .d(n2853), .a(n2866), 
        .b(n3618), .o1(n2854) );
  b15nandp2ar1n03x5 U3224 ( .a(n2890), .b(n3620), .o1(n2863) );
  b15oai112ar1n02x5 U3225 ( .c(n3617), .d(n2889), .a(n2854), .b(n2863), .o1(
        u_device_sm_state_next[2]) );
  b15nanb03ar1n03x5 U3226 ( .a(n3617), .b(n2860), .c(u_device_sm_tx_done_reg), 
        .out0(n2875) );
  b15oai112ar1n02x5 U3227 ( .c(n3627), .d(n2856), .a(n2855), .b(n2875), .o1(
        u_device_sm_tx_data_valid_next) );
  b15oabi12ar1n03x5 U3228 ( .b(n3627), .c(n2857), .a(
        u_device_sm_tx_data_valid_next), .out0(u_device_sm_tx_counter_upd_next) );
  b15aoi012ar1n02x5 U3229 ( .b(n2859), .c(n2858), .a(n3664), .o1(n3666) );
  b15nor002ar1n03x5 U3232 ( .a(n3174), .b(n3176), .o1(n3681) );
  b15ao0012ar1n02x5 U3233 ( .b(n3681), .c(n2865), .a(
        u_dcfifo_rx_u_din_full_full_up), .o(u_dcfifo_rx_u_din_full_N0) );
  b15inv000ar1n03x5 U3234 ( .a(n2860), .o1(n3622) );
  b15nor002ar1n03x5 U3235 ( .a(n2861), .b(n3622), .o1(n2867) );
  b15oaoi13ar1n02x3 U3236 ( .c(n3632), .d(n3819), .b(n2863), .a(n2862), .o1(
        n2864) );
  b15nor004ar1n02x7 U3237 ( .a(n2867), .b(n2866), .c(n2865), .d(n2864), .o1(
        n2656) );
  b15nandp2ar1n03x5 U3238 ( .a(n2656), .b(n2868), .o1(u_rxreg_N9) );
  b15nor004ar1n02x3 U3239 ( .a(u_rxreg_counter_trgt[2]), .b(
        u_rxreg_counter_trgt[5]), .c(u_rxreg_counter_trgt[1]), .d(
        u_rxreg_counter_trgt[7]), .o1(n2872) );
  b15nand04ar1n03x5 U3240 ( .a(n2872), .b(n2871), .c(n2870), .d(n3813), .o1(
        n2873) );
  b15oai013ar1n02x3 U3241 ( .b(u_rxreg_counter_trgt[6]), .c(n2874), .d(n2873), 
        .a(n2656), .o1(u_rxreg_N7) );
  b15oai112ar1n02x5 U3244 ( .c(n3971), .d(n2877), .a(n2876), .b(n2875), .o1(
        u_device_sm_ctrl_data_tx_ready_next) );
  b15nandp2ar1n03x5 U3245 ( .a(n2878), .b(n3812), .o1(n3628) );
  b15aoi022ar1n02x3 U3246 ( .a(n2886), .b(u_device_sm_s_dummy_cycles[4]), .c(
        n3613), .d(n3628), .o1(n2885) );
  b15nor002ar1n03x5 U3247 ( .a(n2656), .b(n2879), .o1(n3612) );
  b15nor003ar1n02x7 U3249 ( .a(n3912), .b(n3819), .c(n3822), .o1(n2884) );
  b15nor002ar1n03x5 U3250 ( .a(n2880), .b(n2886), .o1(n2882) );
  b15aoi012ar1n02x5 U3251 ( .b(n2891), .c(n3613), .a(n2890), .o1(n2881) );
  b15oaoi13ar1n02x3 U3253 ( .c(n2882), .d(n2889), .b(n2881), .a(n3631), .o1(
        n2883) );
  b15oabi12ar1n03x5 U3254 ( .b(n2884), .c(n2883), .a(n2656), .out0(n2887) );
  b15oai012ar1n03x5 U3255 ( .b(n2885), .c(n2896), .a(n2887), .o1(
        u_rxreg_counter_trgt_next[4]) );
  b15aoi022ar1n02x3 U3256 ( .a(n2886), .b(u_device_sm_s_dummy_cycles[3]), .c(
        n3613), .d(n3628), .o1(n2888) );
  b15oai012ar1n03x5 U3257 ( .b(n2888), .c(n2896), .a(n2887), .o1(
        u_rxreg_counter_trgt_next[3]) );
  b15nor002ar1n03x5 U3259 ( .a(n3617), .b(n2889), .o1(n2894) );
  b15oai022ar1n02x5 U3260 ( .a(n3812), .b(n3622), .c(n3631), .d(n2889), .o1(
        n2893) );
  b15aoi112ar1n02x3 U3261 ( .c(n2891), .d(n3613), .a(n2890), .b(n2656), .o1(
        n3616) );
  b15aoai13ar1n02x3 U3262 ( .c(n3631), .d(n3822), .b(n3819), .a(n3616), .o1(
        n2892) );
  b15oai013ar1n02x3 U3263 ( .b(n2894), .c(n2893), .d(n2892), .a(u_rxreg_N7), 
        .o1(n2895) );
  b15aoai13ar1n02x3 U3264 ( .c(n3611), .d(n3185), .b(n2896), .a(n2895), .o1(
        u_rxreg_counter_trgt_next[2]) );
  b15inv000ar1n03x5 U3265 ( .a(u_device_sm_s_dummy_cycles[1]), .o1(n2897) );
  b15aoai13ar1n02x3 U3266 ( .c(n3611), .d(n2897), .b(n2896), .a(n2895), .o1(
        u_rxreg_counter_trgt_next[1]) );
  b15nandp2ar1n03x5 U3268 ( .a(u_dcfifo_rx_write_token[5]), .b(
        u_dcfifo_rx_write_token[4]), .o1(n3238) );
  b15nandp2ar1n03x5 U3269 ( .a(u_dcfifo_rx_write_token[3]), .b(
        u_dcfifo_rx_write_token[2]), .o1(n3248) );
  b15nandp2ar1n03x5 U3270 ( .a(u_dcfifo_rx_write_token[6]), .b(
        u_dcfifo_rx_write_token[7]), .o1(n3246) );
  b15nandp2ar1n03x5 U3271 ( .a(u_dcfifo_rx_write_token[0]), .b(
        u_dcfifo_rx_write_token[1]), .o1(n3242) );
  b15nand04ar1n03x5 U3272 ( .a(n3238), .b(n3248), .c(n3246), .d(n3242), .o1(
        n2908) );
  b15oa0012ar1n03x5 U3273 ( .b(u_dcfifo_rx_write_token[5]), .c(
        u_dcfifo_rx_write_token[7]), .a(u_dcfifo_rx_write_token[6]), .o(n3239)
         );
  b15oaoi13ar1n02x3 U3274 ( .c(u_dcfifo_rx_write_token[5]), .d(
        u_dcfifo_rx_write_token[3]), .b(u_dcfifo_rx_write_token[4]), .a(n3239), 
        .o1(n2903) );
  b15oai012ar1n03x5 U3275 ( .b(u_dcfifo_rx_write_token[3]), .c(
        u_dcfifo_rx_write_token[1]), .a(u_dcfifo_rx_write_token[2]), .o1(n3235) );
  b15nona23ar1n02x5 U3276 ( .a(n3239), .b(n2903), .c(n3235), .d(
        u_dcfifo_rx_u_din_write_enable), .out0(n2899) );
  b15nor002ar1n03x5 U3277 ( .a(n2908), .b(n2899), .o1(
        u_dcfifo_rx_u_din_buffer_N30) );
  b15nor002ar1n03x5 U3279 ( .a(n2906), .b(n2899), .o1(
        u_dcfifo_rx_u_din_buffer_N31) );
  b15inv000ar1n03x5 U3280 ( .a(n3235), .o1(n2905) );
  b15and002ar1n02x5 U3281 ( .a(u_dcfifo_rx_u_din_write_enable), .b(n2903), .o(
        n2901) );
  b15nandp2ar1n03x5 U3282 ( .a(n2905), .b(n2901), .o1(n2900) );
  b15nor002ar1n03x5 U3283 ( .a(n2906), .b(n2900), .o1(
        u_dcfifo_rx_u_din_buffer_N29) );
  b15nor002ar1n03x5 U3284 ( .a(n2908), .b(n2900), .o1(
        u_dcfifo_rx_u_din_buffer_N28) );
  b15nandp2ar1n03x5 U3285 ( .a(n2901), .b(n3235), .o1(n2902) );
  b15nor002ar1n03x5 U3286 ( .a(n2906), .b(n2902), .o1(
        u_dcfifo_rx_u_din_buffer_N27) );
  b15nor002ar1n03x5 U3287 ( .a(n2908), .b(n2902), .o1(
        u_dcfifo_rx_u_din_buffer_N26) );
  b15nonb02ar1n02x3 U3288 ( .a(u_dcfifo_rx_u_din_write_enable), .b(n2903), 
        .out0(n2904) );
  b15oai012ar1n03x5 U3289 ( .b(n2905), .c(n3239), .a(n2904), .o1(n2907) );
  b15nor002ar1n03x5 U3290 ( .a(n2906), .b(n2907), .o1(
        u_dcfifo_rx_u_din_buffer_N33) );
  b15nor002ar1n03x5 U3291 ( .a(n2908), .b(n2907), .o1(
        u_dcfifo_rx_u_din_buffer_N32) );
  b15nor002ar1n03x5 U3296 ( .a(tx_counter_upd), .b(u_txreg_running), .o1(n2966) );
  b15inv000ar1n03x5 U3297 ( .a(n2966), .o1(u_txreg_N11) );
  b15ao0022ar1n03x5 U3307 ( .a(en_quad), .b(u_txreg_data_int[28]), .c(
        u_txreg_data_int[31]), .d(n3815), .o(spi_sdo0) );
  b15and002ar1n02x5 U3312 ( .a(n3917), .b(tx_data[0]), .o(u_txreg_N34) );
  b15ao0022ar1n03x5 U3316 ( .a(n3917), .b(tx_data[3]), .c(n3932), .d(
        u_txreg_data_int[2]), .o(u_txreg_N37) );
  b15ao0022ar1n03x5 U3317 ( .a(n3917), .b(tx_data[2]), .c(n3932), .d(
        u_txreg_data_int[1]), .o(u_txreg_N36) );
  b15ao0022ar1n03x5 U3318 ( .a(n3917), .b(tx_data[1]), .c(n3932), .d(
        u_txreg_data_int[0]), .o(u_txreg_N35) );
  b15aoi022ar1n02x3 U3324 ( .a(tx_data_valid), .b(tx_data[25]), .c(n2917), .d(
        u_txreg_data_int[24]), .o1(n2920) );
  b15aob012ar1n03x5 U3325 ( .b(n3929), .c(u_txreg_data_int[21]), .a(n2920), 
        .out0(u_txreg_N59) );
  b15aoi022ar1n02x3 U3326 ( .a(n3922), .b(tx_data[29]), .c(n2917), .d(
        u_txreg_data_int[28]), .o1(n2921) );
  b15aob012ar1n03x5 U3327 ( .b(n2919), .c(u_txreg_data_int[25]), .a(n2921), 
        .out0(u_txreg_N63) );
  b15aoi022ar1n02x3 U3328 ( .a(tx_data_valid), .b(tx_data[27]), .c(n3932), .d(
        u_txreg_data_int[26]), .o1(n2922) );
  b15aob012ar1n03x5 U3329 ( .b(n3929), .c(u_txreg_data_int[23]), .a(n2922), 
        .out0(u_txreg_N61) );
  b15aoi022ar1n02x3 U3330 ( .a(n3922), .b(tx_data[30]), .c(n2917), .d(
        u_txreg_data_int[29]), .o1(n2923) );
  b15aob012ar1n03x5 U3331 ( .b(n2919), .c(u_txreg_data_int[26]), .a(n2923), 
        .out0(u_txreg_N64) );
  b15aoi022ar1n02x3 U3332 ( .a(n3917), .b(tx_data[26]), .c(n2917), .d(
        u_txreg_data_int[25]), .o1(n2925) );
  b15aob012ar1n03x5 U3333 ( .b(n3929), .c(u_txreg_data_int[22]), .a(n2925), 
        .out0(u_txreg_N60) );
  b15aoi022ar1n02x3 U3336 ( .a(tx_data_valid), .b(tx_data[20]), .c(n3932), .d(
        u_txreg_data_int[19]), .o1(n2927) );
  b15aob012ar1n03x5 U3337 ( .b(n2919), .c(u_txreg_data_int[16]), .a(n2927), 
        .out0(u_txreg_N54) );
  b15aoi022ar1n02x3 U3338 ( .a(tx_data_valid), .b(tx_data[19]), .c(n3932), .d(
        u_txreg_data_int[18]), .o1(n2928) );
  b15aob012ar1n03x5 U3339 ( .b(n3929), .c(u_txreg_data_int[15]), .a(n2928), 
        .out0(u_txreg_N53) );
  b15aoi022ar1n02x3 U3341 ( .a(n3917), .b(tx_data[12]), .c(n2917), .d(
        u_txreg_data_int[11]), .o1(n2929) );
  b15aob012ar1n03x5 U3342 ( .b(n3929), .c(u_txreg_data_int[8]), .a(n2929), 
        .out0(u_txreg_N46) );
  b15aoi022ar1n02x3 U3343 ( .a(tx_data_valid), .b(tx_data[31]), .c(n2917), .d(
        u_txreg_data_int[30]), .o1(n2930) );
  b15aob012ar1n03x5 U3344 ( .b(n2919), .c(u_txreg_data_int[27]), .a(n2930), 
        .out0(u_txreg_N65) );
  b15aoi022ar1n02x3 U3345 ( .a(n3917), .b(tx_data[15]), .c(n2917), .d(
        u_txreg_data_int[14]), .o1(n2931) );
  b15aob012ar1n03x5 U3346 ( .b(n2919), .c(u_txreg_data_int[11]), .a(n2931), 
        .out0(u_txreg_N49) );
  b15aoi022ar1n02x3 U3347 ( .a(tx_data_valid), .b(tx_data[10]), .c(n2917), .d(
        u_txreg_data_int[9]), .o1(n2932) );
  b15aob012ar1n03x5 U3348 ( .b(n3929), .c(u_txreg_data_int[6]), .a(n2932), 
        .out0(u_txreg_N44) );
  b15aoi022ar1n02x3 U3349 ( .a(tx_data_valid), .b(tx_data[14]), .c(n3932), .d(
        u_txreg_data_int[13]), .o1(n2933) );
  b15aob012ar1n03x5 U3350 ( .b(n3929), .c(u_txreg_data_int[10]), .a(n2933), 
        .out0(u_txreg_N48) );
  b15aoi022ar1n02x3 U3351 ( .a(n3917), .b(tx_data[23]), .c(n3932), .d(
        u_txreg_data_int[22]), .o1(n2934) );
  b15aob012ar1n03x5 U3352 ( .b(n3929), .c(u_txreg_data_int[19]), .a(n2934), 
        .out0(u_txreg_N57) );
  b15aoi022ar1n02x3 U3353 ( .a(n3917), .b(tx_data[13]), .c(n2917), .d(
        u_txreg_data_int[12]), .o1(n2935) );
  b15aob012ar1n03x5 U3354 ( .b(n2919), .c(u_txreg_data_int[9]), .a(n2935), 
        .out0(u_txreg_N47) );
  b15aoi022ar1n02x3 U3355 ( .a(n3917), .b(tx_data[9]), .c(n2917), .d(
        u_txreg_data_int[8]), .o1(n2936) );
  b15aob012ar1n03x5 U3356 ( .b(n2919), .c(u_txreg_data_int[5]), .a(n2936), 
        .out0(u_txreg_N43) );
  b15aoi022ar1n02x3 U3357 ( .a(tx_data_valid), .b(tx_data[17]), .c(n3932), .d(
        u_txreg_data_int[16]), .o1(n2937) );
  b15aob012ar1n03x5 U3358 ( .b(n2919), .c(u_txreg_data_int[13]), .a(n2937), 
        .out0(u_txreg_N51) );
  b15aoi022ar1n02x3 U3359 ( .a(tx_data_valid), .b(tx_data[18]), .c(n2917), .d(
        u_txreg_data_int[17]), .o1(n2938) );
  b15aob012ar1n03x5 U3360 ( .b(n2919), .c(u_txreg_data_int[14]), .a(n2938), 
        .out0(u_txreg_N52) );
  b15aoi022ar1n02x3 U3361 ( .a(tx_data_valid), .b(tx_data[11]), .c(n3932), .d(
        u_txreg_data_int[10]), .o1(n2939) );
  b15aob012ar1n03x5 U3362 ( .b(n3929), .c(u_txreg_data_int[7]), .a(n2939), 
        .out0(u_txreg_N45) );
  b15aoi022ar1n02x3 U3363 ( .a(n3917), .b(tx_data[16]), .c(n2917), .d(
        u_txreg_data_int[15]), .o1(n2940) );
  b15aob012ar1n03x5 U3364 ( .b(n3929), .c(u_txreg_data_int[12]), .a(n2940), 
        .out0(u_txreg_N50) );
  b15aoi022ar1n02x3 U3365 ( .a(tx_data_valid), .b(tx_data[21]), .c(n3932), .d(
        u_txreg_data_int[20]), .o1(n2941) );
  b15aob012ar1n03x5 U3366 ( .b(n2919), .c(u_txreg_data_int[17]), .a(n2941), 
        .out0(u_txreg_N55) );
  b15aoi022ar1n02x3 U3367 ( .a(n3917), .b(tx_data[8]), .c(n2917), .d(
        u_txreg_data_int[7]), .o1(n2942) );
  b15aob012ar1n03x5 U3368 ( .b(n3929), .c(u_txreg_data_int[4]), .a(n2942), 
        .out0(u_txreg_N42) );
  b15aoi022ar1n02x3 U3369 ( .a(n3922), .b(tx_data[22]), .c(n3932), .d(
        u_txreg_data_int[21]), .o1(n2943) );
  b15aob012ar1n03x5 U3370 ( .b(n3929), .c(u_txreg_data_int[18]), .a(n2943), 
        .out0(u_txreg_N56) );
  b15aoi022ar1n02x3 U3371 ( .a(n3917), .b(tx_data[24]), .c(n3932), .d(
        u_txreg_data_int[23]), .o1(n2945) );
  b15aob012ar1n03x5 U3372 ( .b(n3929), .c(u_txreg_data_int[20]), .a(n2945), 
        .out0(u_txreg_N58) );
  b15aoi022ar1n02x3 U3373 ( .a(n3917), .b(tx_data[6]), .c(n2917), .d(
        u_txreg_data_int[5]), .o1(n2946) );
  b15aob012ar1n03x5 U3374 ( .b(n2919), .c(u_txreg_data_int[2]), .a(n2946), 
        .out0(u_txreg_N40) );
  b15aoi022ar1n02x3 U3375 ( .a(n3917), .b(tx_data[7]), .c(n3932), .d(
        u_txreg_data_int[6]), .o1(n2948) );
  b15aob012ar1n03x5 U3376 ( .b(n2919), .c(u_txreg_data_int[3]), .a(n2948), 
        .out0(u_txreg_N41) );
  b15aoi022ar1n02x3 U3377 ( .a(n3917), .b(tx_data[28]), .c(
        u_txreg_data_int[27]), .d(n2917), .o1(n2951) );
  b15aob012ar1n03x5 U3378 ( .b(n3929), .c(u_txreg_data_int[24]), .a(n2951), 
        .out0(u_txreg_N62) );
  b15inv000ar1n03x5 U3379 ( .a(u_txreg_counter[2]), .o1(n2980) );
  b15inv000ar1n03x5 U3380 ( .a(u_txreg_counter[5]), .o1(n2962) );
  b15xor002ar1n02x5 U3381 ( .a(u_txreg_counter_trgt[3]), .b(u_txreg_counter[3]), .out0(n2961) );
  b15inv000ar1n03x5 U3382 ( .a(u_txreg_counter[0]), .o1(n2958) );
  b15xor002ar1n02x5 U3383 ( .a(u_txreg_counter_trgt[7]), .b(u_txreg_counter[7]), .out0(n2957) );
  b15nandp2ar1n03x5 U3384 ( .a(u_txreg_counter[4]), .b(u_txreg_counter_trgt[4]), .o1(n2954) );
  b15xor002ar1n02x5 U3385 ( .a(u_txreg_counter_trgt[6]), .b(u_txreg_counter[6]), .out0(n2953) );
  b15oaoi13ar1n02x3 U3386 ( .c(u_txreg_counter[4]), .d(u_txreg_counter_trgt[4]), .b(n2954), .a(n2953), .o1(n2955) );
  b15oai012ar1n03x5 U3387 ( .b(u_txreg_counter_trgt[0]), .c(n2958), .a(n2955), 
        .o1(n2956) );
  b15oai012ar1n03x5 U3389 ( .b(n2962), .c(u_txreg_counter_trgt[5]), .a(n2959), 
        .o1(n2960) );
  b15xor002ar1n02x5 U3391 ( .a(u_txreg_counter_trgt[1]), .b(u_txreg_counter[1]), .out0(n2963) );
  b15aoi012ar1n02x5 U3392 ( .b(u_txreg_counter_trgt[2]), .c(n2980), .a(n2963), 
        .o1(n2964) );
  b15nor002ar1n03x5 U3394 ( .a(n2966), .b(n2981), .o1(tx_done) );
  b15nandp2ar1n03x5 U3395 ( .a(u_txreg_counter[1]), .b(u_txreg_counter[0]), 
        .o1(n2979) );
  b15oai112ar1n02x5 U3396 ( .c(u_txreg_counter[1]), .d(u_txreg_counter[0]), 
        .a(n2979), .b(n2981), .o1(n2967) );
  b15inv000ar1n03x5 U3398 ( .a(u_txreg_counter[4]), .o1(n2973) );
  b15and003ar1n03x5 U3399 ( .a(u_txreg_counter[2]), .b(u_txreg_counter[1]), 
        .c(u_txreg_counter[0]), .o(n2978) );
  b15nandp2ar1n03x5 U3400 ( .a(u_txreg_counter[3]), .b(n2978), .o1(n2972) );
  b15nor002ar1n03x5 U3401 ( .a(n2973), .b(n2972), .o1(n2971) );
  b15nandp2ar1n03x5 U3402 ( .a(u_txreg_counter[5]), .b(n2971), .o1(n2975) );
  b15oai112ar1n02x5 U3403 ( .c(u_txreg_counter[5]), .d(n2971), .a(n2975), .b(
        n2981), .o1(n2968) );
  b15oai112ar1n02x5 U3405 ( .c(u_txreg_counter[3]), .d(n2978), .a(n2972), .b(
        n2981), .o1(n2969) );
  b15inv000ar1n03x5 U3407 ( .a(n2981), .o1(n2977) );
  b15nor002ar1n03x5 U3408 ( .a(u_txreg_counter[0]), .b(n2977), .o1(u_txreg_N24) );
  b15inv000ar1n03x5 U3409 ( .a(u_txreg_counter[6]), .o1(n2976) );
  b15nor002ar1n03x5 U3410 ( .a(n2976), .b(n2975), .o1(n2974) );
  b15oai012ar1n03x5 U3411 ( .b(u_txreg_counter[7]), .c(n2974), .a(n2981), .o1(
        n2970) );
  b15aoi012ar1n02x5 U3412 ( .b(u_txreg_counter[7]), .c(n2974), .a(n2970), .o1(
        u_txreg_N31) );
  b15aoi112ar1n02x3 U3413 ( .c(n2973), .d(n2972), .a(n2971), .b(n2977), .o1(
        u_txreg_N28) );
  b15aoi112ar1n02x3 U3414 ( .c(n2976), .d(n2975), .a(n2974), .b(n2977), .o1(
        u_txreg_N30) );
  b15aoi112ar1n02x3 U3415 ( .c(n2980), .d(n2979), .a(n2978), .b(n2977), .o1(
        u_txreg_N26) );
  b15nanb02ar1n02x5 U3416 ( .a(tx_counter_upd), .b(n2981), .out0(u_txreg_N10)
         );
  b15orn002ar1n02x5 U3417 ( .a(u_dcfifo_tx_u_din_full_full_up), .b(tl_i[65]), 
        .o(u_dcfifo_tx_u_din_full_N0) );
  b15nandp2ar1n03x5 U3471 ( .a(n3008), .b(n3645), .o1(n3634) );
  b15oaoi13ar1n02x3 U3472 ( .c(u_dcfifo_tx_u_dout_read_token[5]), .d(
        u_dcfifo_tx_u_dout_read_token[3]), .b(u_dcfifo_tx_u_dout_read_token[4]), .a(n3634), .o1(n3014) );
  b15nandp2ar1n03x5 U3473 ( .a(n3647), .b(n3640), .o1(n3649) );
  b15oaoi13ar1n02x3 U3474 ( .c(u_dcfifo_tx_u_dout_read_token[1]), .d(
        u_dcfifo_tx_u_dout_read_token[3]), .b(u_dcfifo_tx_u_dout_read_token[2]), .a(n3649), .o1(n3012) );
  b15aoi022ar1n02x3 U3475 ( .a(u_dcfifo_tx_u_dout_read_token[0]), .b(
        u_dcfifo_tx_u_dout_read_token[1]), .c(u_dcfifo_tx_u_dout_read_token[7]), .d(u_dcfifo_tx_u_dout_read_token[6]), .o1(n3007) );
  b15inv000ar1n03x5 U3476 ( .a(n3007), .o1(n3005) );
  b15aoi112ar1n02x3 U3477 ( .c(u_dcfifo_tx_u_dout_read_token[2]), .d(
        u_dcfifo_tx_u_dout_read_token[3]), .a(n3001), .b(n3005), .o1(n3013) );
  b15nanb02ar1n02x5 U3478 ( .a(n3012), .b(n3013), .out0(n3003) );
  b15inv000ar1n03x5 U3482 ( .a(n3014), .o1(n3017) );
  b15aoi022ar1n02x3 U3486 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[203]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[139]), .o1(n3024) );
  b15nandp2ar1n03x5 U3487 ( .a(n3012), .b(n3005), .o1(n3019) );
  b15nandp2ar1n03x5 U3491 ( .a(n3012), .b(n3007), .o1(n3010) );
  b15aoi022ar1n02x3 U3495 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[43]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[75]), .o1(n3023) );
  b15orn002ar1n02x5 U3499 ( .a(n3013), .b(n3012), .o(n3016) );
  b15aoi022ar1n02x3 U3503 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[11]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[235]), .o1(n3022) );
  b15aoi022ar1n02x3 U3510 ( .a(n3909), .b(u_dcfifo_tx_u_din_buffer_data[171]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[107]), .o1(n3021) );
  b15nand04ar1n03x5 U3511 ( .a(n3024), .b(n3023), .c(n3022), .d(n3021), .o1(
        n3025) );
  b15nonb02ar1n02x3 U3513 ( .a(n3025), .b(n3822), .out0(u_device_sm_N185) );
  b15aoi022ar1n02x3 U3516 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[59]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[123]), .o1(n3029) );
  b15aoi022ar1n02x3 U3519 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[219]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[251]), .o1(n3028) );
  b15aoi022ar1n02x3 U3522 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[27]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[187]), .o1(n3027) );
  b15aoi022ar1n02x3 U3525 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[91]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[155]), .o1(n3026) );
  b15nand04ar1n03x5 U3526 ( .a(n3029), .b(n3028), .c(n3027), .d(n3026), .o1(
        n3031) );
  b15nonb02ar1n02x3 U3528 ( .a(n3031), .b(n3918), .out0(u_device_sm_N201) );
  b15aoi022ar1n02x3 U3529 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[204]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[140]), .o1(n3038) );
  b15aoi022ar1n02x3 U3530 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[44]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[76]), .o1(n3037) );
  b15aoi022ar1n02x3 U3533 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[12]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[172]), .o1(n3036) );
  b15aoi022ar1n02x3 U3535 ( .a(n3906), .b(u_dcfifo_tx_u_din_buffer_data[236]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[108]), .o1(n3035) );
  b15nand04ar1n03x5 U3536 ( .a(n3038), .b(n3037), .c(n3036), .d(n3035), .o1(
        n3039) );
  b15aoi022ar1n02x3 U3538 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[77]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[173]), .o1(n3044) );
  b15aoi022ar1n02x3 U3540 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[205]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[237]), .o1(n3043) );
  b15aoi022ar1n02x3 U3541 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[45]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[109]), .o1(n3042) );
  b15aoi022ar1n02x3 U3542 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[13]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[141]), .o1(n3041) );
  b15nand04ar1n03x5 U3543 ( .a(n3044), .b(n3043), .c(n3042), .d(n3041), .o1(
        n3045) );
  b15nonb02ar1n02x3 U3544 ( .a(n3045), .b(n3918), .out0(u_device_sm_N187) );
  b15aoi022ar1n02x3 U3545 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[215]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[119]), .o1(n3050) );
  b15aoi022ar1n02x3 U3546 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[23]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[247]), .o1(n3049) );
  b15aoi022ar1n02x3 U3548 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[87]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[183]), .o1(n3048) );
  b15aoi022ar1n02x3 U3549 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[55]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[151]), .o1(n3047) );
  b15nand04ar1n03x5 U3550 ( .a(n3050), .b(n3049), .c(n3048), .d(n3047), .o1(
        n3051) );
  b15nonb02ar1n02x3 U3551 ( .a(n3051), .b(n3918), .out0(u_device_sm_N197) );
  b15aoi022ar1n02x3 U3552 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[51]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[243]), .o1(n3055) );
  b15aoi022ar1n02x3 U3553 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[211]), 
        .c(n3940), .d(u_dcfifo_tx_u_din_buffer_data[83]), .o1(n3054) );
  b15aoi022ar1n02x3 U3554 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[179]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[115]), .o1(n3053) );
  b15aoi022ar1n02x3 U3555 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[19]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[147]), .o1(n3052) );
  b15nand04ar1n03x5 U3556 ( .a(n3055), .b(n3054), .c(n3053), .d(n3052), .o1(
        n3056) );
  b15nonb02ar1n02x3 U3557 ( .a(n3056), .b(n3918), .out0(u_device_sm_N193) );
  b15aoi022ar1n02x3 U3559 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[63]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[223]), .o1(n3061) );
  b15aoi022ar1n02x3 U3560 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[31]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[95]), .o1(n3060) );
  b15aoi022ar1n02x3 U3561 ( .a(n3907), .b(u_dcfifo_tx_u_din_buffer_data[159]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[127]), .o1(n3059) );
  b15aoi022ar1n02x3 U3562 ( .a(n3909), .b(u_dcfifo_tx_u_din_buffer_data[191]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[255]), .o1(n3058) );
  b15nand04ar1n03x5 U3563 ( .a(n3061), .b(n3060), .c(n3059), .d(n3058), .o1(
        n3062) );
  b15nonb02ar1n02x3 U3564 ( .a(n3062), .b(n3822), .out0(u_device_sm_N205) );
  b15aoi022ar1n02x3 U3565 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[50]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[242]), .o1(n3066) );
  b15aoi022ar1n02x3 U3566 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[210]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[178]), .o1(n3065) );
  b15aoi022ar1n02x3 U3567 ( .a(n3943), .b(u_dcfifo_tx_u_din_buffer_data[146]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[114]), .o1(n3064) );
  b15aoi022ar1n02x3 U3568 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[18]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[82]), .o1(n3063) );
  b15nand04ar1n03x5 U3569 ( .a(n3066), .b(n3065), .c(n3064), .d(n3063), .o1(
        n3067) );
  b15nonb02ar1n02x3 U3570 ( .a(n3067), .b(n3918), .out0(u_device_sm_N192) );
  b15aoi022ar1n02x3 U3571 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[48]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[112]), .o1(n3071) );
  b15aoi022ar1n02x3 U3572 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[16]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[176]), .o1(n3070) );
  b15aoi022ar1n02x3 U3573 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[208]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[240]), .o1(n3069) );
  b15aoi022ar1n02x3 U3574 ( .a(n3901), .b(u_dcfifo_tx_u_din_buffer_data[80]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[144]), .o1(n3068) );
  b15nand04ar1n03x5 U3575 ( .a(n3071), .b(n3070), .c(n3069), .d(n3068), .o1(
        n3072) );
  b15nonb02ar1n02x3 U3576 ( .a(n3072), .b(n3822), .out0(u_device_sm_N190) );
  b15aoi022ar1n02x3 U3577 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[222]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[254]), .o1(n3076) );
  b15aoi022ar1n02x3 U3578 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[30]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[126]), .o1(n3075) );
  b15aoi022ar1n02x3 U3579 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[190]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[158]), .o1(n3074) );
  b15aoi022ar1n02x3 U3580 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[62]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[94]), .o1(n3073) );
  b15nand04ar1n03x5 U3581 ( .a(n3076), .b(n3075), .c(n3074), .d(n3073), .o1(
        n3077) );
  b15nonb02ar1n02x3 U3582 ( .a(n3077), .b(n3971), .out0(u_device_sm_N204) );
  b15aoi022ar1n02x3 U3583 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[206]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[238]), .o1(n3081) );
  b15aoi022ar1n02x3 U3584 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[14]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[110]), .o1(n3080) );
  b15aoi022ar1n02x3 U3585 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[78]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[142]), .o1(n3079) );
  b15aoi022ar1n02x3 U3586 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[46]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[174]), .o1(n3078) );
  b15nand04ar1n03x5 U3587 ( .a(n3081), .b(n3080), .c(n3079), .d(n3078), .o1(
        n3082) );
  b15nonb02ar1n02x3 U3588 ( .a(n3082), .b(n3918), .out0(u_device_sm_N188) );
  b15aoi022ar1n02x3 U3589 ( .a(n3909), .b(u_dcfifo_tx_u_din_buffer_data[185]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[121]), .o1(n3086) );
  b15aoi022ar1n02x3 U3590 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[57]), 
        .c(n3940), .d(u_dcfifo_tx_u_din_buffer_data[89]), .o1(n3085) );
  b15aoi022ar1n02x3 U3591 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[25]), 
        .c(n3974), .d(u_dcfifo_tx_u_din_buffer_data[217]), .o1(n3084) );
  b15aoi022ar1n02x3 U3592 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[249]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[153]), .o1(n3083) );
  b15nand04ar1n03x5 U3593 ( .a(n3086), .b(n3085), .c(n3084), .d(n3083), .o1(
        n3087) );
  b15nonb02ar1n02x3 U3594 ( .a(n3087), .b(n3918), .out0(u_device_sm_N199) );
  b15aoi022ar1n02x3 U3595 ( .a(n3901), .b(u_dcfifo_tx_u_din_buffer_data[85]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[149]), .o1(n3091) );
  b15aoi022ar1n02x3 U3596 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[53]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[245]), .o1(n3090) );
  b15aoi022ar1n02x3 U3597 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[181]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[117]), .o1(n3089) );
  b15aoi022ar1n02x3 U3598 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[21]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[213]), .o1(n3088) );
  b15nand04ar1n03x5 U3599 ( .a(n3091), .b(n3090), .c(n3089), .d(n3088), .o1(
        n3092) );
  b15nonb02ar1n02x3 U3600 ( .a(n3092), .b(n3918), .out0(u_device_sm_N195) );
  b15aoi022ar1n02x3 U3601 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[24]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[184]), .o1(n3096) );
  b15aoi022ar1n02x3 U3602 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[88]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[120]), .o1(n3095) );
  b15aoi022ar1n02x3 U3603 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[56]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[152]), .o1(n3094) );
  b15aoi022ar1n02x3 U3604 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[216]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[248]), .o1(n3093) );
  b15nand04ar1n03x5 U3605 ( .a(n3096), .b(n3095), .c(n3094), .d(n3093), .o1(
        n3097) );
  b15nonb02ar1n02x3 U3606 ( .a(n3097), .b(n3918), .out0(u_device_sm_N198) );
  b15aoi022ar1n02x3 U3607 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[74]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[170]), .o1(n3101) );
  b15aoi022ar1n02x3 U3608 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[42]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[202]), .o1(n3100) );
  b15aoi022ar1n02x3 U3609 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[234]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[106]), .o1(n3099) );
  b15aoi022ar1n02x3 U3610 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[10]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[138]), .o1(n3098) );
  b15nand04ar1n03x5 U3611 ( .a(n3101), .b(n3100), .c(n3099), .d(n3098), .o1(
        n3102) );
  b15aoi022ar1n02x3 U3613 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[54]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[118]), .o1(n3106) );
  b15aoi022ar1n02x3 U3614 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[22]), 
        .c(n3940), .d(u_dcfifo_tx_u_din_buffer_data[86]), .o1(n3105) );
  b15aoi022ar1n02x3 U3615 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[214]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[182]), .o1(n3104) );
  b15aoi022ar1n02x3 U3616 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[246]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[150]), .o1(n3103) );
  b15nand04ar1n03x5 U3617 ( .a(n3106), .b(n3105), .c(n3104), .d(n3103), .o1(
        n3107) );
  b15nonb02ar1n02x3 U3618 ( .a(n3107), .b(n3918), .out0(u_device_sm_N196) );
  b15aoi022ar1n02x3 U3619 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[207]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[111]), .o1(n3111) );
  b15aoi022ar1n02x3 U3620 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[79]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[143]), .o1(n3110) );
  b15aoi022ar1n02x3 U3621 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[15]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[239]), .o1(n3109) );
  b15aoi022ar1n02x3 U3622 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[47]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[175]), .o1(n3108) );
  b15nand04ar1n03x5 U3623 ( .a(n3111), .b(n3110), .c(n3109), .d(n3108), .o1(
        n3112) );
  b15nonb02ar1n02x3 U3624 ( .a(n3112), .b(n3822), .out0(u_device_sm_N189) );
  b15aoi022ar1n02x3 U3626 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[20]), 
        .c(n3902), .d(u_dcfifo_tx_u_din_buffer_data[52]), .o1(n3117) );
  b15aoi022ar1n02x3 U3627 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[212]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[244]), .o1(n3116) );
  b15aoi022ar1n02x3 U3628 ( .a(n3901), .b(u_dcfifo_tx_u_din_buffer_data[84]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[116]), .o1(n3115) );
  b15aoi022ar1n02x3 U3629 ( .a(n3909), .b(u_dcfifo_tx_u_din_buffer_data[180]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[148]), .o1(n3114) );
  b15nand04ar1n03x5 U3630 ( .a(n3117), .b(n3116), .c(n3115), .d(n3114), .o1(
        n3118) );
  b15nonb02ar1n02x3 U3631 ( .a(n3118), .b(n3918), .out0(u_device_sm_N194) );
  b15aoi022ar1n02x3 U3632 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[186]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[122]), .o1(n3122) );
  b15aoi022ar1n02x3 U3633 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[26]), 
        .c(n3973), .d(u_dcfifo_tx_u_din_buffer_data[58]), .o1(n3121) );
  b15aoi022ar1n02x3 U3634 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[218]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[250]), .o1(n3120) );
  b15aoi022ar1n02x3 U3635 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[90]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[154]), .o1(n3119) );
  b15nand04ar1n03x5 U3636 ( .a(n3122), .b(n3121), .c(n3120), .d(n3119), .o1(
        n3123) );
  b15nonb02ar1n02x3 U3637 ( .a(n3123), .b(n3918), .out0(u_device_sm_N200) );
  b15aoi022ar1n02x3 U3638 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[189]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[253]), .o1(n3127) );
  b15aoi022ar1n02x3 U3639 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[29]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[125]), .o1(n3126) );
  b15aoi022ar1n02x3 U3640 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[61]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[221]), .o1(n3125) );
  b15aoi022ar1n02x3 U3641 ( .a(n3901), .b(u_dcfifo_tx_u_din_buffer_data[93]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[157]), .o1(n3124) );
  b15nand04ar1n03x5 U3642 ( .a(n3127), .b(n3126), .c(n3125), .d(n3124), .o1(
        n3128) );
  b15nonb02ar1n02x3 U3643 ( .a(n3128), .b(n3822), .out0(u_device_sm_N203) );
  b15aoi022ar1n02x3 U3644 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[49]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[177]), .o1(n3134) );
  b15aoi022ar1n02x3 U3645 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[17]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[209]), .o1(n3133) );
  b15aoi022ar1n02x3 U3646 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[241]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[113]), .o1(n3132) );
  b15aoi022ar1n02x3 U3647 ( .a(n3901), .b(u_dcfifo_tx_u_din_buffer_data[81]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[145]), .o1(n3131) );
  b15nand04ar1n03x5 U3648 ( .a(n3134), .b(n3133), .c(n3132), .d(n3131), .o1(
        n3135) );
  b15nonb02ar1n02x3 U3649 ( .a(n3135), .b(n3971), .out0(u_device_sm_N191) );
  b15aoi022ar1n02x3 U3650 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[201]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[137]), .o1(n3139) );
  b15aoi022ar1n02x3 U3651 ( .a(n3906), .b(u_dcfifo_tx_u_din_buffer_data[233]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[105]), .o1(n3138) );
  b15aoi022ar1n02x3 U3652 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[9]), 
        .c(n3902), .d(u_dcfifo_tx_u_din_buffer_data[41]), .o1(n3137) );
  b15aoi022ar1n02x3 U3653 ( .a(n3901), .b(u_dcfifo_tx_u_din_buffer_data[73]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[169]), .o1(n3136) );
  b15nand04ar1n03x5 U3654 ( .a(n3139), .b(n3138), .c(n3137), .d(n3136), .o1(
        n3140) );
  b15nonb02ar1n02x3 U3655 ( .a(n3140), .b(n3822), .out0(u_device_sm_N183) );
  b15aoi022ar1n02x3 U3656 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[28]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[92]), .o1(n3146) );
  b15aoi022ar1n02x3 U3657 ( .a(n3943), .b(u_dcfifo_tx_u_din_buffer_data[156]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[124]), .o1(n3145) );
  b15aoi022ar1n02x3 U3658 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[188]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[252]), .o1(n3144) );
  b15aoi022ar1n02x3 U3659 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[60]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[220]), .o1(n3143) );
  b15nand04ar1n03x5 U3660 ( .a(n3146), .b(n3145), .c(n3144), .d(n3143), .o1(
        n3148) );
  b15nonb02ar1n02x3 U3661 ( .a(n3148), .b(n3822), .out0(u_device_sm_N202) );
  b15aoi022ar1n02x3 U3662 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[40]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[232]), .o1(n3153) );
  b15aoi022ar1n02x3 U3663 ( .a(n3909), .b(u_dcfifo_tx_u_din_buffer_data[168]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[136]), .o1(n3152) );
  b15aoi022ar1n02x3 U3664 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[8]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[104]), .o1(n3151) );
  b15aoi022ar1n02x3 U3665 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[200]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[72]), .o1(n3150) );
  b15nand04ar1n03x5 U3666 ( .a(n3153), .b(n3152), .c(n3151), .d(n3150), .o1(
        n3155) );
  b15nonb02ar1n02x3 U3667 ( .a(n3155), .b(n3822), .out0(u_device_sm_N182) );
  b15aoi022ar1n02x3 U3668 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[199]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[103]), .o1(n3160) );
  b15aoi022ar1n02x3 U3669 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[7]), 
        .c(n3973), .d(u_dcfifo_tx_u_din_buffer_data[39]), .o1(n3159) );
  b15aoi022ar1n02x3 U3671 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[231]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[135]), .o1(n3158) );
  b15aoi022ar1n02x3 U3672 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[71]), 
        .c(n3924), .d(u_dcfifo_tx_u_din_buffer_data[167]), .o1(n3157) );
  b15nand04ar1n03x5 U3673 ( .a(n3160), .b(n3159), .c(n3158), .d(n3157), .o1(
        n3164) );
  b15aoi022ar1n02x3 U3674 ( .a(n3663), .b(u_device_sm_u_spiregs_n[9]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[1]), .o1(n3161) );
  b15aob012ar1n03x5 U3675 ( .b(n3664), .c(u_device_sm_s_dummy_cycles[7]), .a(
        n3161), .out0(n3162) );
  b15oaoi13ar1n02x3 U3676 ( .c(u_device_sm_u_spiregs_reg0[7]), .d(n3228), .b(
        n3666), .a(n3162), .o1(n3163) );
  b15oab012ar1n02x5 U3677 ( .b(n3164), .c(n3822), .a(n3163), .out0(
        u_device_sm_N181) );
  b15aoi022ar1n02x3 U3678 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[160]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[128]), .o1(n3172) );
  b15aoi022ar1n02x3 U3679 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[0]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[64]), .o1(n3171) );
  b15aoi022ar1n02x3 U3680 ( .a(n3902), .b(u_dcfifo_tx_u_din_buffer_data[32]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[224]), .o1(n3170) );
  b15aoi022ar1n02x3 U3681 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[192]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[96]), .o1(n3169) );
  b15nand04ar1n03x5 U3682 ( .a(n3172), .b(n3171), .c(n3170), .d(n3169), .o1(
        n3179) );
  b15aoi022ar1n02x3 U3683 ( .a(n3663), .b(u_device_sm_u_spiregs_n[16]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[8]), .o1(n3173) );
  b15aoai13ar1n02x3 U3684 ( .c(n3176), .d(n3817), .b(n3174), .a(n3173), .o1(
        n3177) );
  b15aoi012ar1n02x5 U3685 ( .b(u_device_sm_s_dummy_cycles[0]), .c(n3664), .a(
        n3177), .o1(n3178) );
  b15oab012ar1n02x5 U3686 ( .b(n3918), .c(n3179), .a(n3178), .out0(
        u_device_sm_N174) );
  b15aoi022ar1n02x3 U3687 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[34]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[98]), .o1(n3183) );
  b15aoi022ar1n02x3 U3688 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[2]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[226]), .o1(n3182) );
  b15aoi022ar1n02x3 U3689 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[162]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[130]), .o1(n3181) );
  b15aoi022ar1n02x3 U3690 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[194]), 
        .c(n3940), .d(u_dcfifo_tx_u_din_buffer_data[66]), .o1(n3180) );
  b15nand04ar1n03x5 U3691 ( .a(n3183), .b(n3182), .c(n3181), .d(n3180), .o1(
        n3188) );
  b15aoi022ar1n02x3 U3692 ( .a(n3663), .b(u_device_sm_u_spiregs_n[14]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[6]), .o1(n3184) );
  b15oai012ar1n03x5 U3693 ( .b(n3821), .c(n3185), .a(n3184), .o1(n3186) );
  b15oaoi13ar1n02x3 U3694 ( .c(u_device_sm_u_spiregs_reg0[2]), .d(n3228), .b(
        n3666), .a(n3186), .o1(n3187) );
  b15oab012ar1n02x5 U3695 ( .b(n3918), .c(n3188), .a(n3187), .out0(
        u_device_sm_N176) );
  b15aoi022ar1n02x3 U3696 ( .a(n3974), .b(u_dcfifo_tx_u_din_buffer_data[197]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[133]), .o1(n3192) );
  b15aoi022ar1n02x3 U3697 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[37]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[101]), .o1(n3191) );
  b15aoi022ar1n02x3 U3698 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[69]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[165]), .o1(n3190) );
  b15aoi022ar1n02x3 U3699 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[5]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[229]), .o1(n3189) );
  b15nand04ar1n03x5 U3700 ( .a(n3192), .b(n3191), .c(n3190), .d(n3189), .o1(
        n3198) );
  b15aoi022ar1n02x3 U3701 ( .a(n3663), .b(u_device_sm_u_spiregs_n[11]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[3]), .o1(n3193) );
  b15oai012ar1n03x5 U3702 ( .b(n3821), .c(n3194), .a(n3193), .o1(n3196) );
  b15oaoi13ar1n02x3 U3703 ( .c(u_device_sm_u_spiregs_reg0[5]), .d(n3228), .b(
        n3666), .a(n3196), .o1(n3197) );
  b15oab012ar1n02x5 U3704 ( .b(n3918), .c(n3198), .a(n3197), .out0(
        u_device_sm_N179) );
  b15aoi022ar1n02x3 U3705 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[198]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[70]), .o1(n3202) );
  b15aoi022ar1n02x3 U3706 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[230]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[102]), .o1(n3201) );
  b15aoi022ar1n02x3 U3707 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[38]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[134]), .o1(n3200) );
  b15aoi022ar1n02x3 U3708 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[6]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[166]), .o1(n3199) );
  b15nand04ar1n03x5 U3709 ( .a(n3202), .b(n3201), .c(n3200), .d(n3199), .o1(
        n3206) );
  b15aoi022ar1n02x3 U3710 ( .a(n3664), .b(u_device_sm_s_dummy_cycles[6]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[2]), .o1(n3203) );
  b15aob012ar1n03x5 U3711 ( .b(n3663), .c(u_device_sm_u_spiregs_n[10]), .a(
        n3203), .out0(n3204) );
  b15oaoi13ar1n02x3 U3712 ( .c(u_device_sm_u_spiregs_reg0[6]), .d(n3228), .b(
        n3666), .a(n3204), .o1(n3205) );
  b15oab012ar1n02x5 U3713 ( .b(n3971), .c(n3206), .a(n3205), .out0(
        u_device_sm_N180) );
  b15aoi022ar1n02x3 U3714 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[35]), 
        .c(n3909), .d(u_dcfifo_tx_u_din_buffer_data[163]), .o1(n3212) );
  b15aoi022ar1n02x3 U3715 ( .a(n3930), .b(u_dcfifo_tx_u_din_buffer_data[3]), 
        .c(n3940), .d(u_dcfifo_tx_u_din_buffer_data[67]), .o1(n3211) );
  b15aoi022ar1n02x3 U3716 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[195]), 
        .c(n3943), .d(u_dcfifo_tx_u_din_buffer_data[131]), .o1(n3210) );
  b15aoi022ar1n02x3 U3717 ( .a(n3939), .b(u_dcfifo_tx_u_din_buffer_data[227]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[99]), .o1(n3209) );
  b15nand04ar1n03x5 U3718 ( .a(n3212), .b(n3211), .c(n3210), .d(n3209), .o1(
        n3216) );
  b15aoi022ar1n02x3 U3719 ( .a(n3663), .b(u_device_sm_u_spiregs_n[13]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[5]), .o1(n3213) );
  b15aob012ar1n03x5 U3720 ( .b(n3664), .c(u_device_sm_s_dummy_cycles[3]), .a(
        n3213), .out0(n3214) );
  b15oaoi13ar1n02x3 U3721 ( .c(u_device_sm_u_spiregs_reg0[3]), .d(n3228), .b(
        n3666), .a(n3214), .o1(n3215) );
  b15oab012ar1n02x5 U3722 ( .b(n3918), .c(n3216), .a(n3215), .out0(
        u_device_sm_N177) );
  b15aoi022ar1n02x3 U3723 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[4]), 
        .c(n3910), .d(u_dcfifo_tx_u_din_buffer_data[196]), .o1(n3225) );
  b15aoi022ar1n02x3 U3724 ( .a(n3973), .b(u_dcfifo_tx_u_din_buffer_data[36]), 
        .c(n3920), .d(u_dcfifo_tx_u_din_buffer_data[100]), .o1(n3224) );
  b15aoi022ar1n02x3 U3725 ( .a(n3924), .b(u_dcfifo_tx_u_din_buffer_data[164]), 
        .c(n3939), .d(u_dcfifo_tx_u_din_buffer_data[228]), .o1(n3223) );
  b15aoi022ar1n02x3 U3726 ( .a(n3940), .b(u_dcfifo_tx_u_din_buffer_data[68]), 
        .c(n3907), .d(u_dcfifo_tx_u_din_buffer_data[132]), .o1(n3222) );
  b15nand04ar1n03x5 U3727 ( .a(n3225), .b(n3224), .c(n3223), .d(n3222), .o1(
        n3230) );
  b15aoi022ar1n02x3 U3728 ( .a(n3663), .b(u_device_sm_u_spiregs_n[12]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[4]), .o1(n3226) );
  b15aob012ar1n03x5 U3729 ( .b(n3664), .c(u_device_sm_s_dummy_cycles[4]), .a(
        n3226), .out0(n3227) );
  b15oaoi13ar1n02x3 U3730 ( .c(u_device_sm_u_spiregs_reg0[4]), .d(n3228), .b(
        n3666), .a(n3227), .o1(n3229) );
  b15oab012ar1n02x5 U3731 ( .b(n3822), .c(n3230), .a(n3229), .out0(
        u_device_sm_N178) );
  b15inv000ar1n03x5 U3733 ( .a(u_spi_device_tlul_plug_state[1]), .o1(n3276) );
  b15nor002ar1n03x5 U3734 ( .a(u_spi_device_tlul_plug_state[0]), .b(n3276), 
        .o1(tl_o[108]) );
  b15inv000ar1n03x5 U3735 ( .a(tl_o[92]), .o1(n3234) );
  b15nand03ar1n03x5 U3736 ( .a(tl_o[108]), .b(tl_i[0]), .c(n3234), .o1(n3233)
         );
  b15aoai13ar1n02x3 U3737 ( .c(tl_i[0]), .d(tl_o[108]), .b(n3234), .a(n3233), 
        .o1(n604) );
  b15nandp2ar1n03x5 U3738 ( .a(u_dcfifo_rx_u_dout_read_token[7]), .b(
        u_dcfifo_rx_u_dout_read_token[6]), .o1(n3269) );
  b15aoi012ar1n02x5 U3740 ( .b(u_dcfifo_rx_u_dout_read_token[5]), .c(
        u_dcfifo_rx_u_dout_read_token[4]), .a(n3255), .o1(n3346) );
  b15oai012ar1n03x5 U3741 ( .b(u_dcfifo_rx_write_token[5]), .c(n3255), .a(
        n3239), .o1(n3258) );
  b15oai012ar1n03x5 U3742 ( .b(u_dcfifo_rx_write_token[5]), .c(
        u_dcfifo_rx_write_token[3]), .a(u_dcfifo_rx_write_token[4]), .o1(n3237) );
  b15oai012ar1n03x5 U3743 ( .b(u_dcfifo_rx_u_dout_read_token[3]), .c(
        u_dcfifo_rx_u_dout_read_token[5]), .a(u_dcfifo_rx_u_dout_read_token[4]), .o1(n3236) );
  b15nandp2ar1n03x5 U3744 ( .a(u_dcfifo_rx_u_dout_read_token[1]), .b(
        u_dcfifo_rx_u_dout_read_token[2]), .o1(n3243) );
  b15nandp2ar1n03x5 U3745 ( .a(u_dcfifo_rx_u_dout_read_token[3]), .b(
        u_dcfifo_rx_u_dout_read_token[2]), .o1(n3344) );
  b15nandp2ar1n03x5 U3746 ( .a(n3243), .b(n3344), .o1(n3348) );
  b15oai022ar1n02x5 U3748 ( .a(n3237), .b(n3236), .c(n3358), .d(n3235), .o1(
        n3254) );
  b15nandp2ar1n03x5 U3749 ( .a(u_dcfifo_rx_u_dout_read_token[0]), .b(
        u_dcfifo_rx_u_dout_read_token[7]), .o1(n3245) );
  b15nandp2ar1n03x5 U3750 ( .a(u_dcfifo_rx_u_dout_read_token[0]), .b(
        u_dcfifo_rx_u_dout_read_token[1]), .o1(n3345) );
  b15nandp2ar1n03x5 U3751 ( .a(n3245), .b(n3345), .o1(n3354) );
  b15inv000ar1n03x5 U3753 ( .a(n3238), .o1(n3240) );
  b15oai112ar1n02x5 U3754 ( .c(n3240), .d(n3239), .a(
        u_dcfifo_rx_u_dout_read_token[5]), .b(u_dcfifo_rx_u_dout_read_token[6]), .o1(n3241) );
  b15aoai13ar1n02x3 U3755 ( .c(n3244), .d(n3243), .b(n3242), .a(n3241), .o1(
        n3253) );
  b15nandp2ar1n03x5 U3756 ( .a(u_dcfifo_rx_u_dout_read_token[4]), .b(
        u_dcfifo_rx_u_dout_read_token[3]), .o1(n3247) );
  b15oai022ar1n02x5 U3757 ( .a(n3248), .b(n3247), .c(n3246), .d(n3245), .o1(
        n3252) );
  b15nandp2ar1n03x5 U3758 ( .a(u_dcfifo_rx_write_token[4]), .b(
        u_dcfifo_rx_write_token[3]), .o1(n3250) );
  b15nandp2ar1n03x5 U3759 ( .a(u_dcfifo_rx_write_token[2]), .b(
        u_dcfifo_rx_write_token[1]), .o1(n3249) );
  b15oai022ar1n02x5 U3760 ( .a(n3250), .b(n3344), .c(n3345), .d(n3249), .o1(
        n3251) );
  b15nor004ar1n02x3 U3761 ( .a(n3254), .b(n3253), .c(n3252), .d(n3251), .o1(
        n3257) );
  b15oai112ar1n02x5 U3762 ( .c(n3255), .d(n3354), .a(
        u_dcfifo_rx_write_token[0]), .b(u_dcfifo_rx_write_token[7]), .o1(n3256) );
  b15oai112ar1n02x5 U3763 ( .c(n3346), .d(n3258), .a(n3257), .b(n3256), .o1(
        u_dcfifo_rx_u_din_full_full_dn) );
  b15aobi12ar1n02x5 U3764 ( .b(u_dcfifo_tx_u_din_full_full_up), .c(
        u_dcfifo_tx_u_din_full_latched_full_s), .a(tl_i[65]), .out0(
        u_dcfifo_tx_u_din_write_enable) );
  b15aoi022ar1n02x3 U3765 ( .a(u_dcfifo_tx_write_token[7]), .b(
        u_dcfifo_tx_write_token[6]), .c(u_dcfifo_tx_write_token[5]), .d(
        u_dcfifo_tx_write_token[4]), .o1(n3259) );
  b15nandp2ar1n03x5 U3766 ( .a(u_dcfifo_tx_write_token[1]), .b(
        u_dcfifo_tx_write_token[0]), .o1(n3661) );
  b15nandp2ar1n03x5 U3767 ( .a(u_dcfifo_tx_write_token[3]), .b(
        u_dcfifo_tx_write_token[2]), .o1(n3639) );
  b15nand03ar1n03x5 U3768 ( .a(n3259), .b(n3661), .c(n3639), .o1(n3286) );
  b15oai012ar1n03x5 U3769 ( .b(u_dcfifo_tx_write_token[7]), .c(
        u_dcfifo_tx_write_token[5]), .a(u_dcfifo_tx_write_token[6]), .o1(n3643) );
  b15oai012ar1n03x5 U3770 ( .b(u_dcfifo_tx_write_token[1]), .c(
        u_dcfifo_tx_write_token[3]), .a(u_dcfifo_tx_write_token[2]), .o1(n3636) );
  b15nandp2ar1n03x5 U3771 ( .a(n3643), .b(n3636), .o1(n3282) );
  b15and002ar1n02x5 U3773 ( .a(u_dcfifo_tx_write_token[7]), .b(
        u_dcfifo_tx_write_token[6]), .o(n3260) );
  b15oaoi13ar1n02x3 U3774 ( .c(u_dcfifo_tx_write_token[6]), .d(
        u_dcfifo_tx_write_token[4]), .b(u_dcfifo_tx_write_token[5]), .a(n3260), 
        .o1(n3654) );
  b15aob012ar1n03x5 U3775 ( .b(u_dcfifo_tx_write_token[3]), .c(
        u_dcfifo_tx_write_token[4]), .a(n3654), .out0(n3279) );
  b15nand03ar1n03x5 U3776 ( .a(n3280), .b(u_dcfifo_tx_u_din_write_enable), .c(
        n3279), .o1(n3278) );
  b15nor002ar1n03x5 U3777 ( .a(n3286), .b(n3278), .o1(
        u_dcfifo_tx_u_din_buffer_N30) );
  b15nand03ar1n03x5 U3778 ( .a(u_dcfifo_tx_u_din_write_enable), .b(n3282), .c(
        n3279), .o1(n3277) );
  b15nor002ar1n03x5 U3779 ( .a(n3286), .b(n3277), .o1(
        u_dcfifo_tx_u_din_buffer_N32) );
  b15inv000ar1n03x5 U3780 ( .a(u_dcfifo_rx_u_dout_read_token[3]), .o1(n3262)
         );
  b15aoai13ar1n02x3 U3781 ( .c(u_dcfifo_rx_u_dout_read_token[5]), .d(
        u_dcfifo_rx_u_dout_write_token_dn[6]), .b(
        u_dcfifo_rx_u_dout_write_token_dn[5]), .a(
        u_dcfifo_rx_u_dout_read_token[4]), .o1(n3261) );
  b15oaoi13ar1n02x3 U3782 ( .c(u_dcfifo_rx_u_dout_write_token_dn[4]), .d(n3262), .b(u_dcfifo_rx_u_dout_write_token_dn[5]), .a(n3261), .o1(n3274) );
  b15nand04ar1n03x5 U3785 ( .a(u_dcfifo_rx_u_dout_read_token[7]), .b(
        u_dcfifo_rx_u_dout_read_token[0]), .c(
        u_dcfifo_rx_u_dout_write_token_dn[1]), .d(n3270), .o1(n3263) );
  b15oai013ar1n02x3 U3786 ( .b(u_dcfifo_rx_u_dout_write_token_dn[1]), .c(n3345), .d(n3264), .a(n3263), .o1(n3273) );
  b15inv000ar1n03x5 U3787 ( .a(u_dcfifo_rx_u_dout_write_token_dn[4]), .o1(
        n3266) );
  b15nand04ar1n03x5 U3788 ( .a(u_dcfifo_rx_u_dout_read_token[1]), .b(
        u_dcfifo_rx_u_dout_read_token[2]), .c(
        u_dcfifo_rx_u_dout_write_token_dn[3]), .d(n3264), .o1(n3265) );
  b15oai013ar1n02x3 U3789 ( .b(u_dcfifo_rx_u_dout_write_token_dn[3]), .c(n3266), .d(n3344), .a(n3265), .o1(n3272) );
  b15inv000ar1n03x5 U3790 ( .a(u_dcfifo_rx_u_dout_write_token_dn[6]), .o1(
        n3267) );
  b15nand04ar1n03x5 U3791 ( .a(u_dcfifo_rx_u_dout_read_token[5]), .b(
        u_dcfifo_rx_u_dout_read_token[6]), .c(
        u_dcfifo_rx_u_dout_write_token_dn[7]), .d(n3267), .o1(n3268) );
  b15oai013ar1n02x3 U3792 ( .b(u_dcfifo_rx_u_dout_write_token_dn[7]), .c(n3270), .d(n3269), .a(n3268), .o1(n3271) );
  b15nor004ar1n02x3 U3793 ( .a(n3274), .b(n3273), .c(n3272), .d(n3271), .o1(
        n2723) );
  b15inv000ar1n03x5 U3794 ( .a(n2723), .o1(n3308) );
  b15aoi012ar1n02x5 U3796 ( .b(rd_wr_sync), .c(n3307), .a(
        u_spi_device_tlul_plug_state[0]), .o1(n3275) );
  b15aoi013ar1n02x3 U3797 ( .b(u_spi_device_tlul_plug_state[0]), .c(n3276), 
        .d(n3308), .a(n3275), .o1(u_spi_device_tlul_plug_state_next[1]) );
  b15nor002ar1n03x5 U3799 ( .a(n3284), .b(n3277), .o1(
        u_dcfifo_tx_u_din_buffer_N33) );
  b15nor002ar1n03x5 U3800 ( .a(n3284), .b(n3278), .o1(
        u_dcfifo_tx_u_din_buffer_N31) );
  b15nonb02ar1n02x3 U3801 ( .a(u_dcfifo_tx_u_din_write_enable), .b(n3279), 
        .out0(n3283) );
  b15nandp2ar1n03x5 U3802 ( .a(n3280), .b(n3283), .o1(n3281) );
  b15nor002ar1n03x5 U3803 ( .a(n3284), .b(n3281), .o1(
        u_dcfifo_tx_u_din_buffer_N27) );
  b15nor002ar1n03x5 U3804 ( .a(n3286), .b(n3281), .o1(
        u_dcfifo_tx_u_din_buffer_N26) );
  b15nandp2ar1n03x5 U3805 ( .a(n3283), .b(n3282), .o1(n3285) );
  b15nor002ar1n03x5 U3806 ( .a(n3284), .b(n3285), .o1(
        u_dcfifo_tx_u_din_buffer_N29) );
  b15nor002ar1n03x5 U3807 ( .a(n3286), .b(n3285), .o1(
        u_dcfifo_tx_u_din_buffer_N28) );
  b15inv000ar1n03x5 U3808 ( .a(tl_i[57]), .o1(n3288) );
  b15inv000ar1n03x5 U3810 ( .a(tl_i[58]), .o1(n3302) );
  b15xor002ar1n02x5 U3811 ( .a(tl_i[11]), .b(tl_i[64]), .out0(n3294) );
  b15xor002ar1n02x5 U3812 ( .a(tl_i[64]), .b(tl_i[9]), .out0(n3290) );
  b15inv000ar1n03x5 U3813 ( .a(tl_i[63]), .o1(n3298) );
  b15aboi22ar1n02x3 U3814 ( .c(tl_i[62]), .d(n3298), .a(tl_i[62]), .b(tl_i[63]), .out0(n3287) );
  b15xor002ar1n02x5 U3815 ( .a(tl_i[58]), .b(n3287), .out0(n3289) );
  b15xor002ar1n02x5 U3816 ( .a(n3289), .b(n3288), .out0(n3291) );
  b15xor002ar1n02x5 U3817 ( .a(n3290), .b(n3291), .out0(n3293) );
  b15xnr002ar1n02x5 U3818 ( .a(tl_i[10]), .b(n3291), .out0(n3292) );
  b15nor004ar1n02x3 U3819 ( .a(tl_i[1]), .b(n3294), .c(n3293), .d(n3292), .o1(
        n3296) );
  b15nand04ar1n03x5 U3820 ( .a(tl_i[1]), .b(n3294), .c(n3293), .d(n3292), .o1(
        n3295) );
  b15nanb02ar1n02x5 U3821 ( .a(n3296), .b(n3295), .out0(n3300) );
  b15oai022ar1n02x5 U3822 ( .a(n3298), .b(tl_i[15]), .c(tl_i[14]), .d(tl_i[62]), .o1(n3297) );
  b15oai112ar1n02x5 U3824 ( .c(n3302), .d(tl_i[13]), .a(n3300), .b(n3299), 
        .o1(n3301) );
  b15aoi012ar1n02x5 U3825 ( .b(n3302), .c(tl_i[13]), .a(n3301), .o1(n3303) );
  b15oai012ar1n03x5 U3826 ( .b(n3305), .c(tl_i[12]), .a(n3303), .o1(n3304) );
  b15aoai13ar1n02x3 U3827 ( .c(tl_i[12]), .d(n3305), .b(n3304), .a(tl_i[65]), 
        .o1(n3306) );
  b15nanb02ar1n02x5 U3828 ( .a(n1455), .b(n3306), .out0(n1456) );
  b15inv000ar1n03x5 U3829 ( .a(n3307), .o1(n3610) );
  b15inv000ar1n03x5 U3830 ( .a(u_spi_device_tlul_plug_state[0]), .o1(n3310) );
  b15oaoi13ar1n02x3 U3834 ( .c(rd_wr_sync), .d(n3610), .b(n3310), .a(n3309), 
        .o1(u_spi_device_tlul_plug_state_next[0]) );
  b15inv000ar1n03x5 U3835 ( .a(u_spi_device_tlul_plug_we), .o1(tl_o[107]) );
  b15inv000ar1n03x5 U3836 ( .a(tl_o[90]), .o1(n3339) );
  b15aboi22ar1n02x3 U3837 ( .c(tl_o[90]), .d(tl_o[88]), .a(tl_o[88]), .b(n3339), .out0(n3561) );
  b15inv000ar1n03x5 U3838 ( .a(tl_o[67]), .o1(n3317) );
  b15inv000ar1n03x5 U3839 ( .a(tl_o[63]), .o1(n3318) );
  b15aoi022ar1n02x3 U3840 ( .a(tl_o[63]), .b(tl_o[67]), .c(n3317), .d(n3318), 
        .o1(n3312) );
  b15inv000ar1n03x5 U3841 ( .a(tl_o[89]), .o1(n3595) );
  b15inv000ar1n03x5 U3842 ( .a(tl_o[91]), .o1(n3580) );
  b15aoi022ar1n02x3 U3843 ( .a(tl_o[91]), .b(tl_o[89]), .c(n3595), .d(n3580), 
        .o1(n3326) );
  b15inv000ar1n03x5 U3844 ( .a(tl_o[64]), .o1(n3334) );
  b15aboi22ar1n02x3 U3845 ( .c(n3326), .d(n3334), .a(n3326), .b(tl_o[64]), 
        .out0(n3311) );
  b15xor002ar1n02x5 U3846 ( .a(n3312), .b(n3311), .out0(n3315) );
  b15inv000ar1n03x5 U3847 ( .a(tl_o[66]), .o1(n3340) );
  b15aoi022ar1n02x3 U3848 ( .a(u_spi_device_tlul_plug_we), .b(tl_o[66]), .c(
        n3340), .d(tl_o[107]), .o1(n3314) );
  b15inv000ar1n03x5 U3849 ( .a(tl_o[65]), .o1(n3322) );
  b15aboi22ar1n02x3 U3850 ( .c(tl_o[62]), .d(tl_o[65]), .a(tl_o[62]), .b(n3322), .out0(n3313) );
  b15xor002ar1n02x5 U3851 ( .a(n3314), .b(n3313), .out0(n3585) );
  b15xor002ar1n02x5 U3852 ( .a(n3315), .b(n3585), .out0(n3316) );
  b15xor002ar1n02x5 U3853 ( .a(n3561), .b(n3316), .out0(tl_o[8]) );
  b15inv000ar1n03x5 U3854 ( .a(tl_o[77]), .o1(n3564) );
  b15aoi022ar1n02x3 U3855 ( .a(tl_o[77]), .b(tl_o[67]), .c(n3317), .d(n3564), 
        .o1(n3333) );
  b15inv000ar1n03x5 U3856 ( .a(tl_o[79]), .o1(n3572) );
  b15aoi022ar1n02x3 U3857 ( .a(tl_o[63]), .b(tl_o[79]), .c(n3572), .d(n3318), 
        .o1(n3320) );
  b15inv000ar1n03x5 U3858 ( .a(tl_o[84]), .o1(n3581) );
  b15inv000ar1n03x5 U3859 ( .a(tl_o[86]), .o1(n3330) );
  b15aoi022ar1n02x3 U3860 ( .a(tl_o[86]), .b(n3581), .c(tl_o[84]), .d(n3330), 
        .o1(n3319) );
  b15xor002ar1n02x5 U3861 ( .a(n3320), .b(n3319), .out0(n3599) );
  b15inv000ar1n03x5 U3862 ( .a(tl_o[73]), .o1(n3569) );
  b15aboi22ar1n02x3 U3863 ( .c(tl_o[75]), .d(n3569), .a(tl_o[75]), .b(tl_o[73]), .out0(n3321) );
  b15xor002ar1n02x5 U3864 ( .a(n3599), .b(n3321), .out0(n3324) );
  b15aboi22ar1n02x3 U3865 ( .c(tl_o[83]), .d(tl_o[65]), .a(tl_o[83]), .b(n3322), .out0(n3323) );
  b15xor002ar1n02x5 U3866 ( .a(n3324), .b(n3323), .out0(n3325) );
  b15xor002ar1n02x5 U3867 ( .a(n3333), .b(n3325), .out0(n3328) );
  b15xor002ar1n02x5 U3868 ( .a(tl_o[70]), .b(n3326), .out0(n3562) );
  b15inv000ar1n03x5 U3869 ( .a(tl_o[87]), .o1(n3331) );
  b15inv000ar1n03x5 U3870 ( .a(tl_o[81]), .o1(n3573) );
  b15aoi022ar1n02x3 U3871 ( .a(tl_o[81]), .b(tl_o[87]), .c(n3331), .d(n3573), 
        .o1(n3593) );
  b15xor002ar1n02x5 U3872 ( .a(n3562), .b(n3593), .out0(n3327) );
  b15inv000ar1n03x5 U3874 ( .a(tl_o[82]), .o1(n3583) );
  b15inv000ar1n03x5 U3875 ( .a(tl_o[80]), .o1(n3596) );
  b15aoi022ar1n02x3 U3876 ( .a(tl_o[80]), .b(n3583), .c(tl_o[82]), .d(n3596), 
        .o1(n3329) );
  b15xor002ar1n02x5 U3877 ( .a(tl_o[83]), .b(n3329), .out0(n3578) );
  b15aoi022ar1n02x3 U3878 ( .a(tl_o[86]), .b(tl_o[87]), .c(n3331), .d(n3330), 
        .o1(n3332) );
  b15xor002ar1n02x5 U3879 ( .a(n3333), .b(n3332), .out0(n3336) );
  b15inv000ar1n03x5 U3880 ( .a(tl_o[85]), .o1(n3582) );
  b15aoi022ar1n02x3 U3881 ( .a(tl_o[85]), .b(tl_o[64]), .c(n3334), .d(n3582), 
        .o1(n3608) );
  b15xor002ar1n02x5 U3882 ( .a(tl_o[74]), .b(n3608), .out0(n3335) );
  b15xor002ar1n02x5 U3883 ( .a(n3336), .b(n3335), .out0(n3338) );
  b15inv000ar1n03x5 U3884 ( .a(tl_o[76]), .o1(n3566) );
  b15aboi22ar1n02x3 U3885 ( .c(tl_o[71]), .d(n3566), .a(tl_o[71]), .b(tl_o[76]), .out0(n3337) );
  b15xor002ar1n02x5 U3886 ( .a(n3338), .b(n3337), .out0(n3342) );
  b15aoi022ar1n02x3 U3887 ( .a(tl_o[90]), .b(tl_o[66]), .c(n3340), .d(n3339), 
        .o1(n3341) );
  b15xor002ar1n02x5 U3888 ( .a(n3342), .b(n3341), .out0(n3343) );
  b15xor002ar1n02x5 U3889 ( .a(n3578), .b(n3343), .out0(tl_o[14]) );
  b15nand03ar1n03x5 U3891 ( .a(n3346), .b(n3345), .c(n3344), .o1(n3360) );
  b15oaoi13ar1n02x3 U3893 ( .c(u_dcfifo_rx_u_dout_read_token[3]), .d(
        u_dcfifo_rx_u_dout_read_token[5]), .b(u_dcfifo_rx_u_dout_read_token[4]), .a(n3348), .o1(n3355) );
  b15oaoi13ar1n02x3 U3894 ( .c(u_dcfifo_rx_u_dout_read_token[3]), .d(
        u_dcfifo_rx_u_dout_read_token[5]), .b(u_dcfifo_rx_u_dout_read_token[4]), .a(n3354), .o1(n3357) );
  b15orn002ar1n02x5 U3895 ( .a(n3355), .b(n3357), .o(n3350) );
  b15nandp2ar1n03x5 U3899 ( .a(n3357), .b(n3348), .o1(n3352) );
  b15aoi022ar1n02x3 U3903 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[232]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[136]), .o1(n3369) );
  b15aoi022ar1n02x3 U3910 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[200]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[168]), .o1(n3368) );
  b15nandp2ar1n03x5 U3911 ( .a(n3355), .b(n3354), .o1(n3361) );
  b15nandp2ar1n03x5 U3915 ( .a(n3358), .b(n3357), .o1(n3363) );
  b15aoi022ar1n02x3 U3919 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[104]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[8]), .o1(n3367) );
  b15aoi022ar1n02x3 U3926 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[72]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[40]), .o1(n3366) );
  b15nand04ar1n03x5 U3927 ( .a(n3369), .b(n3368), .c(n3367), .d(n3366), .o1(
        n3370) );
  b15and002ar1n02x5 U3928 ( .a(n3972), .b(n3370), .o(
        u_spi_device_tlul_plug_wdata_next[8]) );
  b15aoi022ar1n02x3 U3932 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[250]), 
        .c(n3941), .d(u_dcfifo_rx_u_din_buffer_data[122]), .o1(n3375) );
  b15aoi022ar1n02x3 U3935 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[218]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[154]), .o1(n3374) );
  b15aoi022ar1n02x3 U3938 ( .a(n3900), .b(u_dcfifo_rx_u_din_buffer_data[26]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[186]), .o1(n3373) );
  b15aoi022ar1n02x3 U3940 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[90]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[58]), .o1(n3372) );
  b15nand04ar1n03x5 U3941 ( .a(n3375), .b(n3374), .c(n3373), .d(n3372), .o1(
        n3376) );
  b15and002ar1n02x5 U3942 ( .a(n3925), .b(n3376), .o(
        u_spi_device_tlul_plug_wdata_next[26]) );
  b15aoi022ar1n02x3 U3944 ( .a(n3916), .b(u_dcfifo_rx_u_din_buffer_data[4]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[164]), .o1(n3383) );
  b15aoi022ar1n02x3 U3945 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[196]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[132]), .o1(n3382) );
  b15aoi022ar1n02x3 U3947 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[228]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[100]), .o1(n3381) );
  b15aoi022ar1n02x3 U3949 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[68]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[36]), .o1(n3380) );
  b15nand04ar1n03x5 U3950 ( .a(n3383), .b(n3382), .c(n3381), .d(n3380), .o1(
        n3384) );
  b15and002ar1n02x5 U3951 ( .a(n3309), .b(n3384), .o(
        u_spi_device_tlul_plug_wdata_next[4]) );
  b15aoi022ar1n02x3 U3952 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[240]), 
        .c(n3923), .d(u_dcfifo_rx_u_din_buffer_data[144]), .o1(n3388) );
  b15aoi022ar1n02x3 U3953 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[112]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[16]), .o1(n3387) );
  b15aoi022ar1n02x3 U3954 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[208]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[176]), .o1(n3386) );
  b15aoi022ar1n02x3 U3955 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[80]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[48]), .o1(n3385) );
  b15nand04ar1n03x5 U3956 ( .a(n3388), .b(n3387), .c(n3386), .d(n3385), .o1(
        n3389) );
  b15and002ar1n02x5 U3957 ( .a(n3925), .b(n3389), .o(
        u_spi_device_tlul_plug_wdata_next[16]) );
  b15aoi022ar1n02x3 U3959 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[62]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[126]), .o1(n3393) );
  b15aoi022ar1n02x3 U3960 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[222]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[30]), .o1(n3392) );
  b15aoi022ar1n02x3 U3961 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[254]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[190]), .o1(n3391) );
  b15aoi022ar1n02x3 U3962 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[94]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[158]), .o1(n3390) );
  b15nand04ar1n03x5 U3963 ( .a(n3393), .b(n3392), .c(n3391), .d(n3390), .o1(
        n3394) );
  b15and002ar1n02x5 U3964 ( .a(n3309), .b(n3394), .o(
        u_spi_device_tlul_plug_wdata_next[30]) );
  b15aoi022ar1n02x3 U3966 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[157]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[189]), .o1(n3401) );
  b15aoi022ar1n02x3 U3968 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[61]), 
        .c(n3919), .d(u_dcfifo_rx_u_din_buffer_data[221]), .o1(n3400) );
  b15aoi022ar1n02x3 U3969 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[253]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[125]), .o1(n3399) );
  b15aoi022ar1n02x3 U3971 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[93]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[29]), .o1(n3398) );
  b15nand04ar1n03x5 U3972 ( .a(n3401), .b(n3400), .c(n3399), .d(n3398), .o1(
        n3402) );
  b15and002ar1n02x5 U3973 ( .a(n3309), .b(n3402), .o(
        u_spi_device_tlul_plug_wdata_next[29]) );
  b15aoi022ar1n02x3 U3974 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[95]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[63]), .o1(n3407) );
  b15aoi022ar1n02x3 U3976 ( .a(n3904), .b(u_dcfifo_rx_u_din_buffer_data[223]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[255]), .o1(n3406) );
  b15aoi022ar1n02x3 U3977 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[127]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[159]), .o1(n3405) );
  b15aoi022ar1n02x3 U3978 ( .a(n3900), .b(u_dcfifo_rx_u_din_buffer_data[31]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[191]), .o1(n3404) );
  b15nand04ar1n03x5 U3979 ( .a(n3407), .b(n3406), .c(n3405), .d(n3404), .o1(
        n3408) );
  b15and002ar1n02x5 U3980 ( .a(n3309), .b(n3408), .o(
        u_spi_device_tlul_plug_wdata_next[31]) );
  b15aoi022ar1n02x3 U3981 ( .a(n3916), .b(u_dcfifo_rx_u_din_buffer_data[17]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[177]), .o1(n3412) );
  b15aoi022ar1n02x3 U3982 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[81]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[49]), .o1(n3411) );
  b15aoi022ar1n02x3 U3983 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[209]), 
        .c(n3923), .d(u_dcfifo_rx_u_din_buffer_data[145]), .o1(n3410) );
  b15aoi022ar1n02x3 U3984 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[241]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[113]), .o1(n3409) );
  b15nand04ar1n03x5 U3985 ( .a(n3412), .b(n3411), .c(n3410), .d(n3409), .o1(
        n3413) );
  b15and002ar1n02x5 U3986 ( .a(n3925), .b(n3413), .o(
        u_spi_device_tlul_plug_wdata_next[17]) );
  b15aoi022ar1n02x3 U3987 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[242]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[18]), .o1(n3418) );
  b15aoi022ar1n02x3 U3988 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[82]), 
        .c(n3923), .d(u_dcfifo_rx_u_din_buffer_data[146]), .o1(n3417) );
  b15aoi022ar1n02x3 U3989 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[210]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[114]), .o1(n3416) );
  b15aoi022ar1n02x3 U3991 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[50]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[178]), .o1(n3415) );
  b15nand04ar1n03x5 U3992 ( .a(n3418), .b(n3417), .c(n3416), .d(n3415), .o1(
        n3419) );
  b15and002ar1n02x5 U3993 ( .a(n3925), .b(n3419), .o(
        u_spi_device_tlul_plug_wdata_next[18]) );
  b15aoi022ar1n02x3 U3994 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[86]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[214]), .o1(n3423) );
  b15aoi022ar1n02x3 U3995 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[54]), 
        .c(n3923), .d(u_dcfifo_rx_u_din_buffer_data[150]), .o1(n3422) );
  b15aoi022ar1n02x3 U3996 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[118]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[22]), .o1(n3421) );
  b15aoi022ar1n02x3 U3997 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[246]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[182]), .o1(n3420) );
  b15nand04ar1n03x5 U3998 ( .a(n3423), .b(n3422), .c(n3421), .d(n3420), .o1(
        n3424) );
  b15and002ar1n02x5 U3999 ( .a(n3925), .b(n3424), .o(
        u_spi_device_tlul_plug_wdata_next[22]) );
  b15aoi022ar1n02x3 U4000 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[76]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[204]), .o1(n3428) );
  b15aoi022ar1n02x3 U4001 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[140]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[12]), .o1(n3427) );
  b15aoi022ar1n02x3 U4002 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[236]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[108]), .o1(n3426) );
  b15aoi022ar1n02x3 U4003 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[44]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[172]), .o1(n3425) );
  b15nand04ar1n03x5 U4004 ( .a(n3428), .b(n3427), .c(n3426), .d(n3425), .o1(
        n3429) );
  b15and002ar1n02x5 U4005 ( .a(n3309), .b(n3429), .o(
        u_spi_device_tlul_plug_wdata_next[12]) );
  b15aoi022ar1n02x3 U4006 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[84]), 
        .c(n3903), .d(u_dcfifo_rx_u_din_buffer_data[52]), .o1(n3433) );
  b15aoi022ar1n02x3 U4007 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[244]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[148]), .o1(n3432) );
  b15aoi022ar1n02x3 U4008 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[212]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[20]), .o1(n3431) );
  b15aoi022ar1n02x3 U4009 ( .a(n3908), .b(u_dcfifo_rx_u_din_buffer_data[116]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[180]), .o1(n3430) );
  b15nand04ar1n03x5 U4010 ( .a(n3433), .b(n3432), .c(n3431), .d(n3430), .o1(
        n3434) );
  b15and002ar1n02x5 U4011 ( .a(n3925), .b(n3434), .o(
        u_spi_device_tlul_plug_wdata_next[20]) );
  b15aoi022ar1n02x3 U4012 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[97]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[129]), .o1(n3438) );
  b15aoi022ar1n02x3 U4013 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[65]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[193]), .o1(n3437) );
  b15aoi022ar1n02x3 U4014 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[225]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[161]), .o1(n3436) );
  b15aoi022ar1n02x3 U4015 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[33]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[1]), .o1(n3435) );
  b15nand04ar1n03x5 U4016 ( .a(n3438), .b(n3437), .c(n3436), .d(n3435), .o1(
        n3439) );
  b15and002ar1n02x5 U4017 ( .a(n3925), .b(n3439), .o(
        u_spi_device_tlul_plug_wdata_next[1]) );
  b15aoi022ar1n02x3 U4018 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[137]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[9]), .o1(n3443) );
  b15aoi022ar1n02x3 U4019 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[41]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[233]), .o1(n3442) );
  b15aoi022ar1n02x3 U4020 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[73]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[105]), .o1(n3441) );
  b15aoi022ar1n02x3 U4021 ( .a(n3904), .b(u_dcfifo_rx_u_din_buffer_data[201]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[169]), .o1(n3440) );
  b15nand04ar1n03x5 U4022 ( .a(n3443), .b(n3442), .c(n3441), .d(n3440), .o1(
        n3444) );
  b15and002ar1n02x5 U4023 ( .a(n3309), .b(n3444), .o(
        u_spi_device_tlul_plug_wdata_next[9]) );
  b15aoi022ar1n02x3 U4024 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[38]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[6]), .o1(n3448) );
  b15aoi022ar1n02x3 U4025 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[70]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[134]), .o1(n3447) );
  b15aoi022ar1n02x3 U4026 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[198]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[230]), .o1(n3446) );
  b15aoi022ar1n02x3 U4027 ( .a(n3908), .b(u_dcfifo_rx_u_din_buffer_data[102]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[166]), .o1(n3445) );
  b15nand04ar1n03x5 U4028 ( .a(n3448), .b(n3447), .c(n3446), .d(n3445), .o1(
        n3449) );
  b15and002ar1n02x5 U4029 ( .a(n3309), .b(n3449), .o(
        u_spi_device_tlul_plug_wdata_next[6]) );
  b15aoi022ar1n02x3 U4030 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[197]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[165]), .o1(n3453) );
  b15aoi022ar1n02x3 U4031 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[37]), 
        .c(n3941), .d(u_dcfifo_rx_u_din_buffer_data[101]), .o1(n3452) );
  b15aoi022ar1n02x3 U4032 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[69]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[229]), .o1(n3451) );
  b15aoi022ar1n02x3 U4033 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[133]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[5]), .o1(n3450) );
  b15nand04ar1n03x5 U4034 ( .a(n3453), .b(n3452), .c(n3451), .d(n3450), .o1(
        n3454) );
  b15and002ar1n02x5 U4035 ( .a(n3309), .b(n3454), .o(
        u_spi_device_tlul_plug_wdata_next[5]) );
  b15aoi022ar1n02x3 U4036 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[55]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[183]), .o1(n3458) );
  b15aoi022ar1n02x3 U4037 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[87]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[247]), .o1(n3457) );
  b15aoi022ar1n02x3 U4038 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[215]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[23]), .o1(n3456) );
  b15aoi022ar1n02x3 U4039 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[119]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[151]), .o1(n3455) );
  b15nand04ar1n03x5 U4040 ( .a(n3458), .b(n3457), .c(n3456), .d(n3455), .o1(
        n3459) );
  b15and002ar1n02x5 U4041 ( .a(n3925), .b(n3459), .o(
        u_spi_device_tlul_plug_wdata_next[23]) );
  b15aoi022ar1n02x3 U4042 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[153]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[25]), .o1(n3463) );
  b15aoi022ar1n02x3 U4043 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[217]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[249]), .o1(n3462) );
  b15aoi022ar1n02x3 U4044 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[89]), 
        .c(n3941), .d(u_dcfifo_rx_u_din_buffer_data[121]), .o1(n3461) );
  b15aoi022ar1n02x3 U4045 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[57]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[185]), .o1(n3460) );
  b15nand04ar1n03x5 U4046 ( .a(n3463), .b(n3462), .c(n3461), .d(n3460), .o1(
        n3464) );
  b15and002ar1n02x5 U4047 ( .a(n3925), .b(n3464), .o(
        u_spi_device_tlul_plug_wdata_next[25]) );
  b15aoi022ar1n02x3 U4048 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[71]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[135]), .o1(n3468) );
  b15aoi022ar1n02x3 U4049 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[231]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[167]), .o1(n3467) );
  b15aoi022ar1n02x3 U4050 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[39]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[199]), .o1(n3466) );
  b15aoi022ar1n02x3 U4051 ( .a(n3908), .b(u_dcfifo_rx_u_din_buffer_data[103]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[7]), .o1(n3465) );
  b15nand04ar1n03x5 U4052 ( .a(n3468), .b(n3467), .c(n3466), .d(n3465), .o1(
        n3469) );
  b15and002ar1n02x5 U4053 ( .a(n3309), .b(n3469), .o(
        u_spi_device_tlul_plug_wdata_next[7]) );
  b15aoi022ar1n02x3 U4054 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[111]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[175]), .o1(n3474) );
  b15aoi022ar1n02x3 U4055 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[79]), 
        .c(n3931), .d(u_dcfifo_rx_u_din_buffer_data[47]), .o1(n3473) );
  b15aoi022ar1n02x3 U4056 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[239]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[15]), .o1(n3472) );
  b15aoi022ar1n02x3 U4057 ( .a(n3919), .b(u_dcfifo_rx_u_din_buffer_data[207]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[143]), .o1(n3471) );
  b15nand04ar1n03x5 U4058 ( .a(n3474), .b(n3473), .c(n3472), .d(n3471), .o1(
        n3475) );
  b15and002ar1n02x5 U4059 ( .a(n3972), .b(n3475), .o(
        u_spi_device_tlul_plug_wdata_next[15]) );
  b15aoi022ar1n02x3 U4060 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[53]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[21]), .o1(n3480) );
  b15aoi022ar1n02x3 U4061 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[245]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[149]), .o1(n3479) );
  b15aoi022ar1n02x3 U4062 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[85]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[213]), .o1(n3478) );
  b15aoi022ar1n02x3 U4063 ( .a(n3908), .b(u_dcfifo_rx_u_din_buffer_data[117]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[181]), .o1(n3477) );
  b15nand04ar1n03x5 U4064 ( .a(n3480), .b(n3479), .c(n3478), .d(n3477), .o1(
        n3481) );
  b15and002ar1n02x5 U4065 ( .a(n3309), .b(n3481), .o(
        u_spi_device_tlul_plug_wdata_next[21]) );
  b15aoi022ar1n02x3 U4066 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[110]), 
        .c(n3923), .d(u_dcfifo_rx_u_din_buffer_data[142]), .o1(n3485) );
  b15aoi022ar1n02x3 U4067 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[78]), 
        .c(n3919), .d(u_dcfifo_rx_u_din_buffer_data[206]), .o1(n3484) );
  b15aoi022ar1n02x3 U4068 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[46]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[14]), .o1(n3483) );
  b15aoi022ar1n02x3 U4069 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[238]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[174]), .o1(n3482) );
  b15nand04ar1n03x5 U4070 ( .a(n3485), .b(n3484), .c(n3483), .d(n3482), .o1(
        n3486) );
  b15and002ar1n02x5 U4071 ( .a(n3925), .b(n3486), .o(
        u_spi_device_tlul_plug_wdata_next[14]) );
  b15aoi022ar1n02x3 U4072 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[109]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[13]), .o1(n3490) );
  b15aoi022ar1n02x3 U4073 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[77]), 
        .c(n3919), .d(u_dcfifo_rx_u_din_buffer_data[205]), .o1(n3489) );
  b15aoi022ar1n02x3 U4074 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[45]), 
        .c(n3923), .d(u_dcfifo_rx_u_din_buffer_data[141]), .o1(n3488) );
  b15aoi022ar1n02x3 U4075 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[237]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[173]), .o1(n3487) );
  b15nand04ar1n03x5 U4076 ( .a(n3490), .b(n3489), .c(n3488), .d(n3487), .o1(
        n3491) );
  b15and002ar1n02x5 U4077 ( .a(n3309), .b(n3491), .o(
        u_spi_device_tlul_plug_wdata_next[13]) );
  b15aoi022ar1n02x3 U4078 ( .a(n3916), .b(u_dcfifo_rx_u_din_buffer_data[2]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[162]), .o1(n3495) );
  b15aoi022ar1n02x3 U4079 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[34]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[194]), .o1(n3494) );
  b15aoi022ar1n02x3 U4080 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[66]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[98]), .o1(n3493) );
  b15aoi022ar1n02x3 U4081 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[226]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[130]), .o1(n3492) );
  b15nand04ar1n03x5 U4082 ( .a(n3495), .b(n3494), .c(n3493), .d(n3492), .o1(
        n3496) );
  b15and002ar1n02x5 U4083 ( .a(n3972), .b(n3496), .o(
        u_spi_device_tlul_plug_wdata_next[2]) );
  b15aoi022ar1n02x3 U4084 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[124]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[188]), .o1(n3500) );
  b15aoi022ar1n02x3 U4085 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[156]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[28]), .o1(n3499) );
  b15aoi022ar1n02x3 U4086 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[60]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[220]), .o1(n3498) );
  b15aoi022ar1n02x3 U4087 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[92]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[252]), .o1(n3497) );
  b15nand04ar1n03x5 U4088 ( .a(n3500), .b(n3499), .c(n3498), .d(n3497), .o1(
        n3501) );
  b15and002ar1n02x5 U4089 ( .a(n3925), .b(n3501), .o(
        u_spi_device_tlul_plug_wdata_next[28]) );
  b15aoi022ar1n02x3 U4090 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[35]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[99]), .o1(n3506) );
  b15aoi022ar1n02x3 U4091 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[67]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[3]), .o1(n3505) );
  b15aoi022ar1n02x3 U4092 ( .a(n3905), .b(u_dcfifo_rx_u_din_buffer_data[131]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[163]), .o1(n3504) );
  b15aoi022ar1n02x3 U4093 ( .a(n3904), .b(u_dcfifo_rx_u_din_buffer_data[195]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[227]), .o1(n3503) );
  b15nand04ar1n03x5 U4094 ( .a(n3506), .b(n3505), .c(n3504), .d(n3503), .o1(
        n3507) );
  b15and002ar1n02x5 U4095 ( .a(n3309), .b(n3507), .o(
        u_spi_device_tlul_plug_wdata_next[3]) );
  b15aoi022ar1n02x3 U4096 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[155]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[27]), .o1(n3513) );
  b15aoi022ar1n02x3 U4097 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[251]), 
        .c(n3941), .d(u_dcfifo_rx_u_din_buffer_data[123]), .o1(n3512) );
  b15aoi022ar1n02x3 U4098 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[91]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[187]), .o1(n3511) );
  b15aoi022ar1n02x3 U4099 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[59]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[219]), .o1(n3510) );
  b15nand04ar1n03x5 U4100 ( .a(n3513), .b(n3512), .c(n3511), .d(n3510), .o1(
        n3514) );
  b15and002ar1n02x5 U4101 ( .a(n3309), .b(n3514), .o(
        u_spi_device_tlul_plug_wdata_next[27]) );
  b15aoi022ar1n02x3 U4102 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[75]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[139]), .o1(n3520) );
  b15aoi022ar1n02x3 U4103 ( .a(n3916), .b(u_dcfifo_rx_u_din_buffer_data[11]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[171]), .o1(n3519) );
  b15aoi022ar1n02x3 U4104 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[43]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[203]), .o1(n3518) );
  b15aoi022ar1n02x3 U4105 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[235]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[107]), .o1(n3517) );
  b15nand04ar1n03x5 U4106 ( .a(n3520), .b(n3519), .c(n3518), .d(n3517), .o1(
        n3521) );
  b15and002ar1n02x5 U4107 ( .a(n3972), .b(n3521), .o(
        u_spi_device_tlul_plug_wdata_next[11]) );
  b15aoi022ar1n02x3 U4108 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[64]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[160]), .o1(n3528) );
  b15aoi022ar1n02x3 U4109 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[96]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[0]), .o1(n3527) );
  b15aoi022ar1n02x3 U4110 ( .a(n3975), .b(u_dcfifo_rx_u_din_buffer_data[224]), 
        .c(n3905), .d(u_dcfifo_rx_u_din_buffer_data[128]), .o1(n3526) );
  b15aoi022ar1n02x3 U4111 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[32]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[192]), .o1(n3525) );
  b15nand04ar1n03x5 U4112 ( .a(n3528), .b(n3527), .c(n3526), .d(n3525), .o1(
        n3529) );
  b15and002ar1n02x5 U4113 ( .a(n3925), .b(n3529), .o(
        u_spi_device_tlul_plug_wdata_next[0]) );
  b15aoi022ar1n02x3 U4114 ( .a(n3941), .b(u_dcfifo_rx_u_din_buffer_data[115]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[179]), .o1(n3535) );
  b15aoi022ar1n02x3 U4115 ( .a(n3913), .b(u_dcfifo_rx_u_din_buffer_data[83]), 
        .c(n3914), .d(u_dcfifo_rx_u_din_buffer_data[243]), .o1(n3534) );
  b15aoi022ar1n02x3 U4116 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[147]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[19]), .o1(n3533) );
  b15aoi022ar1n02x3 U4117 ( .a(n3903), .b(u_dcfifo_rx_u_din_buffer_data[51]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[211]), .o1(n3532) );
  b15nand04ar1n03x5 U4118 ( .a(n3535), .b(n3534), .c(n3533), .d(n3532), .o1(
        n3536) );
  b15and002ar1n02x5 U4119 ( .a(n3925), .b(n3536), .o(
        u_spi_device_tlul_plug_wdata_next[19]) );
  b15aoi022ar1n02x3 U4120 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[56]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[120]), .o1(n3545) );
  b15aoi022ar1n02x3 U4121 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[248]), 
        .c(n3944), .d(u_dcfifo_rx_u_din_buffer_data[184]), .o1(n3544) );
  b15aoi022ar1n02x3 U4122 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[152]), 
        .c(n3916), .d(u_dcfifo_rx_u_din_buffer_data[24]), .o1(n3543) );
  b15aoi022ar1n02x3 U4123 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[88]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[216]), .o1(n3542) );
  b15nand04ar1n03x5 U4124 ( .a(n3545), .b(n3544), .c(n3543), .d(n3542), .o1(
        n3546) );
  b15and002ar1n02x5 U4125 ( .a(n3925), .b(n3546), .o(
        u_spi_device_tlul_plug_wdata_next[24]) );
  b15aoi022ar1n02x3 U4126 ( .a(n3931), .b(u_dcfifo_rx_u_din_buffer_data[42]), 
        .c(n3911), .d(u_dcfifo_rx_u_din_buffer_data[170]), .o1(n3559) );
  b15aoi022ar1n02x3 U4127 ( .a(n3923), .b(u_dcfifo_rx_u_din_buffer_data[138]), 
        .c(n3900), .d(u_dcfifo_rx_u_din_buffer_data[10]), .o1(n3558) );
  b15aoi022ar1n02x3 U4128 ( .a(n3914), .b(u_dcfifo_rx_u_din_buffer_data[234]), 
        .c(n3908), .d(u_dcfifo_rx_u_din_buffer_data[106]), .o1(n3557) );
  b15aoi022ar1n02x3 U4129 ( .a(n3898), .b(u_dcfifo_rx_u_din_buffer_data[74]), 
        .c(n3904), .d(u_dcfifo_rx_u_din_buffer_data[202]), .o1(n3556) );
  b15nand04ar1n03x5 U4130 ( .a(n3559), .b(n3558), .c(n3557), .d(n3556), .o1(
        n3560) );
  b15and002ar1n02x5 U4131 ( .a(n3309), .b(n3560), .o(
        u_spi_device_tlul_plug_wdata_next[10]) );
  b15xor002ar1n02x5 U4132 ( .a(n3561), .b(tl_o[68]), .out0(n3601) );
  b15xor002ar1n02x5 U4133 ( .a(tl_o[71]), .b(n3601), .out0(n3563) );
  b15xor002ar1n02x5 U4134 ( .a(n3563), .b(n3562), .out0(n3575) );
  b15inv000ar1n03x5 U4135 ( .a(tl_o[69]), .o1(n3571) );
  b15aoi022ar1n02x3 U4136 ( .a(tl_o[77]), .b(tl_o[69]), .c(n3571), .d(n3564), 
        .o1(n3565) );
  b15xor002ar1n02x5 U4137 ( .a(n3575), .b(n3565), .out0(n3568) );
  b15inv000ar1n03x5 U4138 ( .a(tl_o[72]), .o1(n3597) );
  b15aoi022ar1n02x3 U4139 ( .a(tl_o[76]), .b(tl_o[72]), .c(n3597), .d(n3566), 
        .o1(n3567) );
  b15xor002ar1n02x5 U4140 ( .a(tl_o[75]), .b(n3567), .out0(n3586) );
  b15xor002ar1n02x5 U4141 ( .a(n3568), .b(n3586), .out0(n3570) );
  b15aboi22ar1n02x3 U4142 ( .c(tl_o[74]), .d(n3569), .a(tl_o[74]), .b(tl_o[73]), .out0(n3605) );
  b15xor002ar1n02x5 U4143 ( .a(n3570), .b(n3605), .out0(tl_o[9]) );
  b15inv000ar1n03x5 U4144 ( .a(tl_o[78]), .o1(n3598) );
  b15aoi022ar1n02x3 U4145 ( .a(tl_o[69]), .b(tl_o[78]), .c(n3598), .d(n3571), 
        .o1(n3590) );
  b15xor002ar1n02x5 U4146 ( .a(n3590), .b(u_spi_device_tlul_plug_we), .out0(
        n3577) );
  b15aoi022ar1n02x3 U4147 ( .a(tl_o[79]), .b(tl_o[81]), .c(n3573), .d(n3572), 
        .o1(n3574) );
  b15xor002ar1n02x5 U4148 ( .a(n3575), .b(n3574), .out0(n3576) );
  b15xor002ar1n02x5 U4149 ( .a(n3577), .b(n3576), .out0(n3579) );
  b15xor002ar1n02x5 U4150 ( .a(n3579), .b(n3578), .out0(tl_o[10]) );
  b15aoi022ar1n02x3 U4151 ( .a(tl_o[91]), .b(tl_o[84]), .c(n3581), .d(n3580), 
        .o1(n3589) );
  b15aoi022ar1n02x3 U4152 ( .a(tl_o[85]), .b(tl_o[82]), .c(n3583), .d(n3582), 
        .o1(n3584) );
  b15xor002ar1n02x5 U4153 ( .a(n3585), .b(n3584), .out0(n3587) );
  b15xor002ar1n02x5 U4154 ( .a(n3587), .b(n3586), .out0(n3588) );
  b15xor002ar1n02x5 U4155 ( .a(n3589), .b(n3588), .out0(n3591) );
  b15xor002ar1n02x5 U4156 ( .a(n3591), .b(n3590), .out0(n3592) );
  b15xor002ar1n02x5 U4157 ( .a(n3593), .b(n3592), .out0(n3594) );
  b15xor002ar1n02x5 U4158 ( .a(n3594), .b(tl_o[88]), .out0(tl_o[12]) );
  b15aoi022ar1n02x3 U4159 ( .a(tl_o[89]), .b(n3596), .c(tl_o[80]), .d(n3595), 
        .o1(n3604) );
  b15aoi022ar1n02x3 U4160 ( .a(tl_o[72]), .b(tl_o[78]), .c(n3598), .d(n3597), 
        .o1(n3600) );
  b15xor002ar1n02x5 U4161 ( .a(n3600), .b(n3599), .out0(n3602) );
  b15xor002ar1n02x5 U4162 ( .a(n3602), .b(n3601), .out0(n3603) );
  b15xor002ar1n02x5 U4163 ( .a(n3604), .b(n3603), .out0(n3606) );
  b15xor002ar1n02x5 U4164 ( .a(n3606), .b(n3605), .out0(n3607) );
  b15xor002ar1n02x5 U4165 ( .a(tl_o[62]), .b(n3607), .out0(n3609) );
  b15xor002ar1n02x5 U4166 ( .a(n3609), .b(n3608), .out0(tl_o[11]) );
  b15nor002ar1n03x5 U4167 ( .a(u_spi_device_tlul_plug_state[0]), .b(n3610), 
        .o1(u_spi_device_tlul_plug_N61) );
  b15and003ar1n03x5 U4168 ( .a(n3612), .b(n3611), .c(
        u_device_sm_s_dummy_cycles[6]), .o(u_rxreg_counter_trgt_next[6]) );
  b15and003ar1n03x5 U4169 ( .a(n3612), .b(n3611), .c(
        u_device_sm_s_dummy_cycles[7]), .o(u_rxreg_counter_trgt_next[7]) );
  b15inv000ar1n03x5 U4170 ( .a(u_rxreg_N7), .o1(n3615) );
  b15oai012ar1n03x5 U4171 ( .b(u_device_sm_s_dummy_cycles[0]), .c(n3613), .a(
        n3612), .o1(n3614) );
  b15aoai13ar1n02x3 U4172 ( .c(n3616), .d(n3626), .b(n3615), .a(n3614), .o1(
        u_rxreg_counter_trgt_next[0]) );
  b15nonb02ar1n02x3 U4174 ( .a(u_device_sm_tx_done_reg), .b(n3617), .out0(
        n3623) );
  b15oaoi13ar1n02x3 U4175 ( .c(n3620), .d(n3619), .b(u_device_sm_state[2]), 
        .a(n3618), .o1(n3621) );
  b15aoai13ar1n02x3 U4176 ( .c(n3812), .d(n3623), .b(n3622), .a(n3621), .o1(
        n3625) );
  b15oaoi13ar1n02x3 U4177 ( .c(n3628), .d(n3627), .b(n3626), .a(n3625), .o1(
        n3629) );
  b15aoai13ar1n02x3 U4178 ( .c(n3632), .d(n3631), .b(n3819), .a(n3629), .o1(
        u_device_sm_tx_counter_next_3_) );
  b15aoai13ar1n02x3 U4179 ( .c(n3633), .d(u_dcfifo_tx_write_token[6]), .b(
        u_dcfifo_tx_write_token[0]), .a(u_dcfifo_tx_write_token[7]), .o1(n3662) );
  b15aoi012ar1n02x5 U4180 ( .b(u_dcfifo_tx_write_token[1]), .c(n3635), .a(
        n3634), .o1(n3660) );
  b15inv000ar1n03x5 U4181 ( .a(n3636), .o1(n3658) );
  b15oai112ar1n02x5 U4182 ( .c(n3640), .d(n3639), .a(n3638), .b(n3637), .o1(
        n3657) );
  b15nandp2ar1n03x5 U4183 ( .a(u_dcfifo_tx_write_token[0]), .b(
        u_dcfifo_tx_write_token[7]), .o1(n3642) );
  b15aoi012ar1n02x5 U4184 ( .b(n3643), .c(n3642), .a(n3641), .o1(n3656) );
  b15nandp2ar1n03x5 U4185 ( .a(u_dcfifo_tx_write_token[6]), .b(
        u_dcfifo_tx_write_token[5]), .o1(n3646) );
  b15nandp2ar1n03x5 U4186 ( .a(u_dcfifo_tx_write_token[1]), .b(
        u_dcfifo_tx_write_token[2]), .o1(n3644) );
  b15oai022ar1n02x5 U4187 ( .a(n3647), .b(n3646), .c(n3645), .d(n3644), .o1(
        n3648) );
  b15aoi013ar1n02x3 U4188 ( .b(u_dcfifo_tx_write_token[5]), .c(
        u_dcfifo_tx_write_token[4]), .d(n3649), .a(n3648), .o1(n3652) );
  b15oai112ar1n02x5 U4189 ( .c(n3650), .d(n3649), .a(
        u_dcfifo_tx_write_token[3]), .b(u_dcfifo_tx_write_token[4]), .o1(n3651) );
  b15oai112ar1n02x5 U4190 ( .c(n3654), .d(n3653), .a(n3652), .b(n3651), .o1(
        n3655) );
  b15aoi112ar1n02x3 U4191 ( .c(n3658), .d(n3657), .a(n3656), .b(n3655), .o1(
        n3659) );
  b15aoai13ar1n02x3 U4192 ( .c(n3662), .d(n3661), .b(n3660), .a(n3659), .o1(
        u_dcfifo_tx_u_din_full_full_dn) );
  b15aoi022ar1n02x3 U4193 ( .a(n3664), .b(u_device_sm_s_dummy_cycles[1]), .c(
        n3663), .d(u_device_sm_u_spiregs_n[15]), .o1(n3683) );
  b15aoi022ar1n02x3 U4194 ( .a(n3666), .b(u_device_sm_u_spiregs_reg0[1]), .c(
        n3665), .d(u_device_sm_u_spiregs_n[7]), .o1(n3682) );
  b15aoi022ar1n02x3 U4195 ( .a(n3899), .b(u_dcfifo_tx_u_din_buffer_data[1]), 
        .c(n3902), .d(u_dcfifo_tx_u_din_buffer_data[33]), .o1(n3678) );
  b15aoi022ar1n02x3 U4196 ( .a(n3910), .b(u_dcfifo_tx_u_din_buffer_data[193]), 
        .c(n3901), .d(u_dcfifo_tx_u_din_buffer_data[65]), .o1(n3677) );
  b15aoi022ar1n02x3 U4197 ( .a(n3909), .b(u_dcfifo_tx_u_din_buffer_data[161]), 
        .c(n3906), .d(u_dcfifo_tx_u_din_buffer_data[225]), .o1(n3676) );
  b15aoi022ar1n02x3 U4198 ( .a(n3907), .b(u_dcfifo_tx_u_din_buffer_data[129]), 
        .c(n3897), .d(u_dcfifo_tx_u_din_buffer_data[97]), .o1(n3675) );
  b15nand04ar1n03x5 U4199 ( .a(n3678), .b(n3677), .c(n3676), .d(n3675), .o1(
        n3679) );
  b15nandp2ar1n03x5 U4200 ( .a(n3681), .b(n3679), .o1(n3680) );
  b15aoai13ar1n02x3 U4201 ( .c(n3683), .d(n3682), .b(n3681), .a(n3680), .o1(
        u_device_sm_N175) );
  b15aoi022ar1n02x3 U4204 ( .a(tx_data_valid), .b(tx_data[5]), .c(n3932), .d(
        u_txreg_data_int[4]), .o1(n3685) );
  b15aob012ar1n03x5 U4205 ( .b(n2919), .c(u_txreg_data_int[1]), .a(n3685), 
        .out0(u_txreg_N39) );
  b15aoi022ar1n02x3 U4206 ( .a(tx_data_valid), .b(tx_data[4]), .c(n3932), .d(
        u_txreg_data_int[3]), .o1(n3688) );
  b15aob012ar1n03x5 U4207 ( .b(n3929), .c(u_txreg_data_int[0]), .a(n3688), 
        .out0(u_txreg_N38) );
  b15nor002ar1n03x5 U3896 ( .a(n3364), .b(n3350), .o1(n3347) );
  b15nor002ar1n03x5 U3907 ( .a(n3364), .b(n3352), .o1(n3353) );
  b15nor002ar1n03x5 U3912 ( .a(n3364), .b(n3361), .o1(n3356) );
  b15nor002ar1n03x5 U3923 ( .a(n3364), .b(n3363), .o1(n3365) );
  b15nor002ar1n03x5 U3479 ( .a(n3014), .b(n3003), .o1(n3002) );
  b15nor002ar1n03x5 U3483 ( .a(n3017), .b(n3003), .o1(n3004) );
  b15nor002ar1n03x5 U3488 ( .a(n3634), .b(n3019), .o1(n3006) );
  b15nor002ar1n03x5 U3492 ( .a(n3008), .b(n3010), .o1(n3009) );
  b15nor002ar1n03x5 U3496 ( .a(n3633), .b(n3010), .o1(n3011) );
  b15nor002ar1n03x5 U3500 ( .a(n3014), .b(n3016), .o1(n3015) );
  b15nor002ar1n03x5 U3504 ( .a(n3017), .b(n3016), .o1(n3018) );
  b15nor002ar1n03x5 U3900 ( .a(n3360), .b(n3352), .o1(n3349) );
  b15nor002ar1n03x5 U3904 ( .a(n3360), .b(n3350), .o1(n3351) );
  b15nor002ar1n03x5 U3916 ( .a(n3360), .b(n3363), .o1(n3359) );
  b15nor002ar1n03x5 U3920 ( .a(n3361), .b(n3360), .o1(n3362) );
  b15aoi022ar1n04x5 U3165 ( .a(n3806), .b(n2804), .c(n2803), .d(n3807), .o1(
        ctrl_data_rx[9]) );
  b15aoi022ar1n04x5 U3166 ( .a(n3806), .b(n2806), .c(n2805), .d(n3807), .o1(
        ctrl_data_rx[18]) );
  b15aoi022ar1n04x5 U3167 ( .a(n3806), .b(n2808), .c(n2807), .d(n3807), .o1(
        ctrl_data_rx[26]) );
  b15aoi022ar1n04x5 U3168 ( .a(n3806), .b(n2810), .c(n2809), .d(n3807), .o1(
        ctrl_data_rx[27]) );
  b15aoi022ar1n04x5 U3169 ( .a(n3806), .b(n2812), .c(n2811), .d(n3807), .o1(
        ctrl_data_rx[24]) );
  b15aoi022ar1n04x5 U3170 ( .a(n3806), .b(n2814), .c(n2813), .d(n3807), .o1(
        ctrl_data_rx[21]) );
  b15aoi022ar1n04x5 U3171 ( .a(n1869), .b(n2816), .c(n2815), .d(n3811), .o1(
        ctrl_data_rx[12]) );
  b15aoi022ar1n04x5 U3172 ( .a(n3806), .b(n2820), .c(n2819), .d(n3807), .o1(
        ctrl_data_rx[15]) );
  b15inv040ar1n03x5 U2915 ( .a(spi_cs), .o1(n3770) );
  b15inv000ar1n08x5 U2916 ( .a(spi_cs), .o1(n3771) );
  b15inv000ar1n06x5 U2919 ( .a(spi_cs), .o1(n3772) );
  b15inv000ar1n05x5 U2921 ( .a(spi_cs), .o1(n3773) );
  b15inv040ar1n03x5 U2923 ( .a(spi_cs), .o1(n3774) );
  b15bfn001ar1n06x5 U3008 ( .a(n3942), .o(n3789) );
  b15bfn001ar1n06x5 U3011 ( .a(n3942), .o(n3792) );
  b15bfn001ar1n08x5 U3016 ( .a(rst_ni), .o(n3797) );
  b15bfn000ar1n03x5 U3018 ( .a(n3942), .o(n3799) );
  b15bfn001ar1n06x5 U3022 ( .a(rst_ni), .o(n3803) );
  b15bfn001ar1n06x5 U3024 ( .a(rst_ni), .o(n3805) );
  b15inv000ar1n03x5 U3026 ( .a(n3806), .o1(n3807) );
  b15inv000ar1n03x5 U3028 ( .a(n3808), .o1(n3809) );
  b15inv000ar1n03x5 U3030 ( .a(n1869), .o1(n3811) );
  b15inv000ar1n03x5 U3034 ( .a(en_quad), .o1(n3815) );
  b15inv000ar1n03x5 U3037 ( .a(n2783), .o1(n3818) );
  b15inv000ar1n03x5 U3039 ( .a(n2802), .o1(n3820) );
  b15inv000ar1n03x5 U3040 ( .a(n3664), .o1(n3821) );
  b15fqy00car1n02x5 u_syncro_cs_reg_reg_0_ ( .si(1'b0), .d(spi_cs), .ssb(1'b1), 
        .clk(clk_i), .psb(n3915), .o(u_syncro_cs_reg_0_) );
  b15fqy00car1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_1_ ( .si(1'b0), .d(
        u_dcfifo_tx_u_dout_read_token[0]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .psb(n3792), .o(
        u_dcfifo_tx_u_dout_read_token[1]) );
  b15nor002ar1n03x5 U3319 ( .a(tx_data_valid), .b(n3815), .o1(n2919) );
  b15nor002ar1n03x5 U3313 ( .a(en_quad), .b(tx_data_valid), .o1(n2917) );
  b15bfn001ar1n06x5 U2940 ( .a(rst_ni), .o(n3782) );
  b15bfn000ar1n03x5 U3015 ( .a(rst_ni), .o(n3796) );
  b15bfn001ar1n06x5 U3009 ( .a(n3942), .o(n3790) );
  b15bfn001ar1n06x5 U3012 ( .a(n3942), .o(n3793) );
  b15bfn001ar1n06x5 U3003 ( .a(n3942), .o(n3784) );
  b15bfn000ar1n03x5 U3014 ( .a(rst_ni), .o(n3795) );
  b15bfn001ar1n06x5 U2933 ( .a(rst_ni), .o(n3780) );
  b15bfn001ar1n06x5 U3020 ( .a(n3942), .o(n3801) );
  b15bfn000ar1n03x5 U3019 ( .a(rst_ni), .o(n3800) );
  b15bfn001ar1n06x5 U3023 ( .a(n3942), .o(n3804) );
  b15bfn001ar1n06x5 U3007 ( .a(n3942), .o(n3788) );
  b15bfn001ar1n06x5 U3017 ( .a(n3942), .o(n3798) );
  b15bfn001ar1n06x5 U3010 ( .a(rst_ni), .o(n3791) );
  b15bfn001ar1n06x5 U3021 ( .a(rst_ni), .o(n3802) );
  b15bfn001ar1n06x5 U3013 ( .a(rst_ni), .o(n3794) );
  b15bfn001ar1n08x5 U3004 ( .a(n3942), .o(n3785) );
  b15inv000ar1n03x5 U3036 ( .a(en_quad), .o1(n3817) );
  b15inv000ar1n03x5 U3038 ( .a(n2750), .o1(n3819) );
  b15inv000ar1n03x5 U3032 ( .a(n3812), .o1(n3813) );
  b15bfn000ar1n02x5 U3451 ( .a(n3822), .o(n3971) );
  b15bfn000ar1n02x5 U3452 ( .a(n3309), .o(n3972) );
  b15bfn000ar1n03x5 U3481 ( .a(rst_ni), .o(n3915) );
  b15bfn000ar1n02x5 U3489 ( .a(n3971), .o(n3918) );
  b15bfn000ar1n02x5 U3497 ( .a(tx_data_valid), .o(n3922) );
  b15bfn000ar1n02x5 U3502 ( .a(n3972), .o(n3925) );
  b15bfn000ar1n03x5 U3508 ( .a(n3776), .o(n3928) );
  b15bfn000ar1n02x5 U3523 ( .a(n3794), .o(n3938) );
  b15bfn000ar1n02x5 U3625 ( .a(n3786), .o(n3947) );
  b15bfn000ar1n03x5 U3914 ( .a(n3799), .o(n3962) );
  b15bfn001ar1n06x5 U3929 ( .a(rst_ni), .o(n3969) );
  b15bfn000ar1n03x5 U3930 ( .a(n3773), .o(n3970) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_counter_trgt_reg_latch ( .clk(spi_sclk), 
        .en(u_rxreg_N7), .te(1'b0), .clkout(u_rxreg_net873) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_data_int_reg_0_latch ( .clk(spi_sclk), 
        .en(n3809), .te(1'b0), .clkout(u_rxreg_net868) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_data_int_reg_latch ( .clk(spi_sclk), .en(
        n3809), .te(1'b0), .clkout(u_rxreg_net863) );
  b15cilb05ah1n02x3 u_rxreg_clk_gate_counter_reg_latch ( .clk(spi_sclk), .en(
        n3809), .te(1'b0), .clkout(u_rxreg_net857) );
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
        .clk(spi_sclk), .en(u_dcfifo_tx_u_dout_read_enable), .te(1'b0), 
        .clkout(u_dcfifo_tx_u_dout_read_tr_net634) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_0__0_latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N26), .te(1'b0), .clkout(
        u_dcfifo_rx_u_din_buffer_net746) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_din_buffer_clk_gate_data_reg_0__latch ( 
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_buffer_N26), .te(1'b0), .clkout(
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
        .clk(spi_sclk), .en(u_dcfifo_rx_u_din_write_enable), .te(1'b0), 
        .clkout(u_dcfifo_rx_u_din_write_tr_net652) );
  b15cilb05ah1n02x3 u_dcfifo_rx_u_dout_read_tr_clk_gate_state_reg_latch ( 
        .clk(clk_i), .en(n2723), .te(1'b0), .clkout(
        u_dcfifo_rx_u_dout_read_tr_net634) );
  b15fqy203ar1n02x5 u_rxreg_counter_trgt_reg_1__u_rxreg_counter_trgt_reg_2_ ( 
        .si1(1'b0), .d1(u_rxreg_counter_trgt_next[1]), .ssb(1'b1), .clk(
        u_rxreg_net873), .rb(n3778), .o1(u_rxreg_counter_trgt[1]), .si2(1'b0), 
        .d2(u_rxreg_counter_trgt_next[2]), .o2(u_rxreg_counter_trgt[2]) );
  b15fqy203ar1n02x5 u_rxreg_counter_trgt_reg_3__u_rxreg_counter_trgt_reg_4_ ( 
        .si1(1'b0), .d1(u_rxreg_counter_trgt_next[3]), .ssb(1'b1), .clk(
        u_rxreg_net873), .rb(n3778), .o1(u_rxreg_counter_trgt[3]), .si2(1'b0), 
        .d2(u_rxreg_counter_trgt_next[4]), .o2(u_rxreg_counter_trgt[4]) );
  b15fqy203ar1n02x5 u_rxreg_counter_trgt_reg_5__u_rxreg_counter_trgt_reg_6_ ( 
        .si1(1'b0), .d1(u_rxreg_counter_trgt_next[5]), .ssb(1'b1), .clk(
        u_rxreg_net873), .rb(n3778), .o1(u_rxreg_counter_trgt[5]), .si2(1'b0), 
        .d2(u_rxreg_counter_trgt_next[6]), .o2(u_rxreg_counter_trgt[6]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_16__u_rxreg_data_int_reg_17_ ( .si1(
        1'b0), .d1(u_rxreg_N45), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3970), 
        .o1(u_rxreg_data_int[16]), .si2(1'b0), .d2(u_rxreg_N46), .o2(
        u_rxreg_data_int[17]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_18__u_rxreg_data_int_reg_19_ ( .si1(
        1'b0), .d1(u_rxreg_N47), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3773), 
        .o1(u_rxreg_data_int[18]), .si2(1'b0), .d2(u_rxreg_N48), .o2(
        u_rxreg_data_int[19]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_20__u_rxreg_data_int_reg_21_ ( .si1(
        1'b0), .d1(u_rxreg_N49), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3773), 
        .o1(u_rxreg_data_int[20]), .si2(1'b0), .d2(u_rxreg_N50), .o2(
        u_rxreg_data_int[21]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_22__u_rxreg_data_int_reg_23_ ( .si1(
        1'b0), .d1(u_rxreg_N51), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3773), 
        .o1(u_rxreg_data_int[22]), .si2(1'b0), .d2(u_rxreg_N52), .o2(
        u_rxreg_data_int[23]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_24__u_rxreg_data_int_reg_25_ ( .si1(
        1'b0), .d1(u_rxreg_N53), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3773), 
        .o1(u_rxreg_data_int[24]), .si2(1'b0), .d2(u_rxreg_N54), .o2(
        u_rxreg_data_int[25]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_26__u_rxreg_data_int_reg_27_ ( .si1(
        1'b0), .d1(u_rxreg_N55), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3773), 
        .o1(u_rxreg_data_int[26]), .si2(1'b0), .d2(u_rxreg_N56), .o2(
        u_rxreg_data_int[27]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_28__u_rxreg_data_int_reg_29_ ( .si1(
        1'b0), .d1(u_rxreg_N57), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3773), 
        .o1(u_rxreg_data_int[28]), .si2(1'b0), .d2(u_rxreg_N58), .o2(
        u_rxreg_data_int[29]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_30__u_rxreg_data_int_reg_31_ ( .si1(
        1'b0), .d1(u_rxreg_N59), .ssb(1'b1), .clk(u_rxreg_net868), .rb(n3970), 
        .o1(u_rxreg_data_int[30]), .si2(1'b0), .d2(u_rxreg_N60), .o2(
        u_rxreg_data_int[31]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_0__u_rxreg_data_int_reg_1_ ( .si1(
        1'b0), .d1(spi_sdi0), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3774), 
        .o1(u_rxreg_data_int[0]), .si2(1'b0), .d2(u_rxreg_N30), .o2(
        u_rxreg_data_int[1]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_2__u_rxreg_data_int_reg_3_ ( .si1(
        1'b0), .d1(u_rxreg_N31), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3774), 
        .o1(u_rxreg_data_int[2]), .si2(1'b0), .d2(u_rxreg_N32), .o2(
        u_rxreg_data_int[3]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_4__u_rxreg_data_int_reg_5_ ( .si1(
        1'b0), .d1(u_rxreg_N33), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3778), 
        .o1(u_rxreg_data_int[4]), .si2(1'b0), .d2(u_rxreg_N34), .o2(
        u_rxreg_data_int[5]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_6__u_rxreg_data_int_reg_7_ ( .si1(
        1'b0), .d1(u_rxreg_N35), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3774), 
        .o1(u_rxreg_data_int[6]), .si2(1'b0), .d2(u_rxreg_N36), .o2(
        u_rxreg_data_int[7]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_8__u_rxreg_data_int_reg_9_ ( .si1(
        1'b0), .d1(u_rxreg_N37), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3970), 
        .o1(u_rxreg_data_int[8]), .si2(1'b0), .d2(u_rxreg_N38), .o2(
        u_rxreg_data_int[9]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_10__u_rxreg_data_int_reg_11_ ( .si1(
        1'b0), .d1(u_rxreg_N39), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3970), 
        .o1(u_rxreg_data_int[10]), .si2(1'b0), .d2(u_rxreg_N40), .o2(
        u_rxreg_data_int[11]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_12__u_rxreg_data_int_reg_13_ ( .si1(
        1'b0), .d1(u_rxreg_N41), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3970), 
        .o1(u_rxreg_data_int[12]), .si2(1'b0), .d2(u_rxreg_N42), .o2(
        u_rxreg_data_int[13]) );
  b15fqy203ar1n02x5 u_rxreg_data_int_reg_14__u_rxreg_data_int_reg_15_ ( .si1(
        1'b0), .d1(u_rxreg_N43), .ssb(1'b1), .clk(u_rxreg_net863), .rb(n3970), 
        .o1(u_rxreg_data_int[14]), .si2(1'b0), .d2(u_rxreg_N44), .o2(
        u_rxreg_data_int[15]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_0__u_rxreg_counter_reg_1_ ( .si1(1'b0), 
        .d1(u_rxreg_N22), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3968), .o1(
        u_rxreg_counter[0]), .si2(1'b0), .d2(u_rxreg_N23), .o2(
        u_rxreg_counter[1]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_2__u_rxreg_counter_reg_3_ ( .si1(1'b0), 
        .d1(u_rxreg_N24), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3778), .o1(
        u_rxreg_counter[2]), .si2(1'b0), .d2(u_rxreg_N25), .o2(
        u_rxreg_counter[3]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_4__u_rxreg_counter_reg_5_ ( .si1(1'b0), 
        .d1(u_rxreg_N26), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3772), .o1(
        u_rxreg_counter[4]), .si2(1'b0), .d2(u_rxreg_N27), .o2(
        u_rxreg_counter[5]) );
  b15fqy203ar1n02x5 u_rxreg_counter_reg_6__u_rxreg_counter_reg_7_ ( .si1(1'b0), 
        .d1(u_rxreg_N28), .ssb(1'b1), .clk(u_rxreg_net857), .rb(n3778), .o1(
        u_rxreg_counter[6]), .si2(1'b0), .d2(u_rxreg_N29), .o2(
        u_rxreg_counter[7]) );
  b15fqy203ar1n02x5 u_txreg_counter_trgt_reg_3__u_txreg_counter_trgt_reg_4_ ( 
        .si1(1'b0), .d1(tx_counter[3]), .ssb(1'b1), .clk(u_txreg_net840), .rb(
        n3769), .o1(u_txreg_counter_trgt[3]), .si2(1'b0), .d2(tx_counter[4]), 
        .o2(u_txreg_counter_trgt[4]) );
  b15fqy203ar1n02x5 u_txreg_counter_trgt_reg_5__u_txreg_counter_trgt_reg_6_ ( 
        .si1(1'b0), .d1(tx_counter[5]), .ssb(1'b1), .clk(u_txreg_net840), .rb(
        n3769), .o1(u_txreg_counter_trgt[5]), .si2(1'b0), .d2(tx_counter[6]), 
        .o2(u_txreg_counter_trgt[6]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_16__u_txreg_data_int_reg_17_ ( .si1(
        1'b0), .d1(u_txreg_N50), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[16]), .si2(1'b0), .d2(u_txreg_N51), .o2(
        u_txreg_data_int[17]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_18__u_txreg_data_int_reg_19_ ( .si1(
        1'b0), .d1(u_txreg_N52), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[18]), .si2(1'b0), .d2(u_txreg_N53), .o2(
        u_txreg_data_int[19]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_20__u_txreg_data_int_reg_21_ ( .si1(
        1'b0), .d1(u_txreg_N54), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[20]), .si2(1'b0), .d2(u_txreg_N55), .o2(
        u_txreg_data_int[21]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_22__u_txreg_data_int_reg_23_ ( .si1(
        1'b0), .d1(u_txreg_N56), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[22]), .si2(1'b0), .d2(u_txreg_N57), .o2(
        u_txreg_data_int[23]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_24__u_txreg_data_int_reg_25_ ( .si1(
        1'b0), .d1(u_txreg_N58), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[24]), .si2(1'b0), .d2(u_txreg_N59), .o2(
        u_txreg_data_int[25]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_26__u_txreg_data_int_reg_27_ ( .si1(
        1'b0), .d1(u_txreg_N60), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[26]), .si2(1'b0), .d2(u_txreg_N61), .o2(
        u_txreg_data_int[27]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_28__u_txreg_data_int_reg_29_ ( .si1(
        1'b0), .d1(u_txreg_N62), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3771), 
        .o1(u_txreg_data_int[28]), .si2(1'b0), .d2(u_txreg_N63), .o2(
        u_txreg_data_int[29]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_30__u_txreg_data_int_reg_31_ ( .si1(
        1'b0), .d1(u_txreg_N64), .ssb(1'b1), .clk(u_txreg_net835), .rb(n3773), 
        .o1(u_txreg_data_int[30]), .si2(1'b0), .d2(u_txreg_N65), .o2(
        u_txreg_data_int[31]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_0__u_txreg_data_int_reg_1_ ( .si1(
        1'b0), .d1(u_txreg_N34), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3778), 
        .o1(u_txreg_data_int[0]), .si2(1'b0), .d2(u_txreg_N35), .o2(
        u_txreg_data_int[1]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_2__u_txreg_data_int_reg_3_ ( .si1(
        1'b0), .d1(u_txreg_N36), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3778), 
        .o1(u_txreg_data_int[2]), .si2(1'b0), .d2(u_txreg_N37), .o2(
        u_txreg_data_int[3]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_4__u_txreg_data_int_reg_5_ ( .si1(
        1'b0), .d1(u_txreg_N38), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3772), 
        .o1(u_txreg_data_int[4]), .si2(1'b0), .d2(u_txreg_N39), .o2(
        u_txreg_data_int[5]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_6__u_txreg_data_int_reg_7_ ( .si1(
        1'b0), .d1(u_txreg_N40), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3772), 
        .o1(u_txreg_data_int[6]), .si2(1'b0), .d2(u_txreg_N41), .o2(
        u_txreg_data_int[7]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_8__u_txreg_data_int_reg_9_ ( .si1(
        1'b0), .d1(u_txreg_N42), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3772), 
        .o1(u_txreg_data_int[8]), .si2(1'b0), .d2(u_txreg_N43), .o2(
        u_txreg_data_int[9]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_10__u_txreg_data_int_reg_11_ ( .si1(
        1'b0), .d1(u_txreg_N44), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3772), 
        .o1(u_txreg_data_int[10]), .si2(1'b0), .d2(u_txreg_N45), .o2(
        u_txreg_data_int[11]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_12__u_txreg_data_int_reg_13_ ( .si1(
        1'b0), .d1(u_txreg_N46), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3773), 
        .o1(u_txreg_data_int[12]), .si2(1'b0), .d2(u_txreg_N47), .o2(
        u_txreg_data_int[13]) );
  b15fqy203ar1n02x5 u_txreg_data_int_reg_14__u_txreg_data_int_reg_15_ ( .si1(
        1'b0), .d1(u_txreg_N48), .ssb(1'b1), .clk(u_txreg_net830), .rb(n3773), 
        .o1(u_txreg_data_int[14]), .si2(1'b0), .d2(u_txreg_N49), .o2(
        u_txreg_data_int[15]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_0__u_txreg_counter_reg_1_ ( .si1(1'b0), 
        .d1(u_txreg_N24), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3769), .o1(
        u_txreg_counter[0]), .si2(1'b0), .d2(u_txreg_N25), .o2(
        u_txreg_counter[1]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_2__u_txreg_counter_reg_3_ ( .si1(1'b0), 
        .d1(u_txreg_N26), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3769), .o1(
        u_txreg_counter[2]), .si2(1'b0), .d2(u_txreg_N27), .o2(
        u_txreg_counter[3]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_4__u_txreg_counter_reg_5_ ( .si1(1'b0), 
        .d1(u_txreg_N28), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3769), .o1(
        u_txreg_counter[4]), .si2(1'b0), .d2(u_txreg_N29), .o2(
        u_txreg_counter[5]) );
  b15fqy203ar1n02x5 u_txreg_counter_reg_6__u_txreg_counter_reg_7_ ( .si1(1'b0), 
        .d1(u_txreg_N30), .ssb(1'b1), .clk(u_txreg_net824), .rb(n3769), .o1(
        u_txreg_counter[6]), .si2(1'b0), .d2(u_txreg_N31), .o2(
        u_txreg_counter[7]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_0__u_device_sm_cmd_reg_reg_1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(u_device_sm_net774), .rb(
        n3776), .o1(u_device_sm_cmd_reg[0]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_device_sm_cmd_reg[1]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_2__u_device_sm_cmd_reg_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(u_device_sm_net774), 
        .rb(n3774), .o1(u_device_sm_cmd_reg[2]), .si2(1'b0), .d2(
        ctrl_data_rx[3]), .o2(u_device_sm_cmd_reg[3]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_4__u_device_sm_cmd_reg_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(u_device_sm_net774), 
        .rb(n3774), .o1(u_device_sm_cmd_reg[4]), .si2(1'b0), .d2(n3820), .o2(
        u_device_sm_cmd_reg[5]) );
  b15fqy203ar1n02x5 u_device_sm_cmd_reg_reg_6__u_device_sm_cmd_reg_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(u_device_sm_net774), 
        .rb(n3774), .o1(u_device_sm_cmd_reg[6]), .si2(1'b0), .d2(
        ctrl_data_rx[7]), .o2(u_device_sm_cmd_reg[7]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_16__u_device_sm_addr_reg_reg_17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[16]), .si2(1'b0), .d2(ctrl_data_rx[17]), .o2(
        addr_sync[17]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_18__u_device_sm_addr_reg_reg_19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[18]), .si2(1'b0), .d2(ctrl_data_rx[19]), .o2(
        addr_sync[19]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_20__u_device_sm_addr_reg_reg_21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[20]), .si2(1'b0), .d2(ctrl_data_rx[21]), .o2(
        addr_sync[21]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_22__u_device_sm_addr_reg_reg_23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[22]), .si2(1'b0), .d2(ctrl_data_rx[23]), .o2(
        addr_sync[23]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_24__u_device_sm_addr_reg_reg_25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[24]), .si2(1'b0), .d2(ctrl_data_rx[25]), .o2(
        addr_sync[25]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_26__u_device_sm_addr_reg_reg_27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[26]), .si2(1'b0), .d2(ctrl_data_rx[27]), .o2(
        addr_sync[27]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_28__u_device_sm_addr_reg_reg_29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[28]), .si2(1'b0), .d2(ctrl_data_rx[29]), .o2(
        addr_sync[29]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_30__u_device_sm_addr_reg_reg_31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(u_device_sm_net769), .rb(n3770), .o1(addr_sync[30]), .si2(1'b0), .d2(ctrl_data_rx[31]), .o2(
        addr_sync[31]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_0__u_device_sm_addr_reg_reg_1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(u_device_sm_net763), .rb(
        n3776), .o1(addr_sync[0]), .si2(1'b0), .d2(ctrl_data_rx[1]), .o2(
        addr_sync[1]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_2__u_device_sm_addr_reg_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3774), .o1(addr_sync[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        addr_sync[3]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_4__u_device_sm_addr_reg_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3776), .o1(addr_sync[4]), .si2(1'b0), .d2(n3820), .o2(
        addr_sync[5]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_6__u_device_sm_addr_reg_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3776), .o1(addr_sync[6]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        addr_sync[7]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_8__u_device_sm_addr_reg_reg_9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(u_device_sm_net763), 
        .rb(n3928), .o1(addr_sync[8]), .si2(1'b0), .d2(ctrl_data_rx[9]), .o2(
        addr_sync[9]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_10__u_device_sm_addr_reg_reg_11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(u_device_sm_net763), .rb(n3776), .o1(addr_sync[10]), .si2(1'b0), .d2(ctrl_data_rx[11]), .o2(
        addr_sync[11]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_12__u_device_sm_addr_reg_reg_13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(u_device_sm_net763), .rb(n3776), .o1(addr_sync[12]), .si2(1'b0), .d2(ctrl_data_rx[13]), .o2(
        addr_sync[13]) );
  b15fqy203ar1n02x5 u_device_sm_addr_reg_reg_14__u_device_sm_addr_reg_reg_15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(u_device_sm_net763), .rb(n3776), .o1(addr_sync[14]), .si2(1'b0), .d2(ctrl_data_rx[15]), .o2(
        addr_sync[15]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_16__u_spi_device_tlul_plug_addr_reg_17_ ( 
        .si1(1'b0), .d1(addr_sync[16]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3938), .o1(tl_o[76]), .si2(1'b0), 
        .d2(addr_sync[17]), .o2(tl_o[77]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_18__u_spi_device_tlul_plug_addr_reg_19_ ( 
        .si1(1'b0), .d1(addr_sync[18]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[78]), .si2(1'b0), 
        .d2(addr_sync[19]), .o2(tl_o[79]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_20__u_spi_device_tlul_plug_addr_reg_21_ ( 
        .si1(1'b0), .d1(addr_sync[20]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[80]), .si2(1'b0), 
        .d2(addr_sync[21]), .o2(tl_o[81]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_22__u_spi_device_tlul_plug_addr_reg_23_ ( 
        .si1(1'b0), .d1(addr_sync[22]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[82]), .si2(1'b0), 
        .d2(addr_sync[23]), .o2(tl_o[83]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_24__u_spi_device_tlul_plug_addr_reg_25_ ( 
        .si1(1'b0), .d1(addr_sync[24]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[84]), .si2(1'b0), 
        .d2(addr_sync[25]), .o2(tl_o[85]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_26__u_spi_device_tlul_plug_addr_reg_27_ ( 
        .si1(1'b0), .d1(addr_sync[26]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[86]), .si2(1'b0), 
        .d2(addr_sync[27]), .o2(tl_o[87]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_28__u_spi_device_tlul_plug_addr_reg_29_ ( 
        .si1(1'b0), .d1(addr_sync[28]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[88]), .si2(1'b0), 
        .d2(addr_sync[29]), .o2(tl_o[89]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_30__u_spi_device_tlul_plug_addr_reg_31_ ( 
        .si1(1'b0), .d1(addr_sync[30]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net617), .rb(n3794), .o1(tl_o[90]), .si2(1'b0), 
        .d2(addr_sync[31]), .o2(tl_o[91]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_0__u_spi_device_tlul_plug_addr_reg_1_ ( 
        .si1(1'b0), .d1(addr_sync[0]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3794), .o1(), .si2(1'b0), .d2(
        addr_sync[1]), .o2() );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_2__u_spi_device_tlul_plug_addr_reg_3_ ( 
        .si1(1'b0), .d1(addr_sync[2]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3794), .o1(tl_o[62]), .si2(1'b0), 
        .d2(addr_sync[3]), .o2(tl_o[63]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_4__u_spi_device_tlul_plug_addr_reg_5_ ( 
        .si1(1'b0), .d1(addr_sync[4]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3794), .o1(tl_o[64]), .si2(1'b0), 
        .d2(addr_sync[5]), .o2(tl_o[65]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_6__u_spi_device_tlul_plug_addr_reg_7_ ( 
        .si1(1'b0), .d1(addr_sync[6]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3794), .o1(tl_o[66]), .si2(1'b0), 
        .d2(addr_sync[7]), .o2(tl_o[67]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_8__u_spi_device_tlul_plug_addr_reg_9_ ( 
        .si1(1'b0), .d1(addr_sync[8]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3938), .o1(tl_o[68]), .si2(1'b0), 
        .d2(addr_sync[9]), .o2(tl_o[69]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_10__u_spi_device_tlul_plug_addr_reg_11_ ( 
        .si1(1'b0), .d1(addr_sync[10]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3938), .o1(tl_o[70]), .si2(1'b0), 
        .d2(addr_sync[11]), .o2(tl_o[71]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_12__u_spi_device_tlul_plug_addr_reg_13_ ( 
        .si1(1'b0), .d1(addr_sync[12]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3938), .o1(tl_o[72]), .si2(1'b0), 
        .d2(addr_sync[13]), .o2(tl_o[73]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_addr_reg_14__u_spi_device_tlul_plug_addr_reg_15_ ( 
        .si1(1'b0), .d1(addr_sync[14]), .ssb(1'b1), .clk(
        u_spi_device_tlul_plug_net611), .rb(n3794), .o1(tl_o[74]), .si2(1'b0), 
        .d2(addr_sync[15]), .o2(tl_o[75]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_0__u_device_sm_u_spiregs_reg2_reg_1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net807), 
        .rb(n3963), .o1(u_device_sm_u_spiregs_n[16]), .si2(1'b0), .d2(
        ctrl_data_rx[1]), .o2(u_device_sm_u_spiregs_n[15]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_2__u_device_sm_u_spiregs_reg2_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net807), .rb(n3799), .o1(
        u_device_sm_u_spiregs_n[14]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_u_spiregs_n[13]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_4__u_device_sm_u_spiregs_reg2_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net807), .rb(n3785), .o1(
        u_device_sm_u_spiregs_n[12]), .si2(1'b0), .d2(n3820), .o2(
        u_device_sm_u_spiregs_n[11]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg2_reg_6__u_device_sm_u_spiregs_reg2_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net807), .rb(n3789), .o1(
        u_device_sm_u_spiregs_n[10]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        u_device_sm_u_spiregs_n[9]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg1_reg_0__u_device_sm_u_spiregs_reg1_reg_1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net802), 
        .rb(n3962), .o1(u_device_sm_s_dummy_cycles[0]), .si2(1'b0), .d2(
        ctrl_data_rx[1]), .o2(u_device_sm_s_dummy_cycles[1]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg1_reg_2__u_device_sm_u_spiregs_reg1_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net802), .rb(n3962), .o1(
        u_device_sm_s_dummy_cycles[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_s_dummy_cycles[3]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg1_reg_4__u_device_sm_u_spiregs_reg1_reg_6_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net802), .rb(n3785), .o1(
        u_device_sm_s_dummy_cycles[4]), .si2(1'b0), .d2(ctrl_data_rx[6]), .o2(
        u_device_sm_s_dummy_cycles[6]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_0__u_device_sm_u_spiregs_reg0_reg_1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net797), 
        .rb(n3962), .o1(en_quad), .si2(1'b0), .d2(ctrl_data_rx[1]), .o2(
        u_device_sm_u_spiregs_reg0[1]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_2__u_device_sm_u_spiregs_reg0_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net797), .rb(n3962), .o1(
        u_device_sm_u_spiregs_reg0[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_u_spiregs_reg0[3]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_4__u_device_sm_u_spiregs_reg0_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net797), .rb(n3785), .o1(
        u_device_sm_u_spiregs_reg0[4]), .si2(1'b0), .d2(n3820), .o2(
        u_device_sm_u_spiregs_reg0[5]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg0_reg_6__u_device_sm_u_spiregs_reg0_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net797), .rb(n3789), .o1(
        u_device_sm_u_spiregs_reg0[6]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        u_device_sm_u_spiregs_reg0[7]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_0__u_device_sm_u_spiregs_reg3_reg_1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(u_device_sm_u_spiregs_net791), 
        .rb(n3799), .o1(u_device_sm_u_spiregs_n[8]), .si2(1'b0), .d2(
        ctrl_data_rx[1]), .o2(u_device_sm_u_spiregs_n[7]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_2__u_device_sm_u_spiregs_reg3_reg_3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net791), .rb(n3799), .o1(
        u_device_sm_u_spiregs_n[6]), .si2(1'b0), .d2(ctrl_data_rx[3]), .o2(
        u_device_sm_u_spiregs_n[5]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_4__u_device_sm_u_spiregs_reg3_reg_5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net791), .rb(n3926), .o1(
        u_device_sm_u_spiregs_n[4]), .si2(1'b0), .d2(n3820), .o2(
        u_device_sm_u_spiregs_n[3]) );
  b15fqy203ar1n02x5 u_device_sm_u_spiregs_reg3_reg_6__u_device_sm_u_spiregs_reg3_reg_7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_device_sm_u_spiregs_net791), .rb(n3789), .o1(
        u_device_sm_u_spiregs_n[2]), .si2(1'b0), .d2(ctrl_data_rx[7]), .o2(
        u_device_sm_u_spiregs_n[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__16__u_dcfifo_tx_u_din_buffer_data_reg_0__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3792), .o1(
        u_dcfifo_tx_u_din_buffer_data[16]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[17]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__18__u_dcfifo_tx_u_din_buffer_data_reg_0__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3792), .o1(
        u_dcfifo_tx_u_din_buffer_data[18]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[19]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__20__u_dcfifo_tx_u_din_buffer_data_reg_0__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[20]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[21]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__22__u_dcfifo_tx_u_din_buffer_data_reg_0__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3946), .o1(
        u_dcfifo_tx_u_din_buffer_data[22]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[23]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__24__u_dcfifo_tx_u_din_buffer_data_reg_0__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3927), .o1(
        u_dcfifo_tx_u_din_buffer_data[24]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[25]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__26__u_dcfifo_tx_u_din_buffer_data_reg_0__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3795), .o1(
        u_dcfifo_tx_u_din_buffer_data[26]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[27]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__28__u_dcfifo_tx_u_din_buffer_data_reg_0__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3935), .o1(
        u_dcfifo_tx_u_din_buffer_data[28]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[29]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__30__u_dcfifo_tx_u_din_buffer_data_reg_0__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net746), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[30]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[31]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__0__u_dcfifo_tx_u_din_buffer_data_reg_0__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3966), .o1(
        u_dcfifo_tx_u_din_buffer_data[0]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__2__u_dcfifo_tx_u_din_buffer_data_reg_0__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[2]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[3]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__4__u_dcfifo_tx_u_din_buffer_data_reg_0__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[4]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__6__u_dcfifo_tx_u_din_buffer_data_reg_0__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3953), .o1(
        u_dcfifo_tx_u_din_buffer_data[6]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[7]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__8__u_dcfifo_tx_u_din_buffer_data_reg_0__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[8]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[9]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__10__u_dcfifo_tx_u_din_buffer_data_reg_0__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3790), .o1(
        u_dcfifo_tx_u_din_buffer_data[10]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[11]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__12__u_dcfifo_tx_u_din_buffer_data_reg_0__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3959), .o1(
        u_dcfifo_tx_u_din_buffer_data[12]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[13]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_0__14__u_dcfifo_tx_u_din_buffer_data_reg_0__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net741), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[14]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[15]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__16__u_dcfifo_tx_u_din_buffer_data_reg_1__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3949), .o1(
        u_dcfifo_tx_u_din_buffer_data[48]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[49]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__18__u_dcfifo_tx_u_din_buffer_data_reg_1__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[50]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[51]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__20__u_dcfifo_tx_u_din_buffer_data_reg_1__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[52]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[53]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__22__u_dcfifo_tx_u_din_buffer_data_reg_1__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[54]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[55]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__24__u_dcfifo_tx_u_din_buffer_data_reg_1__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[56]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[57]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__26__u_dcfifo_tx_u_din_buffer_data_reg_1__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3795), .o1(
        u_dcfifo_tx_u_din_buffer_data[58]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[59]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__28__u_dcfifo_tx_u_din_buffer_data_reg_1__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[60]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[61]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__30__u_dcfifo_tx_u_din_buffer_data_reg_1__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net736), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[62]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[63]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__0__u_dcfifo_tx_u_din_buffer_data_reg_1__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[32]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[33]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__2__u_dcfifo_tx_u_din_buffer_data_reg_1__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[34]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[35]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__4__u_dcfifo_tx_u_din_buffer_data_reg_1__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[36]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[37]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__6__u_dcfifo_tx_u_din_buffer_data_reg_1__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[38]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[39]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__8__u_dcfifo_tx_u_din_buffer_data_reg_1__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[40]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[41]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__10__u_dcfifo_tx_u_din_buffer_data_reg_1__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[42]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[43]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__12__u_dcfifo_tx_u_din_buffer_data_reg_1__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[44]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[45]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_1__14__u_dcfifo_tx_u_din_buffer_data_reg_1__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net731), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[46]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[47]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__16__u_dcfifo_tx_u_din_buffer_data_reg_2__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[80]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[81]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__18__u_dcfifo_tx_u_din_buffer_data_reg_2__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[82]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[83]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__20__u_dcfifo_tx_u_din_buffer_data_reg_2__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[84]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[85]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__22__u_dcfifo_tx_u_din_buffer_data_reg_2__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3796), .o1(
        u_dcfifo_tx_u_din_buffer_data[86]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[87]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__24__u_dcfifo_tx_u_din_buffer_data_reg_2__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3795), .o1(
        u_dcfifo_tx_u_din_buffer_data[88]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[89]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__26__u_dcfifo_tx_u_din_buffer_data_reg_2__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[90]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[91]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__28__u_dcfifo_tx_u_din_buffer_data_reg_2__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3795), .o1(
        u_dcfifo_tx_u_din_buffer_data[92]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[93]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__30__u_dcfifo_tx_u_din_buffer_data_reg_2__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net726), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[94]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[95]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__0__u_dcfifo_tx_u_din_buffer_data_reg_2__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[64]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[65]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__2__u_dcfifo_tx_u_din_buffer_data_reg_2__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[66]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[67]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__4__u_dcfifo_tx_u_din_buffer_data_reg_2__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[68]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[69]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__6__u_dcfifo_tx_u_din_buffer_data_reg_2__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[70]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[71]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__8__u_dcfifo_tx_u_din_buffer_data_reg_2__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[72]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[73]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__10__u_dcfifo_tx_u_din_buffer_data_reg_2__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3798), .o1(
        u_dcfifo_tx_u_din_buffer_data[74]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[75]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__12__u_dcfifo_tx_u_din_buffer_data_reg_2__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[76]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[77]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_2__14__u_dcfifo_tx_u_din_buffer_data_reg_2__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net721), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[78]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[79]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__16__u_dcfifo_tx_u_din_buffer_data_reg_3__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[112]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[113]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__18__u_dcfifo_tx_u_din_buffer_data_reg_3__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[114]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[115]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__20__u_dcfifo_tx_u_din_buffer_data_reg_3__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3949), .o1(
        u_dcfifo_tx_u_din_buffer_data[116]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[117]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__22__u_dcfifo_tx_u_din_buffer_data_reg_3__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[118]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[119]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__24__u_dcfifo_tx_u_din_buffer_data_reg_3__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[120]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[121]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__26__u_dcfifo_tx_u_din_buffer_data_reg_3__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3935), .o1(
        u_dcfifo_tx_u_din_buffer_data[122]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[123]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__28__u_dcfifo_tx_u_din_buffer_data_reg_3__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3935), .o1(
        u_dcfifo_tx_u_din_buffer_data[124]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[125]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__30__u_dcfifo_tx_u_din_buffer_data_reg_3__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net716), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[126]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[127]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__0__u_dcfifo_tx_u_din_buffer_data_reg_3__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[96]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[97]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__2__u_dcfifo_tx_u_din_buffer_data_reg_3__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[98]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[99]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__4__u_dcfifo_tx_u_din_buffer_data_reg_3__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[100]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[101]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__6__u_dcfifo_tx_u_din_buffer_data_reg_3__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[102]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[103]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__8__u_dcfifo_tx_u_din_buffer_data_reg_3__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[104]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[105]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__10__u_dcfifo_tx_u_din_buffer_data_reg_3__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[106]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[107]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__12__u_dcfifo_tx_u_din_buffer_data_reg_3__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[108]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[109]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_3__14__u_dcfifo_tx_u_din_buffer_data_reg_3__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net711), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[110]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[111]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__16__u_dcfifo_tx_u_din_buffer_data_reg_4__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[144]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[145]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__18__u_dcfifo_tx_u_din_buffer_data_reg_4__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[146]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[147]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__20__u_dcfifo_tx_u_din_buffer_data_reg_4__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3949), .o1(
        u_dcfifo_tx_u_din_buffer_data[148]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[149]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__22__u_dcfifo_tx_u_din_buffer_data_reg_4__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3805), .o1(
        u_dcfifo_tx_u_din_buffer_data[150]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[151]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__24__u_dcfifo_tx_u_din_buffer_data_reg_4__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[152]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[153]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__26__u_dcfifo_tx_u_din_buffer_data_reg_4__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3949), .o1(
        u_dcfifo_tx_u_din_buffer_data[154]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[155]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__28__u_dcfifo_tx_u_din_buffer_data_reg_4__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3935), .o1(
        u_dcfifo_tx_u_din_buffer_data[156]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[157]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__30__u_dcfifo_tx_u_din_buffer_data_reg_4__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net706), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[158]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[159]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__0__u_dcfifo_tx_u_din_buffer_data_reg_4__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[128]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[129]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__2__u_dcfifo_tx_u_din_buffer_data_reg_4__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[130]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[131]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__4__u_dcfifo_tx_u_din_buffer_data_reg_4__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[132]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[133]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__6__u_dcfifo_tx_u_din_buffer_data_reg_4__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3953), .o1(
        u_dcfifo_tx_u_din_buffer_data[134]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[135]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__8__u_dcfifo_tx_u_din_buffer_data_reg_4__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[136]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[137]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__10__u_dcfifo_tx_u_din_buffer_data_reg_4__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3790), .o1(
        u_dcfifo_tx_u_din_buffer_data[138]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[139]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__12__u_dcfifo_tx_u_din_buffer_data_reg_4__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3959), .o1(
        u_dcfifo_tx_u_din_buffer_data[140]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[141]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_4__14__u_dcfifo_tx_u_din_buffer_data_reg_4__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net701), .rb(n3959), .o1(
        u_dcfifo_tx_u_din_buffer_data[142]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[143]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__16__u_dcfifo_tx_u_din_buffer_data_reg_5__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3792), .o1(
        u_dcfifo_tx_u_din_buffer_data[176]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[177]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__18__u_dcfifo_tx_u_din_buffer_data_reg_5__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3796), .o1(
        u_dcfifo_tx_u_din_buffer_data[178]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[179]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__20__u_dcfifo_tx_u_din_buffer_data_reg_5__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[180]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[181]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__22__u_dcfifo_tx_u_din_buffer_data_reg_5__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3796), .o1(
        u_dcfifo_tx_u_din_buffer_data[182]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[183]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__24__u_dcfifo_tx_u_din_buffer_data_reg_5__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[184]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[185]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__26__u_dcfifo_tx_u_din_buffer_data_reg_5__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3795), .o1(
        u_dcfifo_tx_u_din_buffer_data[186]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[187]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__28__u_dcfifo_tx_u_din_buffer_data_reg_5__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3795), .o1(
        u_dcfifo_tx_u_din_buffer_data[188]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[189]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__30__u_dcfifo_tx_u_din_buffer_data_reg_5__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net696), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[190]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[191]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__0__u_dcfifo_tx_u_din_buffer_data_reg_5__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[160]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[161]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__2__u_dcfifo_tx_u_din_buffer_data_reg_5__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[162]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[163]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__4__u_dcfifo_tx_u_din_buffer_data_reg_5__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3953), .o1(
        u_dcfifo_tx_u_din_buffer_data[164]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[165]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__6__u_dcfifo_tx_u_din_buffer_data_reg_5__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3953), .o1(
        u_dcfifo_tx_u_din_buffer_data[166]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[167]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__8__u_dcfifo_tx_u_din_buffer_data_reg_5__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[168]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[169]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__10__u_dcfifo_tx_u_din_buffer_data_reg_5__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3798), .o1(
        u_dcfifo_tx_u_din_buffer_data[170]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[171]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__12__u_dcfifo_tx_u_din_buffer_data_reg_5__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3783), .o1(
        u_dcfifo_tx_u_din_buffer_data[172]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[173]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_5__14__u_dcfifo_tx_u_din_buffer_data_reg_5__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net691), .rb(n3783), .o1(
        u_dcfifo_tx_u_din_buffer_data[174]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[175]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__16__u_dcfifo_tx_u_din_buffer_data_reg_6__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3949), .o1(
        u_dcfifo_tx_u_din_buffer_data[208]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[209]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__18__u_dcfifo_tx_u_din_buffer_data_reg_6__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3796), .o1(
        u_dcfifo_tx_u_din_buffer_data[210]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[211]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__20__u_dcfifo_tx_u_din_buffer_data_reg_6__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[212]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[213]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__22__u_dcfifo_tx_u_din_buffer_data_reg_6__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3949), .o1(
        u_dcfifo_tx_u_din_buffer_data[214]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[215]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__24__u_dcfifo_tx_u_din_buffer_data_reg_6__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[216]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[217]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__26__u_dcfifo_tx_u_din_buffer_data_reg_6__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3927), .o1(
        u_dcfifo_tx_u_din_buffer_data[218]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[219]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__28__u_dcfifo_tx_u_din_buffer_data_reg_6__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3927), .o1(
        u_dcfifo_tx_u_din_buffer_data[220]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[221]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__30__u_dcfifo_tx_u_din_buffer_data_reg_6__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net686), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[222]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[223]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__0__u_dcfifo_tx_u_din_buffer_data_reg_6__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3966), .o1(
        u_dcfifo_tx_u_din_buffer_data[192]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[193]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__2__u_dcfifo_tx_u_din_buffer_data_reg_6__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[194]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[195]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__4__u_dcfifo_tx_u_din_buffer_data_reg_6__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3953), .o1(
        u_dcfifo_tx_u_din_buffer_data[196]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[197]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__6__u_dcfifo_tx_u_din_buffer_data_reg_6__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3953), .o1(
        u_dcfifo_tx_u_din_buffer_data[198]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[199]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__8__u_dcfifo_tx_u_din_buffer_data_reg_6__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[200]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[201]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__10__u_dcfifo_tx_u_din_buffer_data_reg_6__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[202]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[203]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__12__u_dcfifo_tx_u_din_buffer_data_reg_6__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3959), .o1(
        u_dcfifo_tx_u_din_buffer_data[204]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[205]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_6__14__u_dcfifo_tx_u_din_buffer_data_reg_6__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net681), .rb(n3959), .o1(
        u_dcfifo_tx_u_din_buffer_data[206]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[207]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__16__u_dcfifo_tx_u_din_buffer_data_reg_7__17_ ( 
        .si1(1'b0), .d1(tl_i[32]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3796), .o1(
        u_dcfifo_tx_u_din_buffer_data[240]), .si2(1'b0), .d2(tl_i[33]), .o2(
        u_dcfifo_tx_u_din_buffer_data[241]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__18__u_dcfifo_tx_u_din_buffer_data_reg_7__19_ ( 
        .si1(1'b0), .d1(tl_i[34]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[242]), .si2(1'b0), .d2(tl_i[35]), .o2(
        u_dcfifo_tx_u_din_buffer_data[243]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__20__u_dcfifo_tx_u_din_buffer_data_reg_7__21_ ( 
        .si1(1'b0), .d1(tl_i[36]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3780), .o1(
        u_dcfifo_tx_u_din_buffer_data[244]), .si2(1'b0), .d2(tl_i[37]), .o2(
        u_dcfifo_tx_u_din_buffer_data[245]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__22__u_dcfifo_tx_u_din_buffer_data_reg_7__23_ ( 
        .si1(1'b0), .d1(tl_i[38]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3946), .o1(
        u_dcfifo_tx_u_din_buffer_data[246]), .si2(1'b0), .d2(tl_i[39]), .o2(
        u_dcfifo_tx_u_din_buffer_data[247]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__24__u_dcfifo_tx_u_din_buffer_data_reg_7__25_ ( 
        .si1(1'b0), .d1(tl_i[40]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3927), .o1(
        u_dcfifo_tx_u_din_buffer_data[248]), .si2(1'b0), .d2(tl_i[41]), .o2(
        u_dcfifo_tx_u_din_buffer_data[249]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__26__u_dcfifo_tx_u_din_buffer_data_reg_7__27_ ( 
        .si1(1'b0), .d1(tl_i[42]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[250]), .si2(1'b0), .d2(tl_i[43]), .o2(
        u_dcfifo_tx_u_din_buffer_data[251]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__28__u_dcfifo_tx_u_din_buffer_data_reg_7__29_ ( 
        .si1(1'b0), .d1(tl_i[44]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3793), .o1(
        u_dcfifo_tx_u_din_buffer_data[252]), .si2(1'b0), .d2(tl_i[45]), .o2(
        u_dcfifo_tx_u_din_buffer_data[253]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__30__u_dcfifo_tx_u_din_buffer_data_reg_7__31_ ( 
        .si1(1'b0), .d1(tl_i[46]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net676), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[254]), .si2(1'b0), .d2(tl_i[47]), .o2(
        u_dcfifo_tx_u_din_buffer_data[255]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__0__u_dcfifo_tx_u_din_buffer_data_reg_7__1_ ( 
        .si1(1'b0), .d1(tl_i[16]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3797), .o1(
        u_dcfifo_tx_u_din_buffer_data[224]), .si2(1'b0), .d2(tl_i[17]), .o2(
        u_dcfifo_tx_u_din_buffer_data[225]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__2__u_dcfifo_tx_u_din_buffer_data_reg_7__3_ ( 
        .si1(1'b0), .d1(tl_i[18]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[226]), .si2(1'b0), .d2(tl_i[19]), .o2(
        u_dcfifo_tx_u_din_buffer_data[227]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__4__u_dcfifo_tx_u_din_buffer_data_reg_7__5_ ( 
        .si1(1'b0), .d1(tl_i[20]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[228]), .si2(1'b0), .d2(tl_i[21]), .o2(
        u_dcfifo_tx_u_din_buffer_data[229]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__6__u_dcfifo_tx_u_din_buffer_data_reg_7__7_ ( 
        .si1(1'b0), .d1(tl_i[22]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3791), .o1(
        u_dcfifo_tx_u_din_buffer_data[230]), .si2(1'b0), .d2(tl_i[23]), .o2(
        u_dcfifo_tx_u_din_buffer_data[231]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__8__u_dcfifo_tx_u_din_buffer_data_reg_7__9_ ( 
        .si1(1'b0), .d1(tl_i[24]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3782), .o1(
        u_dcfifo_tx_u_din_buffer_data[232]), .si2(1'b0), .d2(tl_i[25]), .o2(
        u_dcfifo_tx_u_din_buffer_data[233]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__10__u_dcfifo_tx_u_din_buffer_data_reg_7__11_ ( 
        .si1(1'b0), .d1(tl_i[26]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3803), .o1(
        u_dcfifo_tx_u_din_buffer_data[234]), .si2(1'b0), .d2(tl_i[27]), .o2(
        u_dcfifo_tx_u_din_buffer_data[235]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__12__u_dcfifo_tx_u_din_buffer_data_reg_7__13_ ( 
        .si1(1'b0), .d1(tl_i[28]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3802), .o1(
        u_dcfifo_tx_u_din_buffer_data[236]), .si2(1'b0), .d2(tl_i[29]), .o2(
        u_dcfifo_tx_u_din_buffer_data[237]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_buffer_data_reg_7__14__u_dcfifo_tx_u_din_buffer_data_reg_7__15_ ( 
        .si1(1'b0), .d1(tl_i[30]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_buffer_net670), .rb(n3959), .o1(
        u_dcfifo_tx_u_din_buffer_data[238]), .si2(1'b0), .d2(tl_i[31]), .o2(
        u_dcfifo_tx_u_din_buffer_data[239]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_0__u_dcfifo_tx_u_din_write_tr_state_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .rb(n3781), .o1(
        u_dcfifo_tx_write_token[0]), .si2(1'b0), .d2(
        u_dcfifo_tx_write_token[0]), .o2(u_dcfifo_tx_write_token[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_4__u_dcfifo_tx_u_din_write_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .rb(n3781), .o1(
        u_dcfifo_tx_write_token[4]), .si2(1'b0), .d2(
        u_dcfifo_tx_write_token[4]), .o2(u_dcfifo_tx_write_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_write_tr_state_reg_6__u_dcfifo_tx_u_din_write_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_din_write_tr_net652), .rb(n3781), .o1(
        u_dcfifo_tx_write_token[6]), .si2(1'b0), .d2(
        u_dcfifo_tx_write_token[6]), .o2(u_dcfifo_tx_write_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_2__u_dcfifo_tx_u_dout_read_tr_state_reg_3_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_read_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .rb(n3946), .o1(
        u_dcfifo_tx_u_dout_read_token[2]), .si2(1'b0), .d2(
        u_dcfifo_tx_u_dout_read_token[2]), .o2(
        u_dcfifo_tx_u_dout_read_token[3]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_4__u_dcfifo_tx_u_dout_read_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_read_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .rb(n3796), .o1(
        u_dcfifo_tx_u_dout_read_token[4]), .si2(1'b0), .d2(
        u_dcfifo_tx_u_dout_read_token[4]), .o2(
        u_dcfifo_tx_u_dout_read_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_read_tr_state_reg_6__u_dcfifo_tx_u_dout_read_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_read_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_tx_u_dout_read_tr_net634), .rb(n3792), .o1(
        u_dcfifo_tx_u_dout_read_token[6]), .si2(1'b0), .d2(
        u_dcfifo_tx_u_dout_read_token[6]), .o2(
        u_dcfifo_tx_u_dout_read_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__16__u_dcfifo_rx_u_din_buffer_data_reg_0__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3945), .o1(
        u_dcfifo_rx_u_din_buffer_data[16]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[17]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__18__u_dcfifo_rx_u_din_buffer_data_reg_0__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3804), .o1(
        u_dcfifo_rx_u_din_buffer_data[18]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[19]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__20__u_dcfifo_rx_u_din_buffer_data_reg_0__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3781), .o1(
        u_dcfifo_rx_u_din_buffer_data[20]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[21]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__22__u_dcfifo_rx_u_din_buffer_data_reg_0__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3960), .o1(
        u_dcfifo_rx_u_din_buffer_data[22]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[23]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__24__u_dcfifo_rx_u_din_buffer_data_reg_0__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3950), .o1(
        u_dcfifo_rx_u_din_buffer_data[24]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[25]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__26__u_dcfifo_rx_u_din_buffer_data_reg_0__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3952), .o1(
        u_dcfifo_rx_u_din_buffer_data[26]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[27]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__28__u_dcfifo_rx_u_din_buffer_data_reg_0__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[28]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[29]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__30__u_dcfifo_rx_u_din_buffer_data_reg_0__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net746), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[30]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[31]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__0__u_dcfifo_rx_u_din_buffer_data_reg_0__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3942), .o1(
        u_dcfifo_rx_u_din_buffer_data[0]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__2__u_dcfifo_rx_u_din_buffer_data_reg_0__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3788), .o1(
        u_dcfifo_rx_u_din_buffer_data[2]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[3]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__4__u_dcfifo_rx_u_din_buffer_data_reg_0__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[4]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__6__u_dcfifo_rx_u_din_buffer_data_reg_0__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[6]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__8__u_dcfifo_rx_u_din_buffer_data_reg_0__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3788), .o1(
        u_dcfifo_rx_u_din_buffer_data[8]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[9]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__10__u_dcfifo_rx_u_din_buffer_data_reg_0__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3955), .o1(
        u_dcfifo_rx_u_din_buffer_data[10]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[11]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__12__u_dcfifo_rx_u_din_buffer_data_reg_0__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3798), .o1(
        u_dcfifo_rx_u_din_buffer_data[12]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[13]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_0__14__u_dcfifo_rx_u_din_buffer_data_reg_0__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net741), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[14]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[15]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__16__u_dcfifo_rx_u_din_buffer_data_reg_1__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[48]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[49]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__18__u_dcfifo_rx_u_din_buffer_data_reg_1__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3781), .o1(
        u_dcfifo_rx_u_din_buffer_data[50]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[51]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__20__u_dcfifo_rx_u_din_buffer_data_reg_1__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3792), .o1(
        u_dcfifo_rx_u_din_buffer_data[52]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[53]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__22__u_dcfifo_rx_u_din_buffer_data_reg_1__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3787), .o1(
        u_dcfifo_rx_u_din_buffer_data[54]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[55]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__24__u_dcfifo_rx_u_din_buffer_data_reg_1__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3787), .o1(
        u_dcfifo_rx_u_din_buffer_data[56]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[57]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__26__u_dcfifo_rx_u_din_buffer_data_reg_1__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3934), .o1(
        u_dcfifo_rx_u_din_buffer_data[58]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[59]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__28__u_dcfifo_rx_u_din_buffer_data_reg_1__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3800), .o1(
        u_dcfifo_rx_u_din_buffer_data[60]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[61]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__30__u_dcfifo_rx_u_din_buffer_data_reg_1__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net736), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[62]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[63]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__0__u_dcfifo_rx_u_din_buffer_data_reg_1__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[32]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[33]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__2__u_dcfifo_rx_u_din_buffer_data_reg_1__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[34]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[35]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__4__u_dcfifo_rx_u_din_buffer_data_reg_1__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[36]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[37]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__6__u_dcfifo_rx_u_din_buffer_data_reg_1__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[38]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[39]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__8__u_dcfifo_rx_u_din_buffer_data_reg_1__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3798), .o1(
        u_dcfifo_rx_u_din_buffer_data[40]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[41]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__10__u_dcfifo_rx_u_din_buffer_data_reg_1__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3798), .o1(
        u_dcfifo_rx_u_din_buffer_data[42]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[43]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__12__u_dcfifo_rx_u_din_buffer_data_reg_1__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3955), .o1(
        u_dcfifo_rx_u_din_buffer_data[44]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[45]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_1__14__u_dcfifo_rx_u_din_buffer_data_reg_1__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net731), .rb(n3783), .o1(
        u_dcfifo_rx_u_din_buffer_data[46]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[47]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__16__u_dcfifo_rx_u_din_buffer_data_reg_2__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[80]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[81]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__18__u_dcfifo_rx_u_din_buffer_data_reg_2__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3781), .o1(
        u_dcfifo_rx_u_din_buffer_data[82]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[83]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__20__u_dcfifo_rx_u_din_buffer_data_reg_2__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3792), .o1(
        u_dcfifo_rx_u_din_buffer_data[84]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[85]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__22__u_dcfifo_rx_u_din_buffer_data_reg_2__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3792), .o1(
        u_dcfifo_rx_u_din_buffer_data[86]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[87]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__24__u_dcfifo_rx_u_din_buffer_data_reg_2__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3787), .o1(
        u_dcfifo_rx_u_din_buffer_data[88]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[89]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__26__u_dcfifo_rx_u_din_buffer_data_reg_2__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3800), .o1(
        u_dcfifo_rx_u_din_buffer_data[90]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[91]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__28__u_dcfifo_rx_u_din_buffer_data_reg_2__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[92]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[93]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__30__u_dcfifo_rx_u_din_buffer_data_reg_2__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net726), .rb(n3786), .o1(
        u_dcfifo_rx_u_din_buffer_data[94]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[95]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__0__u_dcfifo_rx_u_din_buffer_data_reg_2__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3788), .o1(
        u_dcfifo_rx_u_din_buffer_data[64]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[65]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__2__u_dcfifo_rx_u_din_buffer_data_reg_2__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3963), .o1(
        u_dcfifo_rx_u_din_buffer_data[66]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[67]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__4__u_dcfifo_rx_u_din_buffer_data_reg_2__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[68]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[69]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__6__u_dcfifo_rx_u_din_buffer_data_reg_2__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[70]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[71]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__8__u_dcfifo_rx_u_din_buffer_data_reg_2__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3790), .o1(
        u_dcfifo_rx_u_din_buffer_data[72]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[73]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__10__u_dcfifo_rx_u_din_buffer_data_reg_2__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3955), .o1(
        u_dcfifo_rx_u_din_buffer_data[74]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[75]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__12__u_dcfifo_rx_u_din_buffer_data_reg_2__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3783), .o1(
        u_dcfifo_rx_u_din_buffer_data[76]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[77]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_2__14__u_dcfifo_rx_u_din_buffer_data_reg_2__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net721), .rb(n3783), .o1(
        u_dcfifo_rx_u_din_buffer_data[78]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[79]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__16__u_dcfifo_rx_u_din_buffer_data_reg_3__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3804), .o1(
        u_dcfifo_rx_u_din_buffer_data[112]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[113]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__18__u_dcfifo_rx_u_din_buffer_data_reg_3__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3964), .o1(
        u_dcfifo_rx_u_din_buffer_data[114]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[115]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__20__u_dcfifo_rx_u_din_buffer_data_reg_3__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3792), .o1(
        u_dcfifo_rx_u_din_buffer_data[116]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[117]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__22__u_dcfifo_rx_u_din_buffer_data_reg_3__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3960), .o1(
        u_dcfifo_rx_u_din_buffer_data[118]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[119]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__24__u_dcfifo_rx_u_din_buffer_data_reg_3__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3960), .o1(
        u_dcfifo_rx_u_din_buffer_data[120]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[121]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__26__u_dcfifo_rx_u_din_buffer_data_reg_3__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[122]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[123]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__28__u_dcfifo_rx_u_din_buffer_data_reg_3__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[124]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[125]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__30__u_dcfifo_rx_u_din_buffer_data_reg_3__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net716), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[126]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[127]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__0__u_dcfifo_rx_u_din_buffer_data_reg_3__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[96]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[97]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__2__u_dcfifo_rx_u_din_buffer_data_reg_3__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[98]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[99]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__4__u_dcfifo_rx_u_din_buffer_data_reg_3__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3926), .o1(
        u_dcfifo_rx_u_din_buffer_data[100]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[101]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__6__u_dcfifo_rx_u_din_buffer_data_reg_3__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[102]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[103]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__8__u_dcfifo_rx_u_din_buffer_data_reg_3__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3790), .o1(
        u_dcfifo_rx_u_din_buffer_data[104]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[105]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__10__u_dcfifo_rx_u_din_buffer_data_reg_3__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3798), .o1(
        u_dcfifo_rx_u_din_buffer_data[106]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[107]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__12__u_dcfifo_rx_u_din_buffer_data_reg_3__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3790), .o1(
        u_dcfifo_rx_u_din_buffer_data[108]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[109]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_3__14__u_dcfifo_rx_u_din_buffer_data_reg_3__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net711), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[110]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[111]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__16__u_dcfifo_rx_u_din_buffer_data_reg_4__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3804), .o1(
        u_dcfifo_rx_u_din_buffer_data[144]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[145]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__18__u_dcfifo_rx_u_din_buffer_data_reg_4__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3804), .o1(
        u_dcfifo_rx_u_din_buffer_data[146]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[147]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__20__u_dcfifo_rx_u_din_buffer_data_reg_4__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3787), .o1(
        u_dcfifo_rx_u_din_buffer_data[148]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[149]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__22__u_dcfifo_rx_u_din_buffer_data_reg_4__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3950), .o1(
        u_dcfifo_rx_u_din_buffer_data[150]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[151]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__24__u_dcfifo_rx_u_din_buffer_data_reg_4__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3950), .o1(
        u_dcfifo_rx_u_din_buffer_data[152]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[153]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__26__u_dcfifo_rx_u_din_buffer_data_reg_4__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3950), .o1(
        u_dcfifo_rx_u_din_buffer_data[154]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[155]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__28__u_dcfifo_rx_u_din_buffer_data_reg_4__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[156]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[157]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__30__u_dcfifo_rx_u_din_buffer_data_reg_4__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net706), .rb(n3947), .o1(
        u_dcfifo_rx_u_din_buffer_data[158]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[159]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__0__u_dcfifo_rx_u_din_buffer_data_reg_4__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[128]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[129]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__2__u_dcfifo_rx_u_din_buffer_data_reg_4__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3926), .o1(
        u_dcfifo_rx_u_din_buffer_data[130]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[131]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__4__u_dcfifo_rx_u_din_buffer_data_reg_4__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3926), .o1(
        u_dcfifo_rx_u_din_buffer_data[132]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[133]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__6__u_dcfifo_rx_u_din_buffer_data_reg_4__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[134]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[135]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__8__u_dcfifo_rx_u_din_buffer_data_reg_4__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3790), .o1(
        u_dcfifo_rx_u_din_buffer_data[136]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[137]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__10__u_dcfifo_rx_u_din_buffer_data_reg_4__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3955), .o1(
        u_dcfifo_rx_u_din_buffer_data[138]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[139]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__12__u_dcfifo_rx_u_din_buffer_data_reg_4__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3955), .o1(
        u_dcfifo_rx_u_din_buffer_data[140]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[141]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_4__14__u_dcfifo_rx_u_din_buffer_data_reg_4__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net701), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[142]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[143]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__16__u_dcfifo_rx_u_din_buffer_data_reg_5__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[176]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[177]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__18__u_dcfifo_rx_u_din_buffer_data_reg_5__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3964), .o1(
        u_dcfifo_rx_u_din_buffer_data[178]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[179]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__20__u_dcfifo_rx_u_din_buffer_data_reg_5__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3960), .o1(
        u_dcfifo_rx_u_din_buffer_data[180]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[181]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__22__u_dcfifo_rx_u_din_buffer_data_reg_5__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[182]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[183]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__24__u_dcfifo_rx_u_din_buffer_data_reg_5__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[184]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[185]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__26__u_dcfifo_rx_u_din_buffer_data_reg_5__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3786), .o1(
        u_dcfifo_rx_u_din_buffer_data[186]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[187]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__28__u_dcfifo_rx_u_din_buffer_data_reg_5__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[188]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[189]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__30__u_dcfifo_rx_u_din_buffer_data_reg_5__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net696), .rb(n3786), .o1(
        u_dcfifo_rx_u_din_buffer_data[190]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[191]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__0__u_dcfifo_rx_u_din_buffer_data_reg_5__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3963), .o1(
        u_dcfifo_rx_u_din_buffer_data[160]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[161]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__2__u_dcfifo_rx_u_din_buffer_data_reg_5__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3963), .o1(
        u_dcfifo_rx_u_din_buffer_data[162]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[163]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__4__u_dcfifo_rx_u_din_buffer_data_reg_5__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3926), .o1(
        u_dcfifo_rx_u_din_buffer_data[164]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[165]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__6__u_dcfifo_rx_u_din_buffer_data_reg_5__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[166]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[167]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__8__u_dcfifo_rx_u_din_buffer_data_reg_5__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3788), .o1(
        u_dcfifo_rx_u_din_buffer_data[168]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[169]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__10__u_dcfifo_rx_u_din_buffer_data_reg_5__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3783), .o1(
        u_dcfifo_rx_u_din_buffer_data[170]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[171]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__12__u_dcfifo_rx_u_din_buffer_data_reg_5__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[172]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[173]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_5__14__u_dcfifo_rx_u_din_buffer_data_reg_5__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net691), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[174]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[175]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__16__u_dcfifo_rx_u_din_buffer_data_reg_6__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3784), .o1(
        u_dcfifo_rx_u_din_buffer_data[208]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[209]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__18__u_dcfifo_rx_u_din_buffer_data_reg_6__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3964), .o1(
        u_dcfifo_rx_u_din_buffer_data[210]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[211]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__20__u_dcfifo_rx_u_din_buffer_data_reg_6__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3960), .o1(
        u_dcfifo_rx_u_din_buffer_data[212]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[213]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__22__u_dcfifo_rx_u_din_buffer_data_reg_6__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3792), .o1(
        u_dcfifo_rx_u_din_buffer_data[214]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[215]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__24__u_dcfifo_rx_u_din_buffer_data_reg_6__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3787), .o1(
        u_dcfifo_rx_u_din_buffer_data[216]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[217]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__26__u_dcfifo_rx_u_din_buffer_data_reg_6__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3950), .o1(
        u_dcfifo_rx_u_din_buffer_data[218]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[219]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__28__u_dcfifo_rx_u_din_buffer_data_reg_6__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3934), .o1(
        u_dcfifo_rx_u_din_buffer_data[220]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[221]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__30__u_dcfifo_rx_u_din_buffer_data_reg_6__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net686), .rb(n3945), .o1(
        u_dcfifo_rx_u_din_buffer_data[222]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[223]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__0__u_dcfifo_rx_u_din_buffer_data_reg_6__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[192]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[193]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__2__u_dcfifo_rx_u_din_buffer_data_reg_6__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3926), .o1(
        u_dcfifo_rx_u_din_buffer_data[194]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[195]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__4__u_dcfifo_rx_u_din_buffer_data_reg_6__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[196]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[197]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__6__u_dcfifo_rx_u_din_buffer_data_reg_6__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[198]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[199]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__8__u_dcfifo_rx_u_din_buffer_data_reg_6__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3785), .o1(
        u_dcfifo_rx_u_din_buffer_data[200]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[201]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__10__u_dcfifo_rx_u_din_buffer_data_reg_6__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[202]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[203]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__12__u_dcfifo_rx_u_din_buffer_data_reg_6__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[204]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[205]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_6__14__u_dcfifo_rx_u_din_buffer_data_reg_6__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net681), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[206]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[207]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__16__u_dcfifo_rx_u_din_buffer_data_reg_7__17_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[16]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3945), .o1(
        u_dcfifo_rx_u_din_buffer_data[240]), .si2(1'b0), .d2(ctrl_data_rx[17]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[241]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__18__u_dcfifo_rx_u_din_buffer_data_reg_7__19_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[18]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3945), .o1(
        u_dcfifo_rx_u_din_buffer_data[242]), .si2(1'b0), .d2(ctrl_data_rx[19]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[243]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__20__u_dcfifo_rx_u_din_buffer_data_reg_7__21_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[20]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3804), .o1(
        u_dcfifo_rx_u_din_buffer_data[244]), .si2(1'b0), .d2(ctrl_data_rx[21]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[245]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__22__u_dcfifo_rx_u_din_buffer_data_reg_7__23_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[22]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3952), .o1(
        u_dcfifo_rx_u_din_buffer_data[246]), .si2(1'b0), .d2(ctrl_data_rx[23]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[247]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__24__u_dcfifo_rx_u_din_buffer_data_reg_7__25_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[24]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3952), .o1(
        u_dcfifo_rx_u_din_buffer_data[248]), .si2(1'b0), .d2(ctrl_data_rx[25]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[249]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__26__u_dcfifo_rx_u_din_buffer_data_reg_7__27_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[26]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3952), .o1(
        u_dcfifo_rx_u_din_buffer_data[250]), .si2(1'b0), .d2(ctrl_data_rx[27]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[251]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__28__u_dcfifo_rx_u_din_buffer_data_reg_7__29_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[28]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3801), .o1(
        u_dcfifo_rx_u_din_buffer_data[252]), .si2(1'b0), .d2(ctrl_data_rx[29]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[253]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__30__u_dcfifo_rx_u_din_buffer_data_reg_7__31_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[30]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net676), .rb(n3947), .o1(
        u_dcfifo_rx_u_din_buffer_data[254]), .si2(1'b0), .d2(ctrl_data_rx[31]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[255]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__0__u_dcfifo_rx_u_din_buffer_data_reg_7__1_ ( 
        .si1(1'b0), .d1(n3818), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3963), .o1(
        u_dcfifo_rx_u_din_buffer_data[224]), .si2(1'b0), .d2(ctrl_data_rx[1]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[225]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__2__u_dcfifo_rx_u_din_buffer_data_reg_7__3_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[2]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3963), .o1(
        u_dcfifo_rx_u_din_buffer_data[226]), .si2(1'b0), .d2(ctrl_data_rx[3]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[227]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__4__u_dcfifo_rx_u_din_buffer_data_reg_7__5_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[4]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3926), .o1(
        u_dcfifo_rx_u_din_buffer_data[228]), .si2(1'b0), .d2(n3820), .o2(
        u_dcfifo_rx_u_din_buffer_data[229]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__6__u_dcfifo_rx_u_din_buffer_data_reg_7__7_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[6]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3789), .o1(
        u_dcfifo_rx_u_din_buffer_data[230]), .si2(1'b0), .d2(ctrl_data_rx[7]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[231]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__8__u_dcfifo_rx_u_din_buffer_data_reg_7__9_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[8]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3788), .o1(
        u_dcfifo_rx_u_din_buffer_data[232]), .si2(1'b0), .d2(ctrl_data_rx[9]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[233]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__10__u_dcfifo_rx_u_din_buffer_data_reg_7__11_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[10]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3798), .o1(
        u_dcfifo_rx_u_din_buffer_data[234]), .si2(1'b0), .d2(ctrl_data_rx[11]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[235]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__12__u_dcfifo_rx_u_din_buffer_data_reg_7__13_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[12]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3790), .o1(
        u_dcfifo_rx_u_din_buffer_data[236]), .si2(1'b0), .d2(ctrl_data_rx[13]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[237]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_buffer_data_reg_7__14__u_dcfifo_rx_u_din_buffer_data_reg_7__15_ ( 
        .si1(1'b0), .d1(ctrl_data_rx[14]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_buffer_net670), .rb(n3967), .o1(
        u_dcfifo_rx_u_din_buffer_data[238]), .si2(1'b0), .d2(ctrl_data_rx[15]), 
        .o2(u_dcfifo_rx_u_din_buffer_data[239]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_0__u_dcfifo_rx_u_din_write_tr_state_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[7]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .rb(n3969), .o1(
        u_dcfifo_rx_write_token[0]), .si2(1'b0), .d2(
        u_dcfifo_rx_write_token[0]), .o2(u_dcfifo_rx_write_token[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_4__u_dcfifo_rx_u_din_write_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .rb(n3947), .o1(
        u_dcfifo_rx_write_token[4]), .si2(1'b0), .d2(
        u_dcfifo_rx_write_token[4]), .o2(u_dcfifo_rx_write_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_write_tr_state_reg_6__u_dcfifo_rx_u_din_write_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_din_write_tr_net652), .rb(n3969), .o1(
        u_dcfifo_rx_write_token[6]), .si2(1'b0), .d2(
        u_dcfifo_rx_write_token[6]), .o2(u_dcfifo_rx_write_token[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_2__u_dcfifo_rx_u_dout_read_tr_state_reg_3_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_read_token[1]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .rb(n3969), .o1(
        u_dcfifo_rx_u_dout_read_token[2]), .si2(1'b0), .d2(
        u_dcfifo_rx_u_dout_read_token[2]), .o2(
        u_dcfifo_rx_u_dout_read_token[3]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_4__u_dcfifo_rx_u_dout_read_tr_state_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_read_token[3]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .rb(n3915), .o1(
        u_dcfifo_rx_u_dout_read_token[4]), .si2(1'b0), .d2(
        u_dcfifo_rx_u_dout_read_token[4]), .o2(
        u_dcfifo_rx_u_dout_read_token[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_read_tr_state_reg_6__u_dcfifo_rx_u_dout_read_tr_state_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_read_token[5]), .ssb(1'b1), .clk(
        u_dcfifo_rx_u_dout_read_tr_net634), .rb(n3969), .o1(
        u_dcfifo_rx_u_dout_read_token[6]), .si2(1'b0), .d2(
        u_dcfifo_rx_u_dout_read_token[6]), .o2(
        u_dcfifo_rx_u_dout_read_token[7]) );
  b15fqy203ar1n02x5 u_device_sm_ctrl_addr_valid_reg_u_device_sm_data_reg_reg_0_ ( 
        .si1(1'b0), .d1(u_device_sm_sample_ADDR), .ssb(1'b1), .clk(spi_sclk), 
        .rb(n3776), .o1(ctrl_addr_valid), .si2(1'b0), .d2(n1712), .o2(n1712)
         );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_5__u_device_sm_state_reg_0_ ( 
        .si1(1'b0), .d1(n1881), .ssb(1'b1), .clk(spi_sclk), .rb(n3772), .o1(
        n1881), .si2(1'b0), .d2(u_device_sm_state_next[0]), .o2(
        u_device_sm_state[0]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_0__u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[0]), .ssb(1'b1), .clk(spi_sclk), .rb(n3781), .o1(u_dcfifo_tx_u_dout_empty_synch_d_middle[0]), .si2(1'b0), 
        .d2(u_dcfifo_tx_write_token[1]), .o2(
        u_dcfifo_tx_u_dout_empty_synch_d_middle[1]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_4__u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[4]), .ssb(1'b1), .clk(spi_sclk), .rb(n3783), .o1(u_dcfifo_tx_u_dout_empty_synch_d_middle[4]), .si2(1'b0), 
        .d2(u_dcfifo_tx_write_token[5]), .o2(
        u_dcfifo_tx_u_dout_empty_synch_d_middle[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_6__u_dcfifo_tx_u_dout_empty_synch_d_middle_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_write_token[6]), .ssb(1'b1), .clk(spi_sclk), .rb(n3783), .o1(u_dcfifo_tx_u_dout_empty_synch_d_middle[6]), .si2(1'b0), 
        .d2(u_dcfifo_tx_write_token[7]), .o2(
        u_dcfifo_tx_u_dout_empty_synch_d_middle[7]) );
  b15fqy203ar1n02x5 u_device_sm_ctrl_data_tx_ready_reg_u_device_sm_state_reg_1_ ( 
        .si1(1'b0), .d1(u_device_sm_ctrl_data_tx_ready_next), .ssb(1'b1), 
        .clk(spi_sclk), .rb(n3776), .o1(ctrl_data_tx_ready), .si2(1'b0), .d2(
        u_device_sm_state_next[1]), .o2(u_device_sm_state[1]) );
  b15fqy203ar1n02x5 u_device_sm_state_reg_2__u_device_sm_tx_counter_reg_0_ ( 
        .si1(1'b0), .d1(u_device_sm_state_next[2]), .ssb(1'b1), .clk(spi_sclk), 
        .rb(n3777), .o1(u_device_sm_state[2]), .si2(1'b0), .d2(1'b1), .o2(
        tx_counter[0]) );
  b15fqy203ar1n02x5 u_device_sm_tx_counter_reg_2__u_device_sm_tx_counter_reg_3_ ( 
        .si1(1'b0), .d1(1'b1), .ssb(1'b1), .clk(spi_sclk), .rb(n3928), .o1(
        tx_counter[2]), .si2(1'b0), .d2(u_device_sm_tx_counter_next_3_), .o2(
        tx_counter[3]) );
  b15fqy203ar1n02x5 u_device_sm_tx_counter_reg_4__u_device_sm_tx_counter_upd_reg ( 
        .si1(1'b0), .d1(u_device_sm_tx_counter_next_3_), .ssb(1'b1), .clk(
        spi_sclk), .rb(n3928), .o1(tx_counter[4]), .si2(1'b0), .d2(
        u_device_sm_tx_counter_upd_next), .o2(tx_counter_upd) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_13__u_device_sm_tx_data_reg_14_ ( 
        .si1(1'b0), .d1(u_device_sm_N187), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3928), .o1(tx_data[13]), .si2(1'b0), .d2(u_device_sm_N188), .o2(
        tx_data[14]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_full_full_synch_d_middle_reg_0__u_dcfifo_rx_u_din_full_full_synch_d_out_reg_0_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_din_full_full_dn), .ssb(1'b1), .clk(
        spi_sclk), .rb(n3786), .o1(
        u_dcfifo_rx_u_din_full_full_synch_d_middle_0_), .si2(1'b0), .d2(
        u_dcfifo_rx_u_din_full_full_synch_d_middle_0_), .o2(
        u_dcfifo_rx_u_din_full_full_up) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_din_full_latched_full_s_reg_u_dcfifo_tx_u_dout_empty_synch_d_out_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_din_full_N0), .ssb(1'b1), .clk(spi_sclk), 
        .rb(n3784), .o1(u_dcfifo_rx_u_din_full_latched_full_s), .si2(1'b0), 
        .d2(u_dcfifo_tx_u_dout_empty_synch_d_middle[1]), .o2(
        u_dcfifo_tx_u_dout_write_token_dn[1]) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_1__u_device_sm_data_reg_reg_2_ ( 
        .si1(1'b0), .d1(n1718), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1718), .si2(1'b0), .d2(n1700), .o2(n1700) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_3__u_device_sm_data_reg_reg_4_ ( 
        .si1(1'b0), .d1(n1694), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1694), .si2(1'b0), .d2(n1706), .o2(n1706) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_6__u_device_sm_data_reg_reg_7_ ( 
        .si1(1'b0), .d1(n1724), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1724), .si2(1'b0), .d2(n1730), .o2(n1730) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_8__u_device_sm_data_reg_reg_9_ ( 
        .si1(1'b0), .d1(n1802), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1802), .si2(1'b0), .d2(n1799), .o2(n1799) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_10__u_device_sm_data_reg_reg_11_ ( 
        .si1(1'b0), .d1(n1796), .ssb(1'b1), .clk(spi_sclk), .rb(n3772), .o1(
        n1796), .si2(1'b0), .d2(n1793), .o2(n1793) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_12__u_device_sm_data_reg_reg_13_ ( 
        .si1(1'b0), .d1(n1790), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1790), .si2(1'b0), .d2(n1787), .o2(n1787) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_14__u_device_sm_data_reg_reg_15_ ( 
        .si1(1'b0), .d1(n1784), .ssb(1'b1), .clk(spi_sclk), .rb(n3772), .o1(
        n1784), .si2(1'b0), .d2(n1781), .o2(n1781) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_16__u_device_sm_data_reg_reg_17_ ( 
        .si1(1'b0), .d1(n1778), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1778), .si2(1'b0), .d2(n1775), .o2(n1775) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_18__u_device_sm_data_reg_reg_19_ ( 
        .si1(1'b0), .d1(n1772), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1772), .si2(1'b0), .d2(n1769), .o2(n1769) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_20__u_device_sm_data_reg_reg_21_ ( 
        .si1(1'b0), .d1(n1766), .ssb(1'b1), .clk(spi_sclk), .rb(n3968), .o1(
        n1766), .si2(1'b0), .d2(n1763), .o2(n1763) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_22__u_device_sm_data_reg_reg_23_ ( 
        .si1(1'b0), .d1(n1760), .ssb(1'b1), .clk(spi_sclk), .rb(n3769), .o1(
        n1760), .si2(1'b0), .d2(n1757), .o2(n1757) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_24__u_device_sm_data_reg_reg_25_ ( 
        .si1(1'b0), .d1(n1754), .ssb(1'b1), .clk(spi_sclk), .rb(n3772), .o1(
        n1754), .si2(1'b0), .d2(n1751), .o2(n1751) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_26__u_device_sm_data_reg_reg_27_ ( 
        .si1(1'b0), .d1(n1748), .ssb(1'b1), .clk(spi_sclk), .rb(n3769), .o1(
        n1748), .si2(1'b0), .d2(n1745), .o2(n1745) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_28__u_device_sm_data_reg_reg_29_ ( 
        .si1(1'b0), .d1(n1742), .ssb(1'b1), .clk(spi_sclk), .rb(n3769), .o1(
        n1742), .si2(1'b0), .d2(n1739), .o2(n1739) );
  b15fqy203ar1n02x5 u_device_sm_data_reg_reg_30__u_device_sm_data_reg_reg_31_ ( 
        .si1(1'b0), .d1(n1736), .ssb(1'b1), .clk(spi_sclk), .rb(n3772), .o1(
        n1736), .si2(1'b0), .d2(n1733), .o2(n1733) );
  b15fqy203ar1n02x5 u_device_sm_mode_reg_reg_0__u_device_sm_mode_reg_reg_1_ ( 
        .si1(1'b0), .d1(n1709), .ssb(1'b1), .clk(spi_sclk), .rb(n3968), .o1(
        n1709), .si2(1'b0), .d2(n1715), .o2(n1715) );
  b15fqy203ar1n02x5 u_device_sm_mode_reg_reg_2__u_device_sm_mode_reg_reg_3_ ( 
        .si1(1'b0), .d1(n1697), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1697), .si2(1'b0), .d2(n1691), .o2(n1691) );
  b15fqy203ar1n02x5 u_device_sm_mode_reg_reg_4__u_device_sm_mode_reg_reg_5_ ( 
        .si1(1'b0), .d1(n1703), .ssb(1'b1), .clk(spi_sclk), .rb(n3777), .o1(
        n1703), .si2(1'b0), .d2(n1878), .o2(n1878) );
  b15fqy203ar1n02x5 u_device_sm_tx_counter_reg_1__u_device_sm_tx_data_reg_0_ ( 
        .si1(1'b0), .d1(1'b1), .ssb(1'b1), .clk(spi_sclk), .rb(n3769), .o1(
        tx_counter[1]), .si2(1'b0), .d2(u_device_sm_N174), .o2(tx_data[0]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_1__u_device_sm_tx_data_reg_2_ ( 
        .si1(1'b0), .d1(u_device_sm_N175), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3778), .o1(tx_data[1]), .si2(1'b0), .d2(u_device_sm_N176), .o2(
        tx_data[2]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_3__u_device_sm_tx_data_reg_4_ ( 
        .si1(1'b0), .d1(u_device_sm_N177), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3778), .o1(tx_data[3]), .si2(1'b0), .d2(u_device_sm_N178), .o2(
        tx_data[4]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_5__u_device_sm_tx_data_reg_6_ ( 
        .si1(1'b0), .d1(u_device_sm_N179), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3778), .o1(tx_data[5]), .si2(1'b0), .d2(u_device_sm_N180), .o2(
        tx_data[6]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_7__u_device_sm_tx_data_reg_8_ ( 
        .si1(1'b0), .d1(u_device_sm_N181), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3772), .o1(tx_data[7]), .si2(1'b0), .d2(u_device_sm_N182), .o2(
        tx_data[8]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_9__u_device_sm_tx_data_reg_10_ ( 
        .si1(1'b0), .d1(u_device_sm_N183), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3778), .o1(tx_data[9]), .si2(1'b0), .d2(u_device_sm_N184), .o2(
        tx_data[10]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_11__u_device_sm_tx_data_reg_12_ ( 
        .si1(1'b0), .d1(u_device_sm_N185), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3928), .o1(tx_data[11]), .si2(1'b0), .d2(u_device_sm_N186), .o2(
        tx_data[12]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_16__u_device_sm_tx_data_reg_17_ ( 
        .si1(1'b0), .d1(u_device_sm_N190), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[16]), .si2(1'b0), .d2(u_device_sm_N191), .o2(
        tx_data[17]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_18__u_device_sm_tx_data_reg_19_ ( 
        .si1(1'b0), .d1(u_device_sm_N192), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[18]), .si2(1'b0), .d2(u_device_sm_N193), .o2(
        tx_data[19]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_20__u_device_sm_tx_data_reg_21_ ( 
        .si1(1'b0), .d1(u_device_sm_N194), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[20]), .si2(1'b0), .d2(u_device_sm_N195), .o2(
        tx_data[21]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_22__u_device_sm_tx_data_reg_23_ ( 
        .si1(1'b0), .d1(u_device_sm_N196), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[22]), .si2(1'b0), .d2(u_device_sm_N197), .o2(
        tx_data[23]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_24__u_device_sm_tx_data_reg_25_ ( 
        .si1(1'b0), .d1(u_device_sm_N198), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[24]), .si2(1'b0), .d2(u_device_sm_N199), .o2(
        tx_data[25]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_26__u_device_sm_tx_data_reg_27_ ( 
        .si1(1'b0), .d1(u_device_sm_N200), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[26]), .si2(1'b0), .d2(u_device_sm_N201), .o2(
        tx_data[27]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_28__u_device_sm_tx_data_reg_29_ ( 
        .si1(1'b0), .d1(u_device_sm_N202), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[28]), .si2(1'b0), .d2(u_device_sm_N203), .o2(
        tx_data[29]) );
  b15fqy203ar1n02x5 u_device_sm_tx_data_reg_30__u_device_sm_tx_data_reg_31_ ( 
        .si1(1'b0), .d1(u_device_sm_N204), .ssb(1'b1), .clk(spi_sclk), .rb(
        n3771), .o1(tx_data[30]), .si2(1'b0), .d2(u_device_sm_N205), .o2(
        tx_data[31]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_0__u_dcfifo_tx_u_dout_empty_synch_d_out_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_empty_synch_d_middle[0]), .ssb(1'b1), .clk(spi_sclk), .rb(n3964), .o1(u_dcfifo_tx_u_dout_write_token_dn[0]), .si2(
        1'b0), .d2(u_dcfifo_tx_u_dout_empty_synch_d_middle[5]), .o2(
        u_dcfifo_tx_u_dout_write_token_dn[5]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_dout_empty_synch_d_out_reg_6__u_dcfifo_tx_u_dout_empty_synch_d_out_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_dout_empty_synch_d_middle[6]), .ssb(1'b1), .clk(spi_sclk), .rb(n3781), .o1(u_dcfifo_tx_u_dout_write_token_dn[6]), .si2(
        1'b0), .d2(u_dcfifo_tx_u_dout_empty_synch_d_middle[7]), .o2(
        u_dcfifo_tx_u_dout_write_token_dn[7]) );
  b15fqy203ar1n02x5 u_device_sm_mode_reg_reg_6__u_device_sm_mode_reg_reg_7_ ( 
        .si1(1'b0), .d1(n1721), .ssb(1'b1), .clk(spi_sclk), .rb(n3968), .o1(
        n1721), .si2(1'b0), .d2(n1727), .o2(n1727) );
  b15fqy203ar1n02x5 u_device_sm_tx_counter_reg_5__u_device_sm_tx_counter_reg_6_ ( 
        .si1(1'b0), .d1(1'b0), .ssb(1'b1), .clk(spi_sclk), .rb(n3769), .o1(
        tx_counter[5]), .si2(1'b0), .d2(1'b0), .o2(tx_counter[6]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_0__u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[0]), .ssb(1'b1), .clk(clk_i), 
        .rb(n3915), .o1(u_dcfifo_rx_u_dout_empty_synch_d_middle[0]), .si2(1'b0), .d2(u_dcfifo_rx_write_token[1]), .o2(
        u_dcfifo_rx_u_dout_empty_synch_d_middle[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_4__u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[4]), .ssb(1'b1), .clk(clk_i), 
        .rb(n3786), .o1(u_dcfifo_rx_u_dout_empty_synch_d_middle[4]), .si2(1'b0), .d2(u_dcfifo_rx_write_token[5]), .o2(
        u_dcfifo_rx_u_dout_empty_synch_d_middle[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_6__u_dcfifo_rx_u_dout_empty_synch_d_middle_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_write_token[6]), .ssb(1'b1), .clk(clk_i), 
        .rb(n3969), .o1(u_dcfifo_rx_u_dout_empty_synch_d_middle[6]), .si2(1'b0), .d2(u_dcfifo_rx_write_token[7]), .o2(
        u_dcfifo_rx_u_dout_empty_synch_d_middle[7]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_0__u_dcfifo_rx_u_dout_empty_synch_d_out_reg_1_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_empty_synch_d_middle[0]), .ssb(1'b1), .clk(clk_i), .rb(n3915), .o1(u_dcfifo_rx_u_dout_write_token_dn[0]), .si2(
        1'b0), .d2(u_dcfifo_rx_u_dout_empty_synch_d_middle[1]), .o2(
        u_dcfifo_rx_u_dout_write_token_dn[1]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_4__u_dcfifo_rx_u_dout_empty_synch_d_out_reg_5_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_empty_synch_d_middle[4]), .ssb(1'b1), .clk(clk_i), .rb(n3786), .o1(u_dcfifo_rx_u_dout_write_token_dn[4]), .si2(
        1'b0), .d2(u_dcfifo_rx_u_dout_empty_synch_d_middle[5]), .o2(
        u_dcfifo_rx_u_dout_write_token_dn[5]) );
  b15fqy203ar1n02x5 u_dcfifo_rx_u_dout_empty_synch_d_out_reg_6__u_dcfifo_rx_u_dout_empty_synch_d_out_reg_7_ ( 
        .si1(1'b0), .d1(u_dcfifo_rx_u_dout_empty_synch_d_middle[6]), .ssb(1'b1), .clk(clk_i), .rb(n3969), .o1(u_dcfifo_rx_u_dout_write_token_dn[6]), .si2(
        1'b0), .d2(u_dcfifo_rx_u_dout_empty_synch_d_middle[7]), .o2(
        u_dcfifo_rx_u_dout_write_token_dn[7]) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_full_full_synch_d_middle_reg_0__u_dcfifo_tx_u_din_full_full_synch_d_out_reg_0_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_din_full_full_dn), .ssb(1'b1), .clk(
        clk_i), .rb(n3781), .o1(u_dcfifo_tx_u_din_full_full_synch_d_middle_0_), 
        .si2(1'b0), .d2(u_dcfifo_tx_u_din_full_full_synch_d_middle_0_), .o2(
        u_dcfifo_tx_u_din_full_full_up) );
  b15fqy203ar1n02x5 u_dcfifo_tx_u_din_full_latched_full_s_reg_u_spi_device_tlul_plug_state_reg_0_ ( 
        .si1(1'b0), .d1(u_dcfifo_tx_u_din_full_N0), .ssb(1'b1), .clk(clk_i), 
        .rb(n3786), .o1(u_dcfifo_tx_u_din_full_latched_full_s), .si2(1'b0), 
        .d2(u_spi_device_tlul_plug_state_next[0]), .o2(
        u_spi_device_tlul_plug_state[0]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_state_reg_1__u_spi_device_tlul_plug_u_tlul_adapter_host_g_multiple_reqs_source_q_reg_0_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_state_next[1]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3794), .o1(u_spi_device_tlul_plug_state[1]), .si2(
        1'b0), .d2(n604), .o2(tl_o[92]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_u_tlul_adapter_host_intg_err_q_reg_u_spi_device_tlul_plug_wdata_reg_0_ ( 
        .si1(1'b0), .d1(n1456), .ssb(1'b1), .clk(clk_i), .rb(n3786), .o1(n1455), .si2(1'b0), .d2(u_spi_device_tlul_plug_wdata_next[0]), .o2(tl_o[24]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_1__u_spi_device_tlul_plug_wdata_reg_2_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[1]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3799), .o1(tl_o[25]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[2]), .o2(tl_o[26]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_3__u_spi_device_tlul_plug_wdata_reg_4_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[3]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3799), .o1(tl_o[27]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[4]), .o2(tl_o[28]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_5__u_spi_device_tlul_plug_wdata_reg_6_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[5]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3788), .o1(tl_o[29]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[6]), .o2(tl_o[30]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_7__u_spi_device_tlul_plug_wdata_reg_8_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[7]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3799), .o1(tl_o[31]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[8]), .o2(tl_o[32]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_9__u_spi_device_tlul_plug_wdata_reg_10_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[9]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3788), .o1(tl_o[33]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[10]), .o2(tl_o[34]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_11__u_spi_device_tlul_plug_wdata_reg_12_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[11]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3788), .o1(tl_o[35]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[12]), .o2(tl_o[36]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_13__u_spi_device_tlul_plug_wdata_reg_14_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[13]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3783), .o1(tl_o[37]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[14]), .o2(tl_o[38]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_15__u_spi_device_tlul_plug_wdata_reg_16_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[15]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3784), .o1(tl_o[39]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[16]), .o2(tl_o[40]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_17__u_spi_device_tlul_plug_wdata_reg_18_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[17]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3804), .o1(tl_o[41]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[18]), .o2(tl_o[42]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_19__u_spi_device_tlul_plug_wdata_reg_20_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[19]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3804), .o1(tl_o[43]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[20]), .o2(tl_o[44]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_21__u_spi_device_tlul_plug_wdata_reg_22_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[21]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3800), .o1(tl_o[45]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[22]), .o2(tl_o[46]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_23__u_spi_device_tlul_plug_wdata_reg_24_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[23]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3800), .o1(tl_o[47]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[24]), .o2(tl_o[48]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_25__u_spi_device_tlul_plug_wdata_reg_26_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[25]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3800), .o1(tl_o[49]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[26]), .o2(tl_o[50]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_27__u_spi_device_tlul_plug_wdata_reg_28_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[27]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3934), .o1(tl_o[51]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[28]), .o2(tl_o[52]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_29__u_spi_device_tlul_plug_wdata_reg_30_ ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[29]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3800), .o1(tl_o[53]), .si2(1'b0), .d2(
        u_spi_device_tlul_plug_wdata_next[30]), .o2(tl_o[54]) );
  b15fqy203ar1n02x5 u_spi_device_tlul_plug_wdata_reg_31__u_spi_device_tlul_plug_we_reg ( 
        .si1(1'b0), .d1(u_spi_device_tlul_plug_wdata_next[31]), .ssb(1'b1), 
        .clk(clk_i), .rb(n3787), .o1(tl_o[55]), .si2(1'b0), .d2(n3925), .o2(
        u_spi_device_tlul_plug_we) );
  b15fqy203ar1n02x5 u_syncro_rdwr_reg_reg_0__u_syncro_rdwr_reg_reg_1_ ( .si1(
        1'b0), .d1(ctrl_rd_wr), .ssb(1'b1), .clk(clk_i), .rb(n3789), .o1(
        u_syncro_rdwr_reg_0_), .si2(1'b0), .d2(u_syncro_rdwr_reg_0_), .o2(
        rd_wr_sync) );
  b15fqy203ar1n02x5 u_syncro_valid_reg_reg_0__u_syncro_valid_reg_reg_1_ ( 
        .si1(1'b0), .d1(ctrl_addr_valid), .ssb(1'b1), .clk(clk_i), .rb(n3786), 
        .o1(u_syncro_valid_reg[0]), .si2(1'b0), .d2(u_syncro_valid_reg[0]), 
        .o2(u_syncro_valid_reg[1]) );
  b15inv000ar1n03x5 U2924 ( .a(1'b0), .o1(tl_o[0]) );
  b15inv000ar1n03x5 U3029 ( .a(1'b1), .o1(tl_o[1]) );
  b15inv000ar1n03x5 U3035 ( .a(1'b0), .o1(tl_o[2]) );
  b15inv000ar1n03x5 U3043 ( .a(1'b1), .o1(tl_o[3]) );
  b15inv000ar1n03x5 U3045 ( .a(1'b0), .o1(tl_o[4]) );
  b15inv000ar1n03x5 U3047 ( .a(1'b1), .o1(tl_o[5]) );
  b15inv000ar1n03x5 U3114 ( .a(1'b0), .o1(tl_o[6]) );
  b15inv000ar1n03x5 U3164 ( .a(1'b1), .o1(tl_o[7]) );
  b15inv000ar1n03x5 U3242 ( .a(1'b0), .o1(tl_o[15]) );
  b15inv000ar1n03x5 U3292 ( .a(1'b1), .o1(tl_o[16]) );
  b15inv000ar1n03x5 U3294 ( .a(1'b1), .o1(tl_o[17]) );
  b15inv000ar1n03x5 U3298 ( .a(1'b0), .o1(tl_o[18]) );
  b15inv000ar1n03x5 U3300 ( .a(1'b1), .o1(tl_o[19]) );
  b15inv000ar1n03x5 U3302 ( .a(1'b1), .o1(tl_o[20]) );
  b15inv000ar1n03x5 U3304 ( .a(1'b1), .o1(tl_o[21]) );
  b15inv000ar1n03x5 U3306 ( .a(1'b1), .o1(tl_o[22]) );
  b15inv000ar1n03x5 U3314 ( .a(1'b1), .o1(tl_o[23]) );
  b15inv000ar1n03x5 U3320 ( .a(1'b0), .o1(tl_o[56]) );
  b15inv000ar1n03x5 U3322 ( .a(1'b0), .o1(tl_o[57]) );
  b15inv000ar1n03x5 U3334 ( .a(1'b0), .o1(tl_o[58]) );
  b15inv000ar1n03x5 U3340 ( .a(1'b0), .o1(tl_o[59]) );
  b15inv000ar1n03x5 U3419 ( .a(1'b1), .o1(tl_o[60]) );
  b15inv000ar1n03x5 U3421 ( .a(1'b1), .o1(tl_o[61]) );
  b15inv000ar1n03x5 U3423 ( .a(1'b1), .o1(tl_o[93]) );
  b15inv000ar1n03x5 U3425 ( .a(1'b1), .o1(tl_o[94]) );
  b15inv000ar1n03x5 U3427 ( .a(1'b1), .o1(tl_o[95]) );
  b15inv000ar1n03x5 U3429 ( .a(1'b1), .o1(tl_o[96]) );
  b15inv000ar1n03x5 U3431 ( .a(1'b1), .o1(tl_o[97]) );
  b15inv000ar1n03x5 U3433 ( .a(1'b1), .o1(tl_o[98]) );
  b15inv000ar1n03x5 U3435 ( .a(1'b1), .o1(tl_o[99]) );
  b15inv000ar1n03x5 U3437 ( .a(1'b1), .o1(tl_o[100]) );
  b15inv000ar1n03x5 U3439 ( .a(1'b0), .o1(tl_o[101]) );
  b15inv000ar1n03x5 U3441 ( .a(1'b1), .o1(tl_o[102]) );
  b15inv000ar1n03x5 U3443 ( .a(1'b1), .o1(tl_o[103]) );
  b15inv000ar1n03x5 U3445 ( .a(1'b1), .o1(tl_o[104]) );
  b15inv000ar1n03x5 U3447 ( .a(1'b1), .o1(tl_o[105]) );
  b15inv000ar1n03x5 U3449 ( .a(1'b1), .o1(tl_o[106]) );
  b15inv000ar1n03x5 U3041 ( .a(n3681), .o1(n3822) );
  b15bfn000ar1n03x5 U3460 ( .a(n3365), .o(n3903) );
  b15bfn000ar1n03x5 U3465 ( .a(n3356), .o(n3908) );
  b15bfn000ar1n02x5 U3468 ( .a(n3353), .o(n3911) );
  b15bfn000ar1n03x5 U3480 ( .a(n3347), .o(n3914) );
  b15bfn000ar1n03x5 U3514 ( .a(n3365), .o(n3931) );
  b15bfn000ar1n03x5 U3531 ( .a(n3356), .o(n3941) );
  b15bfn000ar1n02x5 U3539 ( .a(n3353), .o(n3944) );
  b15bfn000ar1n03x5 U3934 ( .a(n3347), .o(n3975) );
  b15bfn000ar1n03x5 U3455 ( .a(n3362), .o(n3898) );
  b15bfn000ar1n03x5 U3456 ( .a(n3011), .o(n3899) );
  b15bfn000ar1n03x5 U3457 ( .a(n3359), .o(n3900) );
  b15bfn000ar1n03x5 U3461 ( .a(n3351), .o(n3904) );
  b15bfn000ar1n03x5 U3462 ( .a(n3349), .o(n3905) );
  b15bfn000ar1n03x5 U3470 ( .a(n3362), .o(n3913) );
  b15bfn000ar1n03x5 U3484 ( .a(n3359), .o(n3916) );
  b15bfn000ar1n03x5 U3490 ( .a(n3351), .o(n3919) );
  b15bfn000ar1n03x5 U3493 ( .a(n3020), .o(n3920) );
  b15bfn000ar1n03x5 U3498 ( .a(n3349), .o(n3923) );
  b15bfn000ar1n03x5 U3501 ( .a(n3018), .o(n3924) );
  b15bfn000ar1n03x5 U3524 ( .a(n3015), .o(n3939) );
  b15bfn000ar1n03x5 U3527 ( .a(n3009), .o(n3940) );
  b15bfn000ar1n03x5 U3534 ( .a(n3004), .o(n3943) );
  b15bfn000ar1n03x5 U3931 ( .a(n3006), .o(n3973) );
  b15bfn000ar1n03x5 U3933 ( .a(n3002), .o(n3974) );
  b15oai022ar1n02x5 U3116 ( .a(n3811), .b(n2799), .c(n2784), .d(n1869), .o1(
        ctrl_data_rx[29]) );
  b15aboi22ar1n04x5 U2941 ( .c(n3806), .d(n2729), .a(u_rxreg_N30), .b(n3807), 
        .out0(ctrl_data_rx[1]) );
  b15aoi022ar1n04x5 U2929 ( .a(n3806), .b(n2726), .c(n2778), .d(n3807), .o1(
        ctrl_data_rx[3]) );
  b15bfn000ar1n02x5 U3515 ( .a(n2917), .o(n3932) );
  b15bfn001ar1n06x5 U3505 ( .a(n3785), .o(n3926) );
  b15bfn000ar1n02x5 U3506 ( .a(n3793), .o(n3927) );
  b15bfn000ar1n02x5 U3547 ( .a(n3804), .o(n3945) );
  b15bfn000ar1n03x5 U3832 ( .a(n3787), .o(n3950) );
  b15bfn000ar1n02x5 U3890 ( .a(n3801), .o(n3952) );
  b15bfn000ar1n03x5 U3901 ( .a(n3798), .o(n3955) );
  b15bfn000ar1n03x5 U3909 ( .a(n3792), .o(n3960) );
  b15bfn000ar1n03x5 U3917 ( .a(n3788), .o(n3963) );
  b15bfn000ar1n03x5 U3918 ( .a(n3781), .o(n3964) );
  b15bfn001ar1n06x5 U3924 ( .a(n3783), .o(n3967) );
  b15bfn000ar1n02x5 U3025 ( .a(n1869), .o(n3806) );
  b15bfn001ar1n06x5 U2970 ( .a(n3942), .o(n3783) );
  b15bfn001ar1n06x5 U3005 ( .a(n3942), .o(n3786) );
  b15bfn001ar1n06x5 U2935 ( .a(n3942), .o(n3781) );
  b15bfn000ar1n03x5 U3006 ( .a(n3942), .o(n3787) );
  b15bfn000ar1n02x5 U3520 ( .a(n3795), .o(n3935) );
  b15bfn000ar1n02x5 U3558 ( .a(n3796), .o(n3946) );
  b15bfn000ar1n03x5 U3732 ( .a(n3805), .o(n3949) );
  b15bfn000ar1n03x5 U3897 ( .a(n3791), .o(n3953) );
  b15bfn000ar1n03x5 U3908 ( .a(n3802), .o(n3959) );
  b15bfn000ar1n02x5 U3922 ( .a(n3797), .o(n3966) );
  b15bfn000ar1n03x5 U3925 ( .a(n3772), .o(n3968) );
  b15fqy203ar1n03x5 u_device_sm_tx_data_valid_reg_u_device_sm_tx_done_reg_reg ( 
        .si1(1'b0), .d1(u_device_sm_tx_data_valid_next), .ssb(1'b1), .clk(
        spi_sclk), .rb(n3776), .o1(tx_data_valid), .si2(1'b0), .d2(tx_done), 
        .o2(u_device_sm_tx_done_reg) );
  b15inv000ar1n03x5 U2918 ( .a(u_rxreg_data_int[4]), .o1(n2787) );
  b15inv000ar1n03x5 U2917 ( .a(u_rxreg_data_int[1]), .o1(n2729) );
  b15inv000ar1n03x5 U2931 ( .a(u_rxreg_data_int[6]), .o1(n2798) );
  b15inv000ar1n03x5 U2951 ( .a(u_rxreg_counter_trgt[0]), .o1(n2874) );
  b15inv000ar1n03x5 U2947 ( .a(u_rxreg_counter_trgt[4]), .o1(n2871) );
  b15inv000ar1n03x5 U2960 ( .a(u_rxreg_counter_trgt[3]), .o1(n2870) );
  b15nonb02ar1n02x3 U2989 ( .a(n2825), .b(n2828), .out0(n2859) );
  b15inv000ar1n03x5 U2991 ( .a(n2839), .o1(n2853) );
  b15inv000ar1n03x5 U3177 ( .a(n2836), .o1(n2829) );
  b15nonb03ar1n02x5 U3194 ( .a(n2832), .b(n2831), .c(n2830), .out0(n2886) );
  b15inv000ar1n03x5 U3053 ( .a(n3647), .o1(n3001) );
  b15inv000ar1n03x5 U3739 ( .a(n3269), .o1(n3255) );
  b15inv000ar1n03x5 U3783 ( .a(u_dcfifo_rx_u_dout_write_token_dn[2]), .o1(
        n3264) );
  b15inv000ar1n03x5 U3784 ( .a(u_dcfifo_rx_u_dout_write_token_dn[0]), .o1(
        n3270) );
  b15inv000ar1n03x5 U3215 ( .a(n2847), .o1(n3620) );
  b15inv000ar1n03x5 U3193 ( .a(n2891), .o1(n2851) );
  b15inv000ar1n03x5 U3231 ( .a(n3228), .o1(n3176) );
  b15inv000ar1n03x5 U3230 ( .a(n3666), .o1(n3174) );
  b15inv000ar1n03x5 U3068 ( .a(n3008), .o1(n3633) );
  b15inv000ar1n03x5 U3747 ( .a(n3348), .o1(n3358) );
  b15nonb02ar1n02x3 U3507 ( .a(n3634), .b(n3019), .out0(n3020) );
  b15inv000ar1n03x5 U3892 ( .a(n3360), .o1(n3364) );
  b15inv000ar1n03x5 U3062 ( .a(n3637), .o1(n3650) );
  b15inv000ar1n03x5 U3069 ( .a(u_dcfifo_tx_u_dout_write_token_dn[0]), .o1(
        n2769) );
  b15inv000ar1n03x5 U3051 ( .a(u_dcfifo_tx_u_dout_write_token_dn[5]), .o1(
        n2765) );
  b15inv000ar1n03x5 U3752 ( .a(n3354), .o1(n3244) );
  b15inv000ar1n03x5 U3056 ( .a(n3638), .o1(n3635) );
  b15inv000ar1n03x5 U3252 ( .a(n3628), .o1(n3631) );
  b15inv000ar1n03x5 U3191 ( .a(u_device_sm_s_dummy_cycles[5]), .o1(n3194) );
  b15inv000ar1n03x5 U3258 ( .a(u_device_sm_s_dummy_cycles[2]), .o1(n3185) );
  b15nor003ar1n06x5 U3831 ( .a(u_spi_device_tlul_plug_state[1]), .b(n3310), 
        .c(n3308), .o1(n3309) );
  b15inv000ar1n03x5 U3772 ( .a(n3282), .o1(n3280) );
  b15nonb03ar1n02x5 U3795 ( .a(u_syncro_valid_reg[1]), .b(
        u_spi_device_tlul_plug_state[1]), .c(u_syncro_valid_reg[2]), .out0(
        n3307) );
  b15inv000ar1n03x5 U3115 ( .a(u_rxreg_data_int[29]), .o1(n2799) );
  b15inv000ar1n03x5 U3141 ( .a(u_rxreg_data_int[18]), .o1(n2806) );
  b15inv000ar1n03x5 U3142 ( .a(u_rxreg_data_int[21]), .o1(n2814) );
  b15inv000ar1n03x5 U3151 ( .a(u_rxreg_data_int[12]), .o1(n2816) );
  b15inv000ar1n03x5 U3156 ( .a(u_rxreg_data_int[24]), .o1(n2812) );
  b15inv000ar1n03x5 U3145 ( .a(u_rxreg_data_int[9]), .o1(n2804) );
  b15inv000ar1n03x5 U3148 ( .a(u_rxreg_data_int[15]), .o1(n2820) );
  b15inv000ar1n03x5 U3120 ( .a(u_rxreg_data_int[27]), .o1(n2810) );
  b15inv000ar1n05x5 U2925 ( .a(spi_cs), .o1(n3776) );
  b15inv000ar1n03x5 U3278 ( .a(n2908), .o1(n2906) );
  b15inv000ar1n03x5 U3798 ( .a(n3286), .o1(n3284) );
  b15inv000ar1n03x5 U3248 ( .a(n3612), .o1(n2896) );
  b15inv000ar1n06x5 U2928 ( .a(spi_cs), .o1(n3778) );
  b15inv000ar1n06x5 U2914 ( .a(spi_cs), .o1(n3769) );
  b15nonb02ar1n02x3 U3537 ( .a(n3039), .b(n3822), .out0(u_device_sm_N186) );
  b15nonb02ar1n02x3 U3612 ( .a(n3102), .b(n3822), .out0(u_device_sm_N184) );
  b15inv000ar1n06x5 U2927 ( .a(spi_cs), .o1(n3777) );
  b15inv000ar1n03x5 U3397 ( .a(n2967), .o1(u_txreg_N25) );
  b15inv000ar1n03x5 U3094 ( .a(n2815), .o1(u_rxreg_N41) );
  b15inv000ar1n03x5 U3090 ( .a(n2803), .o1(u_rxreg_N38) );
  b15inv000ar1n03x5 U3406 ( .a(n2969), .o1(u_txreg_N27) );
  b15inv000ar1n03x5 U3079 ( .a(n2784), .o1(u_rxreg_N58) );
  b15inv000ar1n03x5 U3098 ( .a(n2819), .o1(u_rxreg_N44) );
  b15inv000ar1n03x5 U3096 ( .a(n2809), .o1(u_rxreg_N56) );
  b15inv000ar1n03x5 U3084 ( .a(n2811), .o1(u_rxreg_N53) );
  b15inv000ar1n03x5 U3092 ( .a(n2805), .o1(u_rxreg_N47) );
  b15inv000ar1n03x5 U3088 ( .a(n2813), .o1(u_rxreg_N50) );
  b15inv000ar1n03x5 U3080 ( .a(n2776), .o1(u_rxreg_N35) );
  b15inv000ar1n03x5 U3086 ( .a(n2807), .o1(u_rxreg_N55) );
  b15inv000ar1n03x5 U3081 ( .a(n2777), .o1(u_rxreg_N33) );
  b15inv000ar1n03x5 U3404 ( .a(n2968), .o1(u_txreg_N29) );
  b15bfn000ar1n02x5 U3031 ( .a(en_quad), .o(n3812) );
  b15bfn000ar1n02x5 U3469 ( .a(en_quad), .o(n3912) );
  b15bfn000ar1n02x5 U3027 ( .a(n1869), .o(n3808) );
  b15aoi022ar1n04x5 U2937 ( .a(n3806), .b(n2798), .c(n2776), .d(n3807), .o1(
        ctrl_data_rx[6]) );
  b15aoi022ar1n04x5 U2946 ( .a(n3806), .b(n2787), .c(n2777), .d(n3807), .o1(
        ctrl_data_rx[4]) );
  b15oaoi13ar1n02x5 U3187 ( .c(n2829), .d(n2828), .b(n2827), .a(n2835), .o1(
        n3664) );
  b15aoi112ar1n02x3 U3388 ( .c(u_txreg_counter_trgt[0]), .d(n2958), .a(n2957), 
        .b(n2956), .o1(n2959) );
  b15aoi122ar1n02x3 U3823 ( .b(n3298), .c(tl_i[15]), .d(tl_i[62]), .e(tl_i[14]), .a(n3297), .o1(n3299) );
  b15bfn000ar1n03x5 U3467 ( .a(n3002), .o(n3910) );
  b15bfn000ar1n03x5 U3463 ( .a(n3015), .o(n3906) );
  b15bfn000ar1n03x5 U3466 ( .a(n3018), .o(n3909) );
  b15bfn000ar1n03x5 U3458 ( .a(n3009), .o(n3901) );
  b15bfn000ar1n03x5 U3464 ( .a(n3004), .o(n3907) );
  b15bfn000ar1n03x5 U3459 ( .a(n3006), .o(n3902) );
  b15bfn000ar1n02x5 U3454 ( .a(n3020), .o(n3897) );
  b15aboi22ar1n02x3 U3809 ( .c(tl_i[57]), .d(tl_i[64]), .a(tl_i[64]), .b(n3288), .out0(n3305) );
  b15aoi112ar1n02x3 U3390 ( .c(n2962), .d(u_txreg_counter_trgt[5]), .a(n2961), 
        .b(n2960), .o1(n2965) );
  b15aoi112ar1n02x3 U3267 ( .c(u_dcfifo_rx_u_din_full_full_up), .d(
        u_dcfifo_rx_u_din_full_latched_full_s), .a(n3822), .b(n2898), .o1(
        u_dcfifo_rx_u_din_write_enable) );
  b15bfn000ar1n03x5 U3512 ( .a(n3011), .o(n3930) );
  b15bfn000ar1n03x5 U3532 ( .a(rst_ni), .o(n3942) );
  b15oai112ar1n02x5 U3393 ( .c(u_txreg_counter_trgt[2]), .d(n2980), .a(n2965), 
        .b(n2964), .o1(n2981) );
  b15bfn000ar1n02x5 U3485 ( .a(n3922), .o(n3917) );
  b15bfn000ar1n02x5 U3509 ( .a(n2919), .o(n3929) );
  b15xor002ar1n02x5 U3873 ( .a(n3328), .b(n3327), .out0(tl_o[13]) );
  b15nonb02ar1n02x3 U3308 ( .a(u_txreg_data_int[30]), .b(n3815), .out0(
        spi_sdo2) );
  b15nonb02ar1n02x3 U3310 ( .a(u_txreg_data_int[29]), .b(n3815), .out0(
        spi_sdo1) );
  b15nonb02ar1n02x3 U3309 ( .a(u_txreg_data_int[31]), .b(n3815), .out0(
        spi_sdo3) );
  b15bfn000ar1n02x5 U3518 ( .a(n3800), .o(n3934) );
endmodule

