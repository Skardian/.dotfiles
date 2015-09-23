# ZSH Config
# oh-my-zsh config
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="murilasso"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Personal config
compdef g=git # g function as git
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Source common config
source ~/.commonrc

# chpwd hook
function chpwd() {
    ls
}

alias -g A='| ag'              # Pipe to ag
alias -g G='| grep'            # Pipe to grep
alias -g H='| head'            # Pipe to head
alias -g L="| less"            # Pipe to less
alias -g LA="2>&1 | less"      # Pipe everything to less
alias -g NA="> /dev/null 2>&1" # Redirect everything to null
alias -g NE="2> /dev/null"     # Redirect error to null
alias -g T='| tail'            # Pipe to tail

# Source local config
[ -f ~/.localrc ] && source ~/.localrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
