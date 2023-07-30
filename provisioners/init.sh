#!/usr/bin/env bash
set -o nounset
set -o errexit

export DEBIAN_FRONTEND="noninteractive" 

apt-get update
apt-get autoremove
apt-get autoclean

# Install common utilities
apt-get install -y apt-utils build-essential gcc cpp gcc-multilib

# Install Puppet, adapted from
# https://github.com/puppetlabs/puppet-in-docker/blob/master/puppet-agent-ubuntu/Dockerfile
# Will switch to Puppetlabs' Docker image if they provide puppet-masterless
apt-get install --no-install-recommends -y wget apt-transport-https ca-certificates lsb-release sudo apt-utils software-properties-common locales
wget https://apt.puppetlabs.com/puppet6-release-xenial.deb
dpkg -i puppet6-release-xenial.deb
rm puppet6-release-xenial.deb

apt-get update
apt-get install --no-install-recommends -y puppet-agent
rm -rf /var/lib/apt/lists/*
PATH=/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

# Set locale to en_US UTF-8
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

# Install Docker, adapted from 
# https://docs.docker.com/engine/install/ubuntu/
apt-get update
apt-get remove docker docker.io containerd runc
DEBIAN_FRONTEND="noninteractive"  apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
DEBIAN_FRONTEND="noninteractive" apt-get install -y docker-ce docker-ce-cli containerd.io

# Install GH CLI, adapted from
# https://garywoodfine.com/how-to-install-github-cli-on-linux/
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 23F3D4EA75716059
apt-add-repository https://cli.github.com/packages
apt update
apt install gh

unset DEBIAN_FRONTEND

# Info
/opt/puppetlabs/puppet/bin/ruby --version
/opt/puppetlabs/puppet/bin/gem --version
/opt/puppetlabs/puppet/bin/puppet --version
/opt/puppetlabs/puppet/bin/facter --version
/opt/puppetlabs/puppet/bin/hiera --version
