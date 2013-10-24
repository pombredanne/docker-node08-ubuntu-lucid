# ubuntu lucid64  - built from: 
FROM crohr/ubuntu:lucid

MAINTAINER Hugues <hugues@sutoiku.com>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu lucid main universe" > /etc/apt/sources.list

## Uncomment this if you are not in the US
RUN export UBUNTU_MIRROR=sg && sed -i -e "s/http:\/\/us\.archive\.ubuntu\.com/http:\/\/$UBUNTU_MIRROR.archive.ubuntu.com/g" /etc/apt/sources.list
RUN export UBUNTU_MIRROR=sg && sed -i -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/$UBUNTU_MIRROR.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q --force-yes python-software-properties make g++ wget git-core
RUN add-apt-repository ppa:chris-lea/node.js && apt-get update && apt-get install -y -q --force-yes nodejs=0.10.21-1chl1~lucid1 && apt-get install -y -q --force-yes zlib1g-dev

RUN apt-get clean

# Useful node modules for the builds
RUN echo `which node`
RUN node --version

RUN npm -g install jshint mocha istanbul node-gyp@0.10
# node-gyp configure needs to be run in an actual node_module
RUN git clone --depth 1 https://github.com/sutoiku/node-kafka && cd node-kafka && node-gyp configure && cd .. && rm -rf node-kafka
