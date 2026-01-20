# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## What this repo is
This repository is a cross-platform “terminal setup backup”:

- `config/` is the source-of-truth for terminal/theme/prompt configuration (Windows Terminal, Starship, Nushell, shell profiles).
- `scripts/` contains installers that fetch required tools and copy config into OS-specific locations.
- `docs/` explains how to install and customize the setup.

There is no application build, lint, or test harness in this repo.

## Common commands

### Install / apply the setup
The main “entry points” are the install scripts in `scripts/`.

Windows (PowerShell):
```powershell
# Run from the repo root so relative paths like .\config\... resolve correctly
powershell -ExecutionPolicy Bypass -File scripts\install.ps1
```

Linux / WSL:
```bash
# The docs commonly run this from scripts/
cd scripts
./install-linux.sh
# then
source ~/.bashrc
```

macOS (Ghostty + Homebrew):
```bash
./scripts/install-macos.sh
# then
source ~/.zshrc
```

Notes for future edits:
- These scripts perform system modifications (install packages, write to `~/.config`, update shell profiles). Don’t run them in CI.
- The Windows and Linux installers use relative paths to `config/`. If you change file locations, update the scripts accordingly.
- `scripts/install-linux.sh` changes directories during execution (e.g. `cd /tmp`) and then later does `cp ../config/...`; if you modify this script, prefer resolving paths via the script directory (e.g. `SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)`) to avoid working-directory bugs.

### Update the backup after making changes
This repo is also used as a backup snapshot; the docs include “copy back into repo” commands.

Windows (copy from live system into repo):
```powershell
Copy-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" ".\config\windows-terminal-settings.json"
Copy-Item "$env:USERPROFILE\.config\starship.toml" ".\config\starship.toml"
Copy-Item "$env:APPDATA\nushell\*" ".\config\nushell\"
Copy-Item "$HOME\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" ".\config\shell-profiles\WindowsPowerShell-profile.ps1"
Copy-Item "$HOME\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" ".\config\shell-profiles\PowerShell-profile.ps1"
```

Linux (copy from live system into repo):
```bash
cp ~/.config/starship.toml ./config/
cp ~/.config/nushell/* ./config/nushell/
cp ~/.bashrc ./config/shell-profiles/bashrc
```

## High-level architecture (how the pieces fit)

### 1) Terminal emulator theming
- Windows Terminal is configured via `config/windows-terminal-settings.json`.
  - Contains profiles (PowerShell, PowerShell Core, CMD, WSL Ubuntu, Nushell, plus a “Claude Code” profile), keybindings, and Catppuccin color schemes.
  - The “theme” section defines a Windows Terminal theme (`catppuccin-mocha`) used for tab + window styling.
- macOS Terminal.app theme export lives at `config/Catppuccin-Mocha.terminal` (a `.plist`-style profile export).
- macOS automation in this repo is primarily oriented around Ghostty (see `docs/MACOS_SETUP.md` and `scripts/install-macos.sh`), which writes Ghostty config to `~/.config/ghostty/config`.

### 2) Prompt + UX layer (shared across shells)
The common prompt layer is Starship:
- Canonical Starship config is `config/starship.toml`.
  - Uses a Catppuccin palette and a powerline-style `format`.
  - Includes palettes for all Catppuccin variants (mocha/frappe/macchiato/latte).

Shells load Starship differently:
- PowerShell profiles (`config/shell-profiles/*-profile.ps1`) initialize Starship via `starship init powershell`.
- Bash uses `eval "$(starship init bash)"` (see `config/shell-profiles/bashrc` and the Linux installer, which appends the init block to `~/.bashrc`).
- Nushell uses a two-step setup:
  - `config/nushell/env.nu` generates a cached init script at `~/.cache/starship/init.nu`.
  - `config/nushell/config.nu` then `use`s that cached init file.

### 3) Completions layer
Carapace is used for cross-shell completions:
- PowerShell profiles run `carapace _carapace | ... | Invoke-Expression`.
- Bash sources `source <(carapace _carapace)`.
- Nushell caches init similarly to Starship:
  - `config/nushell/config.nu` writes `carapace _carapace nushell` to `~/.cache/carapace/init.nu` and then `source`s it.

### 4) Installers (scripts) are “wiring”
The installers primarily do two things:
1) Install dependencies (Starship, Carapace, Nushell, fonts, Ghostty/Clink).
2) Copy the repo’s `config/` files into the OS-specific runtime locations:
   - Windows Terminal settings.json, `%USERPROFILE%\.config\starship.toml`, `%APPDATA%\nushell\*`, PowerShell profiles under OneDrive Documents.
   - Linux: `~/.config/starship.toml`, `~/.config/nushell/*`, and a block appended to `~/.bashrc`.
   - macOS: Ghostty + Starship preset + Zsh init block + a generated Nushell config (note: the macOS script mostly generates configs directly rather than copying from `config/`).

## Where to look first when asked to change something
- “Change colors / opacity / profiles”: `config/windows-terminal-settings.json`
- “Change prompt appearance”: `config/starship.toml`
- “Change Nushell behavior”: `config/nushell/config.nu` + `config/nushell/env.nu`
- “Change shell init behavior”: `config/shell-profiles/`
- “Change install behavior”: `scripts/install.ps1`, `scripts/install-linux.sh`, `scripts/install-macos.sh`
- “Docs / intended behavior”: `README.md`, `START_HERE.md`, `docs/`