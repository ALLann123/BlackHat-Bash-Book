#!/usr/bin/env bash

#check if file doesnt exist

file_name="output.txt"

if [[ ! -f "${file_name}" ]]; then
	echo "[+]Creating file"
	touch "${file_name}"
fi
