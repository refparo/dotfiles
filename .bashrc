# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/blesh/ble.sh --noattach

[[ -v EDITOR ]] || export EDITOR=vim
export PATH=$HOME/.local/bin:$HOME/.cabal/bin:$PATH

export RUSTUP_DIST_SERVER=https://mirrors.cernet.edu.cn/rustup

set -o noclobber
shopt -s checkwinsize
shopt -s expand_aliases

PS1="\[$(tput setaf 6)\]\w\[$(tput setaf 2)\] \\$ \[$(tput sgr0)\]"
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE='\: *:\:'
HISTFILESIZE=10000
HISTSIZE=
HISTTIMEFORMAT="[%F %T] "

eval $(dircolors)

alias ls='ls -pv --color=auto --group-directories-first'
alias la='ls -Apv --color=auto --group-directories-first'
alias ll='ls -Ahlpv --color=auto --group-directories-first --time-style=long-iso'
alias grep='grep --color=auto'
alias zed=zeditor

[[ ! ${BLE_VERSION-} ]] || ble-attach
