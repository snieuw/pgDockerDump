#! /bin/bash

#format the current date and time
NOW=$(date +"%Y%m%d-%H%M%S")

#use the formated date and time to create a target filename for the dump
ARCHIVE="/backup/${PGDUMP_DATABASE}-$NOW.archive"

#test if the backup folder already exists. Create one if it does not exist yet. Prevents errors in the log
! test -d /backup && mkdir /backup/

#logging info
echo "Dumping $PGDUMP_DATABASE to $ARCHIVE"

#this creates the actual dump
pg_dump -h $PGDUMP_HOST -p $PGDUMP_PORT -U $PGDUMP_USER -Fc -f $ARCHIVE $PGDUMP_DATABASE

#finished
echo "Backup complete"

#clean up old backup files
find . -name $PGDUMP_DATABASE"-*.archive" -type f -mtime +$PGDUMP_RETENTION -exec rm -f {} \;