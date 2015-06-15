PATH=~/bin:~/.rbenv/bin:/opt/X11/bin:/usr/local/go/bin
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
PATH="$HOME/bin/apache-maven-3.2.1/bin:$PATH"
export PATH


if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

export EDITOR=`which nano`

on_prompt_command() {
  GIT_BRANCH=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  if [ -z $GIT_BRANCH ]; then
    GIT_PROMPT=-
  else
    GIT_CHANGE=`git rev-parse 2>/dev/null && (git diff --no-ext-diff --quiet --exit-code 2> /dev/null || echo -e \*) 2>/dev/null`
    GIT_PROMPT=`echo -e $GIT_CHANGE$GIT_BRANCH`
  fi
  SCREEN_WND=$WINDOW
  if [ -z "$WINDOW" ]; then
    SCREEN_WND=-
  else
    SCREEN_WND=$WINDOW
  fi
}

export PS1="> \$? \$SCREEN_WND \D{%F %H:%M:%S} \$GIT_PROMPT \u@\h:\W\n\$ "
export PROMPT_COMMAND="on_prompt_command; history -a;"

unset HISTFILESIZE
export HISTSIZE=1000000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend

export COLORFGBG="white;black"

#screen -xR
