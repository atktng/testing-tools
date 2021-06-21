#!/bin/sh

PID=
GC_INTERVAL_MS=3600

watch -n ${GC_INTERVAL_MS} -t jmap -histo:live ${PID} &
