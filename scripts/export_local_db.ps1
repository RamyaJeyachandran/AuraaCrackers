# export_local_db.ps1
# Script to export the auraacrackers database from the local Docker container

$DB_NAME = "auraacrackers"
$DB_USER = "auraauser"
$BACKUP_FILE = "backups/auraacrackers_prod_sync.sql"

Write-Host "Checking for Docker Compose..."
if (Get-Command "docker-compose" -ErrorAction SilentlyContinue) {
    $DOCKER_CMD = "docker-compose"
} elseif (docker compose version 2>&1 | Out-String -ErrorAction SilentlyContinue) {
    $DOCKER_CMD = "docker", "compose"
} else {
    Write-Host "Error: Neither 'docker compose' nor 'docker-compose' was found." -ForegroundColor Red
    exit 1
}

Write-Host "--- Starting Local Database Export using $DOCKER_CMD ---" -ForegroundColor Cyan

# Check if backups directory exists
if (-not (Test-Path "backups")) {
    New-Item -ItemType Directory -Force -Path "backups" | Out-Null
}

Write-Host "Exporting database '$DB_NAME' from container 'db'..."
# We use cmd /c to ensure the redirection (>) uses raw binary/UTF-8 and not PowerShell's default UTF-16
if ($DOCKER_CMD -is [array]) {
    $cmdStr = "$($DOCKER_CMD -join ' ') exec -T db pg_dump -U $DB_USER $DB_NAME > $BACKUP_FILE"
} else {
    $cmdStr = "$DOCKER_CMD exec -T db pg_dump -U $DB_USER $DB_NAME > $BACKUP_FILE"
}
cmd /c $cmdStr

if ($LASTEXITCODE -eq 0) {
    Write-Host "Successfully exported database to: $BACKUP_FILE" -ForegroundColor Green
    $fileSize = (Get-Item $BACKUP_FILE).Length / 1KB
    Write-Host "File size: $($fileSize.ToString("N2")) KB"
} else {
    Write-Host "Error: Database export failed. Ensure docker-compose is running ('docker-compose up -d')." -ForegroundColor Red
}
