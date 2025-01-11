#!/bin/bash
#Create Network Namespaces:
`sudo ip netns add teamA`
`sudo ip netns add teamB`
#Create Virtual Ethernet (veth) Interfaces:
`sudo ip link add veth-teamA type veth peer name veth-teamB`
#Move Interfaces into Network Namespaces:
`sudo ip link set veth-teamA netns teamA`
`sudo ip link set veth-teamB netns teamB`
#Configure IP Addresses:
`sudo ip netns exec teamA ip addr add 192.168.1.1/24 dev veth-teamA`
`sudo ip netns exec teamB ip addr add 192.168.1.2/24 dev veth-teamB`
#Bring Up Interfaces:
`sudo ip netns exec teamA ip link set veth-teamA up`
`sudo ip netns exec teamB ip link set veth-teamB up`
#Verify Connectivity:
#Ping from Team A to Team B to ensure connectivity:
`sudo ip netns exec teamA ping 192.168.1.2`
#Ping from Team B to Team A to ensure connectivity:
`sudo ip netns exec teamB ping 192.168.1.1`