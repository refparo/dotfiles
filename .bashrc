# === Environment Variables ===
# This section is executed by:
# - greetd -> sh .profile
# - systemd user-environment-generator -> import env into systemd
# - tty/ssh -> login shell -> ~/.bash_profile
# - non-login shell -> ~/.bashrc
# Only put global (both bash and systemd) env here.
# For graphical-only env, see ~/.local/bin/niri-session

set -a

prepend_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1${PATH:+:$PATH}" ;;
  esac
}
prepend_path $HOME/.cargo/bin
prepend_path $HOME/.local/bin
unset -f prepend_path

QT_QPA_PLATFORMTHEME=qt6ct
RUSTUP_DIST_SERVER=https://mirrors.cernet.edu.cn/rustup
TERMINAL=kitty

# conditional env
[[ -v DISPLAY ]] && EDITOR="zeditor -w" || EDITOR=vim
[[ $- == *i* && $TERM != linux ]] && { LANG=zh_CN.UTF-8; LANGUAGE=zh_CN:zh:en_US:en; }

set +a

# === Actual Bash Config ===
# If not running interactively, don't apply Bash config
[[ $- != *i* ]] && return

source /usr/share/blesh/ble.sh --noattach

set -Co pipefail
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
alias paru='https_proxy=http://localhost:1080 paru'
alias zed=zeditor

[[ ! ${BLE_VERSION-} ]] || ble-attach
