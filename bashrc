# BASH config
# Prompt
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Source common config
source ~/.commonrc

# Source local config
if [ -f ~/.localrc ]; then
    source ~/.localrc
fi
