
# Undertale Save Manager

The **Undertale Save Manager** allows you to manage your Undertale save files, create backups, and load previous saves.

### Features
- Create new backup folders for your save files.
- Copy the current save into an existing backup.
- Load a backup and restore it to your game.
- Delete a backup folder.
- Open the save folder directly.

---

## Installation Instructions

### Requirements
- A Linux-based operating system (tested on Linux Mint) or Windows.
- On Linux, `curl` should be installed to download files (usually pre-installed).
- On Windows, PowerShell should be available (pre-installed in most versions).

### 1. Download and Install the Manager

#### For Linux
To install the **Undertale Save Manager** on Linux, follow these steps:

1. Download the `install.sh` script from the repository.
   
2. Open a terminal and navigate to the folder where you saved the `install.sh` file.

3. Give the script executable permissions:
   ```bash
   chmod +x install.sh
   ```

4. Run the installation script:
   ```bash
   ./install.sh
   ```

This will:
- Download the `utsavemgr.sh` script and `utsavemgr.jpeg` image.
- Place them in `/home/username/bin/utsavemgr/`.
- Create a desktop shortcut `utsavemgr.desktop` on your desktop.

#### For Windows
To install the **Undertale Save Manager** on Windows, follow these steps:

1. Download the `install-utsavemgr.ps1` script from the repository.

2. Open PowerShell as Administrator and enable script execution if necessary:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. Navigate to the folder where you saved the `install-utsavemgr.ps1` file in PowerShell.

4. Run the installation script:
   ```powershell
   .\install-utsavemgr.ps1
   ```

This will:
- Download the `utsavemgr.ps1` script and `utsavemgr.jpeg` image.
- Place them in `C:\Users\username\bin\utsavemgr\`.
- Create a shortcut on your desktop to run the **Undertale Save Manager**.

### 2. Running the Manager
Once the installation is complete, you can access the **Undertale Save Manager**:

- **For Linux**: Click on the **Undertale Save Manager** icon on your desktop to start the application. A terminal window will open, displaying the available options to manage your Undertale save files.
- **For Windows**: Double-click on the **Undertale Save Manager** shortcut on your desktop to run the manager.

### 3. Usage Instructions
When you run the **Undertale Save Manager**, you will be presented with the following options:

- **Make new backup folder (and copy current save)**: Create a new backup folder and copy your current save to it.
- **Copy current save into existing backup folder**: Copy the current save into an existing backup folder.
- **Load a backup**: Choose a backup to load into your save folder.
- **Delete a backup folder**: Remove an existing backup folder.
- **Open save folder**: Open the folder where Undertale save files are stored.
- **Exit**: Close the manager.

### 4. Removing the Manager
To uninstall **Undertale Save Manager**, simply delete the `utsavemgr` folder located in `/home/username/bin/` on Linux, or `C:\Users\username\bin\utsavemgr\` on Windows. You can also remove the desktop shortcut.

