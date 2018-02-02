#!/usr/bin/env bash
source setup.sh
CONTAINER="l1tdev_offline-dqm_1"
if [ ! "$(docker ps -a | grep ${CONTAINER})" ]
then
  docker-compose up -d
  # wait a bit
  echo "Waiting for container to mount CVMFS"
  sleep 30
fi
# connect to container
docker exec -ti ${CONTAINER} cdw
