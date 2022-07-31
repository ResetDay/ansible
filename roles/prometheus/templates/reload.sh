#!/usr/bin/env bash

ps -ef|grep {{ install_dir }}/prometheus|grep -v grep|awk  '{print $2}'|xargs kill -HUP