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

# Bash
if [ -e "$HOME/.bashrc" ] ; then
  mv "$HOME/.bashrc" "$SAVE_DIR" 
fi

ln -s "$DOTFILES_DIR/macos/bash/.bashrc" "$HOME/.bashrc"

if [ -e "$HOME/.bash_profile" ] ; then
  mv "$HOME/.bash_profile" "$SAVE_DIR" 
fi
ln -s "$DOTFILES_DIR/macos/bash/.bash_profile" "$HOME/.bash_profile"

# Git
if [ -e "$HOME/.gitconfig" ] ; then
  mv "$HOME/.gitconfig" "$SAVE_DIR" 
fi

ln -s "$DOTFILES_DIR/gitconfig/.gitconfig" "$HOME/.gitconfig"

if [ -e "$HOME/.gitexclusions.txt" ] ; then
  mv "$HOME/.gitexclusions.txt" "$SAVE_DIR" 
fi

ln -s "$DOTFILES_DIR/gitconfig/.gitexclusions.txt" "$HOME/.gitexclusions.txt"

# Neovim 
NVIM_DIR=$HOME/.config/nvim
if [ ! -d "$NVIM_DIR" ]  ; then
  mkdir -p "$NVIM_DIR"
else
  mv "$NVIM_DIR/init.vim" "$SAVE_DIR" 
fi
ln -s "$DOTFILES_DIR/nvim/init.vim" "$NVIM_DIR/init.vim"

NVIM_SPELL_DIR=$HOME/.config/nvim/spell
if [ ! -d "$NVIM_SPELL_DIR" ]  ; then
  mkdir -p "$NVIM_SPELL_DIR"
else
  mkdir -p "$SAVE_DIR/spell"
  mv "$NVIM_SPELL_DIR/en.utf-8.add" "$SAVE_DIR/spell"
fi
ln -s "$DOTFILES_DIR/nvim/spell/en.utf-8.add" "$NVIM_DIR/spell/en.utf-8.add"
