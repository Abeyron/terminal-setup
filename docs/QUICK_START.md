# Quick Start Guide

Get up and running in 5 minutes!

## Prerequisites

- Windows 10/11 with Windows Terminal
- WSL2 with Ubuntu (optional, for Linux shells)

## Installation Steps

### Windows Setup (5 minutes)

1. **Open PowerShell as Administrator**
   - Press `Win + X`, select "Windows PowerShell (Admin)"

2. **Navigate to the setup folder**
   ```powershell
   cd path\to\terminal-setup\scripts
   ```

3. **Run the installation script**
   ```powershell
   powershell -ExecutionPolicy Bypass -File install.ps1
   ```

4. **Restart Windows Terminal**

5. **Done!** 🎉

### Linux/WSL Setup (3 minutes)

1. **Open Ubuntu/WSL terminal**

2. **Navigate to the setup folder**
   ```bash
   cd /path/to/terminal-setup/scripts
   ```

3. **Run the installation script**
   ```bash
   ./install-linux.sh
   ```

4. **Restart your shell or run**
   ```bash
   source ~/.bashrc
   ```

5. **Done!** 🎉

## What Gets Installed

- ✅ JetBrains Mono Nerd Font
- ✅ Starship prompt
- ✅ Carapace completions
- ✅ Nushell
- ✅ All configuration files
- ✅ Windows Terminal settings
- ✅ Shell profiles

## First Launch

After installation, open Windows Terminal and you'll see:

1. **New dropdown menu** with all configured profiles
2. **Beautiful Catppuccin Mocha colors**
3. **Starship powerline prompt** with icons
4. **Tab completions** when you press Tab

## Try It Out

### Test Starship Prompt
```bash
# Navigate to a git repository
cd ~/Projects/some-git-repo

# You'll see git branch, status, and more in the prompt!
```

### Test Carapace Completions
```bash
# Type a command and press Tab
git <TAB>
docker <TAB>
npm <TAB>
```

### Try Nushell
1. Open Windows Terminal
2. Click dropdown → Select "Nushell"
3. Try:
   ```nu
   ls | where size > 1mb
   sys
   version
   ```

## Next Steps

- Read [README.md](../README.md) for detailed customization
- Explore Starship config in `config/starship.toml`
- Try different Catppuccin variants
- Customize opacity and colors

## Need Help?

Check the [Troubleshooting](../README.md#-troubleshooting) section in README.md
