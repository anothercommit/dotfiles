# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#Functions

mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

#rmthis ()
#{
#  cd .. && rm -rf -P
#}

# Aliases

alias batery="cat /sys/class/power_supply/BAT0/capacity"
alias ll="ls -al"
alias passwords="cat ~/Notas/Contraseñas.md"
alias npasswords="nvim ~/Notas/Contraseñas.md"
alias todo="mdcat ~/Notas/To\\ Do.md"
alias ntodo="nvim ~/Notas/To\\ Do.md"
alias words="mdcat ~/Notas/Palabras\\ pendientes\\ anki.md"
alias nwords="nvim ~/Notas/Palabras\\ pendientes\\ anki.md"
alias icat="kitty +kitten icat"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rcns"
alias update="sudo pacman -Syu"
alias notas="cd ~/Notas"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
