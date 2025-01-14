#!/bin/bash
#Create Network Namespaces:
`sudo ip netns add teamA`
if [[ $? -eq 0 ]]; then
    echo "created name space for team A"
else
    echo "`sudo ip netns add teamA` failed"
fi
`sudo ip netns add teamB`
if [[ $? -eq 0 ]]; then
    echo "created name space for teamB"
else
    echo "`sudo ip netns add teamB` failed"
fi

#Create Virtual Ethernet (veth) Interfaces:
`sudo ip link add veth-teamA type veth peer name veth-teamB`
if [[ $? -eq 0 ]]; then
    echo "pair of virtual ethernet interfaces: veth-teamA & veth-teamB created"
else
    echo "`sudo ip link add veth-teamA type veth peer name veth-teamB` failed"
fi
#Move Interfaces into Network Namespaces:
`sudo ip link set veth-teamA netns teamA`
if [[ $? -eq 0 ]]; then
    echo "added teamA to veth-teamA"
else
    echo "`sudo ip link set veth-teamA netns teamA` failed"
fi
`sudo ip link set veth-teamB netns teamB`
if [[ $? -eq 0 ]]; then
    echo "added teamB to veth-teamB"
else
    echo "`sudo ip link set veth-teamB netns teamB` failed"
fi
#Configure IP Addresses:
`sudo ip netns exec teamA ip addr add 192.168.1.1/24 dev veth-teamA`
if [[ $? -eq 0 ]]; then
    echo "ip address teamA: 192.168.1.1/24"
else
    echo "`failed to configure ip addresse of teamA"
fi
`sudo ip netns exec teamB ip addr add 192.168.1.2/24 dev veth-teamB`
if [[ $? -eq 0 ]]; then
    echo "ip address teamB: 192.168.1.2/24 "
else
    echo "`failed to configure ip address of teamB"
fi
#Bring Up Interfaces:
`sudo ip netns exec teamA ip link set veth-teamA up`
if [[ $? -eq 0 ]]; then
    echo "namespace of teamA activated"
else
    echo "`failed to activate namespace of teamA"
fi
`sudo ip netns exec teamB ip link set veth-teamB up`
if [[ $? -eq 0 ]]; then
    echo "teamB activated"
else
    echo "failed to activate teamB: failed"
fi
#Verify Connectivity:
#Ping from Team A to Team B to ensure connectivity:
`sudo ip netns exec teamA ping 192.168.1.2`
if [[ $? -eq 0 ]]; then
    echo "ping teamB from teamA"
else
    echo "failed to ping teamB from teamA failed"
fi
#Ping from Team B to Team A to ensure connectivity:
`sudo ip netns exec teamB ping 192.168.1.1`
if [[ $? -eq 0 ]]; then
    echo "pingin teamA from teamB"
else
    echo "pind teamA from teamB: failed"
fi
