#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

CMD="source step00-setenv"
$CMD

export DOCKER_TAG="dpdk-containers/testpmd"

echo "Launching docker container in privileged mode with access to host hugepages and DPDK dev sockets"
CMD="docker run -tiv /mnt/huge:/mnt/huge -v /dev/uio0:/dev/uio0 -v /dev/uio1:/dev/uio1 --privileged $DOCKER_TAG"
echo "Running $CMD"
$CMD
