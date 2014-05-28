## Get started with one line, using Vagrant

The three prerequisites, which are available on Mac, Windows, and Linux 
are (we have tested with the versions below, but other versions may be fine too):

1. [VirtualBox 4.3.12](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant 1.6.2](http://www.vagrantup.com/downloads)
3. [Ansible 1.6.1](http://docs.ansible.com/intro_installation.html)

Once you have Virtualbox and Vagrant installed on your machine, you can:

```
vagrant plugin install vagrant-vbguest
git clone https://github.com/smart-on-fhir/smart-on-fhir-installer/
cd smart-on-fhir-installer
vagrant up
```

... wait ~20min while everything installs (depending on your Internet connection speed).

Now visit `http://localhost:9080` in a web browser on your local ("host")
machine and you should have a working FHIR server. 

The OpenID Connect authentication server should be at `http://localhost:9085`. It uses
the OpenLDAP server running on the virtual machine. The two sample accounts are `demo/demo` and
`admin/password` by default.

You can poke around by doing:

```
vagrant ssh
```

And when you're done you can shut it down with:

```
vagrant halt
```

---

## From a fresh Ubuntu 14.04 machine

```
apt-get install curl git ansible python-pycurl
git clone https://github.com/smart-on-fhir/smart-on-fhir-installer
cd smart-on-fhir-installer/provisioning
```

At this point, you probably want to edit `settings.yml` to suit your needs.
For example, change `localhost` to some world-routable hostname if that's
what you need -- and set the app_server public port to 80.

```
ansible-playbook  -c local -i 'localhost,' -vvvv smart-on-fhir-servers.yml 
```
