# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/stuartellis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Text editor
export EDITOR="vscodium -w"
 
# Amazon Web Services profile
export AWS_PROFILE=default
 
 # PATH
export PATH="$HOME/.local/bin:$HOME/Library/Python/3.7/bin:/usr/local/opt/node@10/bin:/opt/puppetlabs/pdk/bin:$PATH" 


