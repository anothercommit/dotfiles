plugins=(git)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export LANG=es_AR.UTF-8

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle '*:completion*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export PATH="/home/joaco/.local/bin:$PATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Functions {{{
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

rmthis ()
{
  cd '..' -p && rm -rf -P -- "$1"
}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
# }}}

# {{{
# }}}

# Aliases {{{
alias ..='cd ..'
alias ...='cd ../..'
alias pws='bat ~/Notas/passwords.txt'
alias npws='nvim ~/Notas/passwords.txt'
alias todo='bat ~/Notas/TO_DO.md'
alias ntodo='nvim ~/Notas/TO_DO.md'
alias words='bat ~/Notas/Palabras\ pendientes\ anki.md'
alias nwords='nvim ~/Notas/Palabras\ pendientes\ anki.md'
alias commands='bat ~/Notas/cheatsheets/Commands.md'
alias ncommands='nvim ~/Notas/cheatsheets/Commands.md'
alias zshconf='nvim ~/.config/zsh/.zshrc'
alias zshsource='source ~/.config/zsh/.zshrc'

alias l='exa'
alias la='exa -a'
alias ll='exa -al'
alias lt='exa -T'
alias llt='exa -alT'

alias icat='kitty +kitten icat'
alias p='sudo pacman'
alias sp='sudo pacman'
alias code='codium'
alias du='du -sh'
alias df='df -h'
alias n='nvim'
alias rust-book='chromium ~/repos/rust-book-es/second-edition/en/book/index.html'

alias chromium="chromium --force-dark-mode --enable-features=WebUIDarkMode"
alias keysoup="sudo systemctl restart keyd"
# }}}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

pfetch

alias luamake=/home/joaco/repos/lua-language-server/3rd/luamake/luamake
