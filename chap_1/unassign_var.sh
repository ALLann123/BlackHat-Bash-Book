#!/usr/bin/env bash

book="BlackHat Bash"

echo "Before unassigning"
echo "I am reading ${book}"

unset book

echo "After Unassigning the variable"
echo "I am reading ${book}"
