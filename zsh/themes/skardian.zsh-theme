local return_code="%(?.. %{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local rvm_ruby='%{$fg[red]%}$(rvm_prompt_info || rbenv_prompt_info)%{$reset_color%}'
local git_branch='%{$fg[cyan]%}$(git_prompt_info)%{$reset_color%}'
local tf_workspace='%{$fg[magenta]%}$(tf_prompt_info)'
local aws_workspace='$(aws_prompt_info)'
local now='$(now)'

PROMPT="${user_host}:${current_dir}${tf_workspace}${aws_workspace} ${rvm_ruby}
${git_branch} %B$%b "
RPS1="${now}${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

function tf_prompt_info() {
    # check if in terraform dir
    if [[ -d .terraform && -r .terraform/environment ]]; then
      workspace=$(cat .terraform/environment) || return
      echo " [${workspace}]"
    fi
}

function aws_prompt_info() {
    if [ -n "$AWS_PROFILE" ]; then
      echo " \e[38;5;214m[$AWS_PROFILE]"
    fi
}

function now() {
    echo "%*"
}

