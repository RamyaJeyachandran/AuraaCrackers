#!/bin/bash
# import_server_db.sh
# Script to import the auraacrackers database into the server's Docker container

DB_NAME="auraacrackers"
DB_USER="auraauser"
DB_ROOT_USER="auraauser" # Usually the same in the docker-compose setup
BACKUP_FILE="backups/auraacrackers_prod_sync.sql"

echo "--- Starting Database Import on Server ---"

if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file $BACKUP_FILE not found!"
    exit 1
fi

echo "Cleaning up existing database '$DB_NAME'..."
# Drop and recreate database to ensure a fresh import
# We connect to 'postgres' database to perform the drop/create
docker-compose exec -T db psql -U $DB_ROOT_USER -d postgres -c "DROP DATABASE IF EXISTS $DB_NAME;"
docker-compose exec -T db psql -U $DB_ROOT_USER -d postgres -c "CREATE DATABASE $DB_NAME;"

echo "Importing data into '$DB_NAME'..."
# Stream the local file into the container's psql
cat $BACKUP_FILE | docker-compose exec -T db psql -U $DB_USER -d $DB_NAME

if [ $? -eq 0 ]; then
    echo "Successfully imported database from $BACKUP_FILE"
else
    echo "Error: Database import failed."
    exit 1
fi
