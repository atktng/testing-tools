#!/bin/sh

PID=
JSTAT_INTERVAL_MS=1000
LOG_FILE="jstatgc_`hostname`_`date -u "+%Y%m%d%H%M%S"`"

jstat -gc -t ${PID} ${JSTAT_INTERVAL_MS} | awk '{print $0; fflush();}' >> ${LOG_FILE}
