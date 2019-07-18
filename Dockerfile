FROM scrapinghub/splash

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN apt-get update && apt-get install monit -y
RUN mkdir /install
COPY splash.conf start.sh stop.sh /install/
RUN chmod u+x /tini && chmod u+x /install/stop.sh && chmod u+x /install/start.sh && chmod 0700 /install/splash.conf
ENTRYPOINT ["/tini", "--", "monit", "-c", "/install/splash.conf"]
