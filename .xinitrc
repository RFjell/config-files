#exec cinnamon-session
#./etx/X11/xinit/xinitrc.d/*
setxkbmap -layout se
setxkbmap -option terminate:ctrl_alt_bksp &
#xsetroot -cursor_name left_ptr
/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh
export GPG_AGENT_INFO SSH_AUTH_SOCK

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
nm-applet &
volumeicon &

exec awesome

