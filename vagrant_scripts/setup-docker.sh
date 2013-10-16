#!/bin/bash
if [ -n "$UBUNTU_MIRROR" ]; then
  sed -i -e "s/http:\/\/us\.archive\.ubuntu\.com/http:\/\/$UBUNTU_MIRROR.archive.ubuntu.com/g" /etc/apt/sources.list
  sed -i -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/$UBUNTU_MIRROR.archive.ubuntu.com/g" /etc/apt/sources.list
  apt-get update
fi

cd /home/core/share/docker-stack
docker build -t lucid-node08/run .

echo 'Ready to run'
#docker run -v `pwd`:`pwd` -w `pwd` -t lucid-node08/run make build