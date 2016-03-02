from sdhibit/rpi-raspbian
MAINTAINER Geo Van O <george.vo@alum.rpi.edu>

RUN apt-get update && apt-get install -y subversion
RUN svn checkout --trust-server-cert https://github.com/BrewPi/brewpi-script/trunk/settings /home/brewpi/settings
RUN svn checkout --trust-server-cert https://github.com/BrewPi/brewpi-script/trunk/data /home/brewpi/data
VOLUME /home/brewpi/data
VOLUME /home/brewpi/settings
ENTRYPOINT /usr/bin/tail -f /dev/null
