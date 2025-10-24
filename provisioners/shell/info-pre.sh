#!/bin/sh
set -o errexit
set -o nounset

export PATH=$env_path:$PATH

echo "****************************************"
echo "* Provisioned software info - Pre"
echo "****************************************"
echo "PATH: $PATH"
echo "ansible version: $(ansible --version)"
echo "curl version: $(curl --version)"
echo "docker version: $(docker --version)"
echo "gh version: $(gh --version)"
echo "pip3 version: $(pip3 --version)"
echo "python3 version: $(python3 --version)"
echo "wget version: $(wget --version)"
