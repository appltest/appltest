#!/bin/sh

OUT="/tmp/task4"
while true; do
 echo -n "ts: "`date +%s`" " >> $OUT
 read L1 L5 L15 REST </proc/loadavg; echo -n "load1: $L1 load5: $L5 load15: $L15 " >> $OUT;
 curl -m 1 -s 127.0.0.1/nginx_status | sed -e '2d' -e '3s/^\s*\([0-9][0-9]*\) \([0-9][0-9]*\) \([0-9][0-9]*\).*$/accepts: \1 handled: \2 requests: \3/' | tr "\n" " " >> $OUT
 echo "" >> $OUT
 sleep 2;
done

