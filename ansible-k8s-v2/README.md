# ansible-k8s
Ansible playbook for recreating kubernetes the hard way

sources used:

https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/08-bootstrapping-kubernetes-controllers.md

https://github.com/Praqma/LearnKubernetes/blob/master/kamran/Kubernetes-The-Hard-Way-on-BareMetal.md

versions used:
kubernetes: 3.13
etcd:       3.3.12

WIP; this is in no way a final project yet.


What you'll need to do yourself:
- review ansible.cfg for your custom configuration
- modify your ~/.ssh/config file for pubkey login via ansible control node
