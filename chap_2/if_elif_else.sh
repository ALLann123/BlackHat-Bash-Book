#!/usr/bin/env bash

USER_INPUT="${1}"

if [[ -z "${USER_INPUT}" ]]; then
	echo "You must provide a command"
	exit 1
fi

if [[ -f "${USER_INPUT}" ]]; then
	echo "${USER_INPUT} is a file"
elif [[ -d "${USER_INPUT}" ]]; then
	echo "${USER_INPUT} is not a file"
else
	echo "${USER_INPUT} does not exist"
	echo "-------------------------------"
	if  touch "${USER_INPUT}" ; then
		echo "[+]FIle created"
	fi
fi

echo "Bye!!"
