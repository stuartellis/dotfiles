
# Add .local/bin/ directory to $PATH if present
if test -d "$HOME/.local/bin"
    fish_add_path --path --append "$HOME/.local/bin"
end

# Activate Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Activate pyenv
pyenv init - | source

if status is-interactive

    # Use Visual Studio Code as editor if available
    set -gx EDITOR vim
    command -q code && set -gx EDITOR code

    # Add abbr to call recipes in user Justfile by typing ".j RECIPE-NAME"
    if command -s just > /dev/null
        abbr --add .j just --justfile $HOME/.user.justfile --working-directory .
    end

    # Add abbr to call tasks in user Taskfile.yml by typing ".t TASK-NAME"
    if command -s task > /dev/null
      abbr --add .t task -g
    end

    # Add abbr for server
    abbr --add .s ssh $USER@192.168.1.152

end

