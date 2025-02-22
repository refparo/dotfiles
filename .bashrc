# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=zh_CN.UTF-8
export EDITOR=vim

export PYENV_ROOT=$HOME/.pyenv
export GHCUP_USE_XDG_DIRS=true
export CABAL_CONFIG=$HOME/.config/cabal/config

export PATH=$HOME/.local/bin:$PYENV_ROOT/bin:$HOME/.cabal/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH

set -o noclobber
shopt -s checkwinsize
shopt -s expand_aliases

PS1="\[$(tput setaf 6)\]\w\[$(tput setaf 2)\] \\$ \[$(tput sgr0)\]"
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE='\: *:\:'
HISTFILESIZE=
HISTSIZE=
HISTTIMEFORMAT="[%F %T] "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

eval $(dircolors)

alias ls='ls -p --color=auto --group-directories-first'
alias la='ls -Ap --color=auto --group-directories-first'
alias ll='ls -Ahlp --color=auto --group-directories-first --time-style=long-iso'
alias :q=exit

. /usr/share/bash-complete-alias/complete_alias
complete -F _complete_alias la
complete -F _complete_alias ll

eval "$(pyenv init -)"
