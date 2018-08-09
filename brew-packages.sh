#!/bin/bash

CLI_PACKAGES=(
  'ansible' 'awscli'
  'git' 'git-lfs'
  'go' 'dep'
  'hugo' 'restic'
  'mysql' 'minio-mc'
  'python3' 'pipenv'
  'neovim' 'node@8'
)

GUI_PACKAGES=(
  'calibre' 'docker' 
  'firefox' 'google-chrome' 
  'libreoffice'
  'skype' 'slack' 'spotify'
  'vienna' 'virtualbox'
)

brew update

for each in "${CLI_PACKAGES[@]}"
do
  brew install "$each"
done

for each in "${GUI_PACKAGES[@]}"
do
  brew install "$each"
done

