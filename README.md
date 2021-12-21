# pgDockerDump
Create PostegreSQL dumps by running a single docker container

This container is targeting Docker or Kubernetes environments that are used to create database backups. The database does not have to be containerized. 

## Environmen variables
The container supports the following environmental variables:

|Name|Description|Mandatory|Default value|
--------------|-----------------|---------|--------------
|PGDUMP_DATABASE    | Name of the database to backup | yes   | postgres |
|PGDUMP_HOST        | Hostname | no    | localhost (127.0.0.1) |
|PGDUMP_PORT        | Port of the postgres server | no    | 5432 |
|PGDUMP_USER        | Username used for connection | no    | postgres |
|PGDUMP_PWD         | Password used for connection | no | - |
|PGDUMP_DELETE_OLD  | Should old backups be deleted? | no | false | 
|PGDUMP_RETENTION   | How many days should the backups be stored? | no | 30 |


## Volumes
The following folder can be mounted on a volume to store the backup data persistently

`/backup`


## Examples
Example kubernetes integration:

This container is targeting Docker or Kubernetes environments that are used to create database backups. The database does not have to be containerized. 

## Environmen variables
The container supports the following environmental variables:

|Name|Description|Mandatory|Default value|
--------------|-----------------|---------|--------------
|PGDUMP_DATABASE    | Name of the database to backup | yes   | postgres |
|PGDUMP_HOST        | Hostname | no    | localhost (127.0.0.1) |
|PGDUMP_PORT        | Port of the postgres server | no    | 5432 |
|PGDUMP_USER        | Username used for connection | no    | postgres |
|PGDUMP_PWD         | Password used for connection | no | - |
|PGDUMP_DELETE_OLD  | Should old backups be deleted? | no | false | 
|PGDUMP_RETENTION   | How many days should the backups be stored? | no | 30 |


## Volumes
The following folder can be mounted on a volume to store the backup data persistently

`/backup`


## Examples
Example kubernetes integration: