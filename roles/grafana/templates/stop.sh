#!/usr/bin/env bash

ps -ef|grep {{ install_dir }}/bin/grafana-server|grep -v grep|awk  '{print $2}'|xargs kill -9