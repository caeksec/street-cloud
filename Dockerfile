FROM --platform=linux/amd64 nvidia/cuda:12.8.0-devel-ubuntu22.04

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-libopencl1 \
    clinfo \
    pkg-config \
    wget \
    make \
    build-essential \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    pciutils \
    python3 \
    python3-pip \
    p7zip-full \
    p7zip-rar \
    && rm -rf /var/lib/apt/lists/* \
    && update-pciids \
    && mkdir -p /etc/OpenCL/vendors \
    && echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd \
    && mkdir -p /etc/ld.so.conf.d \
    && echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf \
    && echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

WORKDIR /root

RUN git clone https://github.com/hashcat/hashcat.git \
    && cd hashcat \
    && make 

WORKDIR /root/hashcat
