<img align="right" src="https://raw.github.com/cliffano/packer-kon-tiki/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/packer-kon-tiki/workflows/CI/badge.svg)](https://github.com/cliffano/packer-kon-tiki/actions?query=workflow%3ACI)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/kon-tiki.svg)](https://hub.docker.com/r/cliffano/kon-tiki/)
[![Security Status](https://snyk.io/test/github/cliffano/packer-kon-tiki/badge.svg)](https://snyk.io/test/github/cliffano/packer-kon-tiki)

Packer Kon-Tiki
---------------

Packer Kon-Tiki is a Packer builder of Docker image containing the software needed to build many micro sites.

Installation
------------

Pull Kon-Tiki Docker image from Docker Hub:

    docker pull cliffano/kon-tiki

Or alternatively, you can create the Docker image:

    git clone https://github.com/cliffano/packer-kon-tiki
    cd packer-kon-tiki
    make build-docker-kon-tiki

An image with `cliffano/kon-tiki` repository and `latest` tag should show up:

    kabuto> docker images

    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    cliffano/kon-tiki   latest              645eb1cde567        2 hours ago         733MB
    ubuntu              latest              f975c5035748        3 weeks ago         112MB

Usage
-----

[Bob](https://github.com/cliffano/bob), [Hugo](https://gohugo.io/), [ImageMagick](https://www.imagemagick.org/script/index.php), and [jq](https://jqlang.github.io/jq/),  are available inside the image. Run the command using:

    docker run \
      --workdir /opt/workspace \
      -v $(pwd):/opt/workspace \
      -t cliffano/kon-tiki \
      --rm \
      kon-tiki

Development
-----------

Extra path should be added to the following:

* provisioners/shell/info-pre.sh
* provisioners/shell/info-post.sh
* templates/packer/docker-kon-tiki-private.pkr.hcl
* templates/packer/docker-kon-tiki.pkr.hcl