# ZSH Config
# oh-my-zsh config
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM="$HOME/.dotfiles/zsh"
# Set name of the theme to load.
ZSH_THEME="skardian"

# ZSH Configs
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"
fpath=(~/.dotfiles/zsh/completion $fpath)

plugins=(
    aws
    docker
    gpg-agent
    httpie
    lein
    python
    terraform
    vagrant
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)
ZSH_HIGHLIGHT_STYLES[root]='bg=red'

# Personal config
compdef g=git # g function as git
setopt hist_ignore_all_dups
setopt hist_ignore_space
# Allow [ or ] wherever you want
unsetopt nomatch

# Source common config
source ~/.commonrc

source $HOME/.dotfiles/zsh/functions.zsh
source $HOME/.dotfiles/zsh/aliases.zsh

# Source local config
[ -f ~/.localrc ] && source ~/.localrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /etc/grc.zsh ] && source /etc/grc.zsh

# Remove path duplicates
typeset -U PATH
