#!/bin/bash

CLI_PACKAGES=(
  'bash-completion'
  'ansible' 
  'awscli' 'rclone'
  'git' 'git-lfs'
  'gimme'
  'hugo' 
  'restic'
  'mysql@5.7' 
  'python3' 'pipenv'
  'neovim' 
  'node@8'
)

GUI_PACKAGES=(
  'android-studio' 'java' 
  'calibre' 'etcher'
  'amazon-workspaces' 
  'docker' 'virtualbox'  
  'firefox' 'google-chrome'
  'google-backup-and-sync' 
  'libreoffice'
  'skype' 'ringcentral' 
  'colloquy' 'slack' 'gitter' 
  'spotify'
  'veracrypt' 
  'vienna'
)

brew update

for each in "${CLI_PACKAGES[@]}"
do
  brew install "$each"
done

for each in "${GUI_PACKAGES[@]}"
do
  brew cask install "$each"
done

