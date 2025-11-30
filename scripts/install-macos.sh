#!/bin/bash
# macOS Terminal Setup with Ghostty - Catppuccin Mocha

echo "🎨 Installing Catppuccin Terminal Setup for macOS with Ghostty..."
echo ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

# Install Ghostty terminal emulator
echo ""
echo "Installing Ghostty..."
brew install --cask ghostty

# Install tools
echo ""
echo "Installing Starship, Carapace, and Nushell..."
brew install starship carapace-sh nushell

# Create config directories
echo ""
echo "Creating config directories..."
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nushell

# Configure Ghostty with Catppuccin Mocha
echo ""
echo "Configuring Ghostty with Catppuccin Mocha theme..."
cat > ~/.config/ghostty/config << 'EOF'
# ===== THEME =====
theme = Catppuccin Mocha

# Auto-switch between light and dark mode (optional)
# theme = dark:Catppuccin Mocha,light:Catppuccin Latte

# ===== FONT =====
font-family = "JetBrainsMono Nerd Font"
font-size = 13

# ===== WINDOW APPEARANCE =====
background-opacity = 0.85
window-padding-x = 10
window-padding-y = 10

# ===== macOS SPECIFIC =====
macos-titlebar-style = transparent
macos-option-as-alt = true

# ===== CURSOR =====
cursor-style = block
cursor-style-blink = true

# ===== MOUSE =====
mouse-hide-while-typing = true
copy-on-select = clipboard
EOF

# Download Nushell theme
echo ""
echo "Downloading Nushell Catppuccin theme..."
curl -o ~/.config/nushell/catppuccin_mocha.nu \
  https://raw.githubusercontent.com/catppuccin/nushell/main/themes/catppuccin_mocha.nu

# Install Starship preset
echo ""
echo "Installing Starship Catppuccin Powerline preset..."
starship preset catppuccin-powerline -o ~/.config/starship.toml

# Configure Zsh
echo ""
echo "Configuring Zsh..."
if ! grep -q "starship init zsh" ~/.zshrc 2>/dev/null; then
    echo "" >> ~/.zshrc
    echo "# Carapace completions" >> ~/.zshrc
    echo 'export CARAPACE_BRIDGES="zsh,fish,bash,inshellisense"' >> ~/.zshrc
    echo 'source <(carapace _carapace)' >> ~/.zshrc
    echo "" >> ~/.zshrc
    echo "# Starship prompt" >> ~/.zshrc
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    echo "✅ Zsh configured"
else
    echo "ℹ️  Starship already configured in ~/.zshrc"
fi

# Configure Nushell
echo ""
echo "Configuring Nushell..."
cat > ~/.config/nushell/config.nu << 'EOF'
# Load Catppuccin Mocha theme
source catppuccin_mocha.nu

# Starship prompt
$env.STARSHIP_SHELL = "nu"
$env.STARSHIP_SESSION_KEY = (random chars -l 16)
$env.PROMPT_MULTILINE_INDICATOR = (^starship prompt --continuation)
$env.PROMPT_INDICATOR = ""
$env.PROMPT_COMMAND = { ||
    ^starship prompt --cmd-duration $env.CMD_DURATION_MS $"--status=($env.LAST_EXIT_CODE)"
}
$env.PROMPT_COMMAND_RIGHT = { ||
    ^starship prompt --right --cmd-duration $env.CMD_DURATION_MS $"--status=($env.LAST_EXIT_CODE)"
}

# Carapace completions
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

# Configuration
$env.config.show_banner = false
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.algorithm = "fuzzy"
$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 100
$env.config.completions.external.completer = $carapace_completer
$env.config.render_right_prompt_on_last_line = false
EOF

cat > ~/.config/nushell/env.nu << 'EOF'
# Add Homebrew to PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
EOF

echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 What was installed:"
echo "  • Ghostty terminal (with 200+ built-in themes)"
echo "  • JetBrains Mono Nerd Font (built into Ghostty)"
echo "  • Starship prompt (Catppuccin Powerline)"
echo "  • Carapace completions"
echo "  • Nushell (optional modern shell)"
echo ""
echo "🎨 Configuration applied:"
echo "  • Catppuccin Mocha theme"
echo "  • 85% opacity with transparency"
echo "  • Font: JetBrainsMono Nerd Font size 13"
echo "  • Starship Catppuccin Powerline prompt"
echo ""
echo "🚀 Next steps:"
echo "  1. Open Ghostty (it's ready to use!)"
echo "  2. Restart your current terminal or run: source ~/.zshrc"
echo "  3. Explore themes: ghostty +list-themes"
echo "  4. View config: ghostty +show-config"
echo ""
echo "💡 Useful commands:"
echo "  • Reload config: cmd+shift+,"
echo "  • New tab: cmd+t"
echo "  • Split pane: cmd+d"
echo ""
echo "🎉 Enjoy your beautiful terminal!"
