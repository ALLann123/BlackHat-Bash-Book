#!/usr/bin/env bash

#make an array
ip_targets=(192.168.137.1 192.168.137.2 192.168.137.3)

for ip in "${ip_targets[@]}"; do
	echo "$ip"
done

echo "Start Reccon"
