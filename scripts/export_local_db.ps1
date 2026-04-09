# export_local_db.ps1
# Script to export the auraacrackers database from the local Docker container

$DB_NAME = "auraacrackers"
$DB_USER = "auraauser"
$BACKUP_FILE = "backups/auraacrackers_prod_sync.sql"

Write-Host "--- Starting Local Database Export ---" -ForegroundColor Cyan

# Check if backups directory exists
if (-not (Test-Path "backups")) {
    New-Item -ItemType Directory -Force -Path "backups" | Out-Null
}

Write-Host "Exporting database '$DB_NAME' from container 'db'..."
# We use docker-compose exec to run pg_dump inside the container
# -T is used to disable pseudo-tty allocation (important for redirection in some shells)
docker-compose exec -T db pg_dump -U $DB_USER $DB_NAME > $BACKUP_FILE

if ($LASTEXITCODE -eq 0) {
    Write-Host "Successfully exported database to: $BACKUP_FILE" -ForegroundColor Green
    $fileSize = (Get-Item $BACKUP_FILE).Length / 1KB
    Write-Host "File size: $($fileSize.ToString("N2")) KB"
} else {
    Write-Host "Error: Database export failed. Ensure docker-compose is running ('docker-compose up -d')." -ForegroundColor Red
}
