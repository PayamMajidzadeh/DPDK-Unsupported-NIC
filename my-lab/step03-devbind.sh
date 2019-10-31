#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

CMD="source step00-setenv"
$CMD

if [ "$RTE_SDK" == "" ]; then
        echo "Sorry, RTE_SDK has not been defined."
        exit 1
fi

if [ "$RTE_TARGET" == "" ]; then
        echo "Sorry, RTE_TARGET has not been defined."
        exit 1
fi

if [ "$DPDK_BUILD" == "" ]; then
        echo "Sorry, DPDK_BUILD has not been defined."
        exit 1
fi

if [ "$DPDK_DIR" == "" ]; then
        echo "Sorry, DPDK_DIR has not been defined."
        exit 1
fi

cd "$DPDK_DIR"
echo "Binding devices to use DPDK"


CMD="./usertools/dpdk-devbind.py --bind=igb_uio 04:00.0"
$CMD
CMD="./usertools/dpdk-devbind.py --bind=igb_uio 0b:00.0"
$CMD
CMD="./usertools/dpdk-devbind.py --bind=igb_uio 0c:00.0"
$CMD
CMD="./usertools/dpdk-devbind.py --bind=igb_uio 13:00.0"
$CMD
CMD="./usertools/dpdk-devbind.py --bind=igb_uio 14:00.0"
$CMD
CMD="./usertools/dpdk-devbind.py --bind=igb_uio 1b:00.0"
$CMD
CMD="./usertools/dpdk-devbind.py --status"
$CMD

