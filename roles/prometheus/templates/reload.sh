#!/usr/bin/env bash

ps -ef|grep prometheus|grep -v grep|awk  '{print $2}'|xargs kill -HUP