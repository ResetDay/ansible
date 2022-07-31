#!/usr/bin/env bash

EXEC={{ install_dir }}/node_exporter

COUNT=`ps -ef|grep $EXEC|grep -v grep|wc -l`

stop() {
  if [ 0 == $COUNT ]; then
    echo "$EXEC is already stopping! "
  else
    echo "Stopping $EXEC"
    ps -ef|grep $EXEC|grep -v grep|awk  '{print $2}'|xargs kill -9
    COUNT=0
  fi
}

start() {
  if [ 0 == $COUNT ]; then
    echo -n "Starting $EXEC"
    nohup $EXEC $1 >> {{ install_dir }}/log.log 2>&1 &
  else
    echo "$EXEC is already starting! "
  fi
}

restart ()
{
  stop
  sleep 1
  start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status $EXEC
    ;;
  restart)
    restart
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
esac