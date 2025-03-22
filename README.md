[![Docker Hub](http://dockeri.co/image/justcake/street-cloud)](https://hub.docker.com/r/justcake/street-cloud/)

[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=cuda)](https://hub.docker.com/r/justcake/street-cloud/tags)
[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=cuda-new-nocat)](https://hub.docker.com/r/justcake/street-cloud/tags)
[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=cuda-new)](https://hub.docker.com/r/justcake/street-cloud/tags)
[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=5090)](https://hub.docker.com/r/justcake/street-cloud/tags)

## Tags (lowest CUDA first)


### ``cuda`` (CUDA 11.2) 
```
docker pull justcake/street-cloud:cuda
```

Updated CUDA-toolkit for 3000 and 2000 series (e.g. 3090ti and 2080ti)


--- 


### ``cuda-new-nocat`` (CUDA 11.8) 
```
docker pull justcake/street-cloud:cuda-new-nocat
```

This does **NOT** include hashcat. 

--- 
### ``cuda-new`` (CUDA 12.2) 
```
docker pull justcake/street-cloud:cuda-new
```

Updated CUDA-toolkit for 4000 series (e.g. 4090)

---
### ``5090`` (CUDA 12.8) <--- Latest
```
docker pull justcake/street-cloud:5090
```
Updated CUDA-toolkit for 5000 series (e.g. 5090)


EXTRA:

**For the people that want to build hashcat with other images.**

Add this line to the On-start Script (rules optional):
```
git clone https://github.com/hashcat/hashcat; cd hashcat; make install;
```

--- 



## Up-to-date Rules
Run the following in the root hashcat directory.
```
rm -rf rules; git clone https://github.com/caeksec/rules
```
Be sure to check [performance sheet](https://docs.google.com/spreadsheets/d/1qQNwggWIWtL-m0EYrRg_vdwHOrZCY-SnWcYTwQN0fMk/edit#gid=1952927995) (Made by p͞é͜ng̸u̡͘iń͢͞k̴è͢͜e̛p͠è͢r#2994) for rules and additional wordlists!


## FAQ

* Warning "Device #1: Unstable OpenCL driver detected!" can be suppressed by adding the `--force` flag to a hashcat command (`hashcat -m2500 -b --force`).



