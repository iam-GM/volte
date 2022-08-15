#!/bin/sh
git clone https://github.com/herlesupreeth/docker_open5gs
cd docker_open5gs/base
docker build --no-cache --force-rm -t docker_open5gs .
cd ../ims_base
docker build --no-cache --force-rm -t docker_kamailio .
cd ..
set -a
source .env
docker-compose build --no-cache
docker-compose -f srsenb.yaml build --no-cache
docker compose up & 
sleep 300
gnome-terminal -- sh -c "bash -c \"docker exec -it osmohlr /bin/bash; exec bash\"" &
sleep 60
xdg-open http://localhost:3000/ &
sleep 60
xdg-open http://172.22.0.18:8080/hss.web.console/ &
