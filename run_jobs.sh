#!/bin/bash
# Run all my jobs!
for file in /cron/*.job.sh
do
  /bin/bash $file >> $file.log
done
