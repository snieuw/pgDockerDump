#! /bin/bash

NOW=$(date +"%Y%m%d-%H%M%S")
echo $NOW
ARCHIVE="/backup/${PGDUMP_DATABASE}-$NOW.archive"

mkdir /backup/

echo "Dumping $PGDUMP_DATABASE to $ARCHIVE"

pg_dump -h $PGDUMP_HOST -p $PGDUMP_PORT -U $PGDUMP_USER -Fc -f $ARCHIVE $PGDUMP_DATABASE

echo "Backup complete"
