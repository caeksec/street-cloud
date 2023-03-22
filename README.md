[![Docker Hub](http://dockeri.co/image/justcake/street-cloud)](https://hub.docker.com/r/justcake/street-cloud/)

[![](https://img.shields.io/docker/image-size/justcake/street-cloud/street?label=street)](https://hub.docker.com/r/justcake/street-cloud/tags)
[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=cuda)](https://hub.docker.com/r/justcake/street-cloud/tags)
[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=cuda-new)](https://hub.docker.com/r/justcake/street-cloud/tags)

## Tags

### ``street`` 
```
docker pull justcake/street-cloud:street
```
STREET version for use in competitions

<b>Make sure to update sync-street.py api key</b>

This will be used to connect you to the left and found lists!


### ``cuda`` 
```
docker pull justcake/street-cloud:cuda
```
Cuda version for normal use.

Now works with CUDA 11.2+


### ``cuda-new`` 
```
docker pull justcake/street-cloud:cuda-new
```
Updated CUDA-toolkit for 4000 series 
e.g. 4090


### ``cuda-new-nocat`` 
```
docker pull justcake/street-cloud:cuda-new-nocat
```
For the people that want to auto build hashcat during runtime.

Add this line to the On-start Script:
```
git clone https://github.com/hashcat/hashcat; cd hashcat; make install; rm -rf rules; git clone https://github.com/caeksec/rules;
```


## Rules included
```
https://github.com/caeksec/hashcat-rules-collection
```
Be sure to check [performance sheet](https://docs.google.com/spreadsheets/d/1qQNwggWIWtL-m0EYrRg_vdwHOrZCY-SnWcYTwQN0fMk/edit#gid=1952927995) (Made by p͞é͜ng̸u̡͘iń͢͞k̴è͢͜e̛p͠è͢r#2994) for rules and additional wordlists!


## FAQ

* Warning "Device #1: Unstable OpenCL driver detected!" can be suppressed by adding the `--force` flag to a hashcat command (`hashcat -m2500 -b --force`).



