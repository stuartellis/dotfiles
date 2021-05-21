
### Enable pure theme: https://github.com/sindresorhus/pure

autoload -U promptinit; promptinit
prompt pure

### Environment Variables

# Add items to PATH
export PATH="/usr/local/opt/node@14/bin:$HOME/.local/bin:$HOME/Library/Python/3.9/bin:$PATH"

# Text editor
export EDITOR="code -w" 

# Amazon Web Services profile
export AWS_PROFILE=labs

### AWSume

alias awsume=". awsume"


