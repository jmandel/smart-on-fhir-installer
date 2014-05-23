# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "smart-on-fhir"

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  
  # accessing "localhost:9080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 9080
  config.vm.network :forwarded_port, guest: 8080, host: 9085
  config.vm.network :forwarded_port, guest: 389, host: 389
  
  config.vm.provision "ansible" do |ansible|
    # ansible.verbose = "v"
    ansible.playbook = "provisioning/smart-on-fhir-servers.yml"
  end

end