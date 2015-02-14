#!/usr/bin/env bash
source settings.sh
docker run --name mail -d -p 25:25 -p 1080:1080 tlyngej/mailcatcher mailcatcher -f --ip 0.0.0.0 --smtp-port 25
