# README

Personal configuration files.

## Usage on Fedora

1. Checkout this repository to the home directory of the user with HTTPS
2. Run *./fedora/setup-homedir.sh*
3. Run *sudo ./fedora/install-packages.sh*
4. Run *./fedora/install-dev-tools.sh*

### Shared Folders on VirtualBox

1. Install shared folder support from RPM Fusion: *sudo dnf install akmod-VirtualBox*
2. Reboot system: *sudo systemctl reboot*
3. Run *./vbox/install-vboxfolders.sh*

## Usage on macOS

1. Install Git on system
2. Checkout this repository to the home directory of the user with HTTPS
3. Run *./macos/setup.sh*

## Post-setup

1. Copy SSH keys to the .ssh directory
2. Change permissions on SSH key files
3. Install Web browser on local system
4. Clone Git repositories for working environments
5. Build working environments with Vagrant or Docker

## Vim plugins

To install ALE:

    mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
    git clone https://github.com/w0rp/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale

## Linters

Run these commands to install linters:

    npm -g install prettier
    pip3 install --user cfn-lint
    pip3 install --user yamllint

## macOS: Applications that Require Installation

- Firefox
- VirtualBox
- Vagrant
- Microsoft Remote Desktop
- Pixelmator
- Xcode
- Xcode Command-line Tools

Install Git separately if not using the Xcode Command-line Tools package.

