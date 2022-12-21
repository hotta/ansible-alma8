# Ansible playbooks for building various server / feature 

## Minimum requirements

1. using AlmaLinux-8.x

To create AlmaLinux-8 vagrant machine on Windows11:

```
PS> cat Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox" do |hv|
    hv.memory = "2048"
  end
  config.vm.define "alma8" do |alma8|
    alma8.vm.box = "generic/alma8"
    alma8.vm.hostname = "alma8"
  end
end
PS> vagrant up
```

2. We assume vagrant environment

```
$ sudo cat /etc/sudoers.d/vagrant
%vagrant ALL=(ALL) NOPASSWD: ALL
```

## Preparation

```
$ sudo dnf -y update
$ sudo dnf -y install git epel-release glibc-langpack-ja
$ sudo dnf -y install ansible
$ git clone https://github.com/hotta/ansible-alma8 
$ cd ansible-alma8
$ ansible-galaxy collection install -r requirements.yml
```

I recommend you to take a snapshot at this point.

## Exceution

```
$ cd ansible-alma8
$ ansible-playbook jobs/XXX.yml
```
