FROM dpdk-containers/testpmd
COPY ./dpdk-container-lab /root/dpdk-container-lab
WORKDIR /root/dpdk-container-lab
COPY ./pktgen /usr/src/pktgen
RUN apt-get update && apt-get install -y libpcap-dev
ENV PKTGEN_DIR "/usr/src/pktgen"
RUN ./build_pktgen.sh; exit 0 #for some reason, the first time always fails, so we do this twice (??)
RUN ./build_pktgen.sh
CMD ["/bin/bash"]
