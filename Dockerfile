FROM nvidia/cuda:10.2-devel-ubuntu18.04

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
    apt-get install -y wget make clinfo build-essential git libcurl4-openssl-dev libssl-dev zlib1g-dev libcurl4-openssl-dev libssl-dev pciutils python sudo apt install p7zip-full p7zip-rar

# Fetch PCI IDs list to display proper GPU names
RUN update-pciids

# Set Working Directory
WORKDIR /root

# Setup Env
RUN pip install gdown

# Custom Street 
RUN gdown https://drive.google.com/file/d/1sR0MGpbj3lUCnki_jBG1irq5g3KwSdkH/view?usp=sharing
RUN 7z x custom_cmiyc_hashcat_linux.7z 
RUN cd custom_cmiyc_hashcat_linux
RUN git clone https://github.com/narkopolo/hashcat-rules-collection.git
RUN mv hashcat-rules-collection rules

# Sync Street.py
RUN gdown https://drive.google.com/file/d/1RhM-dy-GWFncaiR-4i7rVWI_KDOSm9vH/view?usp=sharing


# Wordlists
RUN gdown https://drive.google.com/file/d/1Cme46ftqeAbLy92z_y9skZsnDRmyoJiL/view?usp=sharing
RUN gdown https://drive.google.com/file/d/1K-_c_2Uzfd_7LVUi0nKGAfveAaNYxiHh/view?usp=sharing
RUN gdown https://drive.google.com/file/d/1V-TBAcFz72XRXmpswEULXef3OlxVdPKn/view?usp=sharing


