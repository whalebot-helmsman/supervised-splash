# supervised-splash

This is a containerization of [splash](https://splash.readthedocs.io/en/stable/)
usable for self-hosting with next problems fixed:

* processing specific pages leads to exsessive CPU consumption and unresponsevness
of instance
* exsessive logging
* https://github.com/scrapinghub/splash/issues/313 is fixed

Image based on [image with CSP fix](https://hub.docker.com/repository/docker/whalebothelmsman/splash).
Monit is added to monitor for problems and resolving them
