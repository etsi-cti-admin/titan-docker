#!/bin/bash
# Copyright ETSI 2019
# See: https://forge.etsi.org/etsi-forge-copyright-statement.txt

set -e
set -vx

#check and build stfubuntu image
DOCKER_ID=`docker ps -a | grep -e stfubuntu | awk '{ print $1 }'`
docker rm --force ${DOCKER_ID}
if [ -z `docker images -q stfubuntu` ]; then
  docker build --tag stfubuntu:18.04 -f Dockerfile.stfubuntu --force-rm  . || exit 1
fi

docker build --tag stftitan --force-rm  . || ( echo "Docker build failed: $?"; exit 1 )

docker images
docker inspect stftitan:latest || ( echo "Docker inspect failed: $?"; exit 1 )

# That's all Floks
exit 0
