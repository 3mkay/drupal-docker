#!/usr/bin/env bash
source settings.sh
docker run --name solr -d -p 8983:8983 -t tlyngej/drupal-docker-solr /bin/bash -c "java -jar start.jar"
