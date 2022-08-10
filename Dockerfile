FROM --platform=linux/amd64 nvidia/cuda:11.2.2-devel-ubuntu20.04

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
    apt-get install -y wget make clinfo build-essential git libcurl4-openssl-dev libssl-dev zlib1g-dev libcurl4-openssl-dev libssl-dev pciutils python3 python3-pip p7zip-full p7zip-rar

# Fetch PCI IDs list to display proper GPU names
RUN update-pciids

# Setup Env
RUN pip3 install gdown

# Custom Street 
# RUN gdown 1sR0MGpbj3lUCnki_jBG1irq5g3KwSdkH
# RUN 7z x custom_cmiyc_hashcat_linux.7z 
# RUN mv custom_cmiyc_hashcat_linux STREET
# RUN rm custom_cmiyc_hashcat_linux.7z 

# Normal Hashcat
RUN gdown 1jAti6TJmK16rmLPf1niAW8ad2sNpVN3S
RUN 7z x hashcat-6.2.5.7z
RUN mv hashcat-6.2.5 hashcat
RUN rm hashcat-6.2.5.7z

# Set Working Directory
# WORKDIR /STREET
WORKDIR /hashcat

# Get Rules
RUN rm -rf rules
RUN git clone https://github.com/narkopolo/hashcat-rules-collection.git
RUN mv hashcat-rules-collection rules

# Sync Street.py
# RUN gdown 1RhM-dy-GWFncaiR-4i7rVWI_KDOSm9vH

# Wordlists
RUN gdown 1Cme46ftqeAbLy92z_y9skZsnDRmyoJiL
RUN gdown 1K-_c_2Uzfd_7LVUi0nKGAfveAaNYxiHh
RUN gdown 1V-TBAcFz72XRXmpswEULXef3OlxVdPKn

# perms
# RUN chmod +x hashcat
RUN chmod +x hashcat.bin
