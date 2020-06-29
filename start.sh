#!/bin/sh
set -e
work_dir=`dirname "$0"`
arguments=`cat "$work_dir"/arguments`
echo "Starting splash `date`" >> /install/splash.stdout
echo "Starting splash `date`" >> /install/splash.stderr

/usr/bin/python3 /app/bin/splash $arguments \
    < /dev/null \
    >> /install/splash.stdout \
    2>> /install/splash.stderr &

echo $! > /install/splash.pid
