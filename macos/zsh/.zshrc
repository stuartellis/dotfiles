# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=50000
setopt appendhistory autocd extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stuartellis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load Pure theme for zsh: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Text editor
export EDITOR="vscodium -w" 

# Amazon Web Services profile
export AWS_PROFILE=default

# PATH
export PATH="$HOME/.local/bin:$HOME/Library/Python/3.7/bin:/usr/local/opt/node@10/bin:/opt/puppetlabs/pdk/bin:$HOME/.jenv/bin:$PATH"

# Activate jenv
eval "$(jenv init -)"

