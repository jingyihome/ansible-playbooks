#! /bin/bash
#
# check_dummy_state.sh

ip addr show kube-ipvs0 up | grep 'not exist'  > /dev/null

if [ $? != 0 ]
then
  ip link set kube-ipvs0 up
fi



