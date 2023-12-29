# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "Django-Postgres-CRUD" do |h|
    h.vm.box = "ubuntu/focal64"
    h.vm.network "forwarded_port", guest: 8000, host: 8000
    h.vm.hostname = "django-postgres-crud"
    h.vm.provision "shell", path: "bootstrap.sh"
    h.vm.provider "virtualbox" do |vb|
      vb.name = "django-postgres-crud"
      vb.memory = "2048"
      vb.cpus = 2
    end    
  end
end