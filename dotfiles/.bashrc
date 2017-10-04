PATH=~/bin:~/.rbenv/bin:/opt/X11/bin:/usr/local/go/bin
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
PATH="$HOME/bin/apache-maven-3.2.1/bin:$PATH"
export PATH


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

if [ -n "$TERM" ]; then
  bold=$(tput bold)
  reset=$(tput sgr0)
fi
export PS1="\[$reset\]\[$bold\]\$PS1_PREFIX \$SCREEN_WND \D{%Y-%m-%d %H:%M:%S} \$DIR_LETTER \u@\h:\w\n\$ "
trap '[[ -t 1 ]] && tput sgr0' DEBUG
export PROMPT_COMMAND="on_prompt_command; history -a;"

unset HISTFILESIZE
export HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend

export COLORFGBG="white;black"

#screen -xR
