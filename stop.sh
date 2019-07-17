#!/bin/sh
set -e

/usr/bin/pkill -9 -P `cat /install/splash.pid`
rm /install/splash.pid
