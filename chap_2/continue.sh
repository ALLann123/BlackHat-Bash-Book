#!/usr/bin/env bash

#create the files
touch example_file1 example_file2 example_file3

for file in example_file*; do
	if [[ "${file}" == example_file1 ]]; then
		echo "Skipping the first file"
		continue
	fi
	echo "${RANDOM}" > "${file}"    #generate random value and add to the file
done
