container_exe := 'podman'
backups_dir := join(home_directory(), 'backups')
downloads_dir := if os() == 'linux' { join(home_directory(), 'Downloads') } else { if os() == "macos" { join(home_directory(), 'Downloads') } else { if os() == "windows" { join(home_directory(), 'Downloads') } else { error('Unsupported operating system') } } }
go_arch := if arch() == 'aarch64' { 'arm64' } else { if arch() == 'x86_64' { 'amd64' } else { error('Unsupported operating system') } }
rust_os := if os() == 'linux' { 'linux-gnu' } else { if os() == "macos" { 'apple-darwin' } else { if os() == "windows" { 'windows-msvc' } else { error('Unsupported operating system') } } }

# List available recipes
help:
    @just --list -f "{{ home_directory() }}/.user.justfile"

# Display system information
system-info:
    @echo "CPU architecture (Rust): {{ arch() }}"
    @echo "CPU architecture (Go): {{ go_arch }}"
    @echo "Operating system type: {{ os_family() }}"
    @echo "Operating system: {{ os() }}"
    @echo "Operating system (Rust): {{ rust_os }}"
    @echo "Home directory: {{ home_directory() }}"
    @echo "Backups directory: {{ backups_dir }}"    
    @echo "Executables directory: {{ executable_directory() }}"
    @echo "Downloads directory: {{ downloads_dir }}"

# Install tools
bootstrap: add-pipx add-copier add-pip-tools add-pre-commit

# Install Copier
add-copier:
    @pipx --quiet install copier

# Install pip-tools
add-pip-tools:
    @pipx --quiet install pip-tools

# Install pipx
add-pipx:
    @python3 -m pip install --user pipx
    @python3 -m pipx ensurepath

# Install pre-commit
add-pre-commit:
    @pipx --quiet install pre-commit

# Backup Joplin
backup-joplin:
    #!/usr/bin/env sh
    set -eu
    JOPLIN_BACKUPS_DIR="{{ join(backups_dir, 'joplin-backups') }}"
    CONFIG_DIR="{{ config_directory() }}"
    mkdir -p $JOPLIN_BACKUPS_DIR
    BACKUP_TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
    zip -r $JOPLIN_BACKUPS_DIR/joplin-backup-$BACKUP_TIMESTAMP.zip $CONFIG_DIR/joplin-desktop

# Remove obsolete containers and images
clean-oci:
    @{{ container_exe }} container prune -f
    @{{ container_exe }} image prune -f

# Remove Copier
rm-copier:
    @pipx --quiet uninstall copier

# Remove pip-tools
rm-pip-tools:
    @pipx --quiet uninstall pip-tools

# Remove pipx
rm-pipx:
    @pipx uninstall-all
    @python3 -m pip uninstall -qy pipx

# Remove pre-commit
rm-pre-commit:
    @pipx --quiet uninstall pre-commit
