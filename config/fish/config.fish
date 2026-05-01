if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fastfetch
    # starship init fish | source
    alias cl='clear'
    alias cf='clear; fastfetch'
    alias lasview='~/dotfiles/bin/lasview.exe'
    alias vpnre='netbird down ; netbird up'
    alias vpnon='netbird up'
    alias vpnoff='netbird down'

end
