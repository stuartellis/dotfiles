#!/bin/bash

set -euo pipefail

CLI_PACKAGES=(
  'docker'
  'git'
  'hugo'
  'kubernetes-cli' 
  'maven'
  'python3' 'pipenv' 
  'node@10'
  'shellcheck'
)

CASK_PACKAGES=(
  'adoptopenjdk11'
  'firefox' 'google-chrome'
  'google-backup-and-sync' 
  'libreoffice'
  'minikube'
  'vscodium'
  'virtualbox'  
)

brew update

for each in "${CLI_PACKAGES[@]}"
do
  brew install "$each"
done

for each in "${CASK_PACKAGES[@]}"
do
  brew cask install "$each"
done

