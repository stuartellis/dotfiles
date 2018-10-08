
# Text editor
export EDITOR="code -w"

# Amazon Web Services profile
export AWS_PROFILE=default

# PATH
export PATH="$HOME/Library/Python/3.7/bin:/usr/local/opt/node@8/bin:/usr/local/opt/mysql@5.7/bin:$PATH"

# Aliases
alias did="nvim +'normal Go' +'r!date' ~/Google\ Drive/aaa-notes/did.txt" 
alias n="nvim"

# Auto-completion for pipenv
eval "$(pipenv --completion)"

