#!/bin/sh

PID=
INTERVAL_SEC=60
LOG_FILE="smaps_`hostname`_`date -u "+%Y%m%d%H%M%S"`"

echo 'Timestamp,PSS,RSS,USS' > ${LOG_FILE}

while true
do
  PSS=`cat /proc/${PID}/smaps | awk '/^Pss/{sum += $2}END{print sum}'`
  RSS=`cat /proc/${PID}/smaps | awk '/^Rss/{sum += $2}END{print sum}'`
  USS=`cat /proc/${PID}/smaps | awk '/^Private_Clean|Private_Dirty/{sum += $2}END{print sum}'`
  TIMESTAMP=`date -u +'%Y-%m-%dT%H:%M:%S.%3NZ'`
  echo ${TIMESTAMP},${PSS},${RSS},${USS} >> ${LOG_FILE}
  sleep ${INTERVAL_SEC}
done
