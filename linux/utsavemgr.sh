#!/bin/bash

# CONFIG – updated path for Linux systems
SAVE_PATH="$HOME/.config/UNDERTALE"
BACKUP_PATH="$SAVE_PATH/backups"

mkdir -p "$BACKUP_PATH"

function list_backups {
    echo "Available backups:"
    ls "$BACKUP_PATH"
}

function make_backup {
    echo "Enter a name for the new backup folder:"
    read -r backup_name
    mkdir -p "$BACKUP_PATH/$backup_name"
    # Copy all files from save folder to the backup folder, excluding subfolders
    find "$SAVE_PATH" -maxdepth 1 -type f -exec cp {} "$BACKUP_PATH/$backup_name/" \;
    echo "Backup '$backup_name' created."
}

function copy_to_existing {
    list_backups
    echo "Enter the name of the backup folder to copy INTO:"
    read -r backup_name
    if [ -d "$BACKUP_PATH/$backup_name" ]; then
        # Copy all files from save folder to the selected backup folder, excluding subfolders
        find "$SAVE_PATH" -maxdepth 1 -type f -exec cp {} "$BACKUP_PATH/$backup_name/" \;
        echo "Current save copied into '$backup_name'."
    else
        echo "Folder does not exist."
    fi
}

function load_backup {
    list_backups
    echo "Now choose a backup to LOAD from:"
    read -r load_name

    if [ -d "$BACKUP_PATH/$load_name" ]; then
        # If no current save exists, skip backup step
        if [ "$(ls -A $SAVE_PATH)" ]; then
            echo "Choose a folder to back up your CURRENT save before loading:"
            read -r pre_backup
            mkdir -p "$BACKUP_PATH/$pre_backup"
            # Back up the current files (excluding subfolders)
            find "$SAVE_PATH" -maxdepth 1 -type f -exec cp {} "$BACKUP_PATH/$pre_backup/" \;
            echo "Current save backed up to '$pre_backup'."
        fi
        # Copy all files from the chosen backup to the save folder, excluding subfolders
        find "$BACKUP_PATH/$load_name" -maxdepth 1 -type f -exec cp {} "$SAVE_PATH/" \;
        echo "Loaded backup '$load_name'."
    else
        echo "Invalid backup folder or missing files."
    fi
}

function delete_backup {
    list_backups
    echo "Enter the name of the backup folder to delete:"
    read -r del_name
    echo "Are you sure you want to delete '$del_name'? Type YES to confirm:"
    read -r confirm
    if [ "$confirm" == "YES" ]; then
        rm -rf "$BACKUP_PATH/$del_name"
        echo "Backup '$del_name' deleted."
    else
        echo "Deletion cancelled."
    fi
}

function open_save_folder {
    xdg-open $SAVE_PATH
    echo "Opened save folder."
}

while true; do
    echo ""
    echo "🧠 UNDERTALE SAVE MANAGER"
    echo "=========================="
    echo "Please note that if you wish to sort your backups in a backup tree, so to speak, you may make a new backup folder and name it [first backup name]/[new backup name]."
    echo "1. Make new backup folder (and copy current save)"
    echo "2. Copy current save into existing backup folder"
    echo "3. Load a backup (will first back up current save if necessary)"
    echo "4. Delete a backup folder"
    echo "5. Open save folder"
    echo "6. Exit"
    echo "Choose an option (1-6):"
    read -r choice

    case $choice in
        1) make_backup ;;
        2) copy_to_existing ;;
        3) load_backup ;;
        4) delete_backup ;;
        5) open_save_folder ;;
        6) echo "Bye!"; break ;;
        *) echo "Invalid option." ;;
    esac
done
