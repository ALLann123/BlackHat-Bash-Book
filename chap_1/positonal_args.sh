#!/usr/bin/env bash

#get argument from the user

target="${1}"

echo "[+]Pinging Target"
ping -c 3 "${target}"
