# Get the username of the current user
$USER_NAME = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

# Set the directories (Windows paths)
$INSTALL_DIR = "C:\Users\$USER_NAME\bin\utsavemgr"
$DESKTOP_PATH = [System.Environment]::GetFolderPath('Desktop')
$DESKTOP_FILE = "$DESKTOP_PATH\Undertale Save Manager.lnk"  # Shortcut instead of .desktop file

# Create the directory if it doesn't exist
if (-not (Test-Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR
}

# Download the necessary files from the Windows-specific path
Write-Host "Downloading utsavemgr.ico..."
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nullmedia-social/Undertale-Save-Manager/refs/heads/main/windows/utsavemgr.ico" -OutFile "$INSTALL_DIR\utsavemgr.ico"

Write-Host "Downloading utsavemgr.ps1..."
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nullmedia-social/Undertale-Save-Manager/refs/heads/main/windows/utsavemgr.ps1" -OutFile "$INSTALL_DIR\utsavemgr.ps1"

# Create a shortcut (.lnk file) on the desktop
Write-Host "Creating shortcut on Desktop..."
$Shell = New-Object -ComObject WScript.Shell
$Shortcut = $Shell.CreateShortcut($DESKTOP_FILE)
$Shortcut.TargetPath = "$INSTALL_DIR\utsavemgr.ps1"
$Shortcut.IconLocation = "$INSTALL_DIR\utsavemgr.ico"
$Shortcut.Description = "Undertale Save Manager"
$Shortcut.Save()

# Notify the user that the installation is complete
Write-Host "Installation complete! You can now run 'Undertale Save Manager' from your desktop."
