#!/usr/bin/env sh

# install required base packages
apt-get update
apt-get install -y \
  apt-transport-https ca-certificates curl \
  git gnupg lsb-release wget 

# clone mastodon & chekout latest release
cd /opt
git clone http://github.com/mastodon/mastodon
cd mastodon
git fetch --all --tags
git checkout -b $(git describe --tags `git rev-list --tags --max-count=1`)
