#!/usr/bin/env bash

count=`ps -ef|grep grafana-server|grep -v grep|wc -l`

if [ 0 != $count ]; then
  echo $count
  {{ install_dir }}/scripts/stop.sh
fi

nohup {{ install_dir }}/bin/grafana-server -homepath {{ install_dir }} >> /dev/null 2>&1 &