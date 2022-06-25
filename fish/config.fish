function fish_greeting
    # bat --paging=never ~/Notas/To\ Do.md    
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR "nvim"
set VISUAL "nvim"

set PATH /home/joaco/.local/bin $PATH
set PATH /home/joaco/.cargo/bin $PATH


function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings
end

alias icat='kitty +kitten icat'
alias todo='bat ~/Notas/To\ Do.md'
alias ntodo='nvim ~/Notas/To\ Do.md'
alias pws='bat ~/Notas/Contraseñas.md'
alias npws='nvim ~/Notas/Contraseñas.md'
alias ntodo='nvim ~/Notas/To\ Do.md'
alias ntodo='nvim ~/Notas/To\ Do.md'
alias words='bat ~/Notas/Palabras\ pendientes\ anki.md'
alias nwords='nvim ~/Notas/Palabras\ pendientes\ anki.md'
alias commands='bat ~/Notas/Commands.md'
alias rust-the-book='librewolf ~/repos/rust-book-es/second-edition/es/book/index.html'


starship init fish | source
zoxide init fish | source
