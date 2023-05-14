# -*-perl-*-

# Intel Confidential                                                        
# Copyright 2021 Intel Corporation.                                         
# The information contained herein is the proprietary and confidential      
# information of Intel or its licensors, and is supplied subject to, and    
# may be used only in accordance with, previously executed agreements       
# with Intel ,                                                                                                   
# EXCEPT AS MAY OTHERWISE BE AGREED IN WRITING:                            
# (1) ALL MATERIALS FURNISHED BY INTEL HEREUNDER ARE PROVIDED "AS IS"      
#      WITHOUT WARRANTY OF ANY KIND;                            
# (2) INTEL SPECIFICALLY DISCLAIMS ANY WARRANTY OF NONINFRINGEMENT, FITNESS 
#      FOR A PARTICULAR PURPOSE OR MERCHANTABILITY; AND                     
# (3) INTEL WILL NOT BE LIABLE FOR ANY COSTS OF PROCUREMENT OF SUBSTITUTES, 
#      LOSS OF PROFITS, INTERRUPTION OF BUSINESS, OR                       
#      FOR ANY OTHER SPECIAL, CONSEQUENTIAL OR INCIDENTAL DAMAGES,        
#      HOWEVER CAUSED, WHETHER FOR BREACH OF WARRANTY, CONTRACT,            
#      TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE.                     


{
################################################################################
# Note: All regular expressions must be placed with single quotes '/example/i'
#  instead of double quotes "/example/i"
################################################################################
# If this variable is set, the config files in the list are first read in the
#   order listed (so it is possible to overwrite information from an ealier
#   cfgfile.)  Then the remainder of this file is parsed so that the information
#   contained within this file has the highest precedence.
#
# Note: Only one level of hierarchy can exist (so a file listed here cannot then
#   call an additional base config file.)
#
################################################################################
@BASE_CFG_FILES = ();

%PATTERNS_DEF = (
    # Each of the defined "modes" are checked inside of postsim.pl.  If no modes
    #   are ever "turned on" the test is automatically a fail.
    Modes => {

        AceDefault => {
            Required     => 1,
            StartString  => '/ACE SIM OUTPUT START/',
            EndString    => '/ACE SIM OUTPUT END/',
            RequiredText => [ 
	                      '/(Note: \$finish|\$finish at simulation time)/',
                            ],
            okErrors     => [
	                     '/\*Verdi3\* ERROR:/', 
	                     '/error/',
			     '/dontStopOnSimulError/',
                             '/_response_policy: ABORT_ON_ERROR/',
                             '/Number of demoted UVM_FATAL reports\s+:\s+0/',
                             '/Number of demoted UVM_ERROR reports\s+:\s+0/',
                             '/Number of caught UVM_FATAL reports\s+:\s+0/',
                             '/Number of caught UVM_ERROR reports\s+:\s+0/',
                             '/UVM_ERROR\s+:\s+0\s*$/',
                             '/UVM_FATAL\s+:\s+0\s*$/',
			     ],

            #okErrors_multiLine => [
            #[3, "/ERROR.*\(introduced error\)/", "/At time/", "/ERROR - example multi-line error/"],
            #],
        },
        _dump_hier => {
            Ignore => 1,
            Required => 0,
            StartString  => '/# ACE SIM OUTPUT START/',
            RequiredText => [ '/Dumping RTL hierarchy file to/i',
                            ],
            EndString => '/ACE SAFE TO PARSE/',
            okErrors => [ '/error/i' ],
            
        }, #_dump_hier mode
         
        #NLP related Modes
        "NLP_reg_read" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/Reading register contents/',
            EndString    => '/Finished reading register contents/',
            RequiredText => [ '/Reading 0000abcd from GPRS reg 0/',
                              '/Reading 00111111 from GPRS reg 1/',
                              '/Reading 00222222 from GPRS reg 2/',
                              '/Reading 00333333 from GPRS reg 3/',
                              '/Reading 00444444 from GPRS reg 4/',
                            ],
            okErrors     => undef,
        },
        "NLP_reg_restore" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/Verifying restored values/',
            EndString    => '/Finished verifying restored values/',
            RequiredText => [ '/Reading 0000abcd from GPRS reg 0/',
                              '/Reading 00111111 from GPRS reg 1/',
                              '/Reading 00222222 from GPRS reg 2/',
                              '/Reading 00333333 from GPRS reg 3/',
                              #       '/Reading 00444444 from GPRS reg 4/',
                            ],
        },

        #CDC related checks
        "AceCDC_default" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/ACE SIM OUTPUT START/',
            EndString    => '/End 0in log/',
            RequiredText => [ '/Final Process Statistics:/',
                            ],
            okErrors     => [ '/error/i',
                            ],
        },
        "AceCDC_summary" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/CDC Results/',
            EndString    => '/ACE SIM OUTPUT END/',
            RequiredText => [ '/Violations \(0\)/',
                            ],
            okErrors     => [ '/error/i',
                            ],
        },
        
        
        "AceDefault_JG" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/JASPERGOLD EXECUTION START/',
            EndString    => '/JASPERGOLD EXECUTION DONE/',
            RequiredText => [ 
                             '/Verification Results/',
                            ],
            okErrors     => [ '/Warning Summary/',
                              '/- error\s*: 0 (0%)/',
                              '/- error\s*: 0/',
                              '/No errors found/i',
                            ],
        },

        
        "AceSpyglass_default" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/SPYGLASS EXECUTION START/',
            EndString    => '/SPYGLASS EXECUTION DONE/',
            RequiredText => [ '/SpyGlass Exit Code 0/', 
                            ],
            okErrors     => [ '/[,:]\s*\(?\s*0 [Ee]rrors*,/',
                              '/NOTE: It is recommended to first fix.*error/',
                              '/Please re-run SpyGlass once .*error clean/',
                              '/checking completed without errors/', 
                              '/checking completed with errors/', 
                            ],
        },
        "AceDC_default" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/^DC EXECUTION START/',
            EndString    => '/^DC EXECUTION DONE/',
            RequiredText => [ /DC RC=0/ ],
            okErrors     => [ '/^\s*puts\s+.*error/i',
                              '/\-error_count/',
                            ],
        },
        "AceLintra_default" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/ACE SIM OUTPUT START/',
            EndString    => '/ACE SIM OUTPUT END/',
            RequiredText => [ '/RC = 0/',
                              '/Lint status PASSED/',
                            ],
            okErrors     => [ '/severity: Error/',
                            ],
        },
        "AceLira_default" => {
            Ignore      => 1,
            Required     => 0,
            StartString  => '/ACE SIM OUTPUT START/',
            EndString    => '/ACE SIM OUTPUT END/',
            RequiredText => [ '/RC = 0/',
                              '/Summary - 0 error/',
                            ],
            okErrors     => [ '/Total errors and warnings issued by code/',
                              '/Summary - 0 error/',
                            ],
        },
    },  #end for Modes definitions

    # List of classified errors to look for.
    # The parser searchs for 'All' first. Then tries to classify
    # For instance,
    # # ** Error: static memory checker error : C17 : - SRAM - ....
    # The above error is matches first with the 'All' regular expression.
    # Then it matches with the '1 Static_Mem' classification.
    # The Number in front of classification is used to order the
    # error types, ie, 1 is more serious than 2.
    #
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # NOTE: These errors are only matched when one of the above "modes" is active,
    #  otherwise they are IGNORED!!!
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    Errors => [
        # Error regular expr                                            Category    Severity
        [ '/Error/i',						         "ALL",       1        ],
        [ '/Fatal/i',						         "ALL",       1        ],
        [ '/Quit count reached!/i',                                      "ALL",       1        ],
	[ '/SpyGlass\s+Terminated\s+abnormally/i',                       "ALL",       1        ],
        [ '/Error\s*-\s*Test\s*failed\s*due\s*to\s*(.*)\s*in gears/i',   "ALL",       3        ],
        [ '/^\s*\-E\-/',                                                 "ALL",       3        ],
        [ '/Unable\s+to\s+resolve\s+reference/',                         "ALL",       3        ],
        [ '/read\s+miscompare/',                                         "Read",      1        ],
        [ '/Test\s+Exit\s*:\s+processor\s+\d+\s+failed/i',               "ASM_Fail",  1        ],
    ],
    
    # Timeout strings which result in a postsim.fail with status of "Timeout"
    TimeoutErrors => [
        '/Simulation TIMEOUT reached/i',
    ],
    
    # This is a list of errors which are to be considered FATAL errors regardless of
    # whether they show up before or after the "StartOn" or "EndOn" conditions.
    FatalErrors => [
        '/Error - Test failed due to phase of moon/',
        '/Instantiation of \'tui_unit\' failed/',
    ],
    # Defines a list of warnings to look for
    Warnings     => [
        '/warning/i',
        '/Number of blackboxes\s*=\s*[1-9][0-9]*/',
        '/Cautions \([1-9][0-9]*\)/',
    ],
    
    # Defines a list of errors which are 'safe' to ignore
    #  - if you add any, be careful to create the regexp so that it will not ignore more than you intend
    #
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # NOTE: These errors will be ignored globally (ie. for any of the "modes")
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    okErrors     => [
        '/OVM_ERROR\s*:\s*0\s*$/',  #ignore the summary line saying there were no ovm errors
        '/OVM_FATAL\s*:\s*0\s*$/',  #ignore the summary line saying there were no ovm fatals there were
        '/ERRORS\s*[=:]\s*0\s*/i',  #ignore any summary line saying there were no errors 
        '/FATALS\s*[=:]\s*0\s*/i',  #ignore any summary line saying there were no fatals 
        '/ERROR\s*=\s*0\s*,/i',
        '/FATAL\s*=\s*0\s*,/i',
        '/FATAL\s*=\s*0\s*/i',
        '/\- 0 DUT errors, 0 DUT warnings/',
        # Ignore this because VCS is also printing it for Warnings. Also to avoid need for multiple okErrors as workarounds.
        '/\[Warning\/Error Signature:/',	
    ],
    okErrors_multiLine => [
        ##[<N lines per error message>, <match pattern for first line>, ..   , <line N-1 pattern> , <line N pattern ],
        #[3, "/ERROR.*\(introduced error\)/", "/At time/", "/ERROR - example multi-line error/"],
        
        #[7, 
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 1800 data 00000000.*/', 
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 1c00 data 00000000.*/',
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 2000 data 00000000.*/',
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 2800 data 00000000.*/',
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 3800 data 00000000.*/',
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 5400 data 00000000.*/',
        # '/.*OVM_ERROR.*FROM PMC LEFT IN QUEUE WITHOUT EXPECTED MSG.*dest a9 src 52 opcode 07 address 2400 data 0000f001.*/'
        #],
    ],
    
    # Any additional information that is required from the logfile can be entered here:
    #
    # This is what is already extracted:
    #   Test name:
    #   Test type:  (Verilog procedural or Xscale assembly)
    #   Status:
    #   Cause: (for fails only)
    #   Error Count: 
    #   Warning Count:
    #   SIMPLI Error Count:
    #   SIMPLI Check Count:
    
    ## Default test type is "proc" procedural.  Gets changed to "asm" for assembly if the
    ##  following regular expression matches in the transcript.
    TestType     => {
        Default => {
            regex   => undef,
            keyword => "Proc",
        },
        Assembly => {
            regex   => '/Reading test memory image/',
            keyword => "Asm",
        },
    },
    
    TestInfo     => [
        # Use this to add to, or overwrite the standards
        # defined in $ACE_HOME/udf/ace_test_info.pp
    ],
    
    # Simple calulations based on contents of the 'TestInfo' array
    Calculations => {
        SimRate => '($TestInfo{Runtime} != 0) ? $TestInfo{Cycles}/$TestInfo{Runtime} : 0',
    },
);

};

