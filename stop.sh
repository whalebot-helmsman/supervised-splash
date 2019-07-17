#!/bin/sh

/usr/bin/pkill -9 -P `cat /install/splash.pid`
rm /install/splash.pid
