#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias diff='diff --color=auto'
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

source ~robban/.git-prompt.sh

RED="$(tput setaf 1)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"
GREEN="$(tput setaf 2)"
WHITE="$(tput setaf 7)"
YELLOW="$(tput setaf 3)"
MAGENTA="$(tput setaf 5)"

prompt_status()
{
	if [ $? = 0 ]; then 
		echo -n "${GREEN}^_^${RESET}";
	else
		echo -n "${RED}O_O $? ${RESET}";
	fi
}

# Options for git_ps1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_HIDE_IF_PWD_IGNORED=1

#PS1='[\u@\h \W]\$ '
#PS1='[\[\033[1;31m\]\u\[\033[0m\]@\h \[\033[1m\]\W\[\033[0m\]]\$ '
#PS1='${RESET}${RED}${BOLD}\u${RESET}@${BOLD}\h ${YELLOW}\w${RESET} ${MAGENTA}$(__git_ps1 " (%s)")${RESET} $(prompt_status) \n\$ '
#PS1='${RESET}${RED}${BOLD}\u${RESET}@${BOLD}\h ${YELLOW}\w${RESET} ${MAGENTA}$(__git_ps1 " (%s)")${RESET}\n\$ '
PS1='${RESET}${RED}${BOLD}\u${RESET}@${BOLD}\h ${YELLOW}\w${RESET} ${MAGENTA}$(__git_ps1 " (%s)")${RESET}\n${WHITE}\$${RESET} '

