#!/bin/sh
set -o errexit
set -o nounset

export PATH=$ENV_PATH:$PATH

echo "****************************************"
echo "* Provisioned software info - Post"
echo "****************************************"
echo "PATH: $PATH"
echo "aws version: $(aws --version)"
echo "bob version: $(bob --version)"
echo "checkmake version: $(checkmake --version)"
echo "dasel version: $(dasel --version)"
echo "ffmpeg version: $(ffmpeg -version)"
echo "imagemagick convert version: $(convert --version)"
echo "imagemagick mogrify version: $(mogrify --version)"
echo "jazz-cli version: $(jazz-cli --version)"
echo "node.js version: $(node --version)"
echo "npm version: $(npm --version)"
echo "npx version: $(npx --version)"
echo "packer version: $(packer version)"
# Disabled due to smartcrop not having either version or help flag
# echo "smartcrop version: $(smartcrop --version)"
echo "terraform version: $(terraform version)"
