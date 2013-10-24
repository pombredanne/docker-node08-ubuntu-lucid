Docker build for Node-08 on Ubuntu Lucid64

We use it to statically build node-kafka and msgpack for Cloudfoundry-v1 VMs which don't execute `npm install`.

Vagrant:
--------
`vagrant up`

On a ubuntu host with docker installed
---------------------------------------
```
cd ~/share/docker-stack-lucid-node08 && sudo docker build -t lucid-node08/run .
cd ~/share/docker-stack-lucid-node010 && sudo docker build -t lucid-node010/run .
```

Example build: node-kafka
--------------------------
```
vagrant ssh
git clone --depth 1 https://github.com/sutoiku/node-kafka
cd node-kafka
echo "#!/bin/bash" > buildit
echo "node-gyp configure" >> buildit
echo "node-gyp build" >> buildit
sudo docker run -v `pwd`:`pwd` -w `pwd` -t lucid-node08/run /bin/bash buildit
sudo docker run -v `pwd`:`pwd` -w `pwd` -t lucid-node010/run /bin/bash buildit
```

To run an interactive shell:
```
sudo docker run -v `pwd`:`pwd` -w `pwd` -i -t lucid-node08/run /bin/bash
```
