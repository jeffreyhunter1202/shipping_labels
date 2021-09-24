#!/bin/bash
# Run all my jobs!
for file in /cron/jobs/*.job.sh
do
  echo "[+] Running job=($file) at $(date)"
  # Be sure not to wait for any one job to complete; fire and forget
  /bin/bash $file >> $file.log &
done
