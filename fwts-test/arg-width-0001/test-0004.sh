#!/bin/bash
#
TEST="Test -w 1000"
NAME=test-0004.sh
TMPLOG=$TMP/klog.log.$$

$FWTS --log-format="%line %owner " -w 1000 --klog=klog.txt klog - | grep "^[0-9]*[ ]*klog" | cut -c7- > $TMPLOG
diff $TMPLOG klog-0004.log >> $FAILURE_LOG
ret=$?
if [ $ret -eq 0 ]; then 
	echo PASSED: $TEST, $NAME
else
	echo FAILED: $TEST, $NAME
fi

rm $TMPLOG
exit $ret
