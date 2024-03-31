
# Add .local/bin/ directory to $PATH if present
if test -d "$HOME/.local/bin"
    fish_add_path --path --append "$HOME/.local/bin"
end

# Enable mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

if status is-interactive

    # Use Visual Studio Code as editor if available
    set -gx EDITOR vim
    command -q code && set -gx EDITOR code

    # Add abbr to call recipes in user Justfile by typing ".j"
    abbr --add .j just --justfile $HOME/.user.justfile --working-directory .

    # Add abbr for 
    abbr --add .s ssh stuartellis@192.168.1.152

end
