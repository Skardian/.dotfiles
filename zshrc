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

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

source ~/.alias

# Source local config
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

# Add local ~/bin to path
if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

