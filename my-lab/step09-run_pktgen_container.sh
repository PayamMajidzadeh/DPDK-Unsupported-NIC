#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

CMD="source step00-setenv"
$CMD

export DOCKER_TAG="dpdk-containers/pktgen"


echo "Launching docker container in privileged mode with access to host hugepages and DPDK dev sockets"
CMD="docker run -tiv /mnt/huge:/mnt/huge -v /dev/uio2:/dev/uio2 -v /dev/uio3:/dev/uio3 --privileged $DOCKER_TAG"
echo "Running $CMD"
$CMD
