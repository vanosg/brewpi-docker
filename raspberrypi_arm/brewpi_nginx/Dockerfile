FROM ckulka/rpi-nginx
MAINTAINER Geo Van O <george.vo@alum.rpi.edu>

RUN apt-get update && apt-get install -y git
ADD default.conf /etc/nginx/sites-available/default
ADD entrypoint.sh /
RUN rm /var/www/html/*
RUN chmod +x /entrypoint.sh
RUN git config --global http.sslVerify false
RUN git clone https://github.com/BrewPi/brewpi-www.git /var/www/html
VOLUME /var/www/html
EXPOSE 80
### MOVE ME!
RUN apt-get install -y iputils-ping
ADD default.conf /etc/nginx/sites-available/default
CMD ["/entrypoint.sh"]
