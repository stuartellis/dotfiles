#!/bin/bash

DOTFILES_DIR=$HOME/dotfiles
SAVE_DIR=$HOME/dotfiles_$(date "+%Y-%m-%d-%H-%M")

mkdir -p $SAVE_DIR

# Bash
if [ -e $HOME/.bashrc ] ; then
  mv $HOME/.bashrc $SAVE_DIR 
fi

ln -s $DOTFILES_DIR/bash/.bashrc $HOME/.bashrc

if [ -e $HOME/.bashrc ] ; then
  mv $HOME/.bash_profile $SAVE_DIR 
fi
ln -s $DOTFILES_DIR/bash/.bash_profile $HOME/.bash_profile

# Neovim 
NVIM_DIR=$HOME/.config/nvim
if [ ! -d $NVIM_DIR ]  ; then
  mkdir -p $NVIM_DIR
else
  mv $NVIM_DIR/init.vim $SAVE_DIR 
fi
ln -s $DOTFILES_DIR/nvim/init.vim $NVIM_DIR/init.vim

