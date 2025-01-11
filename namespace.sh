#!/bin/bash
`sudo ip netns add teamA`
`sudo ip netns add teamB`
`sudo ip link add veth-teamA type veth peer name veth-teamB`
`sudo ip link set veth-teamA netns teamA`
`sudo ip link set veth-teamB netns teamB`
`sudo ip netns exec teamA ip addr add 192.168.1.1/24 dev veth-teamA`
`sudo ip netns exec teamB ip addr add 192.168.1.2/24 dev veth-teamB`
`sudo ip netns exec teamA ip link set veth-teamA up`
`sudo ip netns exec teamB ip link set veth-teamB up`
`sudo ip netns exec teamA ping 192.168.1.2`
`sudo ip netns exec teamB ping 192.168.1.1`