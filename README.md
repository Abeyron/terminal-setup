# Terminal Setup - Catppuccin Mocha Theme

Complete backup and installation guide for a beautiful, functional terminal setup with Catppuccin Mocha theme across all shells.

## 🎨 Features

- **Catppuccin Mocha** color theme across all profiles
- **Starship** powerline prompt with beautiful icons
- **Carapace** intelligent completions for 1000+ commands
- **JetBrains Mono Nerd Font** with icon support
- **60% opacity** with acrylic blur effect
- **Multiple shells**: PowerShell, Bash, Nushell, Command Prompt

## 📦 Included Shells & Tools

### Shells
- **Windows PowerShell** - Classic Windows shell
- **PowerShell Core** - Cross-platform PowerShell
- **Bash** (WSL/Ubuntu) - Unix shell
- **Nushell** - Modern data-oriented shell
- **Command Prompt** - Traditional Windows CMD (with Clink)

### Tools
- **Starship** - Cross-shell prompt
- **Carapace** - Universal completion engine
- **Clink** - Command-line editing for CMD

## 🚀 Quick Installation

### Windows

1. Open PowerShell as Administrator
2. Navigate to the terminal-setup folder
3. Run the installation script:

```powershell
cd terminal-setup\scripts
powershell -ExecutionPolicy Bypass -File install.ps1
```

### Linux/WSL

1. Navigate to the terminal-setup folder
2. Run the installation script:

```bash
cd terminal-setup/scripts
./install-linux.sh
```

## 📂 Backup Structure

```
terminal-setup/
├── config/
│   ├── windows-terminal-settings.json   # Windows Terminal configuration
│   ├── starship.toml                    # Starship prompt configuration
│   ├── nushell/                         # Nushell configs
│   │   ├── config.nu
│   │   ├── env.nu
│   │   └── catppuccin_mocha.nu
│   └── shell-profiles/                  # Shell profile files
│       ├── bashrc
│       ├── WindowsPowerShell-profile.ps1
│       └── PowerShell-profile.ps1
├── scripts/
│   ├── install.ps1                      # Windows installation
│   └── install-linux.sh                 # Linux/WSL installation
└── docs/
    └── README.md                        # This file
```

## 🛠️ Manual Installation

If you prefer to install components manually:

### 1. Install Fonts

**JetBrains Mono Nerd Font:**
- Download from: https://github.com/ryanoasis/nerd-fonts/releases
- Install all `JetBrainsMonoNerdFont-*.ttf` files (exclude -Propo variants)

### 2. Install Tools

**Windows (using winget):**
```powershell
winget install -e --id Starship.Starship
winget install -e --id rsteube.Carapace
winget install -e --id Nushell.Nushell
winget install -e --id chrisant996.Clink
```

**Linux/WSL:**
```bash
# Starship
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin -y

# Carapace
# Download from: https://github.com/carapace-sh/carapace-bin/releases

# Nushell
# Download from: https://github.com/nushell/nushell/releases
```

### 3. Copy Configuration Files

**Windows Terminal:**
- Copy `config/windows-terminal-settings.json` to:
  `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`

**Starship:**
- Copy `config/starship.toml` to:
  - Windows: `%USERPROFILE%\.config\starship.toml`
  - Linux: `~/.config/starship.toml`

**Nushell:**
- Copy `config/nushell/*` to:
  - Windows: `%APPDATA%\nushell\`
  - Linux: `~/.config/nushell/`

**PowerShell:**
- Copy profile files to:
  - Windows PowerShell: `%USERPROFILE%\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
  - PowerShell Core: `%USERPROFILE%\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

**Bash:**
- Add to `~/.bashrc`:
```bash
# Initialize Carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Initialize Starship prompt
eval "$(starship init bash)"
```

## 🎯 Windows Terminal Profiles

The setup includes these profiles:

| Profile | Shell | Theme | Opacity | Features |
|---------|-------|-------|---------|----------|
| Windows PowerShell | PowerShell 5.1 | Catppuccin Mocha | 60% | Starship, Carapace |
| PowerShell | PowerShell 7+ | Catppuccin Mocha | 60% | Starship, Carapace |
| Command Prompt | CMD | Catppuccin Mocha | 60% | Starship via Clink |
| Ubuntu | Bash (WSL) | Default | - | Starship, Carapace |
| Nushell | Nushell | Catppuccin Mocha | 60% | Starship, Carapace |
| Claude Code | Claude CLI | Catppuccin Mocha | 85% | - |

## 🎨 Theme Variants

To switch Catppuccin variants, edit the configuration files:

**Starship** (`starship.toml`):
- Change `palette = 'catppuccin_mocha'` to:
  - `catppuccin_frappe`
  - `catppuccin_macchiato`
  - `catppuccin_latte`

**Windows Terminal** (`settings.json`):
- Use the appropriate color scheme from the included options

**Nushell**:
- Download alternative theme from: https://github.com/catppuccin/nushell

## 📝 Customization

### Adjust Transparency

Edit Windows Terminal profile opacity:
```json
"opacity": 60  // Change to 0-100
```

### Change Font Size

Edit font configuration in Windows Terminal:
```json
"font": {
    "face": "JetBrainsMono NF",
    "size": 13  // Change size
}
```

### Modify Starship Prompt

Edit `starship.toml` to customize:
- Module visibility
- Icons and symbols
- Colors and formatting
- Time format
- Directory truncation

See: https://starship.rs/config/

## 🔧 Troubleshooting

**Icons not showing:**
- Ensure "JetBrainsMono NF" font is installed and selected
- Restart Windows Terminal completely

**PowerShell errors:**
- Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
- Ensure profiles are in correct OneDrive paths

**Starship not loading:**
- Check PATH includes installation directories
- Verify starship binary is accessible: `starship --version`

**Carapace completions not working:**
- Restart shell after installation
- Verify: `carapace --version`

## 📚 Resources

- [Catppuccin](https://catppuccin.com/) - Theme project
- [Starship](https://starship.rs/) - Prompt customization
- [Carapace](https://carapace-sh.github.io/) - Completions
- [Nushell](https://www.nushell.sh/) - Modern shell
- [Nerd Fonts](https://www.nerdfonts.com/) - Icon fonts

## 📄 License

Configuration files are provided as-is for personal use.
Individual tools retain their respective licenses.

---

**Created:** $(date +%Y-%m-%d)
**Last Updated:** $(date +%Y-%m-%d)
