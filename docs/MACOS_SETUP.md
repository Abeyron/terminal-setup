# macOS Terminal Setup - Catppuccin Mocha

Complete guide to recreate the beautiful Catppuccin Mocha terminal setup on macOS.

## 🎨 Overview

This guide will set up:

- **Ghostty** terminal emulator with Catppuccin Mocha theme
- **Starship** prompt (same powerline configuration)
- **Carapace** completions
- **Nushell** (optional modern shell)
- **JetBrains Mono Nerd Font** (built-in with Ghostty)
- Beautiful transparency and GPU-accelerated rendering

## 🚀 Quick Installation

### Prerequisites

Install Homebrew if you don't have it:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### One-Command Install

```bash
# Install Ghostty and tools
brew install --cask ghostty
brew install starship carapace-sh nushell

# Create config directory
mkdir -p ~/.config/ghostty

# Configure Ghostty with Catppuccin Mocha
cat > ~/.config/ghostty/config << 'EOF'
# Theme
theme = Catppuccin Mocha

# Font (JetBrains Mono Nerd Font is built-in)
font-family = "JetBrainsMono Nerd Font"
font-size = 13

# Window appearance
window-padding-x = 10
window-padding-y = 10
background-opacity = 0.85

# Performance
macos-titlebar-style = transparent
EOF

# Install Starship configuration
starship preset catppuccin-powerline -o ~/.config/starship.toml
```

## 📦 Step-by-Step Installation

### 1. Install Ghostty Terminal

```bash
brew install --cask ghostty
```

**Why Ghostty?**

- 🚀 **Blazing fast** - GPU-accelerated rendering (Metal on macOS)
- 🎨 **200+ built-in themes** - Including all Catppuccin variants
- 🔤 **Nerd Fonts included** - JetBrains Mono Nerd Font built-in
- 📱 **Native macOS** - SwiftUI-based, feels like a native app
- ⚡ **Zero config** - Works great out of the box
- 🪟 **Modern features** - Tabs, splits, ligatures
- 🌓 **Auto light/dark** - Separate themes for system appearance
- 🔧 **Simple config** - Clean `key = value` format

Alternative: Visit https://ghostty.org/download for other installation methods.

### 2. Verify Nerd Font

Ghostty includes JetBrains Mono Nerd Font by default. Verify it's available:

```bash
# List all available built-in themes
ghostty +list-themes | grep -i catppuccin
```

You should see all Catppuccin variants (Mocha, Frappe, Macchiato, Latte).

### 3. Install Tools

```bash
# Core tools
brew install starship carapace-sh

# Optional: Nushell
brew install nushell

# Optional: Modern CLI replacements
brew install eza bat fd ripgrep fzf
```

### 4. Configure Ghostty

Create the config directory and file:

```bash
mkdir -p ~/.config/ghostty
```

**Create `~/.config/ghostty/config`:**

```bash
cat > ~/.config/ghostty/config << 'EOF'
# ===== THEME =====
# Use Catppuccin Mocha (200+ themes built-in!)
theme = Catppuccin Mocha

# Auto-switch between light and dark mode (optional)
# theme = dark:Catppuccin Mocha,light:Catppuccin Latte

# ===== FONT =====
# JetBrains Mono Nerd Font is built-in
font-family = "JetBrainsMono Nerd Font"
font-size = 13

# ===== WINDOW APPEARANCE =====
# Transparency (0.0-1.0, where 1.0 is opaque)
background-opacity = 0.85

# Window padding
window-padding-x = 10
window-padding-y = 10

# macOS-specific
macos-titlebar-style = transparent
macos-option-as-alt = true

# ===== PERFORMANCE =====
# These are the defaults, but showing for reference
# shell-integration = detect
# shell-integration-features = cursor,sudo,title

# ===== CURSOR =====
cursor-style = block
cursor-style-blink = true

# ===== MOUSE =====
mouse-hide-while-typing = true
copy-on-select = true

# ===== KEYBINDINGS =====
# Reload config: cmd+shift+,
# New tab: cmd+t
# New window: cmd+n
# Split right: cmd+d
# Split down: cmd+shift+d
EOF
```

**View all available themes:**

```bash
ghostty +list-themes
```

**View current configuration:**

```bash
ghostty +show-config
```

**Reload configuration:**
Press `cmd+shift+,` after making changes.

## ⚙️ Configuration

### Advanced Ghostty Configuration

Ghostty uses a simple `key = value` config format. The config file is located at:

- `~/.config/ghostty/config` (recommended)
- `~/Library/Application Support/com.mitchellh.ghostty/config` (macOS alternative)

**Complete example configuration:**

```conf
# ===== THEME =====
theme = Catppuccin Mocha

# Automatic light/dark mode switching
# theme = dark:Catppuccin Mocha,light:Catppuccin Latte

# ===== FONT =====
font-family = "JetBrainsMono Nerd Font"
font-size = 13
font-feature = +liga  # Enable ligatures

# ===== APPEARANCE =====
background-opacity = 0.85
background-blur = 20
window-padding-x = 10
window-padding-y = 10
window-padding-balance = true

# ===== macOS SPECIFIC =====
macos-titlebar-style = transparent
macos-option-as-alt = true
macos-titlebar-proxy-icon = hidden

# ===== CURSOR =====
cursor-style = block
cursor-style-blink = true

# ===== SCROLLBACK =====
scrollback-limit = 10000

# ===== MOUSE =====
mouse-hide-while-typing = true
copy-on-select = clipboard

# ===== SHELL =====
# Uncomment to use specific shell
# command = /bin/zsh
# command = /opt/homebrew/bin/nu

# ===== PERFORMANCE =====
shell-integration = detect
```

**Configuration tips:**

- Press `cmd+shift+,` to reload config
- Use `ghostty +show-config --default --docs` to see all options
- Comments start with `#`
- Empty values reset to defaults

### Configure Zsh (Default macOS Shell)

Add to `~/.zshrc`:

```bash
# Initialize Carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Initialize Starship prompt
eval "$(starship init zsh)"
```

Apply changes:

```bash
source ~/.zshrc
```

### Configure Bash (Alternative)

Add to `~/.bash_profile` or `~/.bashrc`:

```bash
# Initialize Carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Initialize Starship prompt
eval "$(starship init bash)"
```

### Configure Nushell

Create config directory:

```bash
mkdir -p ~/.config/nushell
```

**Download Catppuccin theme:**

```bash
curl -o ~/.config/nushell/catppuccin_mocha.nu \
  https://raw.githubusercontent.com/catppuccin/nushell/main/themes/catppuccin_mocha.nu
```

**Create `~/.config/nushell/config.nu`:**

```nu
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
```

**Create `~/.config/nushell/env.nu`:**

```nu
# Nushell Environment Config
# Add Homebrew to PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
```

### Configure Starship

Copy the Windows configuration or use the preset:

```bash
# Create config directory
mkdir -p ~/.config

# Download Catppuccin Powerline preset
starship preset catppuccin-powerline -o ~/.config/starship.toml
```

Or copy from your Windows backup:

```bash
# If you have the backup
cp /path/to/terminal-setup/config/starship.toml ~/.config/starship.toml
```

## 🎨 Terminal Emulator Comparison

| Feature          | Ghostty    | iTerm2     | Kitty      | Terminal.app |
| ---------------- | ---------- | ---------- | ---------- | ------------ |
| Catppuccin Theme | ✅ Built-in | ⚠️ Import  | ⚠️ Manual  | ❌ Manual     |
| Built-in Themes  | ✅ 200+     | ❌ No       | ⚠️ Some    | ❌ No         |
| Nerd Fonts       | ✅ Included | ❌ External | ❌ External | ❌ External   |
| Transparency     | ✅ Native   | ✅ Native   | ✅ Native   | ❌ No         |
| GPU Acceleration | ✅ Metal    | ✅ Yes      | ✅ Yes      | ❌ No         |
| Ligatures        | ✅ Yes      | ✅ Yes      | ✅ Yes      | ✅ Yes        |
| Split Panes      | ✅ Yes      | ✅ Yes      | ✅ Yes      | ❌ No         |
| Tabs             | ✅ Yes      | ✅ Yes      | ✅ Yes      | ✅ Yes        |
| Configuration    | File-based | GUI        | File-based | GUI          |
| Speed            | ⚡⚡⚡        | ⚡⚡         | ⚡⚡⚡        | ⚡            |
| Zero Config      | ✅ Yes      | ❌ No       | ❌ No       | ✅ Yes        |

**Recommendation:** Ghostty for the best out-of-the-box experience with Catppuccin theme and Nerd Fonts included.

## 🔥 Advanced Ghostty Tips

### Custom Keybindings

Add custom keybindings to your config:

```conf
# Custom keybindings
keybind = cmd+shift+c=copy_to_clipboard
keybind = cmd+shift+v=paste_from_clipboard
keybind = cmd+k=clear_screen
keybind = cmd+shift+k=scroll_to_top

# Tab management
keybind = cmd+1=goto_tab:1
keybind = cmd+2=goto_tab:2
keybind = cmd+3=goto_tab:3

# Split management
keybind = cmd+d=new_split:right
keybind = cmd+shift+d=new_split:down
```

### Multiple Theme Profiles

Create theme-specific configs for different use cases:

**Create `~/.config/ghostty/themes/development.conf`:**

```conf
theme = Catppuccin Mocha
background-opacity = 0.85
```

**Create `~/.config/ghostty/themes/presentation.conf`:**

```conf
theme = Catppuccin Mocha
background-opacity = 1.0
font-size = 16
```

**Load with:**

```bash
ghostty --config-file=~/.config/ghostty/themes/presentation.conf
```

### Auto Light/Dark Mode

Automatically switch themes based on system appearance:

```conf
# In main config
theme = dark:Catppuccin Mocha,light:Catppuccin Latte
```

### Custom Color Overrides

Override specific colors while keeping the theme:

```conf
theme = Catppuccin Mocha

# Override specific colors
# background = #1a1b26
# foreground = #c0caf5
# cursor-color = #f7768e
```

### Shell-Specific Configurations

Run different shells with custom settings:

```bash
# Launch with Nushell
ghostty --command=/opt/homebrew/bin/nu

# Launch in specific directory
ghostty --working-directory=~/Projects
```

## 🛠️ Shell Comparison

| Shell   | Speed  | Learning Curve | Structured Data | Scripts    |
| ------- | ------ | -------------- | --------------- | ---------- |
| Zsh     | Fast   | Easy           | No              | Compatible |
| Bash    | Fast   | Easy           | No              | Universal  |
| Nushell | Medium | Steep          | ✅ Yes           | Different  |
| Fish    | Fast   | Easy           | No              | Different  |

**Default recommendation:** Stick with Zsh (macOS default) for compatibility.

**Data tasks:** Use Nushell for JSON/CSV/API work.

## 📱 Modern CLI Tools (Optional)

Enhance your terminal with Rust-based alternatives:

```bash
# Install modern alternatives
brew install eza bat fd ripgrep fzf zoxide git-delta

# Add aliases to ~/.zshrc
alias ls='eza --icons'
alias ll='eza --icons -l'
alias la='eza --icons -la'
alias cat='bat --style=plain'
alias find='fd'
alias grep='rg'
```

## 🎨 Color Scheme Variants

Switch between Catppuccin variants in Ghostty:

**Ghostty:** Simply change the theme line in `~/.config/ghostty/config`:

```conf
theme = Catppuccin Mocha      # Dark, cool (recommended)
# theme = Catppuccin Frappe   # Dark, warmer
# theme = Catppuccin Macchiato # Dark, lighter
# theme = Catppuccin Latte     # Light theme
```

**View all 200+ available themes:**

```bash
ghostty +list-themes
```

**Auto-switch based on system appearance:**

```conf
theme = dark:Catppuccin Mocha,light:Catppuccin Latte
```

**Starship:** Edit `~/.config/starship.toml`:

```toml
palette = 'catppuccin_mocha'      # Match your Ghostty theme
# palette = 'catppuccin_frappe'
# palette = 'catppuccin_macchiato'
# palette = 'catppuccin_latte'
```

**Reload Ghostty config:** Press `cmd+shift+,`

## 🔧 Troubleshooting

### Icons not showing in Starship

JetBrains Mono Nerd Font is built into Ghostty, so icons should work automatically.

```bash
# Verify font configuration in Ghostty
ghostty +show-config | grep font

# Should show: font-family = JetBrainsMono Nerd Font

# Test with echo
echo "   "  # Should display icons
```

If icons still don't appear, verify your config:

```conf
# In ~/.config/ghostty/config
font-family = "JetBrainsMono Nerd Font"  # With quotes
```

### Ghostty theme not loading

```bash
# List all available themes
ghostty +list-themes | grep -i catppuccin

# Verify current config
ghostty +show-config | grep theme

# Should show: theme = Catppuccin Mocha

# Reload config
# Press cmd+shift+, or restart Ghostty
```

### Starship not loading

```bash
# Check Starship is in PATH
which starship

# Test initialization
starship init zsh

# Add to PATH if needed
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc

# Reload shell
source ~/.zshrc
```

### Transparency not working

Ghostty transparency is controlled by `background-opacity`:

```conf
# In ~/.config/ghostty/config
background-opacity = 0.85  # 0.0 (transparent) to 1.0 (opaque)
```

Reload with `cmd+shift+,`

### Carapace completions not working

```bash
# Verify installation
which carapace

# Should return: /opt/homebrew/bin/carapace

# Test manually
carapace git

# Ensure init in ~/.zshrc
grep "carapace" ~/.zshrc
```

### Ghostty not starting

```bash
# Check if installed
which ghostty

# Try from command line
ghostty

# View logs
# Check Console.app for "ghostty" errors
```

### Configuration not being read

```bash
# Verify config file location
ls -la ~/.config/ghostty/config

# View effective configuration
ghostty +show-config

# Check for syntax errors (keys are lowercase, format is key = value)
```

## 📦 Automated Installation Script

Save as `install-macos.sh`:

```bash
#!/bin/bash
# macOS Terminal Setup with Ghostty - Catppuccin Mocha

echo "🎨 Installing Catppuccin Terminal Setup for macOS with Ghostty..."

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Ghostty terminal emulator
echo "Installing Ghostty..."
brew install --cask ghostty

# Install tools
echo "Installing Starship, Carapace, and Nushell..."
brew install starship carapace-sh nushell

# Create config directories
echo "Creating config directories..."
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nushell

# Configure Ghostty with Catppuccin Mocha
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
echo "Downloading Nushell Catppuccin theme..."
curl -o ~/.config/nushell/catppuccin_mocha.nu \
  https://raw.githubusercontent.com/catppuccin/nushell/main/themes/catppuccin_mocha.nu

# Install Starship preset
echo "Installing Starship Catppuccin Powerline preset..."
starship preset catppuccin-powerline -o ~/.config/starship.toml

# Configure Zsh
if ! grep -q "starship init zsh" ~/.zshrc 2>/dev/null; then
    echo "" >> ~/.zshrc
    echo "# Carapace completions" >> ~/.zshrc
    echo 'export CARAPACE_BRIDGES="zsh,fish,bash,inshellisense"' >> ~/.zshrc
    echo 'source <(carapace _carapace)' >> ~/.zshrc
    echo "" >> ~/.zshrc
    echo "# Starship prompt" >> ~/.zshrc
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

# Configure Nushell
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
```

Make executable and run:

```bash
chmod +x install-macos.sh
./install-macos.sh
```

## 🔗 Resources

- **Ghostty:** https://ghostty.org/
  - Documentation: https://ghostty.org/docs
  - GitHub: https://github.com/ghostty-org/ghostty
- **Catppuccin:** https://github.com/catppuccin/catppuccin
- **Starship:** https://starship.rs/
- **Nushell:** https://www.nushell.sh/
- **Carapace:** https://carapace-sh.github.io/
- **JetBrains Mono:** https://www.jetbrains.com/lp/mono/

## 💡 Tips & Best Practices

### Ghostty-Specific Tips

1. **Explore built-in themes** - Run `ghostty +list-themes` to see 200+ options
2. **Use auto light/dark** - Set `theme = dark:Catppuccin Mocha,light:Catppuccin Latte`
3. **Create profile configs** - Use `--config-file` flag for different setups
4. **Reload config instantly** - Press `cmd+shift+,` instead of restarting
5. **View effective config** - Run `ghostty +show-config` to debug

### General Terminal Tips

1. **Use tmux/zellij** for persistent sessions and advanced window management

2. **Enable Touch ID for sudo** for seamless authentication:
   
   ```bash
   sudo nano /etc/pam.d/sudo
   # Add at top: auth sufficient pam_tid.so
   ```

3. **Set up Alfred/Raycast** workflows for quick terminal access

4. **Modern CLI tools** - Install `eza`, `bat`, `fd`, `ripgrep`, `fzf` for better experience

5. **Shell integration** - Ghostty includes automatic shell integration for Zsh/Bash

### Keyboard Shortcuts (Ghostty)

| Action          | Shortcut      |
| --------------- | ------------- |
| New tab         | `cmd+t`       |
| New window      | `cmd+n`       |
| Split right     | `cmd+d`       |
| Split down      | `cmd+shift+d` |
| Close tab/split | `cmd+w`       |
| Reload config   | `cmd+shift+,` |
| Next tab        | `cmd+shift+]` |
| Previous tab    | `cmd+shift+[` |
| Full screen     | `cmd+ctrl+f`  |

### Customization Ideas

**Presentation mode config:**

```conf
theme = Catppuccin Mocha
background-opacity = 1.0
font-size = 16
```

**Development mode config:**

```conf
theme = Catppuccin Mocha
background-opacity = 0.85
font-size = 13
```

**Remote/SSH visual indicator:**

```conf
theme = Catppuccin Frappe  # Different color for visual distinction
```

---

**Enjoy your beautiful macOS terminal with Ghostty!** 🎨✨

**Quick Reference:**

- Config location: `~/.config/ghostty/config`
- List themes: `ghostty +list-themes`
- View config: `ghostty +show-config`
- Reload: `cmd+shift+,`
