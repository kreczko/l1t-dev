#!/usr/bin/env bash
source setup.sh
docker-compose down
docker volume rm -f l1tdev_dqmgui-volume
