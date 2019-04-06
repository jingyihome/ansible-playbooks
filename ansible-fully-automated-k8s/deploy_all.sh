#! /bin/bash
#
# deploy_all.sh


git clone https://github.com/jpmondet/FullyAutomatedBGPFabric
wait
git clone https://github.com/jpmondet/Fully-automated-k8s-deployment
wait
 
cd $PWD/FullyAutomatedBGPFabric
wait
 
ansible-playbook deploy_network.yml -e "option=5549"
wait
 
cd ../Fully-automated-k8s-deployment
wait
#git checkout version_bumping
#wait
 
# Bypassing an issue with netaddr
# Cause it has been installed with sudo by CITC.
sudo pip uninstall -y netaddr
wait
pip install --user netaddr
wait
 
ansible-playbook deploy_k8s.yaml



