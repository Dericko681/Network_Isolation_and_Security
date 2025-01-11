# Network_Isolation_and_Security
mutilpasss launch --name teamA 
sudo apt update
sudo apt install docker.io


To create a new network namespace for a pair of containers called Team A and Team B, and then move their network interfaces into these namespaces, follow these steps:

Create Network Namespaces:
Create a network namespace for Team A:
````ip netns add teamA```

Create a network namespace for Team B:
```ip netns add teamB```

Create Virtual Ethernet (veth) Interfaces:
Create a veth interface pair:
```ip link add veth-teamA type veth peer name veth-teamB```

This command creates two interfaces, veth-teamA and veth-teamB, which are connected to each other.
Move Interfaces into Network Namespaces:
Move veth-teamA into the Team A namespace:
```ip link set veth-teamA netns teamA```

Move veth-teamB into the Team B namespace:
```ip link set veth-teamB netns teamB```

Configure IP Addresses:
Assign an IP address to veth-teamA in the Team A namespace:
```ip netns exec teamA ip addr add 192.168.1.1/24 dev veth-teamA```

Assign an IP address to veth-teamB in the Team B namespace:
```ip netns exec teamB ip addr add 192.168.1.2/24 dev veth-teamB```

Bring Up Interfaces:
Bring up the veth-teamA interface in the Team A namespace:
```ip netns exec teamA ip link set veth-teamA up```
`
Bring up the veth-teamB interface in the Team B namespace:
```ip netns exec teamB ip link set veth-teamB up```

Verify Connectivity:
Ping from Team A to Team B to ensure connectivity:
```ip netns exec teamA ping 192.168.1.2```

Ping from Team B to Team A to ensure connectivity:
```ip netns exec teamB ping 192.168.1.1```