# README

Personal configuration files.

## Usage on Fedora

1. Checkout this repository to the home directory of the user with HTTPS
2. Run _./fedora/setup-homedir.sh_
3. Run _sudo ./fedora/install-packages.sh_
4. Run _./fedora/install-dev-tools.sh_

### Shared Folders on VirtualBox

1. Install shared folder support from RPM Fusion: _sudo dnf install akmod-VirtualBox_
2. Reboot system: _sudo systemctl reboot_
3. Run _./vbox/install-vboxfolders.sh_

## Usage on macOS

1. Install Git on system
2. Checkout this repository to the home directory of the user with HTTPS
3. Run _./macos/setup.sh_

## Post-setup

1. Copy SSH keys to the .ssh directory
2. Change permissions on SSH key files
3. Install Web browser on local system
4. Clone Git repositories for working environments
5. Build working environments with Docker

