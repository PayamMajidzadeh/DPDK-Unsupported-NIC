#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi


CMD="source step00-setenv"
$CMD

DOCKER_BUILD_DIR="$TRAINING_DIR/docker-build/l3fwd"
DOCKER_TAG="dpdk-containers/l3fwd"

cd "$DOCKER_BUILD_DIR"

docker build . -t $DOCKER_TAG