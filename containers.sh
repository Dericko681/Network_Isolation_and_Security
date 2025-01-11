#!/bin/bash
#create two containers: teamA and teamB
`multipass launch --name teamA `
`multipass launch --name teamB `
#run the first container
`multipass shell teamA`
#install docker in teamA
`sudo apt update`
`sudo apt install docker.io`
#exit the first container
`exit`
#run the second container
`multipass shell teamB`
#install docker in teamA
`sudo apt update`
`sudo apt install docker.io`
#exit the second container
`exit`


