#!/bin/sh
set -o errexit
set -o nounset

export PATH=/root/.local/bin:/root/go/bin:/usr/local/go/bin:/usr/local/node/bin:$PATH

echo "****************************************"
echo "* Provisioned software info - Post"
echo "****************************************"
echo "PATH: $PATH"
echo "aws version: $(aws --version)"
echo "bob version: $(bob --version)"
echo "checkmake version: $(checkmake --version)"
echo "ffmpeg version: $(ffmpeg -version)"
echo "imagemagick convert version: $(convert --version)"
echo "imagemagick mogrify version: $(mogrify --version)"
echo "jazz-cli version: $(jazz-cli --version)"
echo "jq version: $(jq --version)"
echo "node.js version: $(node --version)"
echo "npm version: $(npm --version)"
echo "npx version: $(npx --version)"
echo "packer version: $(packer version)"
echo "terraform version: $(terraform version)"
echo "yq version: $(yq --version)"
