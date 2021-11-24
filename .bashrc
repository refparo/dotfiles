# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=$HOME/.local/bin:$PATH
export GHCUP_USE_XDG_DIRS=true
export CABAL_CONFIG=$HOME/.config/cabal/config

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

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls --color=auto -Alh'
alias :q=exit

. /usr/share/bash-complete-alias/complete_alias
complete -F _complete_alias la
complete -F _complete_alias ll
