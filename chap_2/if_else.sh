#!/usr/bin/env bash

file_name="results.txt"

if [[ -f "${file_name}" ]]; then
	echo "${file_name} File Exists!!"
	exit 1
else
	echo "File does not exists!!Creating file"
	touch "${file_name}"
fi

echo "[+]Bye!!"
