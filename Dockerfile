# Normal CUDA (CUDA 11.1)
# FROM --platform=linux/amd64 nvidia/cuda:11.1.1-devel-ubuntu22.04

# 4000 series (CUDA 12.2)
FROM --platform=linux/amd64 nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

# Container Setup
RUN rm -rf /var/lib/apt/lists/*
RUN set -xe 	&& \
        echo '#!/bin/sh' > /usr/sbin/policy-rc.d && \
        echo 'exit 101' >> /usr/sbin/policy-rc.d && \
        chmod +x /usr/sbin/policy-rc.d 	&& \
        dpkg-divert --local --rename --add /sbin/initctl && \
        cp -a /usr/sbin/policy-rc.d /sbin/initctl && \
        sed -i 's/^exit.*/exit 0/' /sbin/initctl && \
        echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup && \
        echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean 	&& \
        echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean 	&& \
        echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean && \
        echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages && \
        echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes && \
        echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests
RUN mkdir -p /run/systemd && echo 'docker' > /run/systemd/container
LABEL maintainer="NVIDIA CORPORATION <cudatools@nvidia.com>"
LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN apt-get update && apt-get install -y --no-install-recommends \
        ocl-icd-libopencl1 \
        clinfo pkg-config && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

# nvidia paths
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
################################ end nvidia opencl driver ################################

# Update & install packages for installing hashcat
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget make clinfo build-essential git libcurl4-openssl-dev libssl-dev zlib1g-dev libcurl4-openssl-dev libssl-dev pciutils python3 python3-pip p7zip-full p7zip-rar && \
    rm -rf /var/lib/apt/lists/*

# Fetch PCI IDs list to display proper GPU names
RUN update-pciids

# Custom Street 
# --- Setup Env
# RUN pip3 install gdown
# RUN gdown 1sR0MGpbj3lUCnki_jBG1irq5g3KwSdkH
# RUN 7z x custom_cmiyc_hashcat_linux.7z 
# RUN mv custom_cmiyc_hashcat_linux STREET
# RUN rm custom_cmiyc_hashcat_linux.7z 
# WORKDIR /STREET
# --- Sync Street.py
# RUN gdown 1RhM-dy-GWFncaiR-4i7rVWI_KDOSm9vH

# Normal Hashcat
WORKDIR /
RUN rm -rf hashcat 
RUN git clone https://github.com/hashcat/hashcat.git
WORKDIR /hashcat
RUN make

# Get Rules
RUN rm -rf rules
RUN git clone https://github.com/caeksec/hashcat-rules-collection.git
RUN mv hashcat-rules-collection rules
RUN mv /hashcat /root/