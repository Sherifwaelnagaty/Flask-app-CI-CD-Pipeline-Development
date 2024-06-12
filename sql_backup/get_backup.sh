#!/bin/bash
#MySQL Credentials 
DB_USER="root"
DB_PASS=""
DB_NAME="localhost"

#Backup directory
BACKUP_DIR="/backup/dir"
DATE=$(date +%F_%T)

# Export the database
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_backup_$DATE.sql

# Log the backup
echo "[$DATE] Backup of $DB_NAME completed" >> $BACKUP_DIR/backup.log
