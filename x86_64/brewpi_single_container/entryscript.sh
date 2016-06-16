#!/bin/bash

service nginx start
service php5-fpm start

if [ -z $system ]; then
  system="spark"
fi

if [ $system = "arduino" ]; then
  git checkout legacy
fi

if [ "$(ls -A /brewpi)" ]; then
  echo "Persistent files already present"
  rm -rf /home/brewpi/settings
  rm -rf /home/brewpi/data
  rm -rf /var/www/html/data
else
  sed -i '/wwwPath/c\wwwPath = /var/www/html' /home/brewpi/settings/defaults.cfg
  mv /home/brewpi/settings /brewpi/settings
  mv /home/brewpi/data /brewpi/data
  mv /var/www/html/data /brewpi/html_data
fi

ln -s /brewpi/settings /home/brewpi/settings
ln -s /brewpi/data /home/brewpi/data
ln -s /brewpi/html_data /var/www/html/data

chown -R www-data:www-data /brewpi/

sed -i '/wwwPath/c\wwwPath = /var/www/html' /home/brewpi/settings/defaults.cfg

stderrpath="/home/brewpi/logs/stderr.txt"
stdoutpath="/home/brewpi/logs/stdout.txt"
scriptpath="/home/brewpi"
entries="brewpi wifichecker"
/home/brewpi/utils/fixPermissions.sh
/home/brewpi/utils/updateCron.sh
echo "stdoutpath=\"/home/brewpi/logs/stdout.txt\"" > /etc/cron.d/brewpi
echo "scriptpath=\"/home/brewpi\"" > /etc/cron.d/brewpi
echo "entries=\"brewpi\"" > /etc/cron.d/brewpi
echo "* * * * * brewpi python -u $scriptpath/brewpi.py 1>$stdoutpath 2>>$stderrpath &" > /etc/cron.d/brewpi
python -u $scriptpath/brewpi.py 1>$stdoutpath 2>>$stderrpath
tail -f /dev/null
