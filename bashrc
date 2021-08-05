# BASH config
# Prompt
tf_prompt_info() {
    # check if in terraform dir
    if [ -d .terraform ]; then
      workspace=$(terraform workspace show 2> /dev/null) || return
      echo " [${workspace}]"
    fi
}

aws_prompt_info() {
    if [ -n "$AWS_PROFILE" ]; then
      echo " [$AWS_PROFILE]"
    fi
}

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $(tf_prompt_info)$(aws_prompt_info)\$ '

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# export HISTTIMEFORMAT="%d/%m/%y %T "
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Source common config
source ~/.commonrc

# Source local config
[ -f ~/.localrc ] && source ~/.localrc
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
