#!/bin/sh

env >> /etc/environment
CRON=${PGDUMP_CRON:-"0 1 * * *"}

echo "$CRON /app/runBackup.sh" >> /etc/crontabs/root
crond -l 2 -f > /dev/stdout 2> /dev/stderr &
