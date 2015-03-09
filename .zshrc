# Path to your oh-my-zsh installation.
export ZSH=/home/jcpadial/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="murilasso"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

plugins=(zsh-syntax-highlighting)

# PATH config
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# Java
export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_75"
export PATH="/usr/lib/jvm/jdk1.7.0_75/bin":$PATH
# Apache ANT
export ANT_HOME="/usr/lib/apache-ant-1.9.4"
export PATH="/usr/lib/apache-ant-1.9.4/bin":$PATH
# Apache TOMCAT
export CATALINA_HOME="/home/jcpadial/apache-tomcat-7.0.59"
# Axix2
export AXIS2_HOME="/home/jcpadial/axis2-1.6.2"
export PATH="/home/jcpadial/axis2-1.6.2/bin":$PATH

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

source ~/.alias
[[ $TMUX = "" ]] && export TERM="xterm-256color"

