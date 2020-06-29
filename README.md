# supervised-splash

This is a containerization of [splash](https://splash.readthedocs.io/en/stable/)
usable for self-hosting with next problems fixed:

* processing specific pages leads to exsessive CPU consumption and unresponsevness
of instance
* exsessive logging
* https://github.com/scrapinghub/splash/issues/313 is fixed

Image based on [official image](https://hub.docker.com/r/scrapinghub/splash).
Monit is added to monitor for problems and resolving them
