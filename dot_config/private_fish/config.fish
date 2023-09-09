
# Add Rust executables to $PATH
if test -d "$HOME/.cargo/bin"
  fish_add_path --path --append "$HOME/.cargo/bin"
end

# Add local bin/ directory to $PATH
if test -d "$HOME/bin"
	fish_add_path --path --append "$HOME/bin"
end

if status is-interactive

    # Use Visual Studio Code as editor if available
    set -gx EDITOR vim
    command -q code && set -gx EDITOR code

    # Add abbr to call recipes in user Justfile by typing ".j"
    if test -x '/usr/bin/just'
      abbr --add .j just --justfile ~/.user.justfile --working-directory .
    end

end
