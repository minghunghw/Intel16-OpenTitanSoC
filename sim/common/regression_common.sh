function echolog {
	echo -e $1
	echo -e $1 >> $LOG_FILE
}

function postrun_steps {
	tname=$1
	make_exit_code=$2
	cp vcs.log $LOG_DIR/$tname.vcs.log
	if [ -f vcs.log ]; then
		count=$(wc -l vcs.log | cut -d' ' -f1)
		if [ $count -eq 0 ]; then
			rm vcs.log
		fi
	fi
	if [ -f vcs.log ]; then
		num_compiled=$((num_compiled + 1))
		passed=$(grep "SUCCESS" vcs.log | wc -l)
		if [ $passed -gt 1 ]; then
			echolog "There should only be 1 SUCCESS token"
			return -1
		elif [[ $passed -eq 1 ]] && [[ $make_exit_code -eq 0 ]]; then
			num_passed=$((num_passed + 1))
		fi
		rm vcs.log
	fi
}

function prerun_steps {
    logs=*.log
    if [ -f "$logs" ]; then
        rm $logs
    fi
    if [ -d $LOG_DIR ]; then
        rm -rf $LOG_DIR
    fi
    mkdir $LOG_DIR
}

function regress_report {
    echolog "Testbench summary:"
    echolog "\t Total: $num_total"
    echolog "\t Compiled: $num_compiled"
    echolog "\t Passed: $num_passed"

    echolog "Testbenches that didn't compile:"
    if [ $num_compiled -eq $num_total ]; then
        echolog "\t None"
    else
    	for t in $TESTS; do
			if [ ! -f $LOG_DIR/$t.vcs.log ]; then
				echolog "\t $t"
			fi
		done
	fi

	echolog "Testbenches that compiled and failed:"
	if [ $num_compiled -eq $num_passed ]; then
		echolog "\t None"
	else
		grep "FAILED" $LOG_DIR/*
	fi
}


num_total=$(echo $TESTS | wc -w)
num_compiled=0
num_passed=0