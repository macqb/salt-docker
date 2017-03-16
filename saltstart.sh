#!/bin/bash
#Pull latest
docker pull macqb/salt-docker

#Cleanup existing
docker stop salt-docker
docker rm salt-docker

docker run salt-docker
