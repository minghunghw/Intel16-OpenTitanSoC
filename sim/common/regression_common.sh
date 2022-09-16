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
         if [[ ${#variants[@]} -gt 0 ]]; then
            for v in ${variants[$t]}; do
               if [ ! -f $LOG_DIR/$t.$v.run.log ]; then
                  echolog "\t $t.$v"
               fi
            done
         else
            if [ ! -f $LOG_DIR/$t.run.log ]; then
               echolog "\t $t"
            fi
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
