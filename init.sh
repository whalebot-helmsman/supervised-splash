#!/usr/bin/env bash
echo "$@" > `dirname "$0"`/arguments

/tini -s -- monit -c /install/splash.conf
