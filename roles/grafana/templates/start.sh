#!/usr/bin/env bash

COUNT=`ps -ef|grep {{ install_dir }}/bin/grafana-server|grep -v grep|wc -l`

if [ 0 != $COUNT ]; then
  {{ install_dir }}/scripts/stop.sh
fi

nohup {{ install_dir }}/bin/grafana-server -homepath {{ install_dir }} > /dev/null 2>&1 &