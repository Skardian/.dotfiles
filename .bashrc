# Set 256 colors
[[ $TMUX = "" ]] && export TERM="xterm-256color"

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

source ~/.alias

export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_75"
export PATH="/usr/lib/jvm/jdk1.7.0_75/bin":$PATH

# Add local ~/bin to path
export PATH=$PATH:~/bin
