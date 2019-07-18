#!/bin/sh
set -e
echo "Starting splash `date`" >> /install/splash.stdout
echo "Starting splash `date`" >> /install/splash.stderr

/usr/bin/python3 /app/bin/splash \
    --proxy-profiles-path /etc/splash/proxy-profiles \
    --js-profiles-path /etc/splash/js-profiles \
    --filters-path /etc/splash/filters \
    --lua-package-path /etc/splash/lua_modules/?.lua < /dev/null \
    >> /install/splash.stdout 2>> /install/splash.stderr &

echo $! > /install/splash.pid
