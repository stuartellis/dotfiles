chezmoi_version := '2.46.1'
hatch_version := '1.9.3'
mani_version := '0.25.0'
backups_dir := join(home_directory(), 'backups')
downloads_dir := if os() == 'linux' { join(home_directory(), 'Downloads') } else { if os() == "macos" { join(home_directory(), 'Downloads') } else { if os() == "windows" { join(home_directory(), 'Downloads') } else { error('Unsupported operating system') } } }
go_arch := if arch() == 'aarch64' { 'arm64' } else { if arch() == 'x86_64' { 'amd64' } else { error('Unsupported operating system') } }
rust_os := if os() == 'linux' { 'linux-gnu' } else { if os() == "macos" { 'apple-darwin' } else { if os() == "windows" { 'windows-msvc' } else { error('Unsupported operating system') } } }

# List available recipes
default:
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

# Install Ansible
add-ansible: add-pipx
    @pipx --quiet install ansible-core
    @pipx --quiet inject ansible-core boto3

# Install AWS CLI
add-awscli:
    #!/usr/bin/env sh
    set -eu
    $TEMP_DOWNLOAD_DIR="{{ downloads_dir }}/tmp/awscli"
    mkdir -p $TEMP_DOWNLOAD_DIR
    cd $TEMP_DOWNLOAD_DIR
    APP_DOWNLOAD_URL="https://awscli.amazonaws.com/awscli-exe-{{ os() }}-{{ arch() }}.zip"
    curl -S -s $APP_DOWNLOAD_URL -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install --update
    cd "{{ downloads_dir }}/tmp"
    rm -fr $TEMP_DOWNLOAD_DIR

# Install Chezmoi
add-chezmoi:
    #!/usr/bin/env sh
    set -eu
    TEMP_DOWNLOAD_DIR="{{ downloads_dir }}/tmp/chezmoi"
    mkdir -p $TEMP_DOWNLOAD_DIR
    cd $TEMP_DOWNLOAD_DIR
    APP_DOWNLOAD_URL=https://github.com/twpayne/chezmoi/releases/download/v{{ chezmoi_version }}/chezmoi_{{ chezmoi_version }}_{{ os() }}_{{ go_arch }}.tar.gz    
    curl -S -s -L $APP_DOWNLOAD_URL > chezmoi.tar.gz
    tar xzf chezmoi.tar.gz chezmoi
    mkdir -p "{{ executable_directory() }}"
    cp chezmoi {{ join(executable_directory(), 'chezmoi') }}
    cd "{{ downloads_dir }}/tmp"
    rm -fr $TEMP_DOWNLOAD_DIR

# Install Hatch
add-hatch:
    #!/usr/bin/env sh
    set -eu
    TEMP_DOWNLOAD_DIR="{{ downloads_dir }}/tmp/hatch"
    mkdir -p $TEMP_DOWNLOAD_DIR
    cd $TEMP_DOWNLOAD_DIR
    APP_DOWNLOAD_URL=https://github.com/pypa/hatch/releases/download/hatch-v{{ hatch_version }}/hatch-{{ hatch_version }}-{{ arch() }}-unknown-{{ rust_os }}.tar.gz    
    curl -S -s -L $APP_DOWNLOAD_URL > hatch.tar.gz
    tar xzf hatch.tar.gz hatch-{{ hatch_version }}-{{ arch() }}-unknown-{{ rust_os }} 
    mkdir -p "{{ executable_directory() }}"
    cp hatch-{{ hatch_version }}-{{ arch() }}-unknown-{{ rust_os }} {{ join(executable_directory(), 'hatch') }}
    cd "{{ downloads_dir }}/tmp"
    rm -fr $TEMP_DOWNLOAD_DIR

# Install Mani
add-mani:
    #!/usr/bin/env sh
    set -eu
    TEMP_DOWNLOAD_DIR="{{ downloads_dir }}/tmp/mani"
    mkdir -p $TEMP_DOWNLOAD_DIR
    cd $TEMP_DOWNLOAD_DIR
    APP_DOWNLOAD_URL=https://github.com/alajmo/mani/releases/download/v{{ mani_version }}/mani_{{ mani_version }}_{{ os() }}_{{ go_arch }}.tar.gz
    curl -S -s -L $APP_DOWNLOAD_URL > mani.tar.gz
    tar xzf mani.tar.gz mani
    mkdir -p "{{ executable_directory() }}"
    cp mani "{{ executable_directory() }}"
    cd "{{ downloads_dir }}/tmp"
    rm -fr $TEMP_DOWNLOAD_DIR

# Install pipx
add-pipx:
    @python3 -m pip install --user pipx
    @python3 -m pipx ensurepath

# Backup Joplin
backup-joplin:
    #!/usr/bin/env sh
    set -eu
    JOPLIN_BACKUPS_DIR="{{ backups_dir }}/joplin-backups"
    CONFIG_DIR="{{ config_directory() }}"
    mkdir -p $JOPLIN_BACKUPS_DIR
    BACKUP_TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
    zip -r $JOPLIN_BACKUPS_DIR/joplin-backup-$BACKUP_TIMESTAMP.zip $CONFIG_DIR/joplin-desktop

# Remove Ansible
rm-ansible:
    @pipx --quiet uninstall ansible-core

# Remove Chezmoi
rm-chezmoi:
    @rm -f "{{ join(executable_directory(), 'chezmoi') }}"

# Remove Hatch
rm-hatch:
    @rm -f "{{ join(executable_directory(), 'hatch') }}"

# Remove Mani
rm-mani:
    @rm -f "{{ join(executable_directory(), 'mani') }}"

# Remove pipx
rm-pipx:
    @pipx uninstall-all
    @python3 -m pip uninstall -qy pipx
