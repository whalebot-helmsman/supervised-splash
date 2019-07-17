#!/bin/sh
set -e

/usr/bin/pkill -9 -P `cat /install/splash.pid`
/bin/kill -9 `cat /install/splash.pid`
rm /install/splash.pid
