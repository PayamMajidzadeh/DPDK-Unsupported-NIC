#!/bin/bash

if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

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

echo "Unmounting hugepages"
umount nodev /mnt/huge

echo "Deleting huge page memory files..."
rm -rf /dev/hugepages/*

echo "Show the fs table's hugepage mounts"
mount | grep -i huge

echo "De-allocating hugepages"
echo 0  > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

echo "Show free/used hugepage info"
cat /proc/meminfo | grep -i huge

echo "Removing from the kernel any DPDK drivers that may still be in use"
#rmmod i40e
#rmmod ixgbe
#rmmod vmxnet3
rmmod igb_uio
rmmod cuse
rmmod fuse
rmmod openvswitch
rmmod uio
rmmod eventfd_link
rmmod ioeventfd