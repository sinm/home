PATH=~/bin:~/.rbenv/bin:/opt/X11/bin
PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH
[ -f /usr/libexec/path_helper ] && eval `/usr/libexec/path_helper -s`

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

export PS1="\$PS1_PREFIX \$SCREEN_WND \D{%Y-%m-%d %H:%M:%S} \$DIR_LETTER \u@\h:\w\n\$ "
export PROMPT_COMMAND="on_prompt_command; history -a;"

unset HISTFILESIZE
export HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend

export COLORFGBG="white;black"
#export LC_ALL=ru_RU.UTF-8
