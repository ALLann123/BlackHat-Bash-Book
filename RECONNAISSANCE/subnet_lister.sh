#!/usr/bin/env bash

#generate a list of IPs inthe subnet

for ip in $(seq 1 254); do
	echo "172.16.10.${ip}" >> 172-16-10-hosts.txt
done