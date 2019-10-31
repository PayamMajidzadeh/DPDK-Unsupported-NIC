FROM ubuntu:19.04
COPY ./dpdk-container-lab /root/dpdk-container-lab
WORKDIR /root/dpdk-container-lab
COPY ./dpdk /usr/src/dpdk
RUN apt-get update && apt-get install -y build-essential automake python-pip libcap-ng-dev gawk pciutils linux-headers-$(uname -a | awk '{print $3}') vim kmod python python-pip libtool gcc-multilib libnuma-dev libssl-dev pkg-config libpcap-dev lua5.3 liblua5.3-dev libpcap0.8-dev
RUN pip install -U pip six
ENV DPDK_DIR "/usr/src/dpdk"
ENV DPDK_BUILD "x86_64-native-linuxapp-gcc"
ENV RTE_SDK "/usr/src/dpdk"
ENV RTE_TARGET "x86_64-native-linuxapp-gcc"
RUN ./build_dpdk.sh
RUN ./build_testpmd.sh
CMD ["/bin/bash"]
