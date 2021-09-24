#!/bin/bash
# Run all my jobs!
for file in /cron/*.job.sh
do
  echo "[+] Running job=($file) at $(date)"
  /bin/bash $file >> $file.log
done
