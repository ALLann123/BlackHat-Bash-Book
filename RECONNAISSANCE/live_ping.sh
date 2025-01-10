#!/usr/bin/env bash
echo "[+] Checking Live Hosts"
echo "*************************"

file="${1}"

while read -r ip; do
    if ping -c 1 -W 1 "$ip" &> /dev/null; then
        echo "${ip} is up"
    fi
done < "$file"
echo "------------"
echo "[+]Done"
