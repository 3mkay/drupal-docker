#!/bin/bash
useradd $wwwuser -m -s /bin/bash
sed -i "s/www-data/$wwwuser/g" /etc/apache2/envvars
chown $wwwuser:$wwwuser /etc/msmtp
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
