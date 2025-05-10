#!/bin/bash

# Get the username of the current user
USER_NAME=$(whoami)

# Set the directories
INSTALL_DIR="/home/$USER_NAME/bin/utsavemgr"
DESKTOP_FILE="/home/$USER_NAME/Desktop/utsavemgr.desktop"

# Create the directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download the necessary files
echo "Downloading utsavemgr.jpeg..."
curl -o "$INSTALL_DIR/utsavemgr.jpeg" "https://raw.githubusercontent.com/nullmedia-social/Undertale-Save-Manager/refs/heads/main/linux/utsavemgr.jpeg"

echo "Downloading utsavemgr.sh..."
curl -o "$INSTALL_DIR/utsavemgr.sh" "https://raw.githubusercontent.com/nullmedia-social/Undertale-Save-Manager/refs/heads/main/linux/utsavemgr.sh"

# Download and create the desktop file
echo "Creating utsavemgr.desktop..."
cat <<EOL > "$DESKTOP_FILE"
[Desktop Entry]
Name=Undertale Save Manager
Comment=Manage your Undertale save files
Exec=/home/$USER_NAME/bin/utsavemgr/utsavemgr.sh
Icon=/home/$USER_NAME/bin/utsavemgr/utsavemgr.jpeg
Terminal=true
Type=Application
Categories=Utility;Game;
EOL

# Make the sh script and desktop file executable
chmod +x "$INSTALL_DIR/utsavemgr.sh"
chmod +x "$DESKTOP_FILE"

# Notify the user that the installation is complete
echo "Installation complete! You can now run 'Undertale Save Manager' from your desktop."
