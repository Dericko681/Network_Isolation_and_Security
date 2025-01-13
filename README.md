**Goal:** Create isolated networking environments and secure them using namespaces and Linux tools.

**Requirements:**

1. Use Docker to set up two containers simulating isolated environments (e.g., "Team A" and "Team B").
2. Use Linux network namespaces to ensure the containers cannot communicate directly.
3. Create a bridge network that allows selective communication between containers using `iptables`.
4. Test the setup using tools like `ping` and `curl`.
5. Write a script to automate the creation of this setup.

**To Begin:**

clone this repository by running the command 
```sh
git clone https://github.com/Dericko681/Network_Isolation_and_Security.git
```
change your working diresotry to this respository
```sh
Network_Isolation_and_Security
```
We will use multipass virtual machine for this project

check if multipass is installed
```sh
multpass --version
```
If you do not have multipass installed, install by running the script multipass.sh
```sh
./multipass.sh
```

To use Docker to set up two containers simulating isolated environments (e.g., "Team A" and "Team B"), Study and run the file containers.sh

```sh
 ./containers.sh
```
To use Linux network namespaces to ensure the containers cannot communicate directly study and run namepace.sh
```sh
./namespace.sh
```
To create a bridge network that allows selective communication between containers using iptables stduy and run the script network.sh
```sh
./network.sh
```

**Team**:

Derick

Joy

Nathan