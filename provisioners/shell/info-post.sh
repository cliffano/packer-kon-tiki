#!/bin/sh
set -o errexit
set -o nounset

export PATH=/usr/local/node-v22.7.0-linux-x64/bin/:$PATH

echo "****************************************"
echo "* Provisioned software info - Post"
echo "****************************************"
echo "PATH: $PATH"
echo "aws version: $(aws --version)"
echo "bob version: $(bob --version)"
echo "imagemagick convert version: $(convert --version)"
echo "imagemagick mogrify version: $(mogrify --version)"
echo "jazz-cli version: $(jazz-cli --version)"
echo "jq version: $(jq --version)"
echo "node.js version: $(node --version)"
echo "npm version: $(npm --version)"
echo "npx version: $(npx --version)"
echo "packer version: $(/usr/bin/packer version)"
echo "terraform version: $(terraform version)"
echo "yq version: $(yq --version)"