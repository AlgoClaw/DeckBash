#!/bin/bash

# use via "sudo su"

# Disable SteamOS Ready-Only
sudo steamos-readonly disable

# Install Samba
sudo pacman -Sy --noconfirm samba --overwrite '*'

# Delete Existing smb.conf
sudo rm -f "/etc/samba/smb.conf"

# Generate smb.conf
sudo tee -a "/etc/samba/smb.conf" > /dev/null <<EOT
[global]
   unix extensions = NO
   workgroup = WORKGROUP
   map to guest = BAD USER
   usershare allow guests = YES
   store dos attributes = NO

[root]
   path = /
   public = YES
   read only = NO
   writeable = YES
   guest ok = YES
   guest only = YES
   browseable = YES
   wide links = YES
   hide dot files = NO
   follow symlinks = YES
   protocol = SMB3
   force user = root
   create mask = 0777
   directory mask = 0777
   force create mode = 0777
   force directory mode = 0777
EOT

# Enable, Start, Restart Services
sudo systemctl enable smb nmb
sudo systemctl start smb nmb
sudo systemctl restart smb nmb
