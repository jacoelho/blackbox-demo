# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "chef/debian-7.8"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "128"
  end

  config.ssh.forward_agent = true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
      ansible.extra_vars = {
        ansible_ssh_user: 'vagrant',
        ansible_connection: 'ssh',
        ansible_ssh_args: '-o ForwardAgent=yes'
      }
  end
end
