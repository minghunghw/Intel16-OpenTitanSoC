package FlowSpec;

#use strict;
no strict "subs";
use warnings;
no warnings 'redefine';

use RTLUtils;
use Utils;

use vars qw(%FlowSpec);

use lib "$ENV{RTL_PROJ_BIN}/perllib";
use ToolConfig;

%FlowSpec = (
    %FlowSpec,
    compile_flow => ordered_hash(
        aceshell  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "xterm &",
            },
        },
        vcs_lp_compile  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -c -elab_models -use_sim_lp_compile_opts -use_sim_lp_mcrd -enable_pwr_intent",
            },
        },
        vcs_compile  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -c -elab_models -use_sim_compile_opts -use_sim_mcrd",
            },
        },
        vericom_compile  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccod -use_sim_compile_opts",
            },
        },
        ufe_lp_compile  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccud -elab_models -use_sim_lp_compile_opts -use_sim_lp_mcrd -enable_pwr_intent",
            },
        },
        ufe_compile  => {
            stage             => 'ace_command',
            default_active    => "on", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccud -elab_models -use_sim_compile_opts -use_sim_mcrd",
            },
        },
        hierdump  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -ccud -elab_models -use_sim_compile_opts -use_hierdump_mcrd -elab_opts -config_verbose -enable_hier_dump",
            },
        },              

        # Need lp/mpp versions of these stages?
        # synth/dc stages here or in febe?
        emu_compile  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -emul -ASSIGN -hdl_compiler=emul -ignore_filtered_deplib_error -use_emu_compile_opts",
            },
        },
        fpga_compile  => {
            stage             => 'ace_command',
            default_active    => "off", 
            deps              => [qw()],
            opts => {
                command       => "ace -fpga -ASSIGN -hdl_compiler=fpga -ignore_filtered_deplib_error -use_fpga_compile_opts",
            },
        },
    )
);

