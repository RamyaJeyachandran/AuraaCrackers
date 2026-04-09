# Database Migration Plan (Docker Method)

This plan outlines the steps to migrate the `auraacrackers` PostgreSQL database from your local Docker environment to a remote server also running Docker.

## Objectives
- Export all tables, data, and schema from the local `db` container.
- Transfer the data securely to the server.
- Import the data into the server's `db` container while handling database recreation.

## Components to be Created

### 1. Export Script (`scripts/export_local_db.ps1`)
A PowerShell script for Windows that:
- Runs `pg_dump` inside the local `db` container.
- Saves the output to `backups/auraacrackers_prod_sync.sql`.
- Uses credentials from the local `.env` file.

### 2. Import Script (`scripts/import_server_db.sh`)
A Bash script for the Linux server that:
- Deletes the existing database (if any) to ensure a clean state.
- Recreates the database.
- Streams the SQL dump into the server's `db` container using `psql`.

### 3. Migration Instructions (`scripts/MIGRATION_GUIDE.md`)
Detailed instructions on how to use these scripts.

## Workflow
1. **Local**: Run `.\scripts\export_local_db.ps1`.
2. **Transfer**: `git add`, `git commit`, and `git push` the SQL file, then `git pull` on the server.
3. **Server**: Run `bash scripts/import_server_db.sh`.

## Safety Considerations
- **Backup existing server data**: The import script will drop the existing database on the server.
- **Service Names**: Both scripts assume the database service is named `db` in `docker-compose.yml`.
