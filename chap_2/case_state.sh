#!/usr/bin/env bash

#program to check the subnet of the IP

ip_add=${1}

case "${ip_add}" in
	192.168.*)
		echo "Network is 192.168.x.x is an internal Network"
	;;
	10.0.*)
		echo "Network is 10.0.x.x is a virtual machine"
	;;
	*)   #default case when all other are false
		echo "Could not identify Network!!"
	;;
esac
