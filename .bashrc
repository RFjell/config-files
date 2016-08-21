#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#alias diff='colordiff'
alias grep='grep --color=auto'
alias ..='cd ..'
alias da='date "+%A, %d %B %Y [%T]"'
alias ll='ls -lh'
alias japanify='export LANG=ja_JP.UTF-8'
alias feh='feh -F -rSfilename'

export GREP_COLOR="1;32"
export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32
export HISTCONTROL=ignoreboth
export HISTSIZE=50000

#PS1='[\u@\h \W]\$ '
PS1='[\[\033[1;31m\]\u\[\033[0m\]@\h \[\033[1m\]\W\[\033[0m\]]\$ '

