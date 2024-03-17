
# Add .local/bin/ directory to $PATH if present
if test -d "$HOME/.local/bin"
        fish_add_path --path --append "$HOME/.local/bin"
end

if status is-interactive

    # Use Visual Studio Code as editor if available
    set -gx EDITOR vim
    command -q code && set -gx EDITOR code

    # Add abbr to call recipes in user Justfile by typing ".j"
    if command -s just > /dev/null
      abbr --add .j just --justfile $HOME/.user.justfile --working-directory .
    end

end
