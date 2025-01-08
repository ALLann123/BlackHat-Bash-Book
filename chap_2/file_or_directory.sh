#!/usr/bin/env bash

#check whether its a file or a directory using "OR" operator

dir_name="dir_test"

mkdir "${dir_name}"

if [[ -f "${dir_name}" || -d "${dir_name}" ]]; then
	echo "${dir_name} is either a file or directory"
fi


