# ZSH Config
# Path to your oh-my-zsh installation.
export ZSH=/home/jcpadial/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="murilasso"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

plugins=(zsh-syntax-highlighting)

# Set 256 colors
[[ $TMUX = "" ]] && export TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# Functions
# source thoughtbot/dotfiles
g() {
    if [[ $# > 0 ]]; then
        git $@
    else
        git status
    fi
}
compdef g=git

source ~/.alias
export EDITOR=vim
export VISUAL=vim

# Add local ~/bin to path
if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

# Source local config
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi
