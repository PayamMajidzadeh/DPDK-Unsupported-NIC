
FROM dpdk-containers/testpmd
COPY ./dpdk-container-lab /root/dpdk-container-lab
WORKDIR /root/dpdk-container-lab
RUN ./build_l3fwd.sh
CMD ["/bin/bash"]
