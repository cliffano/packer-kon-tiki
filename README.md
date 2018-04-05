<img align="right" src="https://raw.github.com/cliffano/packer-kon-tiki/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://img.shields.io/travis/cliffano/packer-kon-tiki.svg)](http://travis-ci.org/cliffano/packer-kon-tiki)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/kon-tiki.svg)](https://hub.docker.com/r/cliffano/kon-tiki/)

Packer Kon-Tiki
---------------

Packer Kon-Tiki is a Packer builder of Docker image containing the software needed to build many micro sites maintained by Studio C.

Installation
------------

Pull Kon-Tiki Docker image from Docker Hub:

    docker pull cliffano/kon-tiki

Or alternatively, you can create the Docker image:

    git clone https://github.com/cliffano/packer-kon-tiki
    cd packer-kon-tiki
    make docker

An image with `cliffano/kon-tiki` repository and `latest` tag should show up:

    kabuto> docker images

    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    cliffano/kon-tiki   latest              645eb1cde567        2 hours ago         733MB
    ubuntu              latest              f975c5035748        3 weeks ago         112MB

Usage
-----

[AE86](https://github.com/cliffano/ae86), [Bob](https://github.com/cliffano/bob), [Hugo](https://gohugo.io/), and [ImageMagick](https://www.imagemagick.org/script/index.php) are available inside the image. Run the command using:

    docker run \
      --workdir /opt/workspace \
      -v $(pwd):/opt/workspace \
      -t cliffano/kon-tiki \
      --rm \
      kon-tiki \
      --jar /opt/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar \
      --api-spec path/to/spec.yml \
      javascript-gen
