#! /bin/bash

# Set default values
DB=${PGDUMP_DATABASE:-"postgres"}
HOST=${PGDUMP_HOST:-"127.0.0.1"}
PORT=${PGDUMP_PORT:-5432}
USER=${PGDUMP_USER:-"postgres"}
DEL_OLD=${PGDUMP_DELETE_OLD:-false}
RETENTION=${PGDUMP_RETENTION:-14}

# set the PGPASSWORD environment variable, for connecting to the server via username/password
export PGPASSWORD=$PGDUMP_PWD

#format the current date and time
NOW=$(date +"%Y%m%d-%H%M%S")

#use the formated date and time to create a target filename for the dump
ARCHIVE="/backup/${DB}-$NOW.archive"

#test if the backup folder already exists. Create one if it does not exist yet. Prevents errors in the log
! test -d /backup && mkdir /backup/

#logging info
echo "Dumping $DB to $ARCHIVE"

#this creates the actual dump
pg_dump -h $HOST -p $PORT -U $USER -Fc -f $ARCHIVE $DB

#finished
echo "Backup complete"
if [ "$DEL_OLD" = true ] ; then
  #clean up old backup files
  find . -name $DB"-*.archive" -type f -mtime +$RETENTION -exec rm -f {} \;
  echo 'Old backups removed'
else
  echo 'deleting of old backups is disabled'
fi

