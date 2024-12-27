#!/bin/sh
set -o errexit
set -o nounset

################################################################
# Common OS setup
################################################################
export DEBIAN_FRONTEND="noninteractive"
apt update
apt autoremove
apt autoclean
apt install -y apt-utils build-essential gcc cpp gcc-multilib pkg-config software-properties-common locales
rm -rf /var/lib/apt/lists/*
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8
apt clean

################################################################
# Install Ansible and Python utilities
################################################################
add-apt-repository --yes --update ppa:ansible/ansible
apt install -y ansible
apt install -y python3-pip pipx
apt clean

################################################################
# Install Docker, adapted from
# https://docs.docker.com/engine/install/ubuntu/
################################################################
apt update
apt remove docker docker.io containerd runc
DEBIAN_FRONTEND="noninteractive"  apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
DEBIAN_FRONTEND="noninteractive" apt install -y docker-ce docker-ce-cli containerd.io
apt clean

################################################################
# Install GH CLI, adapted from
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
################################################################
(type -p wget >/dev/null || (apt update && apt install wget -y)) \
&& mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y
apt clean

unset DEBIAN_FRONTEND
