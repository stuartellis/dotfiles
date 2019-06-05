
# Load Pure theme for zsh: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Text editor
export EDITOR="vscodium -w"

# Amazon Web Services profile
export AWS_PROFILE=default

# PATH
export PATH="$HOME/.local/bin:$HOME/Library/Python/3.7/bin:/usr/local/opt/node@10/bin:/opt/puppetlabs/pdk/bin:$PATH"
