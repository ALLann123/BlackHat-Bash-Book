#!/usr/bin/env bash

echo "***Welcome to Social Engineering Bash***"
echo "-----------------------------------------"
echo "Enter Email address?"
read -r email
echo "Enter from Name?"
read -r name
echo "Enter subject of the email"
read -r subject

echo "=================================="
echo "Confirm Information"
echo "The Email is ${email}, the from Name is ${name} and finally the subject is ${subject}"
sleep 2
echo "[+]Spoofing Email Wait"
echo "[+]Congratulations Email sent Successfully!!"
