#!/bin/bash

sudo docker stop tar1090
sudo docker container rm tar1090
IMAGE_NAME=$(sudo docker images | grep tar1090 | awk '{ print $3 }')
sudo docker image rm $IMAGE_NAME
sudo DOCKER_BUILDKIT=1 docker build --tag tar1090 .
sudo docker run -d --name=tar1090 -p 8078:80 -e TZ=America/New_York -e BEASTHOST=readsb -e MLATHOST=adsbx -e LAT=-33.33333 -e LONG=111.11111 -v /opt/adsb/tar1090/graphs1090:/var/lib/collectd --tmpfs=/run:exec,size=64M --tmpfs=/var/log --mount type=bind,source=/run/readsb/,target=/run/readsb/ tar1090
sudo cp ./receiver.json /run/readsb/.
