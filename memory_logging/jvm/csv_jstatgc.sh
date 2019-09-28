#/bin/sh

JSTAT_INTERVAL=1000  # ms
GC_INTERVAL=3600     # ms

LOG_CSV=jstatgc_`hostname`_`date "+%Y%m%d"`.csv
LOG_DIR=`pwd`

if [ $# -ne 1 ]; then
  echo "Usage: ./jstat_gc.sh [JVM_PID]"
  exit 1
else
  PID=$1
  jstat -gc ${PID} ${JSTAT_INTERVAL} | gawk '{print strftime("%Y/%m/%d-%H:%M:%S"), $0; fflush();}' | sed -e 's/^  *//g; s/  */,/g' >> $LOG_CSV
fi
