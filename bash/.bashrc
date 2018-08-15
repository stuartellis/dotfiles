
# Text editor
export EDITOR="code -w"

# Amazon Web Services profile
export AWS_PROFILE=default

# PATH
export GOPATH="$HOME/Documents/projects"
export PATH="$HOME/bin:$GOPATH/bin:$HOME/Library/Python/3.7/bin:/usr/local/opt/node@8/bin:/usr/local/opt/mysql@5.6/bin:$PATH"

# Aliases
alias gogo="cd $HOME/Documents/projects/src/gitlab.com/stuart-ellis/"
alias did="nvim +'normal Go' +'r!date' ~/Google\ Drive/aaa-notes/did.txt" 
alias n="nvim"

# Auto-completion for pipenv
eval "$(pipenv --completion)"

