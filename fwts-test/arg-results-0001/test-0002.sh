#!/bin/bash
#
TEST="Test -r option"
NAME=test-0002.sh
TMPLOG=$TMP/results_$$.log

$FWTS --log-format="%line %owner " -w 80 --klog=klog.txt klog -r $TMPLOG >& /dev/null
grep "^[0-9]*[ ]*klog" $TMPLOG | cut -c7- > $TMPLOG.filtered
diff $TMPLOG.filtered results.log >> $FAILURE_LOG
ret=$?
if [ $ret -eq 0 ]; then 
	echo PASSED: $TEST, $NAME
else
	echo FAILED: $TEST, $NAME
fi

rm $TMPLOG $TMPLOG.filtered
exit $ret
