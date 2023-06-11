#!/bin/bash

# Update package list
sudo apt-get update

# Install ProFTPD
sudo apt-get install proftpd -y

# Backup original config file
sudo cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.bak

# Configure ProFTPD
sudo sed -i 's/# DefaultRoot/DefaultRoot/g' /etc/proftpd/proftpd.conf
sudo sed -i 's/# RequireValidShell/RequireValidShell/g' /etc/proftpd/proftpd.conf
sudo sed -i 's/# PassivePorts/PasvMinPort 49152\nPasvMaxPort 65535/g' /etc/proftpd/proftpd.conf

# Restart ProFTPD
sudo systemctl restart proftpd

echo "ProFTPD installation and configuration complete."
