# CONFIG – updated path for Windows systems
$SAVE_PATH = "$env:LOCALAPPDATA\UNDERTALE"
$BACKUP_PATH = "$SAVE_PATH\backups"

# Create backup folder if it doesn't exist
if (-not (Test-Path $BACKUP_PATH)) {
    New-Item -ItemType Directory -Path $BACKUP_PATH
}

function list_backups {
    Write-Host "Available backups:"
    Get-ChildItem -Path $BACKUP_PATH
}

function make_backup {
    Write-Host "Enter a name for the new backup folder:"
    $backup_name = Read-Host
    $backup_folder = "$BACKUP_PATH\$backup_name"
    New-Item -ItemType Directory -Path $backup_folder

    # Copy all files from save folder to the backup folder (excluding subfolders)
    Get-ChildItem -Path $SAVE_PATH -File | ForEach-Object { Copy-Item $_.FullName -Destination $backup_folder }
    Write-Host "Backup '$backup_name' created."
}

function copy_to_existing {
    list_backups
    Write-Host "Enter the name of the backup folder to copy INTO:"
    $backup_name = Read-Host
    $backup_folder = "$BACKUP_PATH\$backup_name"

    if (Test-Path $backup_folder) {
        # Copy all files from save folder to the selected backup folder (excluding subfolders)
        Get-ChildItem -Path $SAVE_PATH -File | ForEach-Object { Copy-Item $_.FullName -Destination $backup_folder }
        Write-Host "Current save copied into '$backup_name'."
    } else {
        Write-Host "Folder does not exist."
    }
}

function load_backup {
    list_backups
    Write-Host "Now choose a backup to LOAD from:"
    $load_name = Read-Host
    $load_folder = "$BACKUP_PATH\$load_name"

    if (Test-Path $load_folder) {
        # If no current save exists, skip backup step
        if (Test-Path $SAVE_PATH -and (Get-ChildItem -Path $SAVE_PATH)) {
            Write-Host "Choose a folder to back up your CURRENT save before loading:"
            $pre_backup = Read-Host
            $pre_backup_folder = "$BACKUP_PATH\$pre_backup"
            New-Item -ItemType Directory -Path $pre_backup_folder

            # Back up the current files (excluding subfolders)
            Get-ChildItem -Path $SAVE_PATH -File | ForEach-Object { Copy-Item $_.FullName -Destination $pre_backup_folder }
            Write-Host "Current save backed up to '$pre_backup'."
        }
        
        # Copy all files from the chosen backup to the save folder (excluding subfolders)
        Get-ChildItem -Path $load_folder -File | ForEach-Object { Copy-Item $_.FullName -Destination $SAVE_PATH }
        Write-Host "Loaded backup '$load_name'."
    } else {
        Write-Host "Invalid backup folder or missing files."
    }
}

function delete_backup {
    list_backups
    Write-Host "Enter the name of the backup folder to delete:"
    $del_name = Read-Host
    Write-Host "Are you sure you want to delete '$del_name'? Type YES to confirm:"
    $confirm = Read-Host

    if ($confirm -eq "YES") {
        Remove-Item -Recurse -Force "$BACKUP_PATH\$del_name"
        Write-Host "Backup '$del_name' deleted."
    } else {
        Write-Host "Deletion cancelled."
    }
}

function open_save_folder {
    Start-Process "explorer.exe" $SAVE_PATH
    Write-Host "Opened save folder."
}

while ($true) {
    Write-Host ""
    Write-Host "🧠 UNDERTALE SAVE MANAGER"
    Write-Host "=========================="
    Write-Host "1. Make new backup folder (and copy current save)"
    Write-Host "2. Copy current save into existing backup folder"
    Write-Host "3. Load a backup (will first back up current save if necessary)"
    Write-Host "4. Delete a backup folder"
    Write-Host "5. Open save folder"
    Write-Host "6. Exit"
    Write-Host "Choose an option (1-6):"
    $choice = Read-Host

    switch ($choice) {
        1 { make_backup }
        2 { copy_to_existing }
        3 { load_backup }
        4 { delete_backup }
        5 { open_save_folder }
        6 { Write-Host "Bye!"; break }
        default { Write-Host "Invalid option." }
    }
}
