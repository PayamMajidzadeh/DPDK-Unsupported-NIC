#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

CMD="source step00-setenv"
$CMD

echo -e "\e[92mAttention!!!\e[0m"
echo -e "\e[91mDO NOT RUN testpmd & l2fwd IN THE SAME TIME!!!\e[0m"


DOCKER_BUILD_DIR="$TRAINING_DIR/docker-build/l2fwd"
DOCKER_TAG="dpdk-containers/l2fwd"

cd "$DOCKER_BUILD_DIR"

docker build . -t $DOCKER_TAG