# ansible-centos7-kvm

ansible-centos7-kvm is an Ansible playbook to bootstrap a centos 7 server to be used as kvm hypervisor. It performs some basic configuration
and basic hardening (first n minutes on an new server like) on the server and it installs and configure a basic kvm hypervisor.
It has a very limted scope, it's modeled on an Hetzner dedicated server and it has a quite strict configuration for libvirt storage
pools and networks (more in the configuration part of this readme)

It configures by distinct roles:

* basic users
* ssh
* basic packages
* motd
* fail2ban
* firewall
* mail for notifications
* unattended updates by yum-cron
* libvirt and kvm

## Install
### Clone
```bash
git clone https://github.com/lgaggini/ansible-centos7-kvm.git
```
## Configuration

The configuration is done by the [group_vars/all](https://github.com/lgaggini/ansible-centos7-kvm/blob/master/group_vars/all.yml) file.
Options are self-explanatory. 
Passwords can be set by using Ansible Vault.
For the libvirt setup there are some strict assumptions, based on a standard Hetzner dedicated server (1 IPv4 Address and 1 IPv6 network).
* one main lvm volume group as storage pool
* 3 libvirt networks: one ipv4 only internal (no nat), one ipv4 only private (nat) and one ipv6 only routed network


## Usage

```bash
ansible-playbook -i hosts playbook.yml --tags {{ tag }}
```

Available tags are:

* user
* ssh
* packages
* motd
* fail2ban
* firewall
* mail
* yum-cron
* libvirt-kvm
