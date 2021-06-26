#!/bin/bash

set -euo pipefail

DOTFILES_DIR=$HOME/dotfiles
SAVE_DIR=$HOME/dotfiles_$(date "+%Y-%m-%d-%H-%M")

mkdir -p "$SAVE_DIR"

# SSH directory
SSH_DIR=$HOME/.ssh
if [ ! -d "$SSH_DIR" ]  ; then
  mkdir -p "$SSH_DIR"
  chmod 0700 "$SSH_DIR"
fi

# .secrets directory
SECRETS_DIR=$HOME/.secrets
if [ ! -d "$SECRETS_DIR" ]  ; then
  mkdir -p "$SECRETS_DIR"
  chmod 0700 "$SECRETS_DIR"
fi

# Project directories
PROJECTS_DIR=$HOME/Projects
if [ ! -d "$PROJECTS_DIR" ]  ; then
  mkdir -p "$PROJECTS_DIR"
fi
if [ ! -d "$PROJECTS_DIR/src" ]  ; then
  mkdir -p "$PROJECTS_DIR/src"
fi
if [ ! -d "$PROJECTS_DIR/src/github.com" ]  ; then
  mkdir -p "$PROJECTS_DIR/src/github.com"
fi
if [ ! -d "$PROJECTS_DIR/src/gitlab.com" ]  ; then
  mkdir -p "$PROJECTS_DIR/src/gitlab.com"
fi

# zsh
if [ -e "$HOME/.zshrc" ] ; then
  mv "$HOME/.zshrc" "$SAVE_DIR" 
fi

ln -s "$DOTFILES_DIR/macos/zsh/.zshrc" "$HOME/.zshrc"

# Git
if [ -e "$HOME/.gitconfig" ] ; then
  mv "$HOME/.gitconfig" "$SAVE_DIR" 
fi

ln -s "$DOTFILES_DIR/gitconfig/.gitconfig" "$HOME/.gitconfig"

if [ -e "$HOME/.gitexclusions.txt" ] ; then
  mv "$HOME/.gitexclusions.txt" "$SAVE_DIR" 
fi

ln -s "$DOTFILES_DIR/gitconfig/.gitexclusions.txt" "$HOME/.gitexclusions.txt"

