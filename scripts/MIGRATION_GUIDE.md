# Docker Database Migration Guide (Git Transfer Method)

Follow these steps to migrate your local `auraacrackers` database to the production server using Git as the transfer medium.

## Step 1: Export Local Database
Open PowerShell in your project root and run:
```powershell
.\scripts\export_local_db.ps1
```
This generates `backups/auraacrackers_prod_sync.sql`.

## Step 2: Transfer via Git
Instead of SCP, we will use Git to move the database file.

1.  **Add and Commit the dump:**
    ```bash
    git add backups/auraacrackers_prod_sync.sql
    git commit -m "chore: add database migration dump"
    ```
2.  **Push to your repository:**
    ```bash
    git push origin your-branch-name
    ```
3.  **Pull on the Server:**
    SSH into your server and pull the latest changes:
    ```bash
    git pull origin your-branch-name
    ```

## Step 3: Run the Import Script on Server
On the server, run:
```bash
bash scripts/import_server_db.sh
```

## Step 4: Cleanup (Optional but Recommended)
After a successful migration, it is good practice to remove the large SQL file from the repository:
```bash
git rm backups/auraacrackers_prod_sync.sql
git commit -m "chore: remove database migration dump"
git push origin your-branch-name
```

## Step 4: Verify Migration
You can check the database on the server:
```bash
docker-compose exec db psql -U auraauser -d auraacrackers -c "\dt"
```

---
**Note:** Ensure Docker containers are running on both local and server environments before executing the scripts.
