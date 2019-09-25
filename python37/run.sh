#!/bin/sh

NAME="docker-python37"
IMAGE="atktng/python:latest"

docker run --rm -it --name ${NAME} -v /d/workspace/testing-tools/python37:/usr/local/src/ -w /usr/local/src ${IMAGE} python3 $@

