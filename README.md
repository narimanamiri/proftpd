# proftpd
this script installs and configures proftpd server
this Bash script installs and configures ProFTPD FTP server on a Linux system:

```
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
```

Here's how the script works:

1. The script starts by updating the package list using the `apt-get update` command.
2. The script installs ProFTPD FTP server using the `apt-get install` command with the `-y` flag to automatically answer "yes" to any prompts.
3. The script creates a backup of the original ProFTPD configuration file using the `cp` command.
4. The script uses the `sed` command to make changes to the ProFTPD configuration file. In this example, the script sets the default root directory for all users, requires valid shells for users, and sets the passive ports range to be used for data transfers.
5. The script restarts the ProFTPD service using the `systemctl restart` command.
6. The script prints a message indicating that the installation and configuration is complete.

Note that this script assumes that you are running a Debian or Ubuntu-based Linux distribution. If you are using a different Linux distribution, you may need to modify the script to use a different package manager or configuration file location. Also, you may need to configure firewall rules to allow FTP traffic to and from your server.
