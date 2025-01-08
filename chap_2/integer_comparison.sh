#!/usr/bin/env bash

#check which number is greater

first_num="30"
second_num="27"

if [[ "${first_num}" -gt "${second_num}" ]]; then
	echo "${first_num} is greater then ${second_num}"
else
	echo "${first_num} is less than ${second_num}"
fi

