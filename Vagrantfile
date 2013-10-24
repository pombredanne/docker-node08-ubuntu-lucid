Vagrant.configure("2") do |config|
  config.vm.box = "coreos110"
  config.vm.box_url = "http://storage.core-os.net/coreos/amd64-generic/110.0.0/coreos_production_vagrant.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 5432, host: 5431
  config.vm.network :forwarded_port, guest: 9200, host: 9201
  config.vm.network :forwarded_port, guest: 6379, host: 6378

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell do |s|
    s.path = "vagrant_scripts/setup-docker.sh"
    s.args = ENV['UBUNTU_MIRROR'] || "us"
  end

  config.vm.network :private_network, ip: "10.11.12.13"

  # https://github.com/coreos/coreos-overlay/pull/192
  # https://github.com/coreos/coreos-vagrant/issues/11
  config.vm.synced_folder ".", "/home/core/share", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']

end
