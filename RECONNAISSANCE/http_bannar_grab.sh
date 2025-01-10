#!/usr/bin/env bash

default_port="80"

# Get user input
read -r -p "Target IP address>> " ip
read -r -p "Target Port>> " port

# Check if IP address is provided
if [[ -z "${ip}" ]]; then
	echo "You must provide an IP address."
	exit 1
fi

# Check if port is provided, otherwise default to port 80
if [[ -z "${port}" ]]; then
	echo "Did not provide a port, defaulting to ${default_port}"
	port="${default_port}"
fi

echo "----------------------------------------------------"
echo "[+] Attempting Banner Grabbing"

# Use curl to get the headers and extract the Server header
result=$(curl -sI "http://${ip}:${port}" | grep -i '^Server:' | awk -F': ' '{print $2}')

# Check if the result is empty
if [[ -n "${result}" ]]; then
	echo "[+] Server header for ${ip} on port ${port} is: ${result}"
else
	echo "[-] No Server header found for ${ip} on port ${port}."
fi
