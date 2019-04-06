# Kubernetes and Spark on Kubernetes

This repository defines multiple ansible roles to help deploying and configuring a Kubernetes cluster

# Requirements

You will need a driver machine with ansible installed and a clone of the current repository:

* If you are running on cloud (public/private network)
  * Install ansible on the edge node (with public ip)
* if you are running on private cloud (public network access to all nodes)
  * Install ansible on your laptop and drive the deployment from it

### Installing Ansible on RHEL

```
curl -O https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -i epel-release-latest-7.noarch.rpm
sudo yum update -y
sudo yum install -y  ansible
```

### Installing Ansible on Mac

* Install Annaconda
* Use pip install ansible

```
pip install --upgrade ansible
```

### Updating Ansible configuration

In order to have variable overriding from host inventory, please add the following configuration into your ~/.ansible.cfg file

```

[defaults]
host_key_checking = False
hash_behaviour = merge
command_warnings = False
inventory = hosts
log_path=ans.log
deprecation_warnings=False
self.use_private_ip = True
host_key_checking = False

```

### Supported/Tested Platform

* RHEL 7.x
* Ansible 2.6.3

### ssh connections

It is not configired here ssh keys for ansible to master and slaves nodes.

So you have to do it himself.  

Command  ansible all -m ping

have to result "ping"  : "pong"



# Defining your cluster deployment metadata (host inventory)

Ansible uses 'host inventory' files to define the cluster configuration, nodes, and groups of nodes
that serves a given purpose (e.g. master node).

Below is a host inventory sample definition:

```
[master]
10.0.2.5

[nodes]
10.0.2.6
10.0.2.7


change group_vars/all.yml


slave1: 10.0.2.6
slave2: 10.0.2.7

```

# Deploying Kubernetes

### Deployment playbook

The sample playbook below can be used to deploy an Spark using an HDP distribution

```
- name: setup kubernetes
  hosts: all
  roles:
    - role: common
    - role: kubernetes

```


### Deploying



### Deployment playbook

```
- name: setup spark
  hosts: all
  remote_user: root
  roles:
    - role: common
    - role: kubernetes 
```

### Deploying

```

Example:

```
ansible-playbook -vvv setup-kubernetes.yml


```
ps.
run under root user because kubadm will timeout if under simple user with become=true
It,s look like bug




# ansible_kubernetes_1.13_centos7
