# Config Management: SMART on FHIR

Use these scripts to get up and runing with:
 * [SMART on FHIR](https://github.com/jmandel/smart-on-fhir) 

##  One cloud server ("local" mode)

Everything runs on your cloud VM, including the ansible installer scripts. (Note that
ansible also supports an ssh-based remote configuraiton mode, where all the
installer scripts run elsewhere and are pushed the the VM when you specify 
remote hosts and run `ansible-playbook`.)

We'll focus on local mode, since it's simpler (and only requires a single machine).

##### 1. Provision a fresh Ubuntu 13.10 VM **with at least 1GB RAM**
##### 2. Install dependencies, ansible, and this playbook

```
export DEBIAN_FRONTEND=noninteractive
  
sudo apt-get -y install git    \
                   make         \
                   python-yaml   \                                                    
                   python-jinja2  \                                                  
                   python-paramiko \
                   software-properties-common

cd /tmp
git clone https://github.com/ansible/ansible.git         
cd ansible
git checkout release1.4.4
make install

cd /tmp 
rm -rf ansible

# Grab this playbook (the one whose README you're reading now)
git clone https://github.com/jmandel/smart-on-fhir-installer
cd smart-on-fhir-installer
```
##### 3.  Configuration your environment (see below)
##### 4.  Run this playbook
```
ansible-playbook -c local -i hosts -v site.yml
```

* `-c local`         use a local connection
* `-i hosts`         uses hosts defined in the `hosts` file
* `-v`               verbose mode for better error reporting
* `site.yml`         the top-level [install script](site.yml)

### Config files
There are three short files you'll need to edit:

---

##### `settings.yml`
Set up your FHIR server.  You'll want to edit the default template to use
your VM's fully qualified domain name.

---

##### `hosts`
Default installs on the local machine.
If you want to install the stack on a remote host, edit `hosts` as needed. (See below.)

---

##  Remote mode
To install against a remote host, you'll:
 * install ansible on your local "control" machine
 * modify the `hosts` file to point to a remote machine
 * Run `ansible-playbook  -i hosts -v site.yml`


## Get started with one line, using Vagrant

The two prerequisites, which are available on Mac, Windows, and Linux are:

1. [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](http://www.vagrantup.com/downloads)

Once you have Virtualbox and Vagrant installed on your machine, you can:

```
vagrant plugin install vagrant-vbguest
git clone https://github.com/jmandel/smart-on-fhir-installer/
cd smart-on-fhir-installer/vagrant
vagrant up
```

... wait ~10min while everything installs (depending on your Internet connection speed).

Now visit `http://localhost:9080` in a web browser on your local ("host")
maachine and you should have a working FHIR server.

You can poke around by doing:

```
vagrant ssh
```

And when you're done you can shut it down with:

```
vagrant halt
```
