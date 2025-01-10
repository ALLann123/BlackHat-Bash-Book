#!/usr/bin/env bash

file="${1}"
port="${2}"

# Check for correct usage
if [[ "$#" -ne 2 ]]; then
 	echo "Usage: ${0} <file> <port>"
 	exit 1
fi

# Check if the file exists
if [[ ! -f "${file}" ]]; then
	echo "File: ${file} was not found."
	exit 1
fi

# Check if the port is a valid number
if [[ ! "${port}" =~ ^[0-9]+$ ]]; then
	echo "${port} must be a number."
	exit 1
fi

# Loop through each IP in the file and run netcat
while read -r ip; do
	# Run netcat and suppress unnecessary output
	result=$(echo -e "\n" | nc "${ip}" -w 1 "${port}" 2>/dev/null)
	
	# If a banner is received, display it
	if [[ -n "${result}" ]]; then
		echo "=========================="
		echo "+ IP Address: ${ip}"
		echo "+ Banner: ${result}"
		echo "=========================="
	fi
done < "${file}"
