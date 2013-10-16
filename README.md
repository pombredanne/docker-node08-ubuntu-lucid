Docker build for Node-08 on Ubuntu Lucid64

We use it to statically build node-kafka and msgpack for Cloudfoundry-v1 VMs which don't execute `npm install`.

Vagrant:
--------
`vagrant up`

On a ubuntu host with docker installed
---------------------------------------
`cd docker-stack && sudo docker build -t lucid-node08/run .`

Example build: node-kafka
--------------------------
```
vagrant ssh
git clone https://github.com/sutoiku/node-kafka
cd node-kafka
sudo docker run -v `pwd`:`pwd` -w `pwd` -t lucid-node08/run node-gyp configure && node-gyp build
```

To run an interactive shell:
```
sudo docker run -v `pwd`:`pwd` -w `pwd` -i -t lucid-node08/run /bin/bash
```
