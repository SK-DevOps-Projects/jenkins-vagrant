Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/impish64"
  config.vm.network "private_network", ip: "192.168.56.10"
  #config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder ".", "/mnt/host_machine", create: true
  config.vm.provider :virtualbox do |vb|
      vb.name = "jenkins"
      vb.memory = "2048"

  end
  config.vm.provision "shell" do |s|
    s.path = "provision.sh"
  end
end
