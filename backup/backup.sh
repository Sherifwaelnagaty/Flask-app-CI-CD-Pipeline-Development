#!/bin/bash
# MySQL Database Configuration
DB_HOST="localhost"
DB_USER="root"
DB_PASSWORD=""
# Backup Directory
BACKUP_DIR="./backup"
# Log File
LOG_FILE="./backup/log"
# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
# Backup Command
BACKUP_CMD="mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} > ${BACKUP_DIR}/db_backup_${TIMESTAMP}.sql"
# Execute Backup Command
eval $BACKUP_CMD
# Log Backup
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup of database ${DB_NAME} completed" >> $LOG_FILE
