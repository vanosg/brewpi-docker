FROM resin/rpi-raspbian
MAINTAINER Geo VO <george.vo@alum.rpi.edu>

RUN apt-get update && apt-get install -y build-essential python-dev python-pip git cron ed php5-fpm nginx
RUN pip install pyserial psutil simplejson configobj gitpython --upgrade
RUN useradd -G www-data,dialout brewpi
RUN bash -c "echo -e \"brewpi\nbrewpi\"|passwd brewpi"
RUN usermod -a -G www-data,dialout brewpi
RUN git clone https://github.com/BrewPi/brewpi-script /home/brewpi
RUN chown -R brewpi:brewpi /home/brewpi
RUN find "/home/brewpi" -type d -exec chmod g+rwxs {} \;
RUN rm -rf /var/www/html/*
RUN git clone https://github.com/BrewPi/brewpi-www /var/www/html
WORKDIR /home/brewpi/
ADD default.conf /etc/nginx/sites-enabled/default
RUN mkdir /brewpi
ADD entryscript.sh /root
RUN chmod +x /root/entryscript.sh
CMD "/root/entryscript.sh"
