#!/bin/bash

sudo docker stop tar1090
sudo docker container rm tar1090
IMAGE_NAME=$(sudo docker images | grep tar1090 | awk '{ print $3 }')
sudo docker image rm $IMAGE_NAME
