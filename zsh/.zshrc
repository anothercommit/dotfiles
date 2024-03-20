# when
figlet -c -t -f 3d "i use arch btw" | lolcat

plugins=(git)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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

# Functions {{{
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

# rmthis ()
# {
#   cd '..' -p && rm -rf -P -- "$1"
# }

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

# Aliases {{{

# Basic aliases
alias ..='cd ..'
alias ...='cd ../..'
alias rm='rm -v'
alias cp='cp -v'
alias l='ls --color'
alias la='ls --color --almost-all'

# Files
alias zshedit='nvim ~/.config/zsh/.zshrc'
alias zshsource='source ~/.config/zsh/.zshrc'

# Programs
alias chromium="chromium --force-dark-mode --enable-features=WebUIDarkMode"
# alias code='codium'

# CLI aliases
alias n='nvim'
alias sn='sudo nvim'
alias e='exa'
alias ea='exa -a'
alias el='exa -al'
alias et='exa -T'
alias elt='exa -alT'
alias tr='trash-put'
alias trr='trash-restore'
alias icat='kitty +kitten icat'
alias p='sudo pacman'
alias sp='sudo pacman'
alias du='du -sh'
alias df='df -h'
alias sudodu='sudo du -sh'
alias sudodf='sudo df -h'
alias keysoup="sudo systemctl restart keyd"
alias b="bat -p"

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gall="git add --all"
alias gc='git commit'
alias gcall="git commit -a -m \"🦎\""
alias gcp="git commit -a -m \"🦎\" && git push"

alias b='bat -p'

alias herramientas='bat "/home/joaco/SecondBrain/1. Áreas 🛸/PKM/Informática/Herramientas linux.md"'
alias comandos='bat "/home/joaco/SecondBrain/1. Áreas 🛸/PKM/Informática/Comandos recurrentes.md"'
# }}}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
