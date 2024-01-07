Vagrant.configure("2") do |config|
  config.vm.define "desafio-integrador" do |h|
    h.vm.box = "ubuntu/focal64"
    h.vm.network "forwarded_port", guest: 8010, host: 8010
    h.vm.network "forwarded_port", guest: 8080, host: 8080
    h.vm.hostname = "desafio-integrador"
    h.vm.provision "shell", path: "bootstrap.sh"
    h.vm.provider "virtualbox" do |vb|
      vb.name = "desafio-integrador"
      vb.memory = "2048"
      vb.cpus = 2
    end    
  end
end