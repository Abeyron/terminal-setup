#!/bin/bash
# Terminal Setup Installation Script for Linux/WSL

echo "=== Terminal Setup Installation (Linux/WSL) ==="
echo ""

# Install Starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin -y

# Install Carapace
echo "Installing Carapace..."
CARAPACE_VERSION="1.5.5"
cd /tmp
wget -q "https://github.com/carapace-sh/carapace-bin/releases/download/v${CARAPACE_VERSION}/carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
tar -xzf "carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"
mv carapace ~/.local/bin/
chmod +x ~/.local/bin/carapace
rm "carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz"

# Install Nushell
echo "Installing Nushell..."
NUSHELL_VERSION="0.108.0"
cd /tmp
wget -q "https://github.com/nushell/nushell/releases/download/${NUSHELL_VERSION}/nu-${NUSHELL_VERSION}-x86_64-unknown-linux-musl.tar.gz"
tar -xzf "nu-${NUSHELL_VERSION}-x86_64-unknown-linux-musl.tar.gz"
cd "nu-${NUSHELL_VERSION}-x86_64-unknown-linux-musl"
mv nu ~/.local/bin/
chmod +x ~/.local/bin/nu
cd /tmp
rm -rf "nu-${NUSHELL_VERSION}-x86_64-unknown-linux-musl"*

# Copy configuration files
echo "Copying configuration files..."

# Starship
mkdir -p ~/.config
cp ../config/starship.toml ~/.config/starship.toml

# Nushell
mkdir -p ~/.config/nushell
cp ../config/nushell/* ~/.config/nushell/

# Bash
BACKUP_DIR=~/terminal-setup-backup-$(date +%Y%m%d-%H%M%S)
mkdir -p "$BACKUP_DIR"

if [ -f ~/.bashrc ]; then
    cp ~/.bashrc "$BACKUP_DIR/bashrc.backup"
    echo "Backed up existing .bashrc to $BACKUP_DIR"
fi

# Append to .bashrc if not already present
if ! grep -q "Initialize Carapace completions" ~/.bashrc; then
    cat >> ~/.bashrc << 'EOF'

# Initialize Carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Initialize Starship prompt
eval "$(starship init bash)"
EOF
    echo "Updated .bashrc with Carapace and Starship"
else
    echo ".bashrc already configured"
fi

echo ""
echo "=== Installation Complete! ==="
echo "Please restart your shell or run: source ~/.bashrc"
echo ""
