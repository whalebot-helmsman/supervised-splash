FROM whalebothelmsman/splash

USER root
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN apt-get update && apt-get install monit -y
RUN mkdir /install
COPY init.sh splash.conf start.sh stop.sh clean_logs.sh /install/
RUN chmod u+x /tini && \
    chmod u+x /install/init.sh && \
    chmod u+x /install/stop.sh && \
    chmod u+x /install/start.sh && \
    chmod u+x /install/clean_logs.sh && \
    chmod 0700 /install/splash.conf

RUN chown splash:splash /tini
RUN chown splash:splash -R /install

USER splash:splash
ENTRYPOINT ["/install/init.sh", \
    "--proxy-profiles-path /etc/splash/proxy-profiles", \
    "--js-profiles-path", "/etc/splash/js-profiles", \
    "--filters-path", "/etc/splash/filters", \
    "--lua-package-path", "/etc/splash/lua_modules/?.lua" ]
