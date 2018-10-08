
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion # Enable Bash autocompletion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
