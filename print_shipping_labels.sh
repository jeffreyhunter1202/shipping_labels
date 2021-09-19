#!/bin/bash
# Installed at /cron/print_shipping_labels.sh
# `chmod 766 print_shipping_labels.sh`
# Created: September 2021
# jhunter@nwajuiceshop.com
# http://nwajuiceshop.com

USER=jhunter
# PASSWD is set securely in environment variable

ftp_connect() {
  echo "[+] Connecting to FTP server..."
  ftp -n $HOST <<END_SCRIPT
    quote USER $USER
    quote PASS $PASSWD
    binary
    put $FILE
    quit
  END_SCRIPT
}

print_labels() {
  FILE="daily_orders.txt"
  echo "[+] Uploading shipping labels to FTP server..."
  if [ -f "$FILE" ]; then
    echo "Found $FILE"
    ftp_connect $FILE
  fi
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


