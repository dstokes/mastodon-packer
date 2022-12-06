packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:jammy"
  commit = true
}

build {
  name = "mastodon-packer"
  sources = [
    "source.docker.ubuntu"
  ]
  provisioner "shell" {
    scripts = [
      "scripts/packages.sh"
    ]
  }

  post-processor "docker-tag" {
    repository = "mastodon-packer"
    tags       = ["0.0.1"]
    only       = ["docker.ubuntu"]
  }
}
