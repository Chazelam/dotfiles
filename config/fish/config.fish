if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fastfetch
    starship init fish | source
    

#    alias cp='kitty +kitten clipboard'
    alias cf='clear; fastfetch'

end
