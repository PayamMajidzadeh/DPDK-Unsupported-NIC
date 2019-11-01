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
export L3FWD_PARAMS="-p 3 -P"

CMD="$DPDK_DIR/examples/l3fwd/build/l3fwd $DPDK_PARAMS -- $L3FWD_PARAMS"
echo "Running $CMD"
$CMD


#Where,

# -p PORTMASK: Hexadecimal bitmask of ports to configure
# -P: Optional, sets all ports to promiscuous mode so that packets are accepted regardless of the packet’s Ethernet MAC destination address. Without this option, only packets with the Ethernet MAC $
# -E: Optional, enable exact match.
# -L: Optional, enable longest prefix match.
# --config (port,queue,lcore)[,(port,queue,lcore)]: Determines which queues from which ports are mapped to which cores.
# --eth-dest=X,MM:MM:MM:MM:MM:MM: Optional, ethernet destination for port X.
# --enable-jumbo: Optional, enables jumbo frames.
# --max-pkt-len: Optional, under the premise of enabling jumbo, maximum packet length in decimal (64-9600).
# --no-numa: Optional, disables numa awareness.
# --hash-entry-num: Optional, specifies the hash entry number in hexadecimal to be setup.
# --ipv6: Optional, set if running ipv6 packets.
# --parse-ptype: Optional, set to use software to analyze packet type. Without this option, hardware will check the packet type.
# --per-port-pool: Optional, set to use independent buffer pools per port. Without this option, single buffer pool is used for all ports.
