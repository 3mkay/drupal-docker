#!/usr/bin/env bash
source settings.sh
./stop.sh
./mail.sh
./mariadb.sh
./solr.sh
docker run --name php55 --link db:db --link solr:solr --link mail:mail -d -p 80:80 -v $wwwroot:/app -e wwwuser="$wwwuser" tlyngej/drupal-docker-php55
