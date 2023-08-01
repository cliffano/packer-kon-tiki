#!/bin/bash
docker --version
source /home/.virtualenvs/py36/bin/activate
make clean init deps lint build-docker-kon-tiki
cat logs/packer-docker-kon-tiki.log
echo "${DOCKERHUB_TOKEN}" | docker login --username cliffano --password-stdin
docker inspect cliffano/kon-tiki
make publish-docker-kon-tiki