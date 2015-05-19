# Set 256 colors
[[ $TMUX = "" ]] && export TERM="xterm-256color"

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

source ~/.alias

# Source local config
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

# Add local ~/bin to path
if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

