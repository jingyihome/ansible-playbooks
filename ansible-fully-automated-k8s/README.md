# Fully-Automated-K8s-deployment

## Introduction

This ansible repository provides a quick way to automatically deploy a Kubernetes Cluster inspired by the "[K8s the hard way](https://github.com/kelseyhightower/kubernetes-the-hard-way)" method.

The resulting cluster is meant to be ready to try different networking solutions (and much more, of course!) without layers of abstraction that prevent to understand exactly what's happening under the hood (such as kubeadm which makes everything very ~~too~~ easy to deploy).

We all know about most of the existing networking plugins (*Flannel, Calico, Kube-router, etc..*) but this is a hugely moving ecosystem and having a "ready-to-bench" cluster looks pretty convenient.

## The network topology

I am going to re-use the network topology deployed with the [Fully-Automated-BGP-fabric](https://github.com/jpmondet/Fully-Automated-BGP-fabric) to focus here on the K8s cluster.

## The resulting cluster

You can optimize everything but if you need a quick test lab, you can deploy with a one-liner on a free blank [Cumulus In The Cloud](https://cumulusnetworks.com/products/cumulus-in-the-cloud/) workbench : 

```
wget https://raw.githubusercontent.com/jpmondet/Fully-Automated-K8s-deployment/master/deploy_all.sh ; chmod u+x deploy_all.sh ; bash deploy_all.sh
```

Some customization can be done by changeing values in the **global_vars.yaml** file but the defaults one-liner above gives you : 

* Kubernetes 1.13
* containerd 1.2.1
* runc 1.0.0-rc6
* etcd 3.3.10
* Standard Cni type Bridge
* IPVS replaces IPtables for Services 
* CoreDNS replaces Kubedns (1.13 made CoreDNS the default so it's no more a 'cool' feature to have ;-)
* A pure RFC5549-based L3 IPv6 network (which lets you use IPv4 above v6)
* [Kubefw](https://github.com/jpmondet/kubefw) to leverage Network Policies
