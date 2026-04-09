#!/bin/bash
# import_server_db.sh
# Script to import the auraacrackers database into the server's Docker container

DB_NAME="auraacrackers"
DB_USER="auraauser"
DB_ROOT_USER="auraauser" # Usually the same in the docker-compose setup
BACKUP_FILE="backups/auraacrackers_prod_sync.sql"

# Determine if we should use 'docker compose' (V2) or 'docker-compose' (V1)
if docker compose version >/dev/null 2>&1; then
    DOCKER_CMD="docker compose"
elif docker-compose version >/dev/null 2>&1; then
    DOCKER_CMD="docker-compose"
else
    echo "Error: Neither 'docker compose' nor 'docker-compose' was found."
    exit 1
fi

echo "--- Starting Database Import on Server using $DOCKER_CMD ---"

if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file $BACKUP_FILE not found!"
    exit 1
fi

echo "Cleaning up existing database '$DB_NAME'..."
# 1. Forcefully disconnect any existing sessions (like the Django app)
$DOCKER_CMD exec -T db psql -U $DB_ROOT_USER -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '$DB_NAME' AND pid <> pg_backend_pid();"

# 2. Drop and recreate database to ensure a fresh import
$DOCKER_CMD exec -T db psql -U $DB_ROOT_USER -d postgres -c "DROP DATABASE IF EXISTS $DB_NAME;"
$DOCKER_CMD exec -T db psql -U $DB_ROOT_USER -d postgres -c "CREATE DATABASE $DB_NAME;"

echo "Importing data into '$DB_NAME'..."
# Stream the local file into the container's psql
cat $BACKUP_FILE | $DOCKER_CMD exec -T db psql -U $DB_USER -d $DB_NAME

if [ $? -eq 0 ]; then
    echo "Successfully imported database from $BACKUP_FILE"
else
    echo "Error: Database import failed."
    exit 1
fi
