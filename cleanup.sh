#!/usr/bin/env bash
source settings.sh
docker rm $(docker ps -a -q)
docker rmi $(docker images -q --filter "dangling=true")
