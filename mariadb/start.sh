#!/usr/bin/env bash
source settings.sh
#docker run --name db -d -p 3306:3306 -v /srv/docker/mariadb:/var/lib/mysql -e MARIADB_PASS="root" tlyngej/mariadb
docker run --name db -d -p 3306:3306 -v $dbroot:/var/lib/mysql -e MARIADB_PASS="$dbpass" tlyngej/mariadb
