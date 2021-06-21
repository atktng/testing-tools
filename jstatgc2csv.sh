#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: ./jstatgc2csv.sh <jstatgc_log_file>"
else
  LOG_IN=$1
  LOG_OUT=${LOG_IN}.csv
  sed -e 's/  */,/g' "${LOG_IN}" > "${LOG_OUT}"
fi
