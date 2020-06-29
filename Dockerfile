FROM whalebothelmsman/splash

USER root
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN apt-get update && apt-get install monit -y
RUN mkdir /install
COPY splash.conf start.sh stop.sh clean_logs.sh /install/
RUN chmod u+x /tini && \
    chmod u+x /install/stop.sh && \
    chmod u+x /install/start.sh && \
    chmod u+x /install/clean_logs.sh && \
    chmod 0700 /install/splash.conf

RUN chown splash:splash /tini
RUN chown splash:splash -R /install

USER splash:splash
ENTRYPOINT ["/tini", "--", "monit", "-c", "/install/splash.conf"]
