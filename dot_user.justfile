go_arch := if arch() == 'aarch64' { 'arm64' } else { 'amd64' }
mani_version := '0.25.0'

# System info
sys-info:
    @echo "CPU Architecture: {{ arch() }}"
    @echo "OS Type: {{ os_family() }}"
    @echo "OS: {{ os() }}"

# Install Ansible
add-ansible: add-pipx
   pipx install ansible-core
   pipx inject ansible-core boto3

# Install AWS CLI
add-awscli:
    #!/usr/bin/env sh
    set -eu
    AWSCLI_DOWNLOADS_URL="https://awscli.amazonaws.com/awscli-exe-{{ os() }}-{{ arch() }}.zip"
    curl $AWSCLI_DOWNLOADS_URL -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

# Install Mani
add-mani:
    #!/usr/bin/env sh
    set -eu
    MANI_DOWNLOADS_URL=https://github.com/alajmo/mani/releases/download/v{{ mani_version }}/mani_{{ mani_version }}_{{ os() }}_{{ go_arch }}.tar.gz
    mkdir -p $HOME/bin
    curl -S -s -L $MANI_DOWNLOADS_URL > mani.tar.gz
    tar xzf mani.tar.gz
    cp mani $HOME/bin
    rm LICENSE mani*

# Install pipx
add-pipx:
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath

# Remove Mani
rm-mani:
    @rm -f $HOME/bin/mani
