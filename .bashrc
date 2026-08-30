# Always set environment variables
[[ -v EDITOR ]] || export EDITOR=vim
[[ -v DISPLAY ]] && export EDITOR=$HOME/.local/bin/zed
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.cabal/bin:$PATH

# If not running interactively, don't do anything related to shell environment
[[ $- != *i* ]] && return

source /usr/share/blesh/ble.sh --noattach

set -o noclobber
shopt -s checkwinsize
shopt -s expand_aliases

bleopt history_share=yes

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

function paru {
  local PROXY_URL=http://localhost:1080
  if [ $# -eq 0 ]; then
    command paru -Syu
    https_proxy=$PROXY_URL command paru --aur -Syu
  else
    for param in "$@"; do
      if [[ "$param" == "--aur" ]]; then
        https_proxy=$PROXY_URL command paru "$@"
        return
      fi
    done
    command paru "$@"
  fi
}

[[ ! ${BLE_VERSION-} ]] || ble-attach
