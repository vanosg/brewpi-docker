FROM resin/rpi-raspbian
MAINTAINER Geo VO <george.vo@alum.rpi.edu>

RUN apt-get update && apt-get install -y build-essential python-dev python-pip git
RUN pip install pyserial psutil simplejson configobj gitpython --upgrade
RUN adduser --disabled-password --gecos "" brewpi
RUN bash -c "echo -e \"brewpi\nbrewpi\"|passwd brewpi"
RUN usermod -a -G www-data,dialout brewpi
RUN mkdir /home/brewpi/logs
RUN chown -R brewpi:brewpi /home/brewpi
RUN find "/home/brewpi" -type d -exec chmod g+rwxs {} \;
RUN apt-get install -y cron ed
WORKDIR /home/brewpi/
RUN git clone https://github.com/BrewPi/brewpi-script 
RUN bash -c /home/brewpi/brewpi-script/utils/updateCron.sh
ENTRYPOINT python -u /home/brewpi/brewpi-script/brewpi.py 1>/home/brewpi/logs/stdout.txt 2>>/home/brewpi/logs/stdout.txt
