
# Rust
if test -d '$HOME/.cargo/bin'
  fish_add_path --path --append "$HOME/.cargo/bin"
end

# Local bin directory 
if test -d "$HOME/bin"
	fish_add_path --path --append "$HOME/bin"
end

# Source machine-local config if it exists

set --local FISH_CONFIG_ROOT (dirname (status --current-filename))
if test -f "$FISH_CONFIG_ROOT/config.local.fish"
  source "$FISH_CONFIG_ROOT/config.local.fish"
end

if status is-interactive

    # Use VS Code as editor if available
    set -gx EDITOR vim
    command -q code && set -gx EDITOR code

    # Add abbr to call recipes in user Justfile by typing "j"
    if test -x '/usr/bin/just'
	    abbr --add j just --justfile ~/.user.justfile --working-directory .
	  end

end

