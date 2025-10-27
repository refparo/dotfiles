# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/blesh/ble.sh --noattach

export LANG=zh_CN.UTF-8
export EDITOR=vim

export PYENV_ROOT=$HOME/.pyenv
export GHCUP_USE_XDG_DIRS=true
export CABAL_CONFIG=$HOME/.config/cabal/config
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

export PATH=$HOME/.local/bin:$PYENV_ROOT/bin:$HOME/.cabal/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH

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
alias :q=exit

eval "$(pyenv init -)"

[[ ! ${BLE_VERSION-} ]] || ble-attach
