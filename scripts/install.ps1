# Terminal Setup Installation Script for Windows
# Run this script with: powershell -ExecutionPolicy Bypass -File install.ps1

Write-Host "=== Terminal Setup Installation ===" -ForegroundColor Cyan
Write-Host ""

# Set execution policy
Write-Host "Setting PowerShell execution policy..." -ForegroundColor Yellow
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install fonts
Write-Host "`nInstalling JetBrains Mono Nerd Font..." -ForegroundColor Yellow
$tempDir = $env:TEMP + '\JetBrainsMonoNerdFont'
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
$url = 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip'
$zipPath = $tempDir + '\JetBrainsMono.zip'
Invoke-WebRequest -Uri $url -OutFile $zipPath
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force
$fonts = Get-ChildItem -Path $tempDir -Include '*.ttf' -Recurse
$FONTS = 0x14
$fontShell = New-Object -ComObject Shell.Application
$fontFolder = $fontShell.Namespace($FONTS)
foreach ($font in $fonts) {
    if ($font.Name -match 'JetBrainsMonoNerdFont-' -and $font.Name -notmatch 'Propo') {
        $fontFolder.CopyHere($font.FullName, 0x10)
    }
}
Remove-Item -Path $tempDir -Recurse -Force
Write-Host "Font installation complete!" -ForegroundColor Green

# Install tools via winget
Write-Host "`nInstalling Starship..." -ForegroundColor Yellow
winget install -e --id Starship.Starship --silent

Write-Host "Installing Carapace..." -ForegroundColor Yellow
winget install -e --id rsteube.Carapace --silent

Write-Host "Installing Nushell..." -ForegroundColor Yellow
winget install -e --id Nushell.Nushell --silent

Write-Host "Installing Clink (for Command Prompt)..." -ForegroundColor Yellow
winget install -e --id chrisant996.Clink --silent

# Copy configuration files
Write-Host "`nCopying configuration files..." -ForegroundColor Yellow

# Windows Terminal settings
$wtSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
if (Test-Path $wtSettingsPath) {
    Copy-Item -Path ".\config\windows-terminal-settings.json" -Destination "$wtSettingsPath\settings.json" -Force
    Write-Host "Windows Terminal settings copied" -ForegroundColor Green
}

# Starship config
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config" -Force | Out-Null
Copy-Item -Path ".\config\starship.toml" -Destination "$env:USERPROFILE\.config\starship.toml" -Force
Write-Host "Starship configuration copied" -ForegroundColor Green

# Nushell config
New-Item -ItemType Directory -Path "$env:APPDATA\nushell" -Force | Out-Null
Copy-Item -Path ".\config\nushell\*" -Destination "$env:APPDATA\nushell\" -Force
Write-Host "Nushell configuration copied" -ForegroundColor Green

# PowerShell profiles
$windowsPSDir = "$HOME\OneDrive\Documents\WindowsPowerShell"
$corePSDir = "$HOME\OneDrive\Documents\PowerShell"
New-Item -ItemType Directory -Path $windowsPSDir -Force | Out-Null
New-Item -ItemType Directory -Path $corePSDir -Force | Out-Null
Copy-Item -Path ".\config\shell-profiles\WindowsPowerShell-profile.ps1" -Destination "$windowsPSDir\Microsoft.PowerShell_profile.ps1" -Force
Copy-Item -Path ".\config\shell-profiles\PowerShell-profile.ps1" -Destination "$corePSDir\Microsoft.PowerShell_profile.ps1" -Force
Write-Host "PowerShell profiles copied" -ForegroundColor Green

# Clink Starship config
$clinkDir = "$env:LOCALAPPDATA\clink"
New-Item -ItemType Directory -Path $clinkDir -Force | Out-Null
$starshipLua = "load(io.popen('starship init cmd'):read(`"*a`"))()"
Set-Content -Path "$clinkDir\starship.lua" -Value $starshipLua -NoNewline
Write-Host "Clink configuration created" -ForegroundColor Green

Write-Host "`n=== Installation Complete! ===" -ForegroundColor Green
Write-Host "Please restart Windows Terminal to see the changes." -ForegroundColor Cyan
Write-Host ""
