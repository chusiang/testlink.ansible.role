# -*- mode: ruby -*-

DOMAIN = "testlink.local"

instances = [
  {
    :name       => "ubuntu1404",
    :image      => "ubuntu/trusty64",
    :private_ip => "192.168.33.10"
  },
  {
    :name       => "ubuntu1604",
    :image      => "ubuntu/xenial64",
    :private_ip => "192.168.33.11"
  },
  {
    :name       => "debian8",
    :image      => "debian/jessie64",
    :private_ip => "192.168.33.21"
  }
]

# Main
######

Vagrant.configure("2") do |config|

  # Loop by each.
  instances.each do |instance|

    config.vm.define instance[:name] do |node|
      node.vm.box = instance[:image].to_s
      node.vm.network "private_network", ip: instance[:private_ip].to_s

      # hostname = <instance name>.<DOMAIN>
      node.vm.hostname = instance[:name].to_s + "." + DOMAIN

      node.vm.provider "virtualbox" do |vb|
        vb.linked_clone = true

        # Customize the memory size for mysql-server-5.6.
        vb.memory = "1024"
      end

      # Only for Ubuntu 16.04.
      if ( instance[:name].to_s == "ubuntu1604" )
        node.vm.provision "shell",
          inline: "sudo sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list"
        node.vm.provision "shell",
          inline: "sudo apt update && sudo apt install -y python"
      end

      node.vm.provision "ansible" do |ansible|
        ansible.playbook = "setup.yml"
        ansible.become = true
        #ansible.verbose = "vvv"
      end
    end

  end
end

# vi: set ft=ruby :
