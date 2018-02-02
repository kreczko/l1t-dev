#!/usr/bin/env bash
source setup.sh
# only the first time to download base image
docker-compose pull
# only the first time to set permissions specific to your machine
docker-compose build
