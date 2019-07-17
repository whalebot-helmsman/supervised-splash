FROM scrapinghub/splash

RUN apt-get update && apt-get install monit -y
RUN mkdir /install
COPY splash.conf start.sh stop.sh /install/
RUN chmod u+x /install/stop.sh && chmod u+x /install/start.sh && chmod 0700 /install/splash.conf
ENTRYPOINT ["monit", "-c", "/install/splash.conf"]
