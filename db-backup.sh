#!/bin/sh
# Dump DBs - https://stackoverflow.com/a/44684766

now=$(date +"%d-%m-%Y_%H-%M")
export PGPASSWORD="metabase"
pg_dump -h db -U metabase -d metabase -w > "/db_backups/db_dump_$now.sql"

# remove all files (type f) modified longer than 30 days ago under /db_backups/backups
find /db_backups -name "*.sql" -type f -mtime +30 -delete

exit 0
