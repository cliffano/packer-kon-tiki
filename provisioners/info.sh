#!/bin/sh
set -o errexit

export PATH=/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:/usr/local/go/bin:/root/.cargo/bin/:/usr/local/sbin:/usr/local/bin:$PATH

echo "****************************************"
echo "* Provisioned software info"
echo "****************************************"
echo "PATH: $PATH"
echo "puppet version: $(puppet --version)"
echo "facter version: $(facter --version)"
echo "hiera version: $(hiera --version)"
echo "node.js version: $(node --version)"
echo "bob version: $(bob --version)"
echo "jazz-cli version: $(jazz-cli --version)"
echo "terraform version: $(terraform version)"
echo "packer version: $(/usr/bin/packer version)"
echo "python version: $(python3 --version)"
echo "ruby version: $(ruby --version)"
echo "gem version: $(gem --version)"
echo "imagemagick convert version: $(convert --version)"
echo "imagemagick mogrify version: $(mogrify --version)"
echo "gh version: $(gh --version)"