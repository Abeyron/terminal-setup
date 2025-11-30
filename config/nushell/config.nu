# Nushell Config File
# Source Catppuccin Mocha theme
source ~/.config/nushell/catppuccin_mocha.nu

# Carapace completions
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save -f ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu

# Starship prompt
use ~/.cache/starship/init.nu

# Use the Catppuccin Mocha color theme
$env.config = {
  color_config: $catppuccin_mocha
  use_grid_icons: true
  footer_mode: "25"
  float_precision: 2
  use_ansi_coloring: true
  edit_mode: emacs
  shell_integration: {
    osc2: true
    osc7: true
    osc8: true
    osc9_9: false
    osc133: true
    osc633: true
    reset_application_mode: true
  }
  show_banner: false
  render_right_prompt_on_last_line: false
}
