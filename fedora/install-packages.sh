#!/bin/sh

# RPM Fusion Free Software repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 

# Required by Visual Studio Code
sudo dnf install libXScrnSaver