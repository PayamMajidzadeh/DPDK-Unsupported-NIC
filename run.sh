#!/bin/bash

      ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
      dpkg-reconfigure debconf -f noninteractive -p critical


      # the original codes start from here
      apt-get update
     	apt-get install build-essential automake docker.io linux-headers-$(uname -a | awk '{print $3}') vim kmod python3 python3-pip libtool gcc-multilib libnuma-dev pkg-config libpcap-dev #lua5.3 liblua5.3-dev libpcap0.8-dev clang python3.4 python-pyftpdlib libssl-dev
	    pip install -U pip six
		apt  upgrade

    # the original commands was curl -s0 instead of wget, but it had an issue for unarchiving
	  wget --progress=bar:force https://git.dpdk.org/apps/pktgen-dpdk/snapshot/pktgen-dpdk-pktgen-19.10.0.tar.gz  #http://dpdk.org/browse/apps/pktgen-dpdk/snapshot/pktgen-dpdk-pktgen-3.1.1.tar.gz
	  wget --progress=bar:force http://fast.dpdk.org/rel/dpdk-19.05.tar.xz  #http://fast.dpdk.org/rel/dpdk-16.11.1.tar.xz
#	  wget --progress=bar:force https://www.openvswitch.org/releases/openvswitch-2.12.0.tar.gz #http://openvswitch.org/releases/openvswitch-2.6.1.tar.gz
	tar xf dpdk-19.05.tar.xz  #dpdk-16.11.1.tar.xz
	tar xzf openvswitch-2.12.0.tar.gz #openvswitch-2.6.1.tar.gz
	tar xzf pktgen-dpdk-pktgen-19.10.0.tar.gz  #pktgen-dpdk-pktgen-3.1.1.tar.gz
	cd dpdk-19.05
	 wget https://patches.dpdk.org/patch/57777/mbox/
         mv index.html net-vmxnet3-fix-RSS-setting-on-v4.patch
         patch -p1 -i net-vmxnet3-fix-RSS-setting-on-v4.patch -b
	cd ..
	mkdir /home/ubuntu
	mkdir /home/ubuntu/training
#	git init DPDK_in_Containers_Hands-on_Lab
#	cd DPDK_in_Containers_Hands-on_Lab
#	git remote add origin https://github.com/intel/SDN-NFV-Hands-on-Samples.git
#	git config core.sparsecheckout true
#	echo "DPDK_in_Containers_Hands-on_Lab" >> .git/info/sparse-checkout
#	git pull origin master

 # cd /home/ubuntu
  cd ~
#	mv DPDK_in_Containers_Hands-on_Lab/DPDK_in_Containers_Hands-on_Lab/dpdk-container-lab /home/ubuntu/training
	cp -r my-lab /home/ubuntu/training
	mv /home/ubuntu/training/my-lab /home/ubuntu/training/dpdk-container-lab
	mv pktgen-dpdk-pktgen-19.10.0 /home/ubuntu/training/dpdk-container-lab/docker-build/pktgen/
	mv /home/ubuntu/training/dpdk-container-lab/docker-build/pktgen/pktgen-dpdk-pktgen-19.10.0 /home/ubuntu/training/dpdk-container-lab/docker-build/pktgen/pktgen
	cp -r ~/dpdk-19.05 /home/ubuntu/training/dpdk-container-lab/docker-build/testpmd/
	mv /home/ubuntu/training/dpdk-container-lab/docker-build/testpmd/dpdk-19.05 /home/ubuntu/training/dpdk-container-lab/docker-build/testpmd/dpdk
#	cd /home/ubuntu/training/dpdk-container-lab/docker-build/testpmd/dpdk
#	 wget https://patches.dpdk.org/series/4259/mbox/
#	 mv index.html net-vmxnet3-v4-boot-and-guest-UDP-RSS-configuration.patch
#	 patch -p1 -i net-vmxnet3-v4-boot-and-guest-UDP-RSS-configuration.patch -b
#        mv ../2M-hugepage.patch .
#        patch -p1 -i 2M-hugepage.patch -b
	chown -R $(users | awk '{print $1}'):$(users | awk '{print $1}') /home/ubuntu/training
	ln -s /usr/bin/automake-1.15 /usr/bin/automake-1.14
  mkdir /mnt/huge
  cp -r ~/dpdk-19.05 /home/ubuntu/
#  cp -r ~/openvswitch-2.12.0 /home/ubuntu/ #~/openvswitch-2.6.1 /home/ubuntu/


 # and then to not get errors while configing Open vSwitch
  export LANGUAGE=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  locale-gen en_US.UTF-8
#nano /home/ubuntu/training/dpdk-container-lab/docker-build/testpmd/Dockerfile

echo -e "\e[92mSome Cleaning is always needed!"
        rm -r dpdk-19.05
        rm dpdk-19.05.tar.xz
        rm pktgen-dpdk-pktgen-19.10.0.tar.gz
	rm -r my-lab
	rm run.sh

echo -e "\e[92mGo to \e[93m/home/ubuntu/training/dpdk-container-lab \e[91m& Enjoy!!!"
