#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Start X automatically when logging in on tty1
[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec startx

