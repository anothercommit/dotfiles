plugins=(git)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export LANG=es_AR.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export PATH="/home/joaco/.local/bin:$PATH"

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
alias zshconf='nvim ~/.zshrc'                

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

eval "$(starship init zsh)"
