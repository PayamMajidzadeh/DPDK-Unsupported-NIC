#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

if [ "$DPDK_DIR" == "" ]; then
        echo "Sorry, DPDK_DIR env var has not been set to root of DPDK src tree"
        exit 1
fi

#-i -- interactive mode
#--burst=64: we are going to fetch 64 packets at at time
#--txd=2048/--rxd=2048: we want 2048 descriptors in the rx and tx rings
#--forward-mode=io: forward all packets received
#--auto-start: start forwarding packets immediately on launch
#--disable-hw-vlan: disable hardware VLAN
#--coremask=0xC0: lock tespmd to run on cores 6-7 (0b1100 0000)
export L2FWD_PARAMS="-q 4 -p 3"

CMD="$DPDK_DIR/examples/l2fwd/build/l2fwd $DPDK_PARAMS -- $L2FWD_PARAMS"
echo "Running $CMD"
$CMD

