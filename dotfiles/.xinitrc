#!/bin/bash

xset -b # disable bell

#NOTE: start with ssh-agent startx 
#eval `/usr/bin/ssh-agent`
if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
then
	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
fi

setxkbmap us,ru -option grp:ctrl_shift_toggle
xset r rate 250 60

VBoxClient --display
VBoxClient --clipboard

xrdb -load <<EOF
xterm*VT100.Translations: #override \
  <Btn1Up>: select-end(CLIPBOARD,PRIMARY,CUT_BUFFER0) \n\
        Ctrl <KeyPress> V: insert-selection(CLIPBOARD,PRIMARY,CUT_BUFFER0)
xterm*font: -*-terminus-medium-*-*-*-16-*-*-*-*-*-iso10646-1
xterm*selectToClipboard: true
EOF

exec dwm
