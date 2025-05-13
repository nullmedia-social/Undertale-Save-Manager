# Get the current user's profile directory
$USER_PROFILE = $env:USERPROFILE

# Set the directories (Windows paths)
$INSTALL_DIR = "$USER_PROFILE\bin\utsavemgr"
$DESKTOP_PATH = [System.Environment]::GetFolderPath('Desktop')
$DESKTOP_FILE = "$DESKTOP_PATH\Undertale Save Manager.lnk"  # Shortcut instead of .desktop file

# Create the directory if it doesn't exist
if (-not (Test-Path $INSTALL_DIR)) {
    New-Item -ItemType Directory -Path $INSTALL_DIR | Out-Null
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
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$INSTALL_DIR\utsavemgr.ps1`""
$Shortcut.IconLocation = "$INSTALL_DIR\utsavemgr.ico"
$Shortcut.Description = "Undertale Save Manager"
$Shortcut.Save()

# Notify the user that the installation is complete
Write-Host "Installation complete! You can now run 'Undertale Save Manager' from your desktop."
