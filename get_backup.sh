#!/bin/bash

# Load environment variables
source .env

# Set the path to the docker-compose.yml file
COMPOSE_FILE="docker-compose.yml"

# Define the service name where you want to execute the command
SERVICE_NAME="mysql"

# Define the command you want to execute within the container
COMMAND="mysqldump -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} > /path/to/backup/dir/db_backup_$(date +%F_%T).sql"

# Execute the command within the container using docker-compose exec
docker-compose -f $COMPOSE_FILE exec $SERVICE_NAME bash -c "$COMMAND"

# Log the backup
echo "[$(date +%F_%T)] Backup of ${MYSQL_DATABASE} completed" >> /path/to/backup/dir/backup.log
