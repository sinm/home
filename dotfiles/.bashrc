PATH=~/bin:~/Projects/home/suckless/dmenu:~/Projects/home/suckless/st:~/Projects/home/suckless/dwm:~/.rbenv/bin:/opt/X11/bin:/usr/local/go/bin
PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
#PATH="$HOME/bin/apache-maven-3.2.1/bin:$PATH"
export PATH
export GO_PATH=$HOME/Projects/go

if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

export EDITOR=`which nano`

on_prompt_command() {
  PS1_PREFIX=`printf '%3s' $?`

  DIR_LETTER=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  if [ -z "$DIR_LETTER" ]; then
    DIR_LETTER=-
  else
    DIR_LETTER=G
  fi

  SCREEN_WND=$WINDOW
  if [ -z "$WINDOW" ]; then
    SCREEN_WND=-
  fi
}

#if [ -n "$TERM" ]; then
  bold=$([[ -t 1 ]] && tput bold)
  reset=$([[ -t 1 ]] && tput sgr0)
#fi
tReset=$(tput sgr0)
export PS1="\[$(tput sgr0)\]\[$(tput bold)\]\$PS1_PREFIX \$SCREEN_WND \D{%Y-%m-%d %H:%M:%S} \$DIR_LETTER \u@\h:\w\n\$ "
#if [ -n "$TERM" ]; then
  trap "[[ -t 1 ]] && printf '$tReset'" DEBUG
#fi
export PROMPT_COMMAND="on_prompt_command; history -a;"

unset HISTFILESIZE
export HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend

export COLORFGBG="white;black"

#screen -xR
