#!/bin/sh
# Dump DBs - https://stackoverflow.com/a/44684766

now=$(date +"%d-%m-%Y_%H-%M")
export PGPASSWORD="metabase"
# Uncomment this if you prefer uncompressed/ raw SQL backups
# pg_dump -h db -U metabase -d metabase -w > "/db_backups/db_dump_$now.sql"
pg_dump -Fc -h db -U metabase -d metabase -w > "/db_backups/db_dump_$now.dump"

# remove all files (type f) modified longer than 30 days ago under /db_backups/backups
find /db_backups -name "*.sql" -o -name "*.dump" -type f -mtime +30 -delete

exit 0
