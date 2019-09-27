#!/bin/sh

NAME="docker-python37"
IMAGE="atktng/python:latest"

# for wsl
docker run --rm -it --name ${NAME} -v ${PWD#/mnt}:/usr/local/src/ -w /usr/local/src ${IMAGE} python3 $@

