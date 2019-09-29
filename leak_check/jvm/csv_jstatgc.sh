#/bin/sh

JSTAT_INTERVAL=1000  # ms
GC_INTERVAL=3600     # ms

LOG_CSV="jstatgc_`hostname`_`date "+%Y%m%d"`.csv"
LOG_DIR=`pwd`


if [ $# -ne 1 ]; then
  echo "Usage: ./jstat_gc.sh [JVM_PID]"
  exit 1
else
  PID=$1
  jstat -gc -t ${PID} ${JSTAT_INTERVAL} \
    | gawk '{print strftime("%Y-%m-%dT%H:%M:%SZ"), $0; fflush();}' \
    | sed -e 's/^  *//g; s/  */,/g' \
    >> ${LOG_DIR}/${LOG_CSV} &

  watch -n ${GC_INTERVAL} -t jmap -histo:live ${PID} &
fi
