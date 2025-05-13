# Undertale Save Manager

The **Undertale Save Manager** lets you back up, restore, and organize your Undertale save files with ease.

---

## 🔧 Features

- 📦 Create new backup folders for your save files  
- 🔁 Copy your current save into an existing backup  
- ⏪ Load a backup into the game  
- 🗑️ Delete unwanted backup folders  
- 📂 Quickly open the save folder

---

## 💾 Installation Instructions

### Requirements

- A Linux-based operating system (tested on Linux Mint) or Windows.
- On Linux, `curl` should be installed (usually pre-installed).
- On Windows, PowerShell must be available (pre-installed in most versions).

---

### 🐧 For Linux

1. Download the `install-linux.sh` script from the repository.
2. Open a terminal and navigate to where you saved `install-linux.sh`.
3. Give the script execute permissions:

    ```bash
    chmod +x install-linux.sh
    ```

4. Run the installer:

    ```bash
    ./install-linux.sh
    ```

This will:
- Download `utsavemgr.sh` and `utsavemgr.jpeg`
- Place them in `/home/username/bin/utsavemgr/`
- Create a desktop shortcut `utsavemgr.desktop`

---

### 🪟 For Windows

1. Download the `install-windows.ps1` script from the repository.
2. Open **PowerShell as Administrator**.
3. Enable script execution if needed:

    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

4. Unblock the script (Windows blocks downloaded files):

    ```powershell
    Unblock-File -Path "C:\\Users\\YourUsername\\Downloads\\install-windows.ps1"
    ```

5. Run the installer:

    ```powershell
    & "C:\\Users\\YourUsername\\Downloads\\install-windows.ps1"
    ```

This will:
- Download `utsavemgr.ps1` and `utsavemgr.jpeg`
- Place them in `C:\\Users\\YourUsername\\bin\\utsavemgr\\`
- Create a desktop shortcut to run the **Undertale Save Manager**

---

### ▶️ Running the Manager

- **Linux**: Double-click the desktop icon.
- **Windows**: Double-click the desktop shortcut.

A terminal/PowerShell window will open with the following menu options:

- 📦 Make new backup folder (and copy current save)
- 📤 Copy current save into existing backup folder
- ⏪ Load a backup
- 🗑️ Delete a backup folder
- 📂 Open save folder
- ❌ Exit

---

### ❌ Uninstalling

- **Linux**: Delete the folder `/home/username/bin/utsavemgr/` and the desktop shortcut.
- **Windows**: Delete the folder `C:\\Users\\YourUsername\\bin\\utsavemgr\\` and the desktop shortcut.
