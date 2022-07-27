#!/usr/bin/env bash

count=`ps -ef|grep prometheus|grep -v grep|grep -v start|wc -l`

if [ 0 == $count ]; then
  nohup {{ install_dir }}/prometheus --config.file={{ install_dir }}/{{ prometheus_config_file }} >> {{ install_dir }}/log.log 2>&1 &
fi

