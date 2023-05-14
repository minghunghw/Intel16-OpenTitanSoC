package ace_aliases_TREX;
use strict;
use TRex_lib;
use ToolConfig;
use File::Basename;
use Getopt::Long;
use Cwd;
use Carp;
use vars qw(%ace_aliases_args @ace_aliases_Switches $run_date);


sub TREX_INIT
{
  TRex_lib::log("Initializing ace_aliases TRex module...\n");
  @ace_aliases_Switches = ('-use_sim_mcrd', '-use_lint_mcrd', '-use_lint_svtb_mcrd', '-use_cdc_mcrd', '-use_sim_lp_mcrd', '-copy_dump_hier', '-dump_hier_dest_path:');
  my @tempSwitches = @ace_aliases_Switches;
  foreach (@tempSwitches)
  {
          s/^\-+//;
          s/:$//;
  }
  #push(@{$Project_Config::TRex_CmdLine{'Hidden flags'}},@tempSwitches);
  push(@{$Project_Config::Rerun{'Common'}{'Drop switches'}},@tempSwitches);

  # Add ace_aliases switches to TREX's command line supported switches.
  push(@{Project_Config::TRex_CmdLine_Get_Switches()},@ace_aliases_Switches);
  Project_Config::Intercept_Stage('BUILD-TEST', \&ace_aliases_init);
  Project_Config::Intercept_Stage('END', \&ace_aliases_end);
}


# ==
# Called at the beginning of the test (test build stage)
# ===

sub ace_aliases_init
{
    TRex_lib::log("ace_aliases_Trex inside ace_aliases_init\n");
    if ($main::found_opt{'use_sim_mcrd'})
    {
        push(@{$main::Test_Info{'Model_Tool_Args'}}, "-ace_args -model_compile_results_dir $ENV{MODEL_ROOT}/target/$ENV{DUT}/results/sim -simv_args -assert,nopostproc -ace_args-");
    }
    elsif ($main::found_opt{'use_sim_lp_mcrd'}) 
    {
        ## added by request of Yael & Harbaksh
        push(@{$main::Test_Info{'Model_Tool_Args'}}, "-ace_args -model_compile_results_dir $ENV{MODEL_ROOT}/target/$ENV{DUT}/results/sim_lp -ace_args-");
    }
    elsif ($main::found_opt{'use_lint_mcrd'})
    {
        push(@{$main::Test_Info{'Model_Tool_Args'}}, "-ace_args -model_compile_results_dir $ENV{MODEL_ROOT}/target/$ENV{DUT}/results/lint -ace_args-");
    }
    elsif ($main::found_opt{'use_lint_svtb_mcrd'})
    {
        push(@{$main::Test_Info{'Model_Tool_Args'}}, "-ace_args -model_compile_results_dir $ENV{MODEL_ROOT}/target/$ENV{DUT}/results/lint/svtb -ace_args-");
    }
    elsif ($main::found_opt{'use_cdc_mcrd'})
    {
        push(@{$main::Test_Info{'Model_Tool_Args'}}, "-ace_args -model_compile_results_dir $ENV{MODEL_ROOT}/target/$ENV{DUT}/results/cdc -ace_args-");        
    }
}

sub ace_aliases_end
{
    # don't do anything if this is not an Ace run
    return unless $main::found_opt{'ace'};

    TRex_lib::log("ace_aliases_Trex inside ace_aliases_end\n");
    if ($main::found_opt{'copy_dump_hier'} || $main::found_opt{'dump_hier_dest_path'})
    {
        my $dest_file_path = "$ENV{MODEL_ROOT}/target/$ENV{DUT}/log/acerun.log.gz";
        $dest_file_path = $main::opt{'dump_hier_dest_path'}[-1] if(defined($main::opt{'dump_hier_dest_path'}[-1]));
        my $cmd = "/usr/intel/bin/gzip acerun.log && /bin/cp -f acerun.log.gz $dest_file_path "; 
        TRex_lib::exec_and_check_error($cmd);        
    }
}

1;
