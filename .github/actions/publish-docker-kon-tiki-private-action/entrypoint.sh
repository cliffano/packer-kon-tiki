#!/bin/bash
docker --version
source /home/.virtualenvs/py36/bin/activate
make clean deps lint build-docker-kon-tiki-private
cat logs/kon-tiki-private.log
echo "${GITHUB_TOKEN}" | docker login ghcr.io --username cliffano --password-stdin
docker inspect ghcr.io/shinesolutions/kon-tiki
make publish-docker-kon-tiki-private