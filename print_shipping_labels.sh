#!/bin/bash
# Installed at /cron/print_shipping_labels.sh
# Created: September 2021

print_labels() {
  echo "[+] Printing shipping labels"
}

# Check we're running as root
if [[ $EUID -ne 0 ]]; then
   echo "[!] This script must be run as root" 
   exit 1
fi

# Check that we have an active internet connection
wget -q --spider http://google.com
if [ $? -ne 0 ]; then
    echo "[!] Please ensure this machine has internet access."
    exit 1
fi

echo "[+] Starting $(date)"

print_labels

echo "[+] End time: $(date)"

echo "[+] Done"


