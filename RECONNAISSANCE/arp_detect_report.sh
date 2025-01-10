#!/usr/bin/env bash

#get the file with ip hosts
known_hosts="${1}"
network="${2}"
interface="br_public"
smtp_server="smtp.gmail.com:587"
smtp_user=""
smtp_pass=""  
from_add=""  # Added missing variable
to_add=""    # Added missing variable

# Check if the required arguments are provided
if [[ -z "${known_hosts}" || -z "${network}" ]]; then
  echo "Usage: $0 <known_hosts_file> <network_range>"
  exit 1
fi

while true; do
    echo "[+] Performing ARP scan against network"
    sudo arp-scan -x -I "${interface}" "${network}" | while read -r line; do
        #filter the ip from the scan above
        host=$(echo "${line}" | awk '{print $1}')
        #we check whether the host detected is in the host file and if not we add it to the host file and send a notification to the attacker
        if ! grep -q "$host" "${known_hosts}"; then
            echo "[+] New host detected >> ${host}"
            echo "${host}" >> "${known_hosts}"
            
            # Send notification email
            sendemail \
                -f "${from_add}" \
                -t "${to_add}" \
                -u "New Host Detected" \
                -m "We have detected a new host: ${host}" \
                -s "${smtp_server}" \
                -xu "${smtp_user}" \
                -xp "${smtp_pass}" \
                -o tls=yes || echo "[!] Failed to send email for ${host}"
        fi
    done
    
    # Wait before the next scan
    sleep 10
done
