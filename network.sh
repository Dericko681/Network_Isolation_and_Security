#!/bin/bash

#Create a bridge network that allows selective communication between containers using iptables
#create bridge networks
`sudo docker network create network1`
echo "netwrok1 created"
`sudo docker network create network2`
#Run Containers
`sudo docker run -d --name teamA --network network1 nginx`
`sudo docker run -d --name teamA --network network2 nginx`
#Install iptables
`sudo iptables -L`
#configure iptable rules
`sudo iptables -I FORWARD -s 192.168.1.1/24 -d 192.168.1.2/24 -j ACCEPT`
`sudo iptables -I FORWARD -d 192.168.1.1/24 -s 192.168.1.2/24 -j ACCEPT`
#persist iptables rules
#`iptables-save > /etc/iptables/rules.v4`
#`iptables-restore < /etc/iptables/rules.v4`
#Enable br_netfilter Module
`modprobe br_netfilter`
#Set Kernel Parameters
echo "net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-arptables = 1" >> /etc/sysctl.conf
#Apply the changes with:
`sysctl -p`