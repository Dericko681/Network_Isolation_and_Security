#!/bin/bash
#Ping from Team A to Team B to ensure connectivity:
`sudo ip netns exec teamA ping 192.168.1.2`
#Ping from Team B to Team A to ensure connectivity:
#`sudo ip netns exec teamB ping 192.168.1.1`
