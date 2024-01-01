#!/bin/bash
# Creates Cron Job which backups DB in Docker everyday at 22:00 host time
# https://stackoverflow.com/a/44684766
croncmd_backup="docker exec -it picolytics-db bash -c '/usr/local/bin/db-backup.sh'"
cronjob_backup="00 22 * * * $croncmd_backup"

if [[ $# -eq 0 ]] ; then
    echo -e 'Please provide one of the arguments (example: ./cron-backup.sh add-cron-db-backup):
    1 > add
    2 > remove'

elif [[ $1 == add ]]; then
    ( crontab -l | grep -v -F "$croncmd_backup" ; echo "$cronjob_backup" ) | crontab -
    echo "==>>> Backup task added to Local (not container) Cron"

elif [[ $1 == remove ]]; then
    ( crontab -l | grep -v -F "$croncmd_backup" ) | crontab -
    echo "==>>> Backup task removed from Cron"
fi

