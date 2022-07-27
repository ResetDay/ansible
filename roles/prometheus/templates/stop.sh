#!/usr/bin/env bash

process_info=`ps -ef|grep prometheus|grep -v grep|grep -v stop`
echo $process_info
if [ "$process_info" = "" ]; then
  exit 0
fi

echo $process_info |awk  '{print $2}'|xargs kill -9