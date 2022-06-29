# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.


plugins=(git)

##source $ZSH/oh-my-zsh.sh

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

alias ..='cd ..'                                               
alias ...='cd ../..'                                           
alias todo='bat ~/Notas/To\ Do.md'                             
alias ntodo='nvim ~/Notas/To\ Do.md'                           
alias pws='bat ~/Notas/Contraseñas.md'                         
alias npws='nvim ~/Notas/Contraseñas.md'                       
alias ntodo='nvim ~/Notas/To\ Do.md'                           
alias ntodo='nvim ~/Notas/To\ Do.md'                           
alias words='bat ~/Notas/Palabras\ pendientes\ anki.md'        
alias nwords='nvim ~/Notas/Palabras\ pendientes\ anki.md'      
alias commands='bat ~/Notas/cheatsheets/Commands.md'           
alias ncommands='nvim ~/Notas/cheatsheets/Commands.md'         
alias rust-the-book='librewolf ~/repos/rust-book-es/second-edit'
alias zshconf='nvim ~/.zshrc'                
alias l='exa'                                                  
alias la='exa -a'                                              
alias ll='exa -al'                                             
alias lt='exa -T'                                              
alias llt='exa -alT'                                           
alias icat='kitty +kitten icat'                                
alias p='sudo pacman'                                          
alias code='codium'                                            
alias du='du -sh'                                              
alias df='df -h'
alias n='nvim'

eval "$(starship init zsh)"
