#!/usr/bin/env bash
#take two inputs

domain="${1}"
file="${2}"

#read the file then echo it to the domain inorder to append it
while read -r subdomain; do
	echo "${subdomain}.${domain}"
done < "${file}"
echo "-----------------------------------------"
echo "[+]Done, Bye!!"
