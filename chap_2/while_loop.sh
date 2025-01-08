#!/usr/bin/env bash

#file to search for
file_name="stoploop"

while [[ ! -f "${file_name}" ]]; do
	echo "[-]File Not found!!"
	echo "Starting again in 2 seconds..."
	sleep 2
done

echo "[+]File was found!!"
