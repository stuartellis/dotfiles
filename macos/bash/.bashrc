
# Text editor
export EDITOR="vscodium -w"

# Amazon Web Services profile
export AWS_PROFILE=default

export JAVA_HOME="/usr/local/lib/jdk-11.0.1+13/Contents/Home"

# PATH
export PATH="$HOME/bin:$HOME/.npm-packages/bin:$HOME/Library/Python/3.7/bin:/usr/local/lib/jdk-11.0.1+13/Contents/Home/bin:/usr/local/lib/apache-maven-3.6.0/bin:$PATH"

# Add npm packages to MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Aliases
alias did="vim +'normal Go' +'r!date' ~/Google\ Drive/aaa-notes/did.txt" 

