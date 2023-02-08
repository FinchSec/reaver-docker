# Reaver container

Docker for https://github.com/kimocoder/reaver-wps-fork-t6x using Kali as a base. Rebuilt daily.

## Pulling

### DockerHub

[![Docker build and upload](https://github.com/FinchSec/reaver-docker/actions/workflows/docker.yml/badge.svg?event=push)](https://github.com/FinchSec/reaver-docker/actions/workflows/docker.yml)

URL: https://hub.docker.com/r/finchsec/reaver

`sudo docker pull finchsec/reaver`

## Running

`sudo docker run --rm -it --privileged --net=host --pid=host finchsec/reaver`
