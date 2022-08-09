[![Docker Hub](http://dockeri.co/image/dizcza/docker-hashcat)](https://hub.docker.com/r/dizcza/docker-hashcat/)

[![](https://img.shields.io/docker/image-size/dizcza/docker-hashcat/latest?label=latest)](https://hub.docker.com/r/dizcza/docker-hashcat/tags)
[![](https://img.shields.io/docker/image-size/dizcza/docker-hashcat/cuda?label=cuda)](https://hub.docker.com/r/dizcza/docker-hashcat/tags)
[![](https://img.shields.io/docker/image-size/dizcza/docker-hashcat/intel-cpu?label=intel-cpu)](https://hub.docker.com/r/dizcza/docker-hashcat/tags)
[![](https://img.shields.io/docker/image-size/dizcza/docker-hashcat/intel-gpu?label=intel-gpu)](https://hub.docker.com/r/dizcza/docker-hashcat/tags)
[![](https://img.shields.io/docker/image-size/dizcza/docker-hashcat/pocl?label=pocl)](https://hub.docker.com/r/dizcza/docker-hashcat/tags)


STREET Version of Dizcza's Docker for Vast.ai use

```
docker pull dizcza/docker-hashcat
```


## Tags

### cuda

`docker pull dizcza/docker-hashcat:cuda`


## Hashcat utils

Along with the hashcat, the following utility packages are installed:

* [hashcat-utils](https://github.com/hashcat/hashcat-utils) for converting raw Airodump to HCCAPX capture format; info `cap2hccapx -h`
* [hcxtools](https://github.com/zerbea/hcxtools) for inspecting, filtering, and converting capture files;
* [hcxdumptool](https://github.com/ZerBea/hcxdumptool) for capturing packets from wlan devices in any format you might think of; info `hcxdumptool -h`
* [kwprocessor](https://github.com/hashcat/kwprocessor) for creating advanced keyboard-walk password candidates; info `kwp -h`


## FAQ

* Warning "Device #1: Unstable OpenCL driver detected!" can be suppressed by adding the `--force` flag to a hashcat command (f.i., `hashcat -m2500 -b --force`).



