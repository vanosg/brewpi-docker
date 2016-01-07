FROM nginx
MAINTAINER Geo Van O <george.vo@alum.rpi.edu>

RUN apt-get update && apt-get install -y git
RUN rm /etc/nginx/conf.d/default.conf
ADD default.conf /etc/nginx/conf.d/
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN git clone https://github.com/BrewPi/brewpi-www.git /var/www/html
VOLUME /var/www/html
CMD ["/entrypoint.sh"]
