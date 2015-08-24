# ZSH Config
# oh-my-zsh config
# Path to your oh-my-zsh installation.
export ZSH=/home/jcpadial/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="murilasso"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


# Personal config
compdef g=git # g function as git

# Source common config
source ~/.commonrc

function chpwd() {
    ls
}

# Source local config
source ~/.localrc
