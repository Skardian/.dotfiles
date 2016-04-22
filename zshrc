# ZSH Config
# oh-my-zsh config
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM="$HOME/.dotfiles/zsh/"
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

source $HOME/.dotfiles/zsh/aliases.zsh

# Source local config
[ -f ~/.localrc ] && source ~/.localrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
