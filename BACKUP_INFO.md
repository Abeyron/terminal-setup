# Terminal Setup Backup Information

**Created:** $(date)
**Location:** `/home/francois/Projects/terminal-setup`

## 📋 Backup Contents

This backup contains a complete snapshot of your terminal configuration including:

### ✅ Configuration Files

- **Windows Terminal settings** - All profiles, themes, and preferences
- **Starship** - Catppuccin Powerline prompt configuration
- **Nushell** - Complete config with Catppuccin Mocha theme
- **PowerShell profiles** - Both Windows PowerShell and PowerShell Core
- **Bash configuration** - With Starship and Carapace integration

### ✅ Installation Scripts

- **Windows installer** (`scripts/install.ps1`) - Automated setup for Windows
- **Linux installer** (`scripts/install-linux.sh`) - Automated setup for WSL/Ubuntu

### ✅ Documentation

- **README.md** - Complete setup guide with manual instructions
- **QUICK_START.md** - 5-minute installation guide
- **CONFIGURATION.md** - Detailed customization guide

## 🎯 What This Setup Includes

### Installed Tools
- JetBrains Mono Nerd Font v3.1.1
- Starship v1.24.1
- Carapace v1.5.5
- Nushell v0.108.0
- Clink v1.9.2 (for Command Prompt)

### Configured Shells
1. **Windows PowerShell** - Catppuccin Mocha, 60% opacity, Starship + Carapace
2. **PowerShell Core** - Catppuccin Mocha, 60% opacity, Starship + Carapace
3. **Command Prompt** - Catppuccin Mocha, 60% opacity, Starship via Clink
4. **Bash (Ubuntu/WSL)** - Starship + Carapace integration
5. **Nushell** - Catppuccin Mocha, 60% opacity, Starship + Carapace
6. **Claude Code** - Catppuccin Mocha, 85% opacity (special profile)

### Theme Details
- **Primary Theme:** Catppuccin Mocha (dark, pastel)
- **Font:** JetBrainsMono NF (Nerd Font)
- **Font Size:** 13pt
- **Line Height:** 1.2
- **Transparency:** 60% (85% for Claude Code)
- **Acrylic Blur:** Enabled

## 🚀 Quick Restore

### From Scratch (New Machine)

**Windows:**
```powershell
cd terminal-setup\scripts
powershell -ExecutionPolicy Bypass -File install.ps1
```

**Linux/WSL:**
```bash
cd terminal-setup/scripts
./install-linux.sh
```

### Update Existing Setup

**Update Windows Terminal settings:**
```powershell
Copy-Item config\windows-terminal-settings.json "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

**Update Starship config:**
```powershell
Copy-Item config\starship.toml "$env:USERPROFILE\.config\starship.toml"
```

**Update Nushell config:**
```powershell
Copy-Item config\nushell\* "$env:APPDATA\nushell\"
```

## 📁 File Locations Reference

### Windows
- **Windows Terminal:** `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`
- **Starship:** `%USERPROFILE%\.config\starship.toml`
- **Nushell:** `%APPDATA%\nushell\`
- **Windows PowerShell:** `%USERPROFILE%\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
- **PowerShell Core:** `%USERPROFILE%\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`
- **Clink:** `%LOCALAPPDATA%\clink\starship.lua`

### Linux/WSL
- **Starship:** `~/.config/starship.toml`
- **Nushell:** `~/.config/nushell/`
- **Bash:** `~/.bashrc`

## 🔄 Keeping Backup Updated

To update this backup after making changes:

**Windows:**
```powershell
# Update Windows Terminal settings
Copy-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" ".\config\windows-terminal-settings.json"

# Update Starship
Copy-Item "$env:USERPROFILE\.config\starship.toml" ".\config\starship.toml"

# Update Nushell
Copy-Item "$env:APPDATA\nushell\*" ".\config\nushell\"

# Update PowerShell profiles
Copy-Item "$HOME\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" ".\config\shell-profiles\WindowsPowerShell-profile.ps1"
Copy-Item "$HOME\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" ".\config\shell-profiles\PowerShell-profile.ps1"
```

**Linux:**
```bash
# Update Starship
cp ~/.config/starship.toml ./config/

# Update Nushell
cp ~/.config/nushell/* ./config/nushell/

# Update Bash
cp ~/.bashrc ./config/shell-profiles/bashrc
```

## 📝 Notes

- All files use UTF-8 encoding
- PowerShell execution policy must be set to `RemoteSigned` or `Bypass`
- Font installation requires administrator privileges on Windows
- Starship and Carapace require restart of shell to take effect
- Nushell config uses module system (not all features available in older versions)

## 🆘 Recovery Checklist

If starting from scratch, install in this order:

1. ✅ Install JetBrains Mono Nerd Font
2. ✅ Install Starship
3. ✅ Install Carapace
4. ✅ Install Nushell (optional)
5. ✅ Install Clink (optional, for CMD)
6. ✅ Copy Windows Terminal settings
7. ✅ Copy Starship config
8. ✅ Copy Nushell config
9. ✅ Copy/update shell profiles
10. ✅ Restart Windows Terminal

## 🔗 Resources

- Catppuccin: https://catppuccin.com/
- Starship: https://starship.rs/
- Carapace: https://carapace-sh.github.io/
- Nushell: https://www.nushell.sh/
- Nerd Fonts: https://www.nerdfonts.com/
- Windows Terminal: https://github.com/microsoft/terminal

---

**Backup Created:** $(date)
**Version:** 1.0
**Status:** Complete ✅
