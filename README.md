[![Docker Hub](http://dockeri.co/image/justcake/street-cloud)](https://hub.docker.com/r/justcake/street-cloud/)

[![](https://img.shields.io/docker/image-size/justcake/street-cloud/street?label=street)](https://hub.docker.com/r/justcake/street-cloud/tags)
[![](https://img.shields.io/docker/image-size/justcake/street-cloud/cuda?label=cuda)](https://hub.docker.com/r/justcake/street-cloud/tags)

# Modded Version of Dizcza's Docker for Vast.ai use

## Tags

### ``street`` 
```
docker pull justcake/street-cloud:latest
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


## Wordlists installed
```
rockyou.txt
hashmob-user.txt
hashmob-default.txt
```

## Rules used
```
https://github.com/narkopolo/hashcat-rules-collection
```
Be sure to check [performance sheet](https://docs.google.com/spreadsheets/d/1qQNwggWIWtL-m0EYrRg_vdwHOrZCY-SnWcYTwQN0fMk/edit#gid=1952927995) (Made by p͞é͜ng̸u̡͘iń͢͞k̴è͢͜e̛p͠è͢r#2994) for rules and additional wordlists!


## FAQ

* Warning "Device #1: Unstable OpenCL driver detected!" can be suppressed by adding the `--force` flag to a hashcat command (f.i., `hashcat -m2500 -b --force`).



