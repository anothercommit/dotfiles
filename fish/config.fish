if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR "nvim"
set VISUAL "nvim"


function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings
end

starship init fish | source
