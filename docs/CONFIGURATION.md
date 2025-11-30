# Configuration Guide

Detailed guide for customizing your terminal setup.

## Table of Contents

1. [Windows Terminal](#windows-terminal)
2. [Starship Prompt](#starship-prompt)
3. [Nushell](#nushell)
4. [PowerShell](#powershell)
5. [Bash](#bash)

## Windows Terminal

### Profile Configuration

Each profile in `windows-terminal-settings.json` has these key settings:

```json
{
    "name": "Profile Name",
    "colorScheme": "Catppuccin Mocha",
    "tabColor": "#1E1E2E",
    "opacity": 60,
    "useAcrylic": true,
    "font": {
        "face": "JetBrainsMono NF",
        "size": 13
    },
    "lineHeight": 1.2
}
```

### Opacity Levels

Recommended opacity settings:
- **60%** - Good balance (current setup)
- **70%** - More visible background
- **80%** - Subtle transparency
- **85%** - Minimal transparency (Claude Code profile)

### Tab Colors

Profile-specific tab colors for easy identification:
- PowerShell: `#1E1E2E` (Catppuccin Mocha)
- Command Prompt: `#1E1E2E`
- Ubuntu: `#300a24` (Ubuntu purple)
- Git Bash: `#f34f29` (Git orange)
- Nushell: `#1E1E2E`

## Starship Prompt

Configuration file: `config/starship.toml`

### Catppuccin Powerline Theme

The current preset uses powerline-style separators with Catppuccin colors.

**Key sections:**
```toml
palette = 'catppuccin_mocha'

[os]
disabled = false  # Shows OS icon

[username]
show_always = true  # Always show username

[directory]
truncation_length = 3  # Show last 3 directories
truncation_symbol = "…/"

[time]
disabled = false  # Show current time
time_format = "%R"  # 24-hour format (HH:MM)
```

### Common Customizations

**Hide the time:**
```toml
[time]
disabled = true
```

**Change directory truncation:**
```toml
[directory]
truncation_length = 5  # Show more directories
```

**Disable username:**
```toml
[username]
show_always = false
```

**Change time format:**
```toml
[time]
time_format = "%I:%M %p"  # 12-hour format with AM/PM
```

### Switch Theme Variant

Change the palette line:
```toml
palette = 'catppuccin_frappe'   # Warmer dark theme
palette = 'catppuccin_macchiato' # Lighter dark theme
palette = 'catppuccin_latte'     # Light theme
```

## Nushell

Configuration files:
- `config/nushell/config.nu` - Main configuration
- `config/nushell/env.nu` - Environment variables
- `config/nushell/catppuccin_mocha.nu` - Theme

### Key Settings

**Disable welcome banner:**
```nu
$env.config.show_banner = false
```

**Change completion behavior:**
```nu
$env.config.completions.algorithm = "prefix"  # or "fuzzy"
$env.config.completions.quick = false  # Show all results
```

**Adjust footer:**
```nu
$env.config.footer_mode = "never"  # Don't show footer
$env.config.footer_mode = "always" # Always show
$env.config.footer_mode = "25"     # Show if >25 rows
```

### Useful Nushell Commands

**Data exploration:**
```nu
ls | where size > 1mb | sort-by modified | reverse
sys | get cpu
ps | where cpu > 5
```

**JSON processing:**
```nu
open data.json | get items | where active == true | select name value
http get https://api.example.com/data | to json
```

**Table operations:**
```nu
ls | select name size | where name =~ "\.md$"
```

## PowerShell

Profile locations:
- Windows PowerShell: `~/OneDrive/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1`
- PowerShell Core: `~/OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1`

### Current Configuration

```powershell
# Tab completion with menu
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Carapace completions
carapace _carapace | Out-String | Invoke-Expression

# Starship prompt
Invoke-Expression (&starship init powershell)
```

### Customizations

**Change completion key:**
```powershell
Set-PSReadlineKeyHandler -Key Ctrl+Space -Function MenuComplete
```

**Add aliases:**
```powershell
Set-Alias -Name g -Value git
Set-Alias -Name k -Value kubectl
```

**Custom functions:**
```powershell
function GitStatus { git status }
Set-Alias -Name gs -Value GitStatus
```

## Bash

Configuration file: `~/.bashrc`

### Current Configuration

```bash
# Initialize Carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Initialize Starship prompt
eval "$(starship init bash)"
```

### Customizations

**Add aliases:**
```bash
alias ll='ls -alF'
alias gs='git status'
alias k='kubectl'
```

**Custom functions:**
```bash
# Quick git commit
function gcom() {
    git add .
    git commit -m "$1"
}
```

**Environment variables:**
```bash
export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"
```

## Color Schemes

### Catppuccin Mocha Palette

The theme uses these colors:

| Name | Hex | Usage |
|------|-----|-------|
| Rosewater | #f5e0dc | Accents |
| Flamingo | #f2cdcd | Errors |
| Pink | #f5c2e7 | Special |
| Mauve | #cba6f7 | Keywords |
| Red | #f38ba8 | Errors, danger |
| Maroon | #eba0ac | Links |
| Peach | #fab387 | Numbers |
| Yellow | #f9e2af | Warnings |
| Green | #a6e3a1 | Success, strings |
| Teal | #94e2d5 | Hints |
| Sky | #89dceb | Operators |
| Sapphire | #74c7ec | Functions |
| Blue | #89b4fa | Types |
| Lavender | #b4befe | Tags |
| Text | #cdd6f4 | Main text |
| Base | #1e1e2e | Background |
| Mantle | #181825 | Darker background |
| Crust | #11111b | Darkest |

### Switching Themes

To switch from Mocha to another variant:

1. **Windows Terminal** - Change `colorScheme` in each profile
2. **Starship** - Change `palette` in `starship.toml`
3. **Nushell** - Download alternative theme from Catppuccin repo

## Advanced Tips

### Performance

**Starship startup optimization:**
```toml
[cmd_duration]
min_time = 500  # Only show if command took >500ms
```

**Reduce module loading:**
Comment out modules you don't need in `starship.toml`

### Custom Modules

**Add weather to Starship:**
```toml
[custom.weather]
command = "curl wttr.in/?format=1"
when = true
```

### Multi-Line Prompt

Enable in Starship:
```toml
[line_break]
disabled = false
```

## Backup Your Customizations

After making changes, update the backup:

**Windows:**
```powershell
Copy-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" ".\config\windows-terminal-settings.json"
Copy-Item "$env:USERPROFILE\.config\starship.toml" ".\config\starship.toml"
Copy-Item "$env:APPDATA\nushell\*" ".\config\nushell\"
```

**Linux:**
```bash
cp ~/.config/starship.toml ./config/
cp ~/.config/nushell/* ./config/nushell/
cp ~/.bashrc ./config/shell-profiles/bashrc
```
