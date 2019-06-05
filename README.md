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

1. Checkout this repository to the home directory of the user with HTTPS
2. Run _./macos/setup-homedir.sh_
3. Install Xcode Command-line Tools: _xcode-select --install_
4. Install [Homebrew](https://brew.sh/)
5. Change working directory to _./macos_ and run _brew bundle_

## Post-setup

1. Copy SSH keys to the .ssh directory
2. Change permissions on SSH key files
3. Install Web browser on local system
4. Clone Git repositories for working environments
5. Build working environments with Docker

