export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME=""

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
