packer {
  required_plugins {
    docker = {
      version = ">= 1.0.10"
      source  = "github.com/hashicorp/docker"
    }
    ansible = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

locals {
  env_path = "/root/.local/bin:/root/go/bin:/usr/local/go/bin:/usr/local/node/bin"
}

variable "version" {
  type    = string
  default = "x.x.x"
}

source "docker" "kon-tiki" {
  image  = "ubuntu:24.04"
  commit = true
  run_command = [
    "-d",
    "-i",
    "-t",
    "{{.Image}}",
    "/bin/bash",
  ]
  changes = [
    "ENV LANG en_US.UTF-8",
    "ENV PATH ${local.env_path}"
  ]
}

build {
  sources = [
    "source.docker.kon-tiki"
  ]

  name = "kon-tiki"

  provisioner "shell" {
    inline = [
      "mkdir -p /tmp"
    ]
  }

  provisioner "shell" {
    script = "provisioners/shell/init.sh"
    environment_vars = [
      "ENV_PATH=${local.env_path}"
    ]
  }

  provisioner "shell" {
    script = "provisioners/shell/info-pre.sh"
    environment_vars = [
      "ENV_PATH=${local.env_path}"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/kon-tiki.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/kon-tiki-go.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/kon-tiki-javascript.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "provisioners/ansible/kon-tiki-python.yml"
    galaxy_file = "requirements.yml"
    role_paths = [
      "stage/ansible/roles"
    ]
    collection_paths = [
      "stage/ansible/collections"
    ]
  }

  provisioner "shell" {
    script = "provisioners/shell/info-post.sh"
    environment_vars = [
      "ENV_PATH=${local.env_path}"
    ]
  }

  post-processor "docker-tag" {
    repository = "cliffano/kon-tiki"
    tags        = [
      "latest",
      var.version
    ]
  }
}
