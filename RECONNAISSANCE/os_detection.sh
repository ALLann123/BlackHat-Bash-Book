#!/bin/bash

HOSTS="$*"

# Check for root privileges
if [[ "${EUID}" -ne 0 ]]; then
    echo "The Nmap OS detection scan type (-O) requires root privileges."
    exit 1
fi

# Ensure an IP or IP range is provided
if [[ "$#" -eq 0 ]]; then
    echo "You must pass an IP or an IP range."
    exit 1
fi

echo "Running an OS Detection Scan against ${HOSTS}..."

# Run Nmap OS detection and process the output
nmap_scan=$(sudo nmap -O "${HOSTS}" -oG -)

# Parse and display results
while read -r line; do
    ip=$(echo "${line}" | awk '{print $2}')
    os=$(echo "${line}" | awk -F'OS: ' '{print $2}' | sed 's/Seq.*//g')

    if [[ -n "${ip}" && -n "${os}" ]]; then
        echo "IP: ${ip} OS: ${os}"
    fi
done <<< "${nmap_scan}"
