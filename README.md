# Ansible playbooks to provide a variety of functions. 

## Minimum requirements

### using AlmaLinux-8.x

To create AlmaLinux-8 vagrant machine on Windows11:

```
PS> cat Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox" do |vb|
    vb.cpu = "2"
    vb.memory = "2048"
  end
  config.vm.define "alma8" do |alma8|
    alma8.vm.box = "generic/alma8"
    alma8.vm.hostname = "alma8"
  end
end
PS> vagrant up
```

If you want to run gitlab, the VM needs 6GB+ memory.

### User and permissions to run

It is intended to be run in a vagrant environment.

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

## Exceution

First, read README(s) at roles/XXX (XXX corresponds XXX.yml) if any, then follow the instructions.
And then run:

```
$ ansible-playbook jobs/XXX.yml
```
