# -*- mode: ruby -*-

Vagrant.configure("2") do |config|

  config.vm.define "redmine-bionic" do |box|
    box.vm.box = "ubuntu/bionic64"
    box.vm.box_version = "20200225.0.0"
    box.vm.hostname = 'redmine.vagrant.example.lan'
    box.vm.provider 'virtualbox' do |vb|
      vb.gui = false
      vb.memory = 1280
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.customize ["modifyvm", :id, "--hpet", "on"]
    end
    box.vm.network "private_network", ip: "192.168.3.10"
    box.vm.provision "shell", path: "vagrant/common.sh"
    box.vm.provision "shell", inline: "/usr/bin/apt-get update"
    box.vm.provision "shell",
      inline: "/opt/puppetlabs/bin/puppet apply /vagrant/vagrant/hosts.pp --modulepath=/vagrant/modules",
      env: {  'FACTER_my_host': 'redmine.vagrant.example.lan',
              'FACTER_my_ip': '192.168.3.10' }
    box.vm.provision "shell",
      inline: "/opt/puppetlabs/bin/puppet apply /vagrant/vagrant/redmine.pp --modulepath=/vagrant/modules"
  end

  config.vm.define "redmine-centos8" do |box|
    # The official CentOS 8 Vagrant box fails when trying to install kernel
    # headers (for Guest Additions)
    box.vm.box = "generic/centos8"
    box.vm.box_version = "3.0.32"
    box.vm.hostname = 'redmine.vagrant.example.lan'
    box.vm.provider 'virtualbox' do |vb|
      vb.gui = false
      vb.memory = 1280
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.customize ["modifyvm", :id, "--hpet", "on"]
    end
    box.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    box.vm.network "private_network", ip: "192.168.3.11"
    box.vm.provision "shell", path: "vagrant/common.sh"
    #box.vm.provision "shell", inline: "/usr/bin/apt-get update"
    box.vm.provision "shell",
      inline: "/opt/puppetlabs/bin/puppet apply /vagrant/vagrant/hosts.pp --modulepath=/vagrant/modules",
      env: {  'FACTER_my_host': 'redmine.vagrant.example.lan',
              'FACTER_my_ip': '192.168.3.11' }
    box.vm.provision "shell",
      inline: "/opt/puppetlabs/bin/puppet apply /vagrant/vagrant/redmine.pp --modulepath=/vagrant/modules"
  end
end
