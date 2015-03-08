# Path to your oh-my-zsh installation.
export ZSH=/home/jcpadial/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="murilasso"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(zsh-syntax-highlighting)

# PATH config
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# Java
export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_75"
export PATH="/usr/lib/jvm/jdk1.7.0_75/bin":$PATH
# Apache ANT
export ANT_HOME="/usr/lib/apache-ant-1.9.4"
export PATH="/usr/lib/apache-ant-1.9.4/bin":$PATH


source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

source ~/.alias
[[ $TMUX = "" ]] && export TERM="xterm-256color"

